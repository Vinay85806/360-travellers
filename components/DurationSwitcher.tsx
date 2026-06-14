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
      <h2 className="font-display text-2xl text-ink">Choose Trip Duration</h2>
      <div className="no-scrollbar mt-4 flex gap-3 overflow-x-auto pb-1">
        {visible.map((p) => {
          const active = p.slug === currentSlug;
          const label = p.days ? `${p.days} Days` : p.duration;
          return (
            <Link
              key={p.id}
              href={`/packages/${p.slug ?? p.id}`}
              aria-current={active ? "true" : undefined}
              className={`group w-28 shrink-0 overflow-hidden rounded-2xl border transition-all ${
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
                  sizes="112px"
                  className="object-cover"
                />
                <span className="absolute bottom-1.5 left-2 font-display text-lg text-cream drop-shadow">
                  {label}
                </span>
              </div>
              <div className="px-2.5 py-2">
                <span className="block text-[0.65rem] text-ink/50">
                  Starting From
                </span>
                <span className="text-sm font-semibold text-ink">
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
