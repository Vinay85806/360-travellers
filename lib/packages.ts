import { supabase } from "./supabase";

export type ItineraryDay = {
  day: number;
  title: string;
  description: string;
};

export type TravelPackage = {
  id: string;
  title: string;
  description: string;
  category: "domestic" | "international";
  price: number;
  duration: string;
  image_url: string;
  itinerary: ItineraryDay[];
  created_at?: string;
};

const COLUMNS =
  "id, title, description, category, price, duration, image_url, itinerary, created_at";

/** Shown when a package row has no image_url yet. Local file in /public. */
export const PLACEHOLDER_IMAGE = "/images/placeholder.svg";

/** Safe image source for next/image — never empty (which would throw). */
export function packageImage(pkg: Pick<TravelPackage, "image_url">): string {
  const url = pkg.image_url?.trim();
  return url ? url : PLACEHOLDER_IMAGE;
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

  return (data as TravelPackage[]) ?? [];
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

  return (data as TravelPackage | null) ?? null;
}
