import { supabase } from "./supabase";

export type ItineraryDay = {
  day: number;
  title: string;
  description: string;
  image?: string;
};

export type TravelPackage = {
  id: string;
  title: string;
  slug?: string | null;
  description: string;
  category: "domestic" | "international";
  destination?: string | null;
  destination_slug?: string | null;
  price: number;
  original_price?: number | null;
  duration: string;
  nights?: number | null;
  days?: number | null;
  location?: string | null;
  image_url: string;
  gallery?: string[];
  itinerary: ItineraryDay[];
  highlights?: string[];
  inclusions?: string[];
  exclusions?: string[];
  know_before?: string[];
  route?: string[];
  rating?: number | null;
  review_count?: number | null;
  created_at?: string;
};

// Select everything; missing columns simply come back undefined.
const COLUMNS = "*";

/** Shown when a package row has no image_url yet. Local file in /public. */
export const PLACEHOLDER_IMAGE = "/images/placeholder.svg";

/** Safe image source for next/image — never empty (which would throw). */
export function packageImage(pkg: Pick<TravelPackage, "image_url">): string {
  const url = pkg.image_url?.trim();
  return url ? url : PLACEHOLDER_IMAGE;
}

/** Normalises a row's array-ish fields so the UI can rely on real arrays. */
function normalize(row: TravelPackage): TravelPackage {
  const arr = (v: unknown): string[] => (Array.isArray(v) ? (v as string[]) : []);
  return {
    ...row,
    gallery: arr(row.gallery),
    highlights: arr(row.highlights),
    inclusions: arr(row.inclusions),
    exclusions: arr(row.exclusions),
    know_before: arr(row.know_before),
    route: arr(row.route),
    itinerary: Array.isArray(row.itinerary) ? row.itinerary : [],
  };
}

/** Fetches the first N packages, newest first. Returns [] on error. */
export async function getPackages(limit = 6): Promise<TravelPackage[]> {
  const { data, error } = await supabase
    .from("packages")
    .select(COLUMNS)
    .order("created_at", { ascending: false })
    .limit(limit);

  if (error) {
    console.error("Failed to fetch packages:", error.message);
    return [];
  }

  return ((data as TravelPackage[]) ?? []).map(normalize);
}

/** Fetches a single package by id. Returns null if not found or on error. */
export async function getPackageById(
  id: string
): Promise<TravelPackage | null> {
  const { data, error } = await supabase
    .from("packages")
    .select(COLUMNS)
    .eq("id", id)
    .maybeSingle();

  if (error) {
    console.error(`Failed to fetch package ${id}:`, error.message);
    return null;
  }

  return data ? normalize(data as TravelPackage) : null;
}

/** Fetches a single package by SEO slug. Returns null if not found. */
export async function getPackageBySlug(
  slug: string
): Promise<TravelPackage | null> {
  const { data, error } = await supabase
    .from("packages")
    .select(COLUMNS)
    .eq("slug", slug)
    .maybeSingle();

  if (error) {
    console.error(`Failed to fetch package by slug ${slug}:`, error.message);
    return null;
  }

  return data ? normalize(data as TravelPackage) : null;
}

export type DestinationGroup = {
  destination: string;
  destination_slug: string;
  packages: TravelPackage[];
};

/**
 * Groups packages by destination, preserving first-seen order.
 * Packages without a destination fall back to a group keyed by category.
 */
export function groupByDestination(
  packages: TravelPackage[]
): DestinationGroup[] {
  const order: string[] = [];
  const map = new Map<string, DestinationGroup>();

  for (const p of packages) {
    const name =
      p.destination ?? (p.category === "domestic" ? "India" : "International");
    const slug =
      p.destination_slug ??
      name.toLowerCase().replace(/[^a-z0-9]+/g, "-").replace(/(^-|-$)/g, "");

    if (!map.has(slug)) {
      order.push(slug);
      map.set(slug, { destination: name, destination_slug: slug, packages: [] });
    }
    map.get(slug)!.packages.push(p);
  }

  return order.map((s) => map.get(s)!);
}

/** Sibling packages sharing a destination — powers the duration switcher. */
export async function getPackagesByDestinationSlug(
  destinationSlug: string
): Promise<TravelPackage[]> {
  const { data, error } = await supabase
    .from("packages")
    .select(COLUMNS)
    .eq("destination_slug", destinationSlug)
    .order("price", { ascending: true });

  if (error) {
    console.error(`Failed to fetch destination ${destinationSlug}:`, error.message);
    return [];
  }

  return ((data as TravelPackage[]) ?? []).map(normalize);
}

/** All packages — for building the sitemap / static params. */
export async function getAllPackageSlugs(): Promise<
  { slug: string; id: string }[]
> {
  const { data, error } = await supabase
    .from("packages")
    .select("id, slug");

  if (error) {
    console.error("Failed to fetch slugs:", error.message);
    return [];
  }

  return (data as { id: string; slug: string | null }[])
    .filter((r): r is { id: string; slug: string } => Boolean(r.slug));
}
