import Link from "next/link";
import { inr } from "@/lib/format";
import type { TravelPackage } from "@/lib/packages";

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

      {/* -mx-5/px-5 makes the row flush to screen edge, bypassing parent overflow-x:hidden */}
      <div className="no-scrollbar -mx-5 mt-3 flex gap-2 overflow-x-auto px-5 pb-1 sm:-mx-8 sm:px-8">
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
              className={`shrink-0 rounded-lg border px-3.5 py-2.5 text-center transition-all ${
                active
                  ? "border-blue bg-blue text-cream"
                  : "border-ink/15 text-ink hover:border-blue/50 hover:bg-tint"
              }`}
            >
              <span className="block whitespace-nowrap text-xs font-bold">
                {label}
              </span>
              <span className={`mt-0.5 block text-[0.65rem] ${active ? "text-cream/75" : "text-ink/50"}`}>
                {inr(p.price)}
              </span>
            </Link>
          );
        })}
      </div>
    </div>
  );
}
