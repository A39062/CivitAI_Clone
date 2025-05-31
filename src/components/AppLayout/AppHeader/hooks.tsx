import { useMantineTheme } from '@mantine/core';
import {
  type Icon,
  type IconProps,
  IconBarbell,
  IconBookmark,
  IconBookmarkEdit,
  IconBrush,
  IconCloudLock,
  IconClubs,
  IconCrown,
  IconGavel,
  IconHistory,
  IconLink,
  IconMoneybag,
  IconPhotoUp,
  IconPlayerPlayFilled,
  IconProgressBolt,
  IconSword,
  IconThumbUp,
  IconUpload,
  IconUser,
  IconUserCircle,
  IconUsers,
  IconVideoPlus,
  IconWriting,
} from '@tabler/icons-react';
import dynamic from 'next/dynamic';
import { useRouter } from 'next/router';
import { useSystemCollections } from '~/components/Collections/collection.utils';
import { dialogStore } from '~/components/Dialog/dialogStore';
import { useCurrentUser } from '~/hooks/useCurrentUser';
import { useFeatureFlags } from '~/providers/FeatureFlagsProvider';
import { LoginRedirectReason } from '~/utils/login-helpers';
import { trpc } from '~/utils/trpc';
import { useTranslation } from 'next-i18next';

export type UserMenuItem = {
  label: string;
  icon: React.ForwardRefExoticComponent<IconProps & React.RefAttributes<Icon>>;
  color?: string;
  visible?: boolean;
  href?: string;
  as?: string;
  rel?: 'nofollow';
  onClick?: () => void;
  currency?: boolean;
  redirectReason?: LoginRedirectReason;
  newUntil?: Date;
};

type UserMenuItemGroup = {
  visible?: boolean;
  items: UserMenuItem[];
};

const FeatureIntroductionModal = dynamic(
  () => import('~/components/FeatureIntroduction/FeatureIntroduction')
);

export function useGetMenuItems(): UserMenuItemGroup[] {
  const router = useRouter();
  const features = useFeatureFlags();
  const currentUser = useCurrentUser();
  const theme = useMantineTheme();
  const { t } = useTranslation();
  const {
    groupedCollections: {
      Article: bookmarkedArticlesCollection,
      Model: bookmarkedModelsCollection,
    },
  } = useSystemCollections();

  return [
    {
      visible: !!currentUser,
      items: [
        {
          href: `/user/${currentUser?.username}`,
          icon: IconUser,
          color: theme.colors.blue[theme.fn.primaryShade()],
          label: t('menu.yourProfile'),
        },
        {
          href: `/user/${currentUser?.username}/models?section=training`,
          visible: !!currentUser && features.imageTrainingResults,
          icon: IconBarbell,
          color: theme.colors.green[theme.fn.primaryShade()],
          label: t('menu.training'),
        },
        {
          href: `/collections`,
          icon: IconBookmark,
          color: theme.colors.green[theme.fn.primaryShade()],
          label: t('menu.myCollections'),
        },
        {
          href: `/collections/${bookmarkedModelsCollection?.id}`,
          icon: IconThumbUp,
          color: theme.colors.green[theme.fn.primaryShade()],
          label: t('menu.likedModels'),
        },
        {
          href: `/collections/${bookmarkedArticlesCollection?.id}`,
          visible: !!bookmarkedArticlesCollection,
          icon: IconBookmarkEdit,
          color: theme.colors.pink[theme.fn.primaryShade()],
          label: t('menu.bookmarkedArticles'),
        },
        {
          href: '/bounties?engagement=favorite',
          as: '/bounties',
          visible: features.bounties,
          icon: IconMoneybag,
          color: theme.colors.pink[theme.fn.primaryShade()],
          label: t('menu.myBounties'),
        },
        {
          href: '/clubs?engagement=engaged',
          as: '/clubs',
          visible: features.clubs,
          icon: IconClubs,
          color: theme.colors.pink[theme.fn.primaryShade()],
          label: t('menu.myClubs'),
        },
        {
          href: '/user/buzz-dashboard',
          visible: features.buzz,
          icon: IconProgressBolt,
          color: theme.colors.yellow[theme.fn.primaryShade()],
          label: t('menu.buzzDashboard'),
        },
        {
          href: '/user/vault',
          visible: features.vault,
          icon: IconCloudLock,
          color: theme.colors.yellow[theme.fn.primaryShade()],
          label: t('menu.myVault'),
        },
      ],
    },
    {
      visible: !!currentUser,
      items: [
        {
          href: '/leaderboard/overall',
          icon: IconCrown,
          color: theme.colors.yellow[theme.fn.primaryShade()],
          label: t('menu.leaderboard'),
        },
        {
          href: '/auctions',
          visible: features.auctions,
          icon: IconGavel,
          color: theme.colors.yellow[theme.fn.primaryShade()],
          label: t('menu.auctions'),
          newUntil: new Date('2025-04-07'),
        },
        {
          href: '/games/knights-of-new-order',
          visible: features.newOrderGame,
          icon: IconSword,
          color: theme.colors.yellow[theme.fn.primaryShade()],
          label: t('menu.knightsOfNew'),
          newUntil: new Date('2025-05-18'),
        },
        {
          href: '/product/link',
          icon: IconLink,
          label: t('menu.downloadApp'),
        },
        {
          href: `/user/${currentUser?.username}/following`,
          icon: IconUsers,
          label: t('menu.creatorsYouFollow'),
        },
        {
          href: '/user/downloads',
          icon: IconHistory,
          label: t('menu.downloadHistory'),
        },
        {
          icon: IconPlayerPlayFilled,
          label: t('menu.gettingStarted'),
          onClick: () => {
            dialogStore.trigger({
              component: FeatureIntroductionModal,
              props: {
                feature: 'getting-started',
                contentSlug: ['feature-introduction', 'welcome'],
              },
            });
          },
        },
      ],
    },
    {
      visible: !currentUser,
      items: [
        {
          href: '/leaderboard/overall',
          icon: IconCrown,
          color: theme.colors.yellow[theme.fn.primaryShade()],
          label: t('menu.leaderboard'),
        },
        {
          href: '/auctions',
          visible: features.auctions,
          icon: IconGavel,
          color: theme.colors.yellow[theme.fn.primaryShade()],
          label: t('menu.auctions'),
          newUntil: new Date('2025-04-07'),
        },
        {
          href: '/product/link',
          icon: IconLink,
          label: t('menu.downloadApp'),
        },
        {
          href: `/login?returnUrl=${router.asPath}`,
          rel: 'nofollow',
          icon: IconUserCircle,
          label: t('menu.signInSignUp'),
        },
      ],
    },
  ];
}

