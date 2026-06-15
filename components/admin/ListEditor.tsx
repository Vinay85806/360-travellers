"use client";

import { useState } from "react";
import { XMark, Plus } from "@/components/icons";

export default function ListEditor({
  label,
  hint,
  items,
  onChange,
  placeholder = "Type and press Enter or click Add…",
}: {
  label: string;
  hint?: string;
  items: string[];
  onChange: (items: string[]) => void;
  placeholder?: string;
}) {
  const [input, setInput] = useState("");

  const add = () => {
    const v = input.trim();
    if (!v || items.includes(v)) return;
    onChange([...items, v]);
    setInput("");
  };

  const remove = (i: number) => onChange(items.filter((_, idx) => idx !== i));

  return (
    <div>
      <label className="block text-sm font-semibold text-ink">{label}</label>
      {hint && <p className="mt-0.5 text-xs text-ink/45">{hint}</p>}

      <div className="mt-2 space-y-1.5">
        {items.map((item, i) => (
          <div
            key={i}
            className="flex items-start gap-2 rounded-xl bg-tint px-3 py-2 text-sm text-ink"
          >
            <span className="flex-1 leading-relaxed">{item}</span>
            <button
              type="button"
              onClick={() => remove(i)}
              className="mt-0.5 shrink-0 text-ink/35 hover:text-red-500 transition-colors"
              aria-label="Remove"
            >
              <XMark className="h-3.5 w-3.5" />
            </button>
          </div>
        ))}
      </div>

      <div className="mt-2 flex gap-2">
        <input
          type="text"
          value={input}
          onChange={(e) => setInput(e.target.value)}
          onKeyDown={(e) => {
            if (e.key === "Enter") { e.preventDefault(); add(); }
          }}
          placeholder={placeholder}
          className="flex-1 rounded-xl border border-ink/15 bg-white px-3 py-2.5 text-sm text-ink placeholder:text-ink/35 focus:border-blue focus:outline-none transition-colors"
        />
        <button
          type="button"
          onClick={add}
          className="inline-flex items-center gap-1.5 rounded-xl bg-blue px-3 py-2.5 text-sm font-semibold text-white hover:bg-blue-deep transition-colors shrink-0"
        >
          <Plus className="h-4 w-4" />
          Add
        </button>
      </div>
    </div>
  );
}
