import { useRouter } from 'next/router';
import { ArticleFeedFilters } from '~/components/Filters/FeedFilters/ArticleFeedFilters';
import { BountyFeedFilters } from '~/components/Filters/FeedFilters/BountyFeedFilters';
import { ImageFeedFilters } from '~/components/Filters/FeedFilters/ImageFeedFilters';
import { ModelFeedFilters } from '~/components/Filters/FeedFilters/ModelFeedFilters';
import { PostFeedFilters } from '~/components/Filters/FeedFilters/PostFeedFilters';
import { VideoFeedFilters } from '~/components/Filters/FeedFilters/VideoFeedFilters';
import { ToolFeedFilters } from '~/components/Filters/FeedFilters/ToolFeedFilters';
import { ManageHomepageButton } from '~/components/HomeBlocks/ManageHomepageButton';
import { HomeTabs } from '~/components/HomeContentToggle/HomeContentToggle';
import { ToolImageFeedFilters } from '~/components/Filters/FeedFilters/ToolImageFeedFilters';
import clsx from 'clsx';
import { SocialLinks } from '~/components/SocialLinks/SocialLinks';
const filterSections = [
  { pathname: '/', component: <ManageHomepageButton ml="auto" /> },
  { pathname: '/models', component: <ModelFeedFilters ml="auto" /> },
  { pathname: '/images', component: <ImageFeedFilters ml="auto" /> },
  { pathname: '/videos', component: <VideoFeedFilters ml="auto" /> },
  { pathname: '/posts', component: <PostFeedFilters ml="auto" /> },
  { pathname: '/articles', component: <ArticleFeedFilters ml="auto" /> },
  { pathname: '/bounties', component: <BountyFeedFilters ml="auto" /> },
  { pathname: '/tools', component: <ToolFeedFilters ml="auto" /> },
  { pathname: '/tools/[slug]', component: <ToolImageFeedFilters ml="auto" /> },
];

export function SubNav2({ isVisible = false }: { isVisible?: boolean }) {
  const router = useRouter();
  const section = filterSections.find((x) => x.pathname === router.pathname);

  if (!isVisible) return null;

  return (
    <div className="flex flex-col gap-4 bg-dark-6 px-4 py-3">
      {/* Menu chính */}
      <div className="flex flex-col gap-2">
        <HomeTabs />
      </div>

      {/* Bộ lọc */}
      {section?.component && <div className="flex flex-col gap-2">{section.component}</div>}

      {/* Social icons below */}
      <div className="mt-3 flex flex-wrap items-center justify-start gap-2">
        <SocialLinks />
      </div>
    </div>
  );
}
