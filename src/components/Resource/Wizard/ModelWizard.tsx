import {
  ActionIcon,
  Button,
  Container,
  createStyles,
  Group,
  Stack,
  Stepper,
  Title,
} from '@mantine/core';
import { ModelUploadType, TrainingStatus } from '@prisma/client';
import { IconX } from '@tabler/icons-react';
import { isEqual } from 'lodash-es';
import { useRouter } from 'next/router';
import { useEffect, useState } from 'react';
import { PostEditWrapper } from '~/components/Post/Edit/PostEditLayout';
import { Files, UploadStepActions } from '~/components/Resource/Files';
import { FilesProvider } from '~/components/Resource/FilesProvider';
import { ModelUpsertForm } from '~/components/Resource/Forms/ModelUpsertForm';
import { ModelVersionUpsertForm } from '~/components/Resource/Forms/ModelVersionUpsertForm';
import TrainingSelectFile from '~/components/Resource/Forms/TrainingSelectFile';
import { useS3UploadStore } from '~/store/s3-upload.store';
import { ModelById } from '~/types/router';
import { trpc } from '~/utils/trpc';
import { isNumber } from '~/utils/type-guards';
import { PostUpsertForm } from '../Forms/PostUpsertForm';

export type ModelWithTags = Omit<ModelById, 'tagsOnModels'> & {
  tagsOnModels: Array<{ id: number; name: string }>;
};

type WizardState = {
  step: number;
  model?: ModelWithTags;
  modelVersion?: ModelWithTags['modelVersions'][number];
};

const useStyles = createStyles((theme) => ({
  closeButton: {
    position: 'absolute',
    top: theme.spacing.md,
    right: theme.spacing.md,
  },
}));

