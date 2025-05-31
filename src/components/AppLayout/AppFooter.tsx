import { Button, Text, HoverCard } from '@mantine/core';
import { IconDots } from '@tabler/icons-react';
import { NextLink as Link } from '~/components/NextLink/NextLink';

import { useDomainColor } from '~/hooks/useDomainColor';
import { useBrowsingSettingsAddons } from '~/providers/BrowsingSettingsAddonsProvider';
import { useFeatureFlags } from '~/providers/FeatureFlagsProvider';
import { ColorDomain } from '~/server/common/constants';
import { FeatureAccess } from '~/server/services/feature-flags.service';

const footerLinks: (React.ComponentProps<typeof Button<typeof Link>> & {
  domains?: ColorDomain[];
  features?: (features: FeatureAccess) => boolean;
  key: string;
})[] = [
  { key: 'creator-program', href: '/creator-program', color: 'blue', children: 'Creators' },
  { key: 'tos', href: '/content/tos', children: 'Terms of Service' },
  { key: '2257', href: '/content/2257', children: '18 U.S.C. §2257' },
  { key: 'privacy', href: '/content/privacy', children: 'Privacy' },
  { key: 'safety', href: '/safety', children: 'Safety', features: (features) => features.safety },
  {
    key: 'newsroom',
    href: '/newsroom',
    children: 'Newsroom',
    features: (features) => features.newsroom,
  },
  {
    key: 'api',
    href: '/github/wiki/REST-API-Reference',
    target: '_blank',
    rel: 'nofollow noreferrer',
    children: 'API',
  },
  {
    key: 'status',
    href: 'https://status.civitai.com',
    target: '_blank',
    rel: 'nofollow noreferrer',
    children: 'Status',
  },
  { key: 'wiki', href: '/wiki', target: '_blank', rel: 'nofollow noreferrer', children: 'Wiki' },
  {
    key: 'education',
    href: '/education',
    target: '_blank',
    rel: 'nofollow noreferrer',
    children: '💡Education',
  },
  { key: 'content-removal', href: '/content/content-removal-request', children: 'Content Removal' },
  { key: 'careers', href: '/content/careers', children: 'Careers' },
];

export function SidebarFooterContent() {
  const features = useFeatureFlags();
  const domain = useDomainColor();
  const browsingSettingsAddons = useBrowsingSettingsAddons();

  const visibleLinks = footerLinks.filter(
    (item) =>
      ((!item.features && !item.domains) ||
        item.features?.(features) ||
        item.domains?.includes(domain)) &&
      !(browsingSettingsAddons.settings.excludedFooterLinks ?? []).includes(item.key)
  );

  return (
    <div className="border-t border-gray-3 bg-dark-6 p-3 text-white dark:border-dark-4">
      {/* See More with HoverCard */}
      <HoverCard width={320} shadow="md" position="top" withinPortal>
        <HoverCard.Target>
          <Button variant="subtle" color="gray" size="xs" className="mb-2">
            <IconDots size={16} />
            See More
          </Button>
        </HoverCard.Target>

        <HoverCard.Dropdown className="rounded border border-gray-3 bg-dark-6 p-2">
          <div className="flex flex-wrap gap-2">
            {visibleLinks.map(({ features, key, ...props }, i) => (
              <Button
                key={key ?? i}
                component={Link}
                {...props}
                className="px-2"
                size="xs"
                variant="subtle"
                color="gray"
              />
            ))}
          </div>
        </HoverCard.Dropdown>
      </HoverCard>
    </div>
  );
}