export function useGetActionMenuItems(): Array<Omit<UserMenuItem, 'href'> & { href: string }> {
  const features = useFeatureFlags();
  const currentUser = useCurrentUser();
  const theme = useMantineTheme();
  const isMuted = currentUser?.muted ?? false;
  const canCreate = features.canWrite;
  const { t } = useTranslation();

  return [
    {
      href: '/generate',
      visible: !isMuted,
      rel: 'nofollow',
      icon: IconBrush,
      color: theme.colors.blue[theme.fn.primaryShade()],
      label: t('menu.generate'),
    },
    {
      href: '/posts/create',
      visible: !isMuted && canCreate,
      redirectReason: 'post-images',
      rel: 'nofollow',
      icon: IconPhotoUp,
      color: theme.colors.blue[theme.fn.primaryShade()],
      label: t('menu.postImages'),
    },
    {
      href: '/posts/create?video=true',
      visible: !isMuted && canCreate,
      redirectReason: 'post-images',
      rel: 'nofollow',
      icon: IconVideoPlus,
      color: theme.colors.blue[theme.fn.primaryShade()],
      label: t('menu.postVideos'),
    },
    {
      href: '/models/create',
      visible: !isMuted && canCreate,
      redirectReason: 'upload-model',
      rel: 'nofollow',
      icon: IconUpload,
      color: theme.colors.blue[theme.fn.primaryShade()],
      label: t('menu.uploadModel'),
    },
    {
      href: '/models/train',
      visible: !isMuted && features.imageTraining,
      redirectReason: 'train-model',
      rel: 'nofollow',
      icon: IconBarbell,
      color: theme.colors.blue[theme.fn.primaryShade()],
      label: t('menu.trainLora'),
      currency: true,
    },
    {
      href: '/articles/create',
      visible: !isMuted && canCreate && features.articles,
      redirectReason: 'create-article',
      rel: 'nofollow',
      icon: IconWriting,
      color: theme.colors.blue[theme.fn.primaryShade()],
      label: t('menu.writeArticle'),
    },
    {
      href: '/bounties/create',
      visible: !isMuted && canCreate && features.bounties,
      redirectReason: 'create-bounty',
      rel: 'nofollow',
      icon: IconMoneybag,
      color: theme.colors.blue[theme.fn.primaryShade()],
      label: t('menu.createBounty'),
      currency: true,
    },
    {
      href: '/clubs/create',
      visible: !isMuted && canCreate && features.clubs,
      redirectReason: 'create-club',
      rel: 'nofollow',
      icon: IconClubs,
      color: theme.colors.blue[theme.fn.primaryShade()],
      label: t('menu.createClub'),
    },
  ];
}

export function useGetCreator() {
  const currentUser = useCurrentUser();
  const { data: creator } = trpc.user.getCreator.useQuery(
    { id: currentUser?.id as number },
    { enabled: !!currentUser }
  );
  return creator;
}
