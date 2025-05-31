import { UnstyledButton, Badge, Button, createStyles, Group, Menu, Text } from '@mantine/core';
import { useLocalStorage } from '@mantine/hooks';
import {
  IconCalendar,
  IconCaretDown,
  IconCategory,
  IconContract,
  IconFileText,
  IconHome,
  IconLayoutList,
  IconMoneybag,
  IconPhoto,
  IconPointFilled,
  IconProps,
  IconShoppingBag,
  IconTools,
  IconTrophy,
  IconVideo,
} from '@tabler/icons-react';
import clsx from 'clsx';
import React from 'react';
import { useRouter } from 'next/router';
import { useState } from 'react';
import { NextLink as Link } from '~/components/NextLink/NextLink';
import { useFeatureFlags } from '~/providers/FeatureFlagsProvider';
import { FeatureAccess } from '~/server/services/feature-flags.service';
import { getDisplayName } from '~/utils/string-helpers';
import { trpc } from '~/utils/trpc';
import { isDefined } from '~/utils/type-guards';
import { useTranslation } from 'next-i18next';

type HomeOption = {
  key: string;
  url: string;
  icon: (props: IconProps) => JSX.Element;
  new?: Date;
  grouped?: boolean;
  classes?: string[];
};
export const homeOptions: HomeOption[] = [
  {
    key: 'home',
    url: '/',
    icon: (props: IconProps) => <IconHome {...props} />,
  },
  {
    key: 'models',
    url: '/models',
    icon: (props: IconProps) => <IconCategory {...props} />,
  },
  {
    key: 'images',
    url: '/images',
    icon: (props: IconProps) => <IconPhoto {...props} />,
  },
  {
    key: 'videos',
    url: '/videos',
    icon: (props: IconProps) => <IconVideo {...props} />,
  },
  {
    key: 'posts',
    url: '/posts',
    icon: (props: IconProps) => <IconLayoutList {...props} />,
    grouped: true,
  },
  {
    key: 'articles',
    url: '/articles',
    icon: (props: IconProps) => <IconFileText {...props} />,
  },
  {
    key: 'bounties',
    url: '/bounties',
    icon: (props: IconProps) => <IconMoneybag {...props} />,
    grouped: true,
  },
  {
    key: 'tools',
    url: '/tools',
    icon: (props: IconProps) => <IconTools {...props} />,
    grouped: true,
  },
  {
    key: 'challenges',
    url: '/challenges',
    icon: (props: IconProps) => <IconTrophy {...props} />,
    grouped: true,
  },
  {
    key: 'events',
    url: '/events',
    icon: (props: IconProps) => <IconCalendar {...props} />,
    grouped: true,
  },
  {
    key: 'updates',
    url: '/changelog',
    icon: (props: IconProps) => <IconContract {...props} />,
    grouped: true,
    // new: new Date('2025-05-26'),
  },
  {
    key: 'shop',
    url: '/shop',
    icon: (props: IconProps) => <IconShoppingBag {...props} />,
    classes: ['tabHighlight'],
  },
];

export function filterHomeOptions(features: FeatureAccess) {
  return homeOptions.filter(
    ({ key }) =>
      ![
        key === 'bounties' && !features.bounties,
        key === 'clubs' && !features.clubs,
        key === 'shop' && !features.cosmeticShop,
        key === 'articles' && !features.articles,
        key === 'tools' && !features.toolSearch,
      ].some((b) => b)
  );
}

