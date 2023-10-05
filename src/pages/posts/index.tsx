import { Group, Stack } from '@mantine/core';
import { Announcements } from '~/components/Announcements/Announcements';
import { PeriodFilter, SortFilter, ViewToggle } from '~/components/Filters';
import { FullHomeContentToggle } from '~/components/HomeContentToggle/FullHomeContentToggle';
import { HomeContentToggle } from '~/components/HomeContentToggle/HomeContentToggle';
import { IsClient } from '~/components/IsClient/IsClient';
import { MasonryContainer } from '~/components/MasonryColumns/MasonryContainer';
import { MasonryProvider } from '~/components/MasonryColumns/MasonryProvider';
import { Meta } from '~/components/Meta/Meta';
import { PostCategoriesInfinite } from '~/components/Post/Categories/PostCategoriesInfinite';
import { PostCategories } from '~/components/Post/Infinite/PostCategories';
import PostsInfinite from '~/components/Post/Infinite/PostsInfinite';
import { usePostQueryParams } from '~/components/Post/post.utils';
import { env } from '~/env/client.mjs';
import { useCurrentUser } from '~/hooks/useCurrentUser';
import { hideMobile, showMobile } from '~/libs/sx-helpers';
import { useFeatureFlags } from '~/providers/FeatureFlagsProvider';
import { useFiltersContext } from '~/providers/FiltersProvider';
import { constants } from '~/server/common/constants';

export default function PostsPage() {
  const currentUser = useCurrentUser();
  const features = useFeatureFlags();
  const storedView = useFiltersContext((state) => state.posts.view);
  const { view: queryView, ...filters } = usePostQueryParams();

  const view = queryView ?? storedView;
  return (
    <>
      <Meta
        title={`Civitai${
          !currentUser ? ` Posts | Explore Community-Created Content with Custom AI Resources` : ''
        }`}
        description="Discover engaging posts from our growing community on Civitai, featuring unique and creative content generated with custom Stable Diffusion AI resources crafted by talented community members."
        links={[{ href: `${env.NEXT_PUBLIC_BASE_URL}/posts`, rel: 'canonical' }]}
      />
      <MasonryProvider
        columnWidth={constants.cardSizes.image}
        maxColumnCount={7}
        maxSingleColumnWidth={450}
      >
        <MasonryContainer fluid>
          <Stack spacing="xs">
            <Announcements
              sx={(theme) => ({
                marginBottom: -35,
                [theme.fn.smallerThan('md')]: {
                  marginBottom: -5,
                },
              })}
            />
            <Group position="left">
              {features.alternateHome ? (
                <FullHomeContentToggle />
              ) : (
                <HomeContentToggle sx={showMobile} />
              )}
            </Group>
            <Group position="apart" spacing={0}>
              <Group>
                {!features.alternateHome && <HomeContentToggle sx={hideMobile} />}
                <SortFilter type="posts" />
              </Group>
              <Group spacing={4}>
                <PeriodFilter type="posts" />
                <ViewToggle type="posts" />
              </Group>
            </Group>
            <IsClient>
              {view === 'categories' ? (
                <PostCategoriesInfinite filters={filters} />
              ) : (
                <>
                  <PostCategories />
                  <PostsInfinite filters={filters} showEof />
                </>
              )}
            </IsClient>
          </Stack>
        </MasonryContainer>
      </MasonryProvider>
    </>
  );
}
