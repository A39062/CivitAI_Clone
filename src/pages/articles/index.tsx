import { Group, Stack, Title } from '@mantine/core';

import { Announcements } from '~/components/Announcements/Announcements';
import { useArticleQueryParams } from '~/components/Article/article.utils';
import { ArticleCategoriesInfinite } from '~/components/Article/Categories/ArticleCategoriesInfinite';
import { ArticleCategories } from '~/components/Article/Infinite/ArticleCategories';
import { ArticlesInfinite } from '~/components/Article/Infinite/ArticlesInfinite';
import { PeriodFilter, SortFilter, ViewToggle } from '~/components/Filters';
import { FullHomeContentToggle } from '~/components/HomeContentToggle/FullHomeContentToggle';
import { HomeContentToggle } from '~/components/HomeContentToggle/HomeContentToggle';
import { MasonryContainer } from '~/components/MasonryColumns/MasonryContainer';
import { MasonryProvider } from '~/components/MasonryColumns/MasonryProvider';
import { Meta } from '~/components/Meta/Meta';
import { env } from '~/env/client.mjs';
import { hideMobile, showMobile } from '~/libs/sx-helpers';
import { useFeatureFlags } from '~/providers/FeatureFlagsProvider';
import { useFiltersContext } from '~/providers/FiltersProvider';
import { constants } from '~/server/common/constants';
import { createServerSideProps } from '~/server/utils/server-side-helpers';

export const getServerSideProps = createServerSideProps({
  useSession: true,
  resolver: async ({ features }) => {
    if (!features?.articles)
      return {
        redirect: {
          destination: '/',
          permanent: false,
        },
      };
  },
});

export default function ArticlesPage() {
  const features = useFeatureFlags();
  const storedView = useFiltersContext((state) => state.articles.view);
  const { view: queryView, ...filters } = useArticleQueryParams();

  const view = queryView ?? storedView;

  return (
    <>
      <Meta
        title="Civitai Articles | Community Guides and Insights"
        description="Learn, innovate, and draw inspiration from generative AI articles written by the Civitai community"
        links={[{ href: `${env.NEXT_PUBLIC_BASE_URL}/articles`, rel: 'canonical' }]}
      />
      <MasonryProvider
        columnWidth={constants.cardSizes.image}
        maxColumnCount={7}
        maxSingleColumnWidth={450}
      >
        <MasonryContainer fluid>
          {filters.favorites && <Title>Your Bookmarked Articles</Title>}
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
                <SortFilter type="articles" />
              </Group>
              <Group spacing={4}>
                <PeriodFilter type="articles" />
                <ViewToggle type="articles" />
              </Group>
            </Group>
            {view === 'categories' ? (
              <ArticleCategoriesInfinite filters={filters} />
            ) : (
              <>
                <ArticleCategories />
                <ArticlesInfinite filters={filters} />
              </>
            )}
          </Stack>
        </MasonryContainer>
      </MasonryProvider>
    </>
  );
}
