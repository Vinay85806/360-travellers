"use client";

import { useState } from "react";
import Image from "next/image";
import { ArrowRight } from "./icons";
import type { ItineraryDay } from "@/lib/packages";

export default function ItineraryAccordion({
  itinerary,
}: {
  itinerary: ItineraryDay[];
}) {
  // First day open by default.
  const [open, setOpen] = useState<number | null>(0);

  if (itinerary.length === 0) return null;

  return (
    <ol className="space-y-3">
      {itinerary.map((day, i) => {
        const isOpen = open === i;
        const dayNum = day.day ?? i + 1;
        return (
          <li
            key={dayNum}
            className="overflow-hidden rounded-2xl border border-ink/10 bg-cream"
          >
            <button
              onClick={() => setOpen(isOpen ? null : i)}
              className="flex w-full items-center gap-3 px-4 py-4 text-left"
              aria-expanded={isOpen}
            >
              <span className="shrink-0 rounded-full bg-blue px-3 py-1 text-xs font-bold text-cream">
                DAY {dayNum}
              </span>
              <span className="flex-1 font-semibold text-ink">{day.title}</span>
              <ArrowRight
                className={`h-4 w-4 shrink-0 text-ink/40 transition-transform ${
                  isOpen ? "rotate-90" : ""
                }`}
              />
            </button>

            {isOpen && (
              <div className="border-t border-ink/8 px-4 pb-5 pt-4">
                {day.image && (
                  <div className="relative mb-4 aspect-[16/7] overflow-hidden rounded-xl">
                    <Image
                      src={day.image}
                      alt={day.title}
                      fill
                      sizes="(max-width: 1024px) 100vw, 640px"
                      className="object-cover"
                    />
                  </div>
                )}
                <p className="text-sm leading-relaxed text-ink/70">
                  {day.description}
                </p>
              </div>
            )}
          </li>
        );
      })}
    </ol>
  );
}
