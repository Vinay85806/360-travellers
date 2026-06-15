"use client";

import { useState } from "react";
import { Plus, Trash, ChevronRight } from "@/components/icons";
import ImageInput from "./ImageInput";
import type { ItineraryDay } from "@/lib/packages";

export default function ItineraryEditor({
  days,
  onChange,
}: {
  days: ItineraryDay[];
  onChange: (days: ItineraryDay[]) => void;
}) {
  const [openIndex, setOpenIndex] = useState<number | null>(days.length > 0 ? 0 : null);

  const addDay = () => {
    const next: ItineraryDay = {
      day: days.length + 1,
      title: "",
      description: "",
    };
    const updated = [...days, next];
    onChange(updated);
    setOpenIndex(updated.length - 1);
  };

  const removeDay = (i: number) => {
    const updated = days
      .filter((_, idx) => idx !== i)
      .map((d, idx) => ({ ...d, day: idx + 1 }));
    onChange(updated);
    if (openIndex !== null && openIndex >= updated.length) {
      setOpenIndex(updated.length - 1);
    }
  };

  const update = (i: number, patch: Partial<ItineraryDay>) => {
    const updated = days.map((d, idx) => (idx === i ? { ...d, ...patch } : d));
    onChange(updated);
  };

  return (
    <div className="space-y-3">
      {days.map((day, i) => {
        const isOpen = openIndex === i;
        return (
          <div
            key={i}
            className="rounded-2xl border border-ink/10 bg-white overflow-hidden"
          >
            {/* Header */}
            <div className="flex items-center gap-3 px-4 py-3">
              <span className="shrink-0 rounded-full bg-blue px-2.5 py-0.5 text-xs font-bold text-white">
                Day {day.day}
              </span>
              <span className="flex-1 text-sm font-medium text-ink truncate">
                {day.title || <span className="text-ink/35 italic">Untitled day</span>}
              </span>
              <button
                type="button"
                onClick={() => removeDay(i)}
                className="text-ink/30 hover:text-red-500 transition-colors"
                aria-label="Remove day"
              >
                <Trash className="h-4 w-4" />
              </button>
              <button
                type="button"
                onClick={() => setOpenIndex(isOpen ? null : i)}
                className="text-ink/40 transition-transform"
                aria-label={isOpen ? "Collapse" : "Expand"}
              >
                <ChevronRight
                  className={`h-4 w-4 transition-transform ${isOpen ? "rotate-90" : ""}`}
                />
              </button>
            </div>

            {/* Body */}
            {isOpen && (
              <div className="border-t border-ink/8 px-4 py-4 space-y-4">
                <div>
                  <label className="block text-xs font-semibold uppercase tracking-wide text-ink/45 mb-1">
                    Day Title *
                  </label>
                  <input
                    type="text"
                    value={day.title}
                    onChange={(e) => update(i, { title: e.target.value })}
                    placeholder="e.g. Arrival in Manali & local sightseeing"
                    className="w-full rounded-xl border border-ink/15 bg-ivory px-3 py-2.5 text-sm text-ink placeholder:text-ink/35 focus:border-blue focus:outline-none"
                  />
                </div>

                <div>
                  <label className="block text-xs font-semibold uppercase tracking-wide text-ink/45 mb-1">
                    Description *
                  </label>
                  <textarea
                    rows={4}
                    value={day.description}
                    onChange={(e) => update(i, { description: e.target.value })}
                    placeholder="What happens on this day? Describe activities, meals, accommodation…"
                    className="w-full rounded-xl border border-ink/15 bg-ivory px-3 py-2.5 text-sm text-ink placeholder:text-ink/35 focus:border-blue focus:outline-none resize-none"
                  />
                </div>

                <ImageInput
                  label="Day Photo (optional)"
                  hint="A photo that represents this day's experience"
                  value={day.image ?? ""}
                  onChange={(url) => update(i, { image: url || undefined })}
                />
              </div>
            )}
          </div>
        );
      })}

      <button
        type="button"
        onClick={addDay}
        className="flex w-full items-center justify-center gap-2 rounded-2xl border-2 border-dashed border-ink/15 py-4 text-sm font-semibold text-ink/50 hover:border-blue/40 hover:text-blue transition-colors"
      >
        <Plus className="h-4 w-4" />
        Add Day {days.length + 1}
      </button>
    </div>
  );
}
