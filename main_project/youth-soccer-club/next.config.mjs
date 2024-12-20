/** @type {import('next').NextConfig} */
const nextConfig = {
  output: "standalone",
  experimental: {
    turbo: {},
    instrumentationHook: true,
  },
};

export default nextConfig;