export function ModelWizard() {
  const { classes } = useStyles();
  const router = useRouter();
  const { getStatus: getUploadStatus } = useS3UploadStore();

  const { id } = router.query;
  const isNew = router.pathname.includes('/create');
  const [state, setState] = useState<WizardState>({ step: 1 });

  const { data: model } = trpc.model.getById.useQuery({ id: Number(id) }, { enabled: !!id });

  const maxSteps = 4;

  const editing = !!model;
  const hasVersions = model && model.modelVersions.length > 0;
  const hasFiles =
    model &&
    model.modelVersions.some((version) =>
      model.uploadType === ModelUploadType.Trained
        ? version.files.filter((f) => f.type === 'Model' || f.type === 'Pruned Model').length > 0
        : version.files.length > 0
    );

  const { uploading, error, aborted } = getUploadStatus(
    (file) => file.meta?.versionId === state.modelVersion?.id
  );

  const goNext = () => {
    if (state.step < maxSteps)
      router.replace(`/models/${id}/wizard?step=${state.step + 1}`, undefined, {
        shallow: true,
      });
  };

  const goBack = () => {
    if (state.step > 1)
      router.replace(`/models/${id}/wizard?step=${state.step - 1}`, undefined, {
        shallow: true,
      });
  };

  useEffect(() => {
    // redirect to correct step if missing values
    if (!isNew) {
      // don't redirect for Trained type
      if (model?.uploadType === ModelUploadType.Trained) {
        // TODO [bw] we could possibly redirect here to step 3 if status == InReview
        return;
      }
      if (!hasVersions) router.replace(`/models/${id}/wizard?step=2`, undefined, { shallow: true });
      else if (!hasFiles)
        router.replace(`/models/${id}/wizard?step=3`, undefined, { shallow: true });
      else router.replace(`/models/${id}/wizard?step=4`, undefined, { shallow: true });
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [hasFiles, hasVersions, id, isNew, model]);

  useEffect(() => {
    // set current step based on query param
    if (state.step.toString() !== router.query.step) {
      const rawStep = router.query.step;
      const step = Number(rawStep);
      const validStep = isNumber(step) && step >= 1 && step <= 4;

      setState((current) => ({ ...current, step: validStep ? step : 1 }));
    }
  }, [isNew, router.query.step, state.step]);

  useEffect(() => {
    // set state model data when query has finished and there's data
    if (model) {
      const parsedModel = {
        ...model,
        tagsOnModels: model.tagsOnModels.map(({ tag }) => tag) ?? [],
      };

      if (!isEqual(parsedModel, state.model))
        setState((current) => ({
          ...current,
          model: parsedModel,
          modelVersion: parsedModel.modelVersions[0],
        }));
    }
  }, [model, state.model]);

  const postId = state.modelVersion?.posts[0]?.id;

  return (
    <FilesProvider model={state.model} version={state.modelVersion}>
      <Container size="sm">
        <ActionIcon
          className={classes.closeButton}
          size="xl"
          radius="xl"
          variant="light"
          onClick={() => (isNew ? router.back() : router.replace(`/models/${id}`))}
        >
          <IconX />
        </ActionIcon>
        <Stack py="xl">
          <Stepper
            active={state.step - 1}
            onStepClick={(step) =>
              router.replace(`/models/${id}/wizard?step=${step + 1}`, undefined, { shallow: true })
            }
            allowNextStepsSelect={false}
            size="sm"
          >
            <Stepper.Step label={editing ? 'Edit model' : 'Create your model'}>
              <Stack>
                <Title order={3}>{editing ? 'Edit model' : 'Create your model'}</Title>
                <ModelUpsertForm
                  model={state.model}
                  onSubmit={({ id }) => {
                    if (editing) return goNext();
                    router.replace(`/models/${id}/wizard?step=2`);
                  }}
                >
                  {({ loading }) => (
                    <Group mt="xl" position="right">
                      <Button type="submit" loading={loading}>
                        Next
                      </Button>
                    </Group>
                  )}
                </ModelUpsertForm>
              </Stack>
            </Stepper.Step>
            <Stepper.Step label={hasVersions ? 'Edit version' : 'Add version'}>
              <Stack>
                <Title order={3}>{hasVersions ? 'Edit version' : 'Add version'}</Title>
                <ModelVersionUpsertForm
                  model={state.model}
                  version={state.modelVersion}
                  onSubmit={goNext}
                >
                  {({ loading }) => (
                    <Group mt="xl" position="right">
                      <Button variant="default" onClick={goBack}>
                        Back
                      </Button>
                      <Button type="submit" loading={loading}>
                        Next
                      </Button>
                    </Group>
                  )}
                </ModelVersionUpsertForm>
              </Stack>
            </Stepper.Step>
            {state.model?.uploadType === ModelUploadType.Trained ? (
              <Stepper.Step
                label="Select Model File"
                loading={
                  state.model.modelVersions[0].trainingStatus === TrainingStatus.Pending ||
                  state.model.modelVersions[0].trainingStatus === TrainingStatus.Submitted ||
                  state.model.modelVersions[0].trainingStatus === TrainingStatus.Processing
                }
                color={
                  state.model.modelVersions[0].trainingStatus === TrainingStatus.Failed
                    ? 'red'
                    : undefined
                }
              >
                <Stack>
                  <Title order={3}>Select Model File</Title>
                  <Title mb="sm" order={5}>
                    Choose a model file from the results of your training run.
                    <br />
                    Sample images are provided for reference.
                  </Title>
                  <TrainingSelectFile
                    model={state.model}
                    onBackClick={goBack}
                    onNextClick={goNext}
                  />
                </Stack>
              </Stepper.Step>
            ) : (
              <Stepper.Step
                label="Upload files"
                loading={uploading > 0}
                color={error + aborted > 0 ? 'red' : undefined}
              >
                <Stack>
                  <Title order={3}>Upload files</Title>
                  <Files />
                  <UploadStepActions onBackClick={goBack} onNextClick={goNext} />
                </Stack>
              </Stepper.Step>
            )}
            <Stepper.Step label={postId ? 'Edit post' : 'Create a post'}>
              <Stack>
                <Title order={3}>{postId ? 'Edit post' : 'Create your post'}</Title>
                {state.model && state.modelVersion && (
                  <PostEditWrapper postId={postId}>
                    <PostUpsertForm
                      modelVersionId={state.modelVersion.id}
                      modelId={state.model.id}
                    />
                  </PostEditWrapper>
                )}
              </Stack>
            </Stepper.Step>
          </Stepper>
        </Stack>
      </Container>
    </FilesProvider>
  );
}
