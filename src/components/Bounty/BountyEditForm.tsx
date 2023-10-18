import {
  Button,
  Group,
  Stack,
  Title,
  ActionIcon,
  Text,
  Tooltip,
  Anchor,
  createStyles,
} from '@mantine/core';
import { TagTarget } from '@prisma/client';
import { IconCalendarDue, IconTrash } from '@tabler/icons-react';
import { useRouter } from 'next/router';
import { getMinMaxDates, useMutateBounty } from '~/components/Bounty/bounty.utils';
import {
  Form,
  InputDatePicker,
  InputRTE,
  useForm,
  InputMultiFileUpload,
  InputTags,
} from '~/libs/form';
import { UpdateBountyInput, updateBountyInputSchema } from '~/server/schema/bounty.schema';
import { BountyGetById } from '~/types/router';
import { BackButton } from '../BackButton/BackButton';
import { IconCalendar } from '@tabler/icons-react';
import { DaysFromNow } from '~/components/Dates/DaysFromNow';
import { stripTime } from '~/utils/date-helpers';

const useStyles = createStyles((theme) => ({
  title: {
    [theme.fn.smallerThan('sm')]: {
      fontSize: '24px',
    },
  },
  fluid: {
    maxWidth: '100% !important',
  },
}));

const schema = updateBountyInputSchema
  .refine((data) => data.startsAt < data.expiresAt, {
    message: 'Start date must be before expiration date',
    path: ['startsAt'],
  })
  .refine((data) => data.expiresAt > data.startsAt, {
    message: 'Expiration date must be after start date',
    path: ['expiresAt'],
  });

export function BountyEditForm({ bounty }: Props) {
  const router = useRouter();
  const { classes } = useStyles();

  const defaultValues = {
    ...bounty,
    id: bounty.id,
    description: bounty.description,
    // TODO.bounty: fix date issue not using utc properly
    startsAt: bounty.startsAt,
    expiresAt: bounty.expiresAt,
    files: bounty.files?.map((file) => ({ ...file, metadata: file.metadata as MixedObject })) ?? [],
  };
  const form = useForm({ schema, defaultValues, shouldUnregister: false });

  const { updateBounty: update, updating } = useMutateBounty({ bountyId: bounty.id });

  const handleSubmit = async (data: UpdateBountyInput) => {
    await update(data);
    await router.push(`/bounties/${bounty.id}`);
  };

  const alreadyStarted = bounty.startsAt < new Date();
  const { minStartDate, maxStartDate, minExpiresDate, maxExpiresDate } = getMinMaxDates();
  const expiresAt = form.watch('expiresAt');

  return (
    <Form form={form} onSubmit={handleSubmit}>
      <Stack spacing="xl">
        <Group spacing="md" noWrap>
          <BackButton url={`/bounties/${bounty.id}`} />
          <Title className={classes.title}>Editing {bounty.name} Bounty</Title>
        </Group>
        <InputRTE
          name="description"
          label="Description"
          editorSize="xl"
          includeControls={['heading', 'formatting', 'list', 'link', 'media', 'colors']}
          withAsterisk
          stickyToolbar
        />
        {!alreadyStarted && (
          <Stack>
            <Group spacing="xl" grow>
              <InputDatePicker
                className={classes.fluid}
                name="startsAt"
                label="Start Date"
                placeholder="Select a starts date"
                icon={<IconCalendar size={16} />}
                withAsterisk
                minDate={minStartDate}
                maxDate={maxStartDate}
              />
              <InputDatePicker
                className={classes.fluid}
                name="expiresAt"
                label="Deadline"
                placeholder="Select an end date"
                icon={<IconCalendarDue size={16} />}
                withAsterisk
                minDate={minExpiresDate}
                maxDate={maxExpiresDate}
              />
            </Group>
            <Text weight={590}>
              With the selected dates, your bounty will expire{' '}
              <Text weight="bold" color="red.5" span>
                <DaysFromNow date={stripTime(expiresAt)} inUtc />
              </Text>
              . All times are in{' '}
              <Text span color="red.5">
                UTC
              </Text>
              .
            </Text>
          </Stack>
        )}
        <InputTags name="tags" label="Tags" target={[TagTarget.Bounty]} />
        <InputMultiFileUpload
          name="files"
          label="Attachments"
          dropzoneProps={{
            maxSize: 100 * 1024 ** 2, // 100MB
            maxFiles: 10,
            // TODO.bounty: revise accepted file types
            accept: {
              'application/pdf': ['.pdf'],
              'application/zip': ['.zip'],
              'application/json': ['.json'],
              'application/x-yaml': ['.yaml', '.yml'],
              'text/plain': ['.txt'],
            },
          }}
          renderItem={(file, onRemove) => (
            <>
              {file.id ? (
                <Anchor
                  href={`/api/download/attachments/${file.id}`}
                  size="sm"
                  weight={500}
                  lineClamp={1}
                  download
                >
                  {file.name}
                </Anchor>
              ) : (
                <Text size="sm" weight={500} lineClamp={1}>
                  {file.name}
                </Text>
              )}
              {!file.id && (
                <Tooltip label="Remove">
                  <ActionIcon
                    size="sm"
                    color="red"
                    variant="transparent"
                    onClick={() => onRemove()}
                  >
                    <IconTrash />
                  </ActionIcon>
                </Tooltip>
              )}
            </>
          )}
        />
        <Group position="right">
          <Button type="submit" loading={updating}>
            Save
          </Button>
        </Group>
      </Stack>
    </Form>
  );
}

type Props = { bounty: BountyGetById };
