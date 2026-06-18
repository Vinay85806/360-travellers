"use client";

import { useEffect, useRef, useState } from "react";
import { useRouter } from "next/navigation";
import { MapPin, ChevronLeft, ChevronRight } from "./icons";
import SpriteIcon from "./SpriteIcon";
import {
  SPRITE_URL,
  SPRITE_W,
  SPRITE_H,
  DESTINATION_ICON_CROPS,
} from "@/lib/destinationIcons";

export type TabItem = {
  id: string;
  label: string;
  /** destination slug — used to look up its icon crop from config */
  slug?: string;
};

export default function CategoryTabs({ tabs }: { tabs: TabItem[] }) {
  const [active, setActive] = useState(tabs[0]?.id ?? "");
  const scrollRef = useRef<HTMLDivElement>(null);
  const router = useRouter();
  const [canScrollLeft, setCanScrollLeft] = useState(false);
  const [canScrollRight, setCanScrollRight] = useState(false);

  const checkScroll = () => {
    const el = scrollRef.current;
    if (!el) return;
    setCanScrollLeft(el.scrollLeft > 4);
    setCanScrollRight(el.scrollLeft + el.clientWidth < el.scrollWidth - 4);
  };

  useEffect(() => {
    checkScroll();
    const el = scrollRef.current;
    el?.addEventListener("scroll", checkScroll, { passive: true });
    window.addEventListener("resize", checkScroll);
    return () => {
      el?.removeEventListener("scroll", checkScroll);
      window.removeEventListener("resize", checkScroll);
    };
  }, [tabs]);

  const nudge = (dir: "left" | "right") => {
    scrollRef.current?.scrollBy({ left: dir === "left" ? -220 : 220, behavior: "smooth" });
  };

  // Scroll-spy: highlight the tab whose section is in view
  useEffect(() => {
    const sections = tabs
      .map((t) => document.getElementById(t.id))
      .filter((el): el is HTMLElement => el !== null);

    const observer = new IntersectionObserver(
      (entries) => {
        const visible = entries
          .filter((e) => e.isIntersecting)
          .sort((a, b) => b.intersectionRatio - a.intersectionRatio)[0];
        if (visible) setActive(visible.target.id);
      },
      { rootMargin: "-40% 0px -55% 0px", threshold: [0, 0.25, 0.5] }
    );

    sections.forEach((s) => observer.observe(s));
    return () => observer.disconnect();
  }, [tabs]);

  const handleClick = (t: TabItem) => {
    if (t.slug) {
      router.push(`/destinations/${t.slug}`);
    } else {
      document.getElementById(t.id)?.scrollIntoView({ behavior: "smooth" });
    }
  };

  return (
    <div className="sticky top-20 z-30 border-y border-ink/8 bg-cream/90 backdrop-blur-md sm:top-[5.5rem]">
      <div className="relative mx-auto max-w-7xl">
        {/* Left fade + arrow */}
        <div
          className={`pointer-events-none absolute left-0 top-0 z-10 h-full w-20 bg-gradient-to-r from-cream/95 to-transparent transition-opacity duration-200 ${
            canScrollLeft ? "opacity-100" : "opacity-0"
          }`}
        />
        <button
          onClick={() => nudge("left")}
          aria-label="Scroll left"
          className={`absolute left-1 top-1/2 z-20 -translate-y-1/2 grid h-8 w-8 place-items-center rounded-full border border-ink/10 bg-cream shadow-md transition-all duration-200 hover:bg-ink/5 ${
            canScrollLeft ? "opacity-100" : "pointer-events-none opacity-0"
          }`}
        >
          <ChevronLeft className="h-4 w-4 text-ink/60" />
        </button>

        {/* Right fade + arrow */}
        <div
          className={`pointer-events-none absolute right-0 top-0 z-10 h-full w-20 bg-gradient-to-l from-cream/95 to-transparent transition-opacity duration-200 ${
            canScrollRight ? "opacity-100" : "opacity-0"
          }`}
        />
        <button
          onClick={() => nudge("right")}
          aria-label="Scroll right"
          className={`absolute right-1 top-1/2 z-20 -translate-y-1/2 grid h-8 w-8 place-items-center rounded-full border border-ink/10 bg-cream shadow-md transition-all duration-200 hover:bg-ink/5 ${
            canScrollRight ? "opacity-100" : "pointer-events-none opacity-0"
          }`}
        >
          <ChevronRight className="h-4 w-4 text-ink/60" />
        </button>

        {/* Scrollable tab row */}
        <div
          ref={scrollRef}
          className="no-scrollbar flex items-center gap-1 overflow-x-auto px-5 py-2.5 sm:px-8"
        >
          {tabs.map((t) => {
            const isActive = active === t.id;
            return (
              <button
                key={t.id}
                onClick={() => handleClick(t)}
                className={`group flex shrink-0 flex-col items-center gap-1 rounded-xl px-4 py-1.5 transition-colors ${
                  isActive ? "text-blue" : "text-ink/55 hover:text-ink"
                }`}
              >
                <span
                  className={`grid h-11 w-11 place-items-center transition-colors ${
                    isActive ? "text-blue" : "text-ink/45 group-hover:text-blue"
                  }`}
                >
                  {t.slug && DESTINATION_ICON_CROPS[t.slug] ? (
                    <SpriteIcon
                      sprite={DESTINATION_ICON_CROPS[t.slug].sprite ?? SPRITE_URL}
                      crop={DESTINATION_ICON_CROPS[t.slug]}
                      spriteW={DESTINATION_ICON_CROPS[t.slug].spriteW ?? SPRITE_W}
                      spriteH={DESTINATION_ICON_CROPS[t.slug].spriteH ?? SPRITE_H}
                      className="h-11 w-11 bg-contain bg-center"
                    />
                  ) : (
                    <MapPin className="h-7 w-7" />
                  )}
                </span>
                <span className="text-xs font-semibold tracking-wide">
                  {t.label}
                </span>
                <span
                  className={`h-0.5 w-full rounded-full transition-colors ${
                    isActive ? "bg-blue" : "bg-transparent"
                  }`}
                />
              </button>
            );
          })}
        </div>
      </div>
    </div>
  );
}
