"use client";

import { useEffect, useState } from "react";
import { MapPin } from "./icons";

export type TabItem = {
  id: string;
  label: string;
};

export default function CategoryTabs({ tabs }: { tabs: TabItem[] }) {
  const [active, setActive] = useState(tabs[0]?.id ?? "");

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

  const handleClick = (id: string) => {
    document.getElementById(id)?.scrollIntoView({ behavior: "smooth" });
  };

  return (
    <div className="sticky top-[68px] z-30 border-y border-ink/8 bg-cream/90 backdrop-blur-md">
      <div className="no-scrollbar mx-auto flex max-w-7xl items-center gap-1 overflow-x-auto px-5 py-2.5 sm:px-8">
        {tabs.map((t) => {
          const isActive = active === t.id;
          return (
            <button
              key={t.id}
              onClick={() => handleClick(t.id)}
              className={`group flex shrink-0 flex-col items-center gap-1 rounded-xl px-4 py-1.5 transition-colors ${
                isActive ? "text-blue" : "text-ink/55 hover:text-ink"
              }`}
            >
              <span
                className={`grid h-6 w-6 place-items-center transition-colors ${
                  isActive ? "text-blue" : "text-ink/45 group-hover:text-blue"
                }`}
              >
                <MapPin className="h-5 w-5" />
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
  );
}
