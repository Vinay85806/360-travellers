"use client";

import { useRef } from "react";
import Image from "next/image";
import Link from "next/link";
import { inr } from "@/lib/format";
import { Clock, ArrowRight } from "./icons";
import { packageImage, type TravelPackage } from "@/lib/packages";

export default function PackageRail({
  id,
  title,
  packages,
  destinationSlug,
  totalCount,
}: {
  id: string;
  title: string;
  packages: TravelPackage[];
  destinationSlug?: string;
  totalCount?: number;
}) {
  const railRef = useRef<HTMLDivElement>(null);

  const scrollBy = (dir: 1 | -1) => {
    railRef.current?.scrollBy({ left: dir * 360, behavior: "smooth" });
  };

  const showTotal = totalCount && totalCount > packages.length;

  return (
    <section id={id} className="scroll-mt-28 py-10">
      <div className="mx-auto max-w-7xl px-5 sm:px-8">
        {/* Header */}
        <div className="flex flex-wrap items-center justify-between gap-3">
          <div>
            <h2 className="font-display text-xl tracking-tight text-ink sm:text-2xl lg:text-3xl">
              {title}
            </h2>
            {showTotal && (
              <p className="mt-0.5 text-xs text-ink/45">
                {totalCount} packages available
              </p>
            )}
          </div>
          {packages.length > 0 && destinationSlug && (
            <Link
              href={`/destinations/${destinationSlug}`}
              className="group inline-flex shrink-0 items-center gap-2 rounded-full bg-blue px-5 py-2 text-sm font-semibold text-cream transition-colors hover:bg-blue-deep"
            >
              View All {totalCount ?? packages.length} packages
              <ArrowRight className="h-4 w-4 transition-transform group-hover:translate-x-0.5" />
            </Link>
          )}
        </div>

        {/* Empty state */}
        {packages.length === 0 && (
          <div className="mt-5 rounded-2xl border border-dashed border-ink/15 bg-ivory px-6 py-8 text-center">
            <p className="text-sm text-ink/55">
              New {title.replace("Tours in ", "")} packages are on the way.
              <span className="ml-1 font-semibold text-blue">
                Enquire for a custom trip →
              </span>
            </p>
          </div>
        )}

        {/* Rail */}
        {packages.length > 0 && (
          <div className="relative mt-6">
            <div
              ref={railRef}
              className="no-scrollbar flex snap-x snap-mandatory gap-5 overflow-x-auto pb-2"
            >
              {packages.map((p) => (
                <article
                  key={p.id}
                  className="w-[78%] shrink-0 snap-start sm:w-[44%] lg:w-[31%]"
                >
                  <Link
                    href={`/packages/${p.slug ?? p.id}`}
                    className="group flex h-full flex-col overflow-hidden rounded-3xl border border-ink/8 bg-cream shadow-soft transition-all duration-300 hover:-translate-y-1 hover:shadow-lift"
                  >
                    {/* Image */}
                    <div className="relative aspect-[4/3] overflow-hidden">
                      <Image
                        src={packageImage(p)}
                        alt={p.title}
                        fill
                        sizes="(max-width: 640px) 78vw, (max-width: 1024px) 44vw, 31vw"
                        className="object-cover transition-transform duration-700 ease-out group-hover:scale-110"
                      />
                      <span className="absolute right-3 top-3 inline-flex items-center gap-1 rounded-full bg-coal/55 px-2.5 py-1 text-xs font-semibold text-cream backdrop-blur-sm">
                        <Clock className="h-3 w-3" />
                        {p.duration}
                      </span>
                      {p.original_price && p.original_price > p.price && (
                        <span className="absolute left-3 top-3 rounded-full bg-green-500 px-2.5 py-1 text-xs font-bold text-white">
                          Save {inr(p.original_price - p.price)}
                        </span>
                      )}
                    </div>

                    {/* Compact body — title + price only */}
                    <div className="flex items-center justify-between gap-3 px-4 py-3.5">
                      <div className="min-w-0">
                        <h3 className="truncate font-display text-sm font-semibold leading-snug text-ink sm:text-base">
                          {p.title}
                        </h3>
                        <div className="mt-0.5 flex items-baseline gap-1">
                          {p.original_price && p.original_price > p.price && (
                            <span className="text-xs text-ink/40 line-through">
                              {inr(p.original_price)}
                            </span>
                          )}
                          <span className="font-display text-base text-blue">
                            {inr(p.price)}
                          </span>
                          <span className="text-xs text-ink/45">/ person</span>
                        </div>
                      </div>
                      <span className="shrink-0 rounded-full bg-tint p-2 text-blue transition-colors group-hover:bg-blue group-hover:text-cream">
                        <ArrowRight className="h-3.5 w-3.5" />
                      </span>
                    </div>
                  </Link>
                </article>
              ))}
            </div>

            {/* Arrow controls (desktop only — mouse users can't swipe) */}
            {packages.length > 1 && (
              <>
                <button
                  aria-label="Scroll left"
                  onClick={() => scrollBy(-1)}
                  className="absolute -left-3 top-1/2 hidden h-11 w-11 -translate-y-1/2 place-items-center rounded-full border border-ink/10 bg-cream text-ink shadow-soft transition-colors hover:bg-blue hover:text-cream lg:grid"
                >
                  <ArrowRight className="h-4 w-4 rotate-180" />
                </button>
                <button
                  aria-label="Scroll right"
                  onClick={() => scrollBy(1)}
                  className="absolute -right-3 top-1/2 hidden h-11 w-11 -translate-y-1/2 place-items-center rounded-full border border-ink/10 bg-cream text-ink shadow-soft transition-colors hover:bg-blue hover:text-cream lg:grid"
                >
                  <ArrowRight className="h-4 w-4" />
                </button>
              </>
            )}
          </div>
        )}
      </div>
    </section>
  );
}
