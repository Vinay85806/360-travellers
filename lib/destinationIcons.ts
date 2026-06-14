/**
 * Destination icon sprite — edit crop coordinates here, no database needed.
 *
 * The sprite holds all icons in one image. For each destination slug, give the
 * pixel rectangle of its icon within the sprite: { x, y, w, h }.
 *   - x, y  = top-left corner of the icon in the sprite (pixels)
 *   - w, h  = icon width and height (pixels)
 *
 * Slugs without an entry fall back to the default map-pin icon.
 * Read coordinates from any image editor (hover the icon's corners).
 */

export const SPRITE_URL =
  "https://fqrghsvqijxnglbrjhwo.supabase.co/storage/v1/object/public/images/icons/12 domestic icons (1).png";

// Natural pixel size of the sprite image.
export const SPRITE_W = 1080;
export const SPRITE_H = 709;

export type IconCrop = { x: number; y: number; w: number; h: number };

// slug -> crop rectangle
export const DESTINATION_ICON_CROPS: Record<string, IconCrop> = {
  kerala: { x: 94, y: 76, w: 116, h: 132 },
  goa: { x: 609, y: 76, w: 125, h: 111 },
  "himachal-pradesh": { x: 90, y: 274, w: 137, h: 124 },
   rajasthan: { x: 88, y: 483, w: 141, h: 128 },
  // gujarat: { x: ?, y: ?, w: ?, h: ? },
  andaman: { x: 607, y: 489, w: 129, h: 117 },
  // uttar-pradesh: { x: ?, y: ?, w: ?, h: ? },
  // delhi: { x: ?, y: ?, w: ?, h: ? },
  // sikkim: { x: ?, y: ?, w: ?, h: ? },
  // assam: { x: ?, y: ?, w: ?, h: ? },
};
