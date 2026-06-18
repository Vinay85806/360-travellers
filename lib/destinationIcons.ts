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

// ── Sprite 2 — domestic icons (Ladakh, Spiti, Chardham, Uttarakhand …) ──────
export const SPRITE2_URL = "https://fqrghsvqijxnglbrjhwo.supabase.co/storage/v1/object/public/images/icons/icons.png";
export const SPRITE2_W = 1280;
export const SPRITE2_H = 832;

// ── Sprite 3 — international icons (Thailand, Bali, Maldives, Egypt …) ──────
export const SPRITE3_URL = "https://fqrghsvqijxnglbrjhwo.supabase.co/storage/v1/object/public/images/icons/Gemini_Generated_Image_khifk2khifk2khif.png";
export const SPRITE3_W = 1280;
export const SPRITE3_H = 832;

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
  rajasthan:          { x: 347, y: 274, w: 135, h: 125 },
  andaman:            { x: 607, y: 489, w: 129, h: 117 },
  delhi:              { x: 878, y: 73,  w: 104, h: 124 },
  assam:              { x: 351, y: 497, w: 131, h: 99  },

  // ── Sprite 2 ──────────────────────────────────────────────────────────────
  "spiti-valley":  { x: 492, y: 439, w: 109, h: 69,  sprite: SPRITE2_URL, spriteW: SPRITE2_W, spriteH: SPRITE2_H },
  ladakh:          { x: 300, y: 438, w: 113, h: 69,  sprite: SPRITE2_URL, spriteW: SPRITE2_W, spriteH: SPRITE2_H },
  chardham:        { x: 684, y: 439, w: 112, h: 68,  sprite: SPRITE2_URL, spriteW: SPRITE2_W, spriteH: SPRITE2_H },
  uttarakhand:     { x: 883, y: 440, w: 96,  h: 69,  sprite: SPRITE2_URL, spriteW: SPRITE2_W, spriteH: SPRITE2_H },
  kashmir:         { x: 304, y: 565, w: 107, h: 60,  sprite: SPRITE2_URL, spriteW: SPRITE2_W, spriteH: SPRITE2_H },
  gujarat:         { x: 516, y: 558, w: 60,  h: 71,  sprite: SPRITE2_URL, spriteW: SPRITE2_W, spriteH: SPRITE2_H },
  meghalaya:       { x: 684, y: 562, w: 110, h: 64,  sprite: SPRITE2_URL, spriteW: SPRITE2_W, spriteH: SPRITE2_H },
  "uttar-pradesh": { x: 883, y: 561, w: 97,  h: 66,  sprite: SPRITE2_URL, spriteW: SPRITE2_W, spriteH: SPRITE2_H },
  lakshadweep:     { x: 309, y: 679, w: 100, h: 73,  sprite: SPRITE2_URL, spriteW: SPRITE2_W, spriteH: SPRITE2_H },
  maharashtra:     { x: 469, y: 681, w: 102, h: 72,  sprite: SPRITE2_URL, spriteW: SPRITE2_W, spriteH: SPRITE2_H },
  "west-bengal":   { x: 684, y: 684, w: 115, h: 61,  sprite: SPRITE2_URL, spriteW: SPRITE2_W, spriteH: SPRITE2_H },
  karnataka:       { x: 883, y: 682, w: 97,  h: 71,  sprite: SPRITE2_URL, spriteW: SPRITE2_W, spriteH: SPRITE2_H },
  sikkim:          { x: 695, y: 166, w: 89,  h: 88,  sprite: SPRITE2_URL, spriteW: SPRITE2_W, spriteH: SPRITE2_H },

  // ── International ─────────────────────────────────────────────────────────
  thailand:        { x: 69,  y: 30,  w: 180, h: 177, sprite: SPRITE3_URL, spriteW: SPRITE3_W, spriteH: SPRITE3_H },
  bali:            { x: 382, y: 25,  w: 198, h: 187, sprite: SPRITE3_URL, spriteW: SPRITE3_W, spriteH: SPRITE3_H },
  maldives:        { x: 694, y: 26,  w: 219, h: 184, sprite: SPRITE3_URL, spriteW: SPRITE3_W, spriteH: SPRITE3_H },
  egypt:           { x: 1010,y: 36,  w: 221, h: 159, sprite: SPRITE3_URL, spriteW: SPRITE3_W, spriteH: SPRITE3_H },
  japan:           { x: 45,  y: 309, w: 231, h: 150, sprite: SPRITE3_URL, spriteW: SPRITE3_W, spriteH: SPRITE3_H },
  dubai:           { x: 404, y: 289, w: 148, h: 198, sprite: SPRITE3_URL, spriteW: SPRITE3_W, spriteH: SPRITE3_H },
  vietnam:         { x: 682, y: 308, w: 240, h: 175, sprite: SPRITE3_URL, spriteW: SPRITE3_W, spriteH: SPRITE3_H },
};
