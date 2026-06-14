import Link from "next/link";
import Image from "next/image";
import { inr } from "@/lib/format";
import { packageImage, type TravelPackage } from "@/lib/packages";

function parseNights(pkg: TravelPackage): number {
  if (pkg.nights != null) return pkg.nights;
  const m = pkg.duration.match(/(\d+)\s*nights?/i);
  return m ? parseInt(m[1], 10) : 0;
}

export default function DurationSwitcher({
  siblings,
  currentSlug,
}: {
  siblings: TravelPackage[];
  currentSlug: string | null | undefined;
}) {
  if (siblings.length < 2) return null;

  // Sort by nights ascending so durations are in logical order
  const sorted = [...siblings].sort((a, b) => parseNights(a) - parseNights(b));

  // Show a window of 5 packages centered around the current one
  const WINDOW = 5;
  const currentIdx = Math.max(0, sorted.findIndex((p) => p.slug === currentSlug));
  let start = Math.max(0, currentIdx - Math.floor(WINDOW / 2));
  const end = Math.min(sorted.length, start + WINDOW);
  start = Math.max(0, end - WINDOW);
  const visible = sorted.slice(start, end);

  return (
    <div className="mt-8">
      <h2 className="font-display text-xl text-ink sm:text-2xl">Choose Trip Duration</h2>

      {/*
        -mx-5 / sm:-mx-8 pulls the scroll track flush to the page edge,
        matching the parent container's px-5 / sm:px-8 padding.
        This escapes any overflow-x:hidden ancestor that would clip the scroll.
        The matching px-5 / sm:px-8 keeps the first card visually inset.
      */}
      <div className="no-scrollbar -mx-5 mt-4 flex gap-2 overflow-x-auto px-5 pb-2 sm:-mx-8 sm:gap-3 sm:px-8">
        {visible.map((p) => {
          const active = p.slug === currentSlug;
          const label = p.days ? `${p.days} Days` : p.duration;
          return (
            <Link
              key={p.id}
              href={`/packages/${p.slug ?? p.id}`}
              aria-current={active ? "true" : undefined}
              className={`group w-20 shrink-0 overflow-hidden rounded-xl border transition-all sm:w-28 sm:rounded-2xl ${
                active
                  ? "border-blue ring-2 ring-blue/30"
                  : "border-ink/10 hover:border-blue/40"
              }`}
            >
              <div className="relative aspect-[4/3]">
                <Image
                  src={packageImage(p)}
                  alt={p.title}
                  fill
                  sizes="(max-width: 640px) 80px, 112px"
                  className="object-cover"
                />
                <span className="absolute bottom-1 left-1.5 font-display text-sm text-cream drop-shadow sm:bottom-1.5 sm:left-2 sm:text-lg">
                  {label}
                </span>
              </div>
              <div className="px-2 py-1.5 sm:px-2.5 sm:py-2">
                <span className="block text-[0.6rem] text-ink/50 sm:text-[0.65rem]">
                  Starting From
                </span>
                <span className="text-xs font-semibold text-ink sm:text-sm">
                  {inr(p.price)}
                </span>
              </div>
            </Link>
          );
        })}
      </div>
    </div>
  );
}
