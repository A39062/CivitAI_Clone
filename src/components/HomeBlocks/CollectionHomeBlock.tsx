import {
  Button,
  Group,
  Stack,
  Title,
  createStyles,
  Text,
  ThemeIcon,
  Box,
  Popover,
  Anchor,
  AspectRatio,
  Skeleton,
} from '@mantine/core';
import { Fragment, useMemo } from 'react';
import {
  IconArrowRight,
  IconCategory,
  IconFileText,
  IconInfoCircle,
  IconLayoutList,
  IconPhoto,
} from '@tabler/icons-react';
import Link from 'next/link';
import { ImageCard } from '~/components/Cards/ImageCard';
import { ModelCard } from '~/components/Cards/ModelCard';
import { HomeBlockWrapper } from '~/components/HomeBlocks/HomeBlockWrapper';
import { useCurrentUser } from '~/hooks/useCurrentUser';
import { PostCard } from '~/components/Cards/PostCard';
import { ArticleCard } from '~/components/Cards/ArticleCard';
import { trpc } from '~/utils/trpc';
import { shuffle } from '~/utils/array-helpers';
import ReactMarkdown from 'react-markdown';
import { useHomeBlockStyles } from '~/components/HomeBlocks/HomeBlock.Styles';
import { HomeBlockMetaSchema } from '~/server/schema/home-block.schema';

const useStyles = createStyles<string, { count: number }>((theme, { count }) => {
  return {
    grid: {
      display: 'grid',
      gridTemplateColumns: `repeat(auto-fit, minmax(320px, 1fr))`,
      columnGap: theme.spacing.md,
      gridTemplateRows: `repeat(2, auto)`,
      gridAutoRows: 0,
      overflow: 'hidden',
      marginTop: -theme.spacing.md,

      '& > *': {
        marginTop: theme.spacing.md,
      },

      [theme.fn.smallerThan('md')]: {
        gridAutoFlow: 'column',
        gridTemplateColumns: `repeat(${count / 2}, minmax(280px, 1fr) )`,
        gridTemplateRows: `repeat(2, auto)`,
        scrollSnapType: 'x mandatory',
        overflowX: 'auto',
      },

      [theme.fn.smallerThan('sm')]: {
        gridAutoFlow: 'column',
        gridTemplateColumns: `repeat(${count}, 280px)`,
        gridTemplateRows: 'auto',
        scrollSnapType: 'x mandatory',
        overflowX: 'auto',
        marginRight: -theme.spacing.md,
        marginLeft: -theme.spacing.md,
        paddingLeft: theme.spacing.md,

        '& > *': {
          scrollSnapAlign: 'center',
        },
      },
    },

    meta: {
      display: 'none',
      [theme.fn.smallerThan('md')]: {
        display: 'block',
      },
    },

    gridMeta: {
      gridColumn: '1 / span 2',
      display: 'flex',
      flexDirection: 'column',

      '& > *': {
        flex: 1,
      },

      [theme.fn.smallerThan('md')]: {
        display: 'none',
      },
    },
  };
});

const icons = {
  model: IconCategory,
  image: IconPhoto,
  post: IconLayoutList,
  article: IconFileText,
};

export const CollectionHomeBlock = ({ ...props }: Props) => {
  return (
    <HomeBlockWrapper py={32}>
      <CollectionHomeBlockContent {...props} />
    </HomeBlockWrapper>
  );
};

