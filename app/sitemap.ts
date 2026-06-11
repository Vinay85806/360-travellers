import type { MetadataRoute } from "next";
import { getAllPackageSlugs } from "@/lib/packages";

const SITE = "https://360travellers.vercel.app"; // update to your live domain

export default async function sitemap(): Promise<MetadataRoute.Sitemap> {
  const packages = await getAllPackageSlugs();

  const packageUrls: MetadataRoute.Sitemap = packages.map((p) => ({
    url: `${SITE}/packages/${p.slug}`,
    lastModified: new Date(),
    changeFrequency: "weekly",
    priority: 0.8,
  }));

  return [
    {
      url: SITE,
      lastModified: new Date(),
      changeFrequency: "daily",
      priority: 1,
    },
    ...packageUrls,
  ];
}