const useTabsStyles = createStyles((theme) => ({
  tabHighlight: {
    backgroundColor: theme.fn.rgba(
      theme.colors.yellow[3],
      theme.colorScheme === 'dark' ? 0.1 : 0.3
    ),
    backgroundImage: `linear-gradient(90deg, ${theme.fn.rgba(
      theme.colors.yellow[4],
      0
    )}, ${theme.fn.rgba(
      theme.colors.yellow[4],
      theme.colorScheme === 'dark' ? 0.1 : 0.2
    )}, ${theme.fn.rgba(theme.colors.yellow[4], 0)})`,
    backgroundSize: '50px',
    backgroundPosition: '-300% 50%',
    backgroundRepeat: 'no-repeat',
    color: theme.colorScheme === 'dark' ? theme.colors.yellow[3] : theme.colors.yellow[8],
    animation: 'button-highlight 5s linear infinite',
    willChange: 'background-position',
  },

  // tabRainbow: {
  //   background: `linear-gradient(
  //       90deg,
  //       rgba(255, 0, 0, 1) 0%,
  //       rgba(255, 154, 0, 1) 10%,
  //       rgba(208, 222, 33, 1) 20%,
  //       rgba(79, 220, 74, 1) 30%,
  //       rgba(63, 218, 216, 1) 40%,
  //       rgba(47, 201, 226, 1) 50%,
  //       rgba(28, 127, 238, 1) 60%,
  //       rgba(95, 21, 242, 1) 70%,
  //       rgba(186, 12, 248, 1) 80%,
  //       rgba(251, 7, 217, 1) 90%,
  //       rgba(255, 0, 0, 1) 100%
  //   ) 0/200%`,
  //   animation: `${rainbowTextAnimation} 10s linear infinite`,
  //   ':hover': {
  //     background: `linear-gradient(
  //       90deg,
  //       rgba(255, 0, 0, 1) 0%,
  //       rgba(255, 154, 0, 1) 10%,
  //       rgba(208, 222, 33, 1) 20%,
  //       rgba(79, 220, 74, 1) 30%,
  //       rgba(63, 218, 216, 1) 40%,
  //       rgba(47, 201, 226, 1) 50%,
  //       rgba(28, 127, 238, 1) 60%,
  //       rgba(95, 21, 242, 1) 70%,
  //       rgba(186, 12, 248, 1) 80%,
  //       rgba(251, 7, 217, 1) 90%,
  //       rgba(255, 0, 0, 1) 100%
  //   ) 0/200%`,
  //   },
  //   '&[data-active]': {
  //     background: `linear-gradient(
  //       90deg,
  //       rgba(255, 0, 0, 1) 0%,
  //       rgba(255, 154, 0, 1) 10%,
  //       rgba(208, 222, 33, 1) 20%,
  //       rgba(79, 220, 74, 1) 30%,
  //       rgba(63, 218, 216, 1) 40%,
  //       rgba(47, 201, 226, 1) 50%,
  //       rgba(28, 127, 238, 1) 60%,
  //       rgba(95, 21, 242, 1) 70%,
  //       rgba(186, 12, 248, 1) 80%,
  //       rgba(251, 7, 217, 1) 90%,
  //       rgba(255, 0, 0, 1) 100%
  //   ) 0/200%`,
  //   },
  // },
  moreButton: {
    padding: '8px 10px 8px 16px',
    fontSize: 16,
    fontWeight: 500,
    display: 'none',

    [`&[data-active="true"]`]: {
      background: theme.colorScheme === 'dark' ? theme.colors.dark[4] : theme.colors.gray[4],
      color: theme.colorScheme === 'dark' ? theme.white : theme.colors.gray[8],
    },

    ['@container (min-width: 992px) and (max-width: 1440px)']: {
      display: 'block',
    },
  },

  groupedOptions: {
    display: 'block',

    ['@container (min-width: 992px) and (max-width: 1440px)']: {
      display: 'none',
    },
  },
}));

export function HomeTabs() {
  const router = useRouter();
  const activePath = router.pathname.split('/')[1] || 'home';
  const features = useFeatureFlags();
  const { t } = useTranslation(); // ✅ lấy hàm t()

  const [lastSeenChangelog] = useLocalStorage<number>({
    key: 'last-seen-changelog',
    defaultValue: 0,
    getInitialValueInEffect: false,
  });

  const { data: latestChangelog } = trpc.changelog.getLatest.useQuery();
  const options = filterHomeOptions(features);

  return (
    <div className="flex flex-col gap-1">
      {options.map(({ key, url, icon: Icon, new: isNew, classes }, index) => {
        const isActive = activePath === key || (activePath === 'changelog' && key === 'updates');

        return (
          <React.Fragment key={key}>
            <Link href={url} passHref legacyBehavior>
              <UnstyledButton
                component="a"
                className={clsx(
                  'flex w-full items-center rounded-md px-4 py-2 transition hover:bg-gray-100 dark:hover:bg-dark-4',
                  {
                    'bg-gray-200 dark:bg-dark-6': isActive,
                  },
                  ...(classes ?? [])
                )}
              >
                <Icon size={18} className="mr-2 text-gray-700 dark:text-gray-300" />
                <span className="flex-1 text-sm font-medium capitalize text-gray-800 dark:text-gray-100">
                  {t(key)}
                </span>

                {key === 'updates' && (latestChangelog ?? 0) > lastSeenChangelog && (
                  <IconPointFilled color="green" size={16} />
                )}
                {!!isNew && isNew > new Date() && <Badge size="xs">New</Badge>}
              </UnstyledButton>
            </Link>

            {/* Thêm dấu gạch sau mỗi 4 mục */}
            {(index + 1) % 4 === 0 && index !== options.length - 1 && (
              <hr className="my-1 border-gray-500 dark:border-dark-4" />
            )}
          </React.Fragment>
        );
      })}
    </div>
  );
}
