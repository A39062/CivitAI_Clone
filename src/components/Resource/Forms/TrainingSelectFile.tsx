import {
  Button,
  Center,
  createStyles,
  Group,
  Image,
  Loader,
  Paper,
  Stack,
  Text,
  Textarea,
  Title,
} from '@mantine/core';
import { showNotification, updateNotification } from '@mantine/notifications';
import { TrainingStatus } from '@prisma/client';
import { IconCheck, IconX } from '@tabler/icons-react';
import React, { useState } from 'react';
import { NotFound } from '~/components/AppLayout/NotFound';
import { DownloadButton } from '~/components/Model/ModelVersions/DownloadButton';
import { NoContent } from '~/components/NoContent/NoContent';
import { ModelWithTags } from '~/components/Resource/Wizard/ModelWizard';
import { EpochSchema } from '~/pages/api/webhooks/image-resource-training';
import { ModelFileType } from '~/server/common/constants';
import { UploadType } from '~/server/common/enums';
import { useS3UploadStore } from '~/store/s3-upload.store';
import { showErrorNotification } from '~/utils/notifications';
import { bytesToKB } from '~/utils/number-helpers';
import { trpc } from '~/utils/trpc';

const useStyles = createStyles((theme) => ({
  epochRow: {
    [theme.fn.smallerThan('sm')]: {
      flexDirection: 'column',
      gap: theme.spacing.md,
    },
  },
  selectedRow: {
    border: `2px solid ${theme.fn.rgba(theme.colors.green[5], 0.7)}`,
  },
  paperRow: {
    cursor: 'pointer',
    '&:hover': {
      backgroundColor: theme.fn.rgba(theme.colors.blue[2], 0.1),
    },
  },
}));

const EpochRow = ({
  epoch,
  selectedFile,
  setSelectedFile,
}: {
  epoch: EpochSchema;
  selectedFile: string | undefined;
  setSelectedFile: React.Dispatch<React.SetStateAction<string | undefined>>;
}) => {
  const { classes, cx } = useStyles();

  return (
    <Paper
      shadow="sm"
      radius="sm"
      p="xs"
      withBorder
      className={cx(
        classes.paperRow,
        selectedFile === epoch.model_url ? classes.selectedRow : undefined
      )}
      onClick={() => setSelectedFile(epoch.model_url)}
    >
      <Stack>
        <Group position="apart" className={classes.epochRow}>
          <Text fz="md" fw={700}>
            Epoch #{epoch.epoch_number}
          </Text>
          <DownloadButton
            onClick={(e) => e.stopPropagation()}
            component="a"
            canDownload
            href={epoch.model_url}
            variant="light"
          >
            <Text align="center">
              {/*{`Download (${formatKBytes(modalData.file?.sizeKB)})`}*/}
              Download
            </Text>
          </DownloadButton>
        </Group>
        <Group className={classes.epochRow} style={{ justifyContent: 'space-evenly' }}>
          {epoch.sample_images && epoch.sample_images.length > 0 ? (
            epoch.sample_images.map((imgData, index) => (
              <Stack key={index} style={{ justifyContent: 'flex-start' }}>
                <Image
                  alt={`Sample image #${index}`}
                  src={imgData.image_url}
                  withPlaceholder
                  imageProps={{
                    style: {
                      height: '200px',
                      // if we want to show full image, change objectFit to contain
                      objectFit: 'cover',
                      // object-position: top;
                      width: '100%',
                    },
                  }}
                />
                <Textarea autosize minRows={1} maxRows={4} value={imgData.prompt} readOnly />
              </Stack>
            ))
          ) : (
            <Center>
              <Text>No images available.</Text>
            </Center>
          )}
        </Group>
      </Stack>
    </Paper>
  );
};

