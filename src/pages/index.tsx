import { FeedLayout } from '~/components/AppLayout/FeedLayout';
import { Page } from '~/components/AppLayout/Page';
import { Home as PersonalizedHomepage } from '~/pages/home';
import { createServerSideProps } from '~/server/utils/server-side-helpers';
import { publicBrowsingLevelsFlag } from '~/shared/constants/browsingLevel.constants';
import { serverSideTranslations } from 'next-i18next/serverSideTranslations';

export const getServerSideProps = createServerSideProps({
  useSession: true,
  useSSG: true,
  resolver: async ({ ssg, ctx }) => {
    const locale = ctx.locale ?? 'en';

    if (ssg) await ssg.homeBlock.getHomeBlocks.prefetch({});

    return {
      props: {
        ...(await serverSideTranslations(locale, ['common'])), // ✅ Thêm dòng này
      },
    };
  },
});

function Home() {
  return <PersonalizedHomepage />;
}

export default Page(Home, {
  announcements: true,
  InnerLayout: FeedLayout,
  browsingLevel: publicBrowsingLevelsFlag,
});
