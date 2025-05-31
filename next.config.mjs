// @ts-check
import { withAxiom } from '@civitai/next-axiom';
import bundlAnalyzer from '@next/bundle-analyzer';
import packageJson from './package.json' assert { type: 'json' };

const isProd = process.env.NODE_ENV === 'production';
const isDev = process.env.NODE_ENV === 'development';
const analyze = process.env.ANALYZE === 'true';

const withBundleAnalyzer = bundlAnalyzer({ enabled: analyze });

/**
 * @template {import('next').NextConfig} T
 * @param {T} config
 */
function defineNextConfig(config) {
  return withBundleAnalyzer(config);
}

const nextConfig = defineNextConfig({
  env: {
    version: packageJson.version,
  },
  reactStrictMode: true,
  productionBrowserSourceMaps: true,
  // ✅ i18n config
  i18n: {
    locales: ['en', 'vi'],
    defaultLocale: 'en',
  },
  eslint: {
    ignoreDuringBuilds: true,
  },
  generateEtags: false,
  compress: false,
  images: {
    remotePatterns: [
      { hostname: 's3.us-west-1.wasabisys.com' },
      { hostname: 'model-share.s3.us-west-1.wasabisys.com' },
      { hostname: 'civitai-prod.s3.us-west-1.wasabisys.com' },
      { hostname: 'civitai-dev.s3.us-west-1.wasabisys.com' },
      { hostname: 'image.civitai.com' },
    ],
  },
  compiler: isProd
    ? {
      reactRemoveProperties: { properties: ['^data-testid$'] },
      // removeConsole: true,
    }
    : {},
  transpilePackages: ['lodash', 'lodash-es', 'prisma'],
  experimental: {
    largePageDataBytes: 512 * 100000,
    optimizePackageImports: ['@civitai/client', './srs/libs/form'],
  },
  headers: async () => {
    const headers = [
      {
        source: '/sitemap(-\\w+)?.xml',
        headers: [
          { key: 'X-Robots-Tag', value: 'noindex' },
          { key: 'Content-Type', value: 'application/xml' },
          { key: 'Cache-Control', value: 'public, max-age=86400, must-revalidate' },
        ],
      },
    ];

    if (process.env.NODE_ENV !== 'production') {
      headers.push({
        source: '/:path*',
        headers: [{ key: 'X-Robots-Tag', value: 'noindex' }],
      });
    }

    headers.push({
      source: '/:path*',
      headers: [{ key: 'X-Frame-Options', value: 'DENY' }],
    });

    return headers;
  },
  poweredByHeader: false,
  redirects: async () => [
    {
      source: '/api/download/training-data/:modelVersionId',
      destination: '/api/download/models/:modelVersionId?type=Training%20Data',
      permanent: true,
    },
    {
      source: '/github/:path*',
      destination: 'https://github.com/civitai/civitai/:path*',
      permanent: true,
    },
    {
      source: '/discord',
      destination: 'https://discord.gg/civitai',
      permanent: true,
    },
    {
      source: '/twitter',
      destination: 'https://twitter.com/HelloCivitai',
      permanent: true,
    },
    {
      source: '/reddit',
      destination: 'https://reddit.com/r/civitai',
      permanent: true,
    },
    {
      source: '/instagram',
      destination: 'https://www.instagram.com/hellocivitai/',
      permanent: true,
    },
    {
      source: '/tiktok',
      destination: 'https://www.tiktok.com/@hellocivitai',
      permanent: true,
    },
    {
      source: '/youtube',
      destination: 'https://www.youtube.com/@civitai',
      permanent: true,
    },
    {
      source: '/twitch',
      destination: 'https://www.twitch.tv/civitai',
      permanent: true,
    },
    {
      source: '/ideas',
      destination: 'https://github.com/civitai/civitai/discussions/categories/ideas',
      permanent: true,
    },
    {
      source: '/v/civitai-link-intro',
      destination: 'https://youtu.be/EHUjiDgh-MI',
      permanent: false,
    },
    {
      source: '/v/civitai-link-installation',
      destination: 'https://youtu.be/fs-Zs-fvxb0',
      permanent: false,
    },
    {
      source: '/gallery/:path*',
      destination: '/images/:path*',
      permanent: true,
    },
    {
      source: '/support-portal',
      destination:
        'https://civitai-team.myfreshworks.com/login/auth/civitai?client_id=451979510707337272&redirect_uri=https%3A%2F%2Fcivitai.freshdesk.com%2Ffreshid%2Fcustomer_authorize_callback%3Fhd%3Dsupport.civitai.com',
      permanent: true,
    },
    {
      source: '/leaderboard',
      destination: '/leaderboard/overall',
      permanent: true,
    },
    {
      source: '/forms/bounty-refund',
      destination: 'https://forms.clickup.com/8459928/f/825mr-8331/R30FGV9JFHLF527GGN',
      permanent: true,
    },
    {
      source: '/air/confirm',
      destination: '/studio/confirm',
      permanent: true,
    },
    {
      source: '/wiki',
      destination: 'https://wiki.civitai.com',
      permanent: true,
    },
    {
      source: '/education',
      destination: 'https://education.civitai.com',
      permanent: true,
    },
    {
      source: '/cosmetic-shop',
      destination: '/shop',
      permanent: true,
    },
    {
      source: '/shop/cosmetic-shop',
      destination: '/shop',
      permanent: true,
    },
    {
      source: '/projectodyssey_season2',
      destination: '/collections/6503138',
      permanent: true,
    },
    {
      source: '/creators-program',
      destination: '/creator-program',
      permanent: true,
    },
  ],
  output: 'standalone',
});

// ✅ Bọc config với Axiom ở ngoài cùng
export default withAxiom(nextConfig);
