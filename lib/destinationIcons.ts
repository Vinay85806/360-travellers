/**
 * Destination icon sprites — edit crop coordinates here, no database needed.
 *
 * For each destination slug, give the pixel rectangle of its icon within its
 * sprite sheet: { x, y, w, h, sprite, spriteW, spriteH }.
 * Slugs without an entry fall back to the default map-pin icon.
 */

// ── Sprite 1 — original 12 domestic icons ────────────────────────────────────
export const SPRITE_URL =
  "https://fqrghsvqijxnglbrjhwo.supabase.co/storage/v1/object/public/images/icons/12 domestic icons (1).png";
export const SPRITE_W = 1080;
export const SPRITE_H = 709;

// ── Sprite 2 — new icons (Ladakh, Spiti, Chardham, Uttarakhand, Kashmir …) ───
// TODO: paste the public URL of your new sprite from Supabase Storage below
export const SPRITE2_URL = "https://fqrghsvqijxnglbrjhwo.supabase.co/storage/v1/object/public/images/icons/icons.png";
export const SPRITE2_W = 1280; // update with actual width  of the new PNG
export const SPRITE2_H = 832;  // update with actual height of the new PNG

export type IconCrop = {
  x: number; y: number; w: number; h: number;
  sprite?: string; spriteW?: number; spriteH?: number;
};

// slug → crop rectangle (+ optional sprite override for icons on Sprite 2)
export const DESTINATION_ICON_CROPS: Record<string, IconCrop> = {
  // ── Sprite 1 ──────────────────────────────────────────────────────────────
  kerala:             { x: 94,  y: 76,  w: 116, h: 132 },
  goa:                { x: 609, y: 76,  w: 125, h: 111 },
  "himachal-pradesh": { x: 90,  y: 274, w: 137, h: 124 },
  gujarat:            { x: 93,  y: 487, w: 133, h: 117 },
  rajasthan:          { x: 347, y: 274, w: 135, h: 125 },
  andaman:            { x: 607, y: 489, w: 129, h: 117 },
  delhi:              { x: 878, y: 73,  w: 104, h: 124 },
  assam:              { x: 351, y: 497, w: 131, h: 99  },

  // ── Sprite 2 ──────────────────────────────────────────────────────────────
  "spiti-valley": { x: 38, y: 47, w: 247, h: 178, sprite: SPRITE2_URL, spriteW: SPRITE2_W, spriteH: SPRITE2_H },
};
