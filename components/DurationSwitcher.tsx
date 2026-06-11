import Link from "next/link";
import Image from "next/image";
import { inr } from "@/lib/format";
import { packageImage, type TravelPackage } from "@/lib/packages";

/**
 * Thrillophilia-style "Choose Trip Duration" — each sibling package of the
 * same destination is shown as a selectable option. The active one is
 * highlighted; the rest link to their own detail page.
 */
export default function DurationSwitcher({
  siblings,
  currentSlug,
}: {
  siblings: TravelPackage[];
  currentSlug: string | null | undefined;
}) {
  // Only meaningful when there is more than one option.
  if (siblings.length < 2) return null;

  return (
    <div className="mt-8">
      <h2 className="font-display text-2xl text-ink">Choose Trip Duration</h2>
      <div className="mt-4 flex flex-wrap gap-3">
        {siblings.map((p) => {
          const active = p.slug === currentSlug;
          const label = p.days ? `${p.days} Days` : p.duration;
          return (
            <Link
              key={p.id}
              href={`/packages/${p.slug ?? p.id}`}
              aria-current={active ? "true" : undefined}
              className={`group w-32 overflow-hidden rounded-2xl border transition-all ${
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
                  sizes="128px"
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