const CollectionHomeBlockContent = ({ homeBlockId, metadata }: Props) => {
  const { data: homeBlock, isLoading } = trpc.homeBlock.getHomeBlock.useQuery({ id: homeBlockId });
  const { classes, cx } = useStyles({
    count: homeBlock?.collection?.items.length ?? 0,
  });
  const { classes: homeBlockClasses } = useHomeBlockStyles();
  const currentUser = useCurrentUser();

  const { collection } = homeBlock ?? {};
  const items = useMemo(() => shuffle(collection?.items ?? []).slice(0, 14), [collection?.items]);

  if (!metadata.link) metadata.link = `/collections/${collection?.id}`;
  const itemType = collection?.items?.[0]?.type || 'model';
  const Icon = icons[itemType];

  const MetaDataTop = (
    <Stack spacing="sm">
      <Group spacing="xs" position="apart" className={homeBlockClasses.header}>
        <Group noWrap>
          <Title className={homeBlockClasses.title} order={1} lineClamp={1}>
            {metadata.title ?? collection?.name ?? 'Collection'}{' '}
          </Title>
          {!metadata.descriptionAlwaysVisible && currentUser && metadata.description && (
            <Popover withArrow width={380}>
              <Popover.Target>
                <Box
                  display="inline-block"
                  sx={{ lineHeight: 0.3, cursor: 'pointer' }}
                  color="white"
                >
                  <IconInfoCircle size={20} />
                </Box>
              </Popover.Target>
              <Popover.Dropdown maw="100%">
                <Text weight={500} size="lg" mb="xs">
                  {metadata.title ?? collection?.name ?? 'Collection'}
                </Text>
                {metadata.description && (
                  <Text size="sm" mb="xs">
                    <ReactMarkdown
                      allowedElements={['a']}
                      unwrapDisallowed
                      className="markdown-content"
                    >
                      {metadata.description}
                    </ReactMarkdown>
                  </Text>
                )}
                {metadata.link && (
                  <Link href={metadata.link} passHref>
                    <Anchor size="sm">
                      <Group spacing={4}>
                        <Text inherit>{metadata.linkText ?? 'View All'} </Text>
                        <IconArrowRight size={16} />
                      </Group>
                    </Anchor>
                  </Link>
                )}
              </Popover.Dropdown>
            </Popover>
          )}
        </Group>
        {metadata.link && (
          <Link href={metadata.link} passHref>
            <Button
              className={homeBlockClasses.expandButton}
              component="a"
              variant="subtle"
              rightIcon={<IconArrowRight size={16} />}
            >
              {metadata.linkText ?? 'View All'}
            </Button>
          </Link>
        )}
      </Group>
      {metadata.description && (metadata.descriptionAlwaysVisible || !currentUser) && (
        <Text>
          <ReactMarkdown allowedElements={['a']} unwrapDisallowed className="markdown-content">
            {metadata.description}
          </ReactMarkdown>
        </Text>
      )}
    </Stack>
  );

  const MetaDataGrid = (
    <Stack justify="center">
      <Group align="center">
        {metadata.withIcon && (
          <ThemeIcon size={50} variant="light" color="gray">
            <Icon />
          </ThemeIcon>
        )}
        <Title className={homeBlockClasses.title} order={1} lineClamp={1}>
          {metadata.title ?? collection?.name ?? 'Collection'}
        </Title>
      </Group>
      {metadata.description && (
        <Text maw={520}>
          <ReactMarkdown allowedElements={['a']} unwrapDisallowed className="markdown-content">
            {metadata.description}
          </ReactMarkdown>
        </Text>
      )}
      {metadata.link && (
        <div>
          <Link href={metadata.link} passHref>
            <Button
              size="md"
              component="a"
              variant="light"
              color="gray"
              rightIcon={<IconArrowRight size={16} />}
            >
              {metadata.linkText ?? 'View All'}
            </Button>
          </Link>
        </div>
      )}
    </Stack>
  );

  const useGrid =
    metadata.description &&
    !metadata.stackedHeader &&
    (!currentUser || metadata.descriptionAlwaysVisible);

  return (
    <>
      <Box mb="md" className={cx({ [classes.meta]: useGrid })}>
        {MetaDataTop}
      </Box>
      <div className={classes.grid}>
        {useGrid && <div className={classes.gridMeta}>{MetaDataGrid}</div>}
        {isLoading
          ? Array.from({ length: 14 }).map((_, index) => (
              <AspectRatio ratio={7 / 9} key={index}>
                <Skeleton width="100%" />
              </AspectRatio>
            ))
          : items.map((item) => (
              <Fragment key={item.id}>
                {item.type === 'model' && (
                  <ModelCard data={{ ...item.data, image: item.data.images[0] }} />
                )}
                {item.type === 'image' && (
                  <ImageCard data={item.data} collectionId={collection?.id} />
                )}
                {item.type === 'post' && <PostCard data={item.data} />}
                {item.type === 'article' && <ArticleCard data={item.data} />}
              </Fragment>
            ))}
      </div>
    </>
  );
};

type Props = { homeBlockId: number; metadata: HomeBlockMetaSchema };
