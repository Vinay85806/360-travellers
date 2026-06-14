/**
 * Renders a single icon cropped from a sprite sheet.
 *
 * Two modes:
 *  1. Manual crop (preferred): pass crop = { x, y, w, h } in sprite pixels
 *     plus spriteW/spriteH (the sprite's natural size). Pixel-precise.
 *  2. Auto grid (fallback): pass index + cols + rows for a uniform grid.
 */
export type Crop = { x: number; y: number; w: number; h: number };

export default function SpriteIcon({
  sprite,
  className = "",
  // manual crop
  crop,
  spriteW,
  spriteH,
  // auto grid
  index,
  cols,
  rows,
}: {
  sprite: string;
  className?: string;
  crop?: Crop | null;
  spriteW?: number | null;
  spriteH?: number | null;
  index?: number;
  cols?: number;
  rows?: number;
}) {
  let style: React.CSSProperties;

  if (crop && spriteW && spriteH) {
    // Scale the sprite so the crop box fills the square box.
    const scaleX = (spriteW / crop.w) * 100;
    const scaleY = (spriteH / crop.h) * 100;
    // Position so the crop's top-left aligns to the box's top-left.
    const posX = (crop.x / (spriteW - crop.w)) * 100;
    const posY = (crop.y / (spriteH - crop.h)) * 100;
    style = {
      backgroundImage: `url("${sprite}")`,
      backgroundSize: `${scaleX}% ${scaleY}%`,
      backgroundPosition: `${spriteW === crop.w ? 0 : posX}% ${
        spriteH === crop.h ? 0 : posY
      }%`,
      backgroundRepeat: "no-repeat",
    };
  } else {
    const c = cols ?? 4;
    const r = rows ?? 3;
    const i = index ?? 0;
    const col = i % c;
    const row = Math.floor(i / c);
    const posX = c > 1 ? (col / (c - 1)) * 100 : 0;
    const posY = r > 1 ? (row / (r - 1)) * 100 : 0;
    style = {
      backgroundImage: `url("${sprite}")`,
      backgroundSize: `${c * 100}% ${r * 100}%`,
      backgroundPosition: `${posX}% ${posY}%`,
      backgroundRepeat: "no-repeat",
    };
  }

  return <span role="img" aria-hidden="true" className={className} style={style} />;
}
