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
    <div className="mt-6">
      <p className="text-xs font-semibold uppercase tracking-wider text-ink/45">
        Choose Trip Duration
      </p>

      {/* -mx-5/px-5 pulls the scroll track to the screen edge, bypassing parent overflow-x:hidden */}
      <div className="no-scrollbar -mx-5 mt-3 flex gap-2 overflow-x-auto px-5 pb-2 sm:-mx-8 sm:px-8">
        {visible.map((p) => {
          const active = p.slug === currentSlug;
          const label =
            p.nights != null && p.days != null
              ? `${p.nights}N / ${p.days}D`
              : p.duration;
          return (
            <Link
              key={p.id}
              href={`/packages/${p.slug ?? p.id}`}
              aria-current={active ? "true" : undefined}
              className={`w-20 shrink-0 overflow-hidden rounded-xl border transition-all ${
                active
                  ? "border-blue ring-2 ring-blue/30"
                  : "border-ink/10 hover:border-blue/40"
              }`}
            >
              {/* Image thumbnail */}
              <div className="relative aspect-[4/3]">
                <Image
                  src={packageImage(p)}
                  alt={p.title}
                  fill
                  sizes="80px"
                  className="object-cover"
                />
                <span className="absolute inset-0 bg-gradient-to-t from-coal/70 to-transparent" />
                <span className="absolute bottom-1 left-0 right-0 text-center font-display text-[0.65rem] font-bold leading-none text-cream drop-shadow">
                  {label}
                </span>
              </div>

              {/* Price row */}
              <div className={`px-1.5 py-1 text-center ${active ? "bg-blue" : "bg-cream"}`}>
                <span className={`block text-[0.6rem] font-semibold ${active ? "text-cream" : "text-ink/70"}`}>
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
