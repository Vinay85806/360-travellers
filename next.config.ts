import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  images: {
    // Uploaded package photos never change in place (filenames are
    // timestamp-unique), so cache optimized variants for a year instead
    // of the 60s default — avoids repeat cold-transform latency.
    minimumCacheTTL: 31536000,
    remotePatterns: [
      {
        protocol: "https",
        hostname: "images.unsplash.com",
      },
      {
        // Supabase Storage — primary image source
        protocol: "https",
        hostname: "fqrghsvqijxnglbrjhwo.supabase.co",
        pathname: "/storage/v1/object/public/**",
      },
      {
        // Google Photos / Google user content (note: links may expire)
        protocol: "https",
        hostname: "*.googleusercontent.com",
      },
      {
        // Google Drive direct image links
        protocol: "https",
        hostname: "drive.google.com",
      },
      {
        // Cloudinary (free 25 GB CDN — recommended for large catalogs)
        protocol: "https",
        hostname: "res.cloudinary.com",
      },
      {
        // imgbb.com — free permanent image hosting
        protocol: "https",
        hostname: "i.ibb.co",
      },
    ],
  },
};

export default nextConfig;