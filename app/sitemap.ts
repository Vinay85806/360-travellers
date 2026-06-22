import type { MetadataRoute } from "next";
import { getAllPackageSlugs, getDestinations } from "@/lib/packages";

const SITE = "https://360travellers.com";

export default async function sitemap(): Promise<MetadataRoute.Sitemap> {
  const [slugs, destinations] = await Promise.all([
    getAllPackageSlugs(),
    getDestinations(),
  ]);

  const now = new Date();

  const destinationUrls: MetadataRoute.Sitemap = destinations.map((d) => ({
    url: `${SITE}/destinations/${d.slug}`,
    lastModified: now,
    changeFrequency: "daily",
    priority: 0.9,
  }));

  const packageUrls: MetadataRoute.Sitemap = slugs.map((p) => ({
    url: `${SITE}/packages/${p.slug}`,
    lastModified: now,
    changeFrequency: "weekly",
    priority: 0.8,
  }));

  return [
    { url: SITE, lastModified: now, changeFrequency: "daily", priority: 1 },
    ...destinationUrls,
    ...packageUrls,
  ];
}