export default function TrainingSelectFile({
  model,
  onBackClick,
  onNextClick,
}: {
  model?: ModelWithTags;
  onBackClick: () => void;
  onNextClick: () => void;
}) {
  const queryUtils = trpc.useContext();
  const { upload } = useS3UploadStore();
  const [awaitInvalidate, setAwaitInvalidate] = useState<boolean>(false);

  const modelVersion = model?.modelVersions?.[0];
  const modelFile = modelVersion?.files.find((f) => f.type === 'Training Data');
  const existingModelFile = modelVersion?.files.find((f) => f.type === 'Model');

  const [selectedFile, setSelectedFile] = useState<string | undefined>(
    existingModelFile?.metadata?.selectedEpochUrl
  );

  const notificationId = `${modelVersion?.id || 1}-uploading-file-notification`;

  const createFileMutation = trpc.modelFile.create.useMutation({
    async onSuccess() {
      if (!model || !modelVersion) {
        // showErrorNotification({
        //   error: new Error('Missing model data. Please try again.'),
        // });
        return;
      }

      const versionMutateData = {
        id: modelVersion.id,
        modelId: model.id,
        name: model.name,
        baseModel: 'SD 1.5' as const,
        trainingStatus: TrainingStatus.Approved,
      };

      upsertVersionMutation.mutate(versionMutateData);

      updateNotification({
        id: notificationId,
        icon: <IconCheck size={18} />,
        color: 'teal',
        title: 'Selection complete!',
        message: '',
        autoClose: 3000,
        disallowClose: false,
      });
    },
    onError(error) {
      setAwaitInvalidate(false);
      updateNotification({
        id: notificationId,
        icon: <IconX size={18} />,
        color: 'red',
        title: 'Failed to create file.',
        message: error.message,
      });
    },
  });

  const upsertVersionMutation = trpc.modelVersion.upsert.useMutation({
    onSuccess: async (vData) => {
      // TODO [bw] ideally, we would simply update the proper values rather than invalidate to skip the loading step
      await queryUtils.modelVersion.getById.invalidate({ id: vData.id });
      await queryUtils.model.getById.invalidate({ id: model?.id });
      await queryUtils.model.getMyTrainingModels.invalidate();
      setAwaitInvalidate(false);
      onNextClick();
    },
    onError: (error) => {
      setAwaitInvalidate(false);
      showErrorNotification({
        error: new Error(error.message),
        title: 'Failed to save model version',
      });
    },
  });

  const handleSubmit = async () => {
    if (!model || !modelVersion) {
      showErrorNotification({
        error: new Error('Missing model data. Please try again.'),
      });
      return;
    }
    if (!selectedFile || !selectedFile.length) {
      showErrorNotification({
        error: new Error('Please select a file to be used.'),
      });
      return;
    }

    setAwaitInvalidate(true);

    showNotification({
      id: notificationId,
      loading: true,
      autoClose: false,
      disallowClose: true,
      title: 'Applying selected model file...',
      message: '',
    });

    const result = await fetch(selectedFile);
    if (!result.ok) {
      setAwaitInvalidate(false);
      updateNotification({
        id: notificationId,
        icon: <IconX size={18} />,
        color: 'red',
        title: 'Failed to create file.',
        message: 'Please try again.',
      });
      console.log(result);
      return;
    }
    const blob = await result.blob();
    const blobFile = new File([blob], `${selectedFile.split('/').pop()}`, {
      type: blob.type,
    });

    await upload(
      {
        file: blobFile,
        type: UploadType.Model,
        meta: {
          versionId: modelVersion.id,
          // TODO more
        },
      },
      async ({ meta, size, ...result }) => {
        const { versionId, type, uuid, ...metadata } = meta as {
          versionId: number;
          type: ModelFileType;
          uuid: string;
        };
        const updatedMetadata = {
          ...metadata,
          selectedEpochUrl: selectedFile,
        };
        createFileMutation.mutate({
          ...result,
          sizeKB: bytesToKB(size),
          modelVersionId: versionId,
          type: 'Model',
          metadata: updatedMetadata,
        });
      }
    );
  };

  // you should only be able to get to this screen after having created a model, version, and uploading a training set
  if (!model || !modelVersion || !modelFile) {
    return <NotFound />;
  }

  const epochs = [...(modelFile.metadata.trainingResults?.epochs || [])].sort(
    (a, b) => b.epoch_number - a.epoch_number
  );

  const inError = modelVersion.trainingStatus === TrainingStatus.Failed;
  const noEpochs = !epochs || !epochs.length;
  const resultsLoading =
    (modelVersion.trainingStatus !== TrainingStatus.InReview &&
      modelVersion.trainingStatus !== TrainingStatus.Approved) ||
    noEpochs;

  return (
    <Stack>
      {inError ? (
        <Center py="md">
          <NoContent message="The training job failed. Please recreate this model and try again, or contact us for help." />
        </Center>
      ) : noEpochs ? (
        <Stack p="xl" align="center">
          <Loader />
          <Text>Models are currently training...</Text>
        </Stack>
      ) : (
        <>
          {modelVersion.trainingStatus === TrainingStatus.Processing && (
            <Stack p="xl" align="center">
              <Loader />
              <Text>Models are currently training...</Text>
            </Stack>
          )}
          {/* TODO [bw] download all button */}
          <Center>
            <Title order={4}>Recommended</Title>
          </Center>
          <EpochRow
            epoch={epochs[0]}
            selectedFile={selectedFile}
            setSelectedFile={setSelectedFile}
          />
          {epochs.length > 1 && (
            <>
              <Center>
                <Title mt="sm" order={4}>
                  Other Results
                </Title>
              </Center>
              {epochs.slice(1).map((e, idx) => (
                <EpochRow
                  key={idx}
                  epoch={e}
                  selectedFile={selectedFile}
                  setSelectedFile={setSelectedFile}
                />
              ))}
            </>
          )}
        </>
      )}

      <Group mt="xl" position="right">
        <Button variant="default" onClick={onBackClick}>
          Back
        </Button>
        <Button onClick={handleSubmit} disabled={resultsLoading} loading={awaitInvalidate}>
          Next
        </Button>
      </Group>
    </Stack>
  );
}
