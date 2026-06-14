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
}: {
  id: string;
  title: string;
  packages: TravelPackage[];
}) {
  const railRef = useRef<HTMLDivElement>(null);

  const scrollBy = (dir: 1 | -1) => {
    railRef.current?.scrollBy({ left: dir * 360, behavior: "smooth" });
  };

  return (
    <section id={id} className="scroll-mt-28 py-10">
      <div className="mx-auto max-w-7xl px-5 sm:px-8">
        {/* Header */}
        <div className="flex items-center justify-between">
          <h2 className="font-display text-2xl tracking-tight text-ink sm:text-3xl">
            {title}
          </h2>
          {packages.length > 0 && (
            <Link
              href="#all-packages"
              className="group inline-flex items-center gap-2 rounded-full border border-blue/25 px-4 py-1.5 text-sm font-semibold text-blue transition-colors hover:bg-blue hover:text-cream"
            >
              View All
              <ArrowRight className="h-4 w-4 transition-transform group-hover:translate-x-0.5" />
            </Link>
          )}
        </div>

        {/* Empty state — destination serviced but no packages loaded yet */}
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
                  <div className="relative aspect-[5/4] overflow-hidden">
                    <Image
                      src={packageImage(p)}
                      alt={p.title}
                      fill
                      sizes="(max-width: 640px) 78vw, (max-width: 1024px) 44vw, 31vw"
                      className="object-cover transition-transform duration-700 ease-out group-hover:scale-110"
                    />
                    <span className="absolute right-3.5 top-3.5 inline-flex items-center gap-1 rounded-full bg-coal/55 px-2.5 py-1 text-xs font-semibold text-cream backdrop-blur-sm">
                      <Clock className="h-3.5 w-3.5" />
                      {p.duration}
                    </span>
                  </div>

                  <div className="flex flex-1 flex-col p-5">
                    <h3 className="font-display text-lg leading-snug text-ink">
                      {p.title}
                    </h3>
                    <p className="mt-2 line-clamp-2 text-sm leading-relaxed text-ink/55">
                      {p.description}
                    </p>

                    <div className="mt-auto flex items-end justify-between pt-5">
                      <div>
                        <span className="font-display text-xl text-ink">
                          {inr(p.price)}
                        </span>
                        <span className="ml-1 text-xs text-ink/50">
                          / person
                        </span>
                      </div>
                      <span className="inline-flex items-center gap-1.5 rounded-full bg-tint px-3 py-1.5 text-xs font-semibold text-blue transition-colors group-hover:bg-blue group-hover:text-cream">
                        View
                        <ArrowRight className="h-3.5 w-3.5" />
                      </span>
                    </div>
                  </div>
                </Link>
              </article>
            ))}
          </div>

          {/* Arrow controls (desktop) */}
          {packages.length > 3 && (
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

