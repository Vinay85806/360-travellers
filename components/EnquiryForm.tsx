"use client";

import { useState } from "react";
import { inr } from "@/lib/format";

export default function EnquiryForm({
  packageTitle,
  packageSlug,
  price,
  originalPrice,
}: {
  packageTitle: string;
  packageSlug?: string;
  price: number;
  originalPrice?: number | null;
}) {
  const [form, setForm] = useState({
    name: "",
    email: "",
    phone: "",
    travelDate: "",
    travellers: "",
    message: "",
  });
  const [status, setStatus] = useState<"idle" | "sending" | "done" | "error">(
    "idle"
  );
  const [errorMsg, setErrorMsg] = useState("");

  const set =
    (field: keyof typeof form) =>
    (e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement>) =>
      setForm((f) => ({ ...f, [field]: e.target.value }));

  const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    setStatus("sending");
    setErrorMsg("");
    try {
      const res = await fetch("/api/enquiry", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ ...form, packageTitle, packageSlug }),
      });
      const data = await res.json();
      if (!res.ok) throw new Error(data.error || "Something went wrong.");
      setStatus("done");
    } catch (err) {
      setStatus("error");
      setErrorMsg(err instanceof Error ? err.message : "Something went wrong.");
    }
  };

  const saving =
    originalPrice && originalPrice > price ? originalPrice - price : 0;

  return (
    <div className="rounded-3xl border border-ink/10 bg-cream p-6 shadow-lift">
      <p className="text-sm font-semibold text-ink">{packageTitle}</p>
      <div className="mt-1 flex flex-wrap items-baseline gap-2">
        <span className="font-display text-2xl text-ink">{inr(price)}</span>
        {originalPrice && originalPrice > price && (
          <span className="text-sm text-ink/40 line-through">
            {inr(originalPrice)}
          </span>
        )}
        {saving > 0 && (
          <span className="rounded bg-blue/10 px-2 py-0.5 text-xs font-semibold text-blue">
            Save {inr(saving)}
          </span>
        )}
        <span className="text-xs text-ink/50">/ adult</span>
      </div>

      {status === "done" ? (
        <div className="mt-5 rounded-2xl bg-tint p-5 text-center">
          <p className="font-display text-lg text-navy">Thank you! 🎉</p>
          <p className="mt-1 text-sm text-ink/65">
            Our travel expert will reach out shortly to plan your trip.
          </p>
        </div>
      ) : (
        <form onSubmit={handleSubmit} className="mt-5 space-y-3">
          <input
            required
            type="text"
            value={form.name}
            onChange={set("name")}
            placeholder="Full Name *"
            className="w-full rounded-xl border border-ink/15 bg-ivory px-4 py-3 text-sm text-ink placeholder:text-ink/40 focus:border-blue focus:outline-none"
          />
          <input
            required
            type="email"
            value={form.email}
            onChange={set("email")}
            placeholder="Email *"
            className="w-full rounded-xl border border-ink/15 bg-ivory px-4 py-3 text-sm text-ink placeholder:text-ink/40 focus:border-blue focus:outline-none"
          />
          <div className="flex gap-2">
            <span className="inline-flex items-center rounded-xl border border-ink/15 bg-ivory px-3 text-sm text-ink/60">
              +91
            </span>
            <input
              required
              type="tel"
              value={form.phone}
              onChange={set("phone")}
              placeholder="Your Phone *"
              className="w-full rounded-xl border border-ink/15 bg-ivory px-4 py-3 text-sm text-ink placeholder:text-ink/40 focus:border-blue focus:outline-none"
            />
          </div>
          <div className="flex gap-2">
            <input
              type="text"
              value={form.travelDate}
              onChange={set("travelDate")}
              onFocus={(e) => (e.currentTarget.type = "date")}
              onBlur={(e) => {
                if (!e.currentTarget.value) e.currentTarget.type = "text";
              }}
              placeholder="Travel Date"
              className="w-full rounded-xl border border-ink/15 bg-ivory px-4 py-3 text-sm text-ink placeholder:text-ink/40 focus:border-blue focus:outline-none"
            />
            <input
              type="number"
              min={1}
              value={form.travellers}
              onChange={set("travellers")}
              placeholder="Travellers"
              className="w-full rounded-xl border border-ink/15 bg-ivory px-4 py-3 text-sm text-ink placeholder:text-ink/40 focus:border-blue focus:outline-none"
            />
          </div>
          <textarea
            rows={3}
            value={form.message}
            onChange={set("message")}
            placeholder="Message…"
            className="w-full rounded-xl border border-ink/15 bg-ivory px-4 py-3 text-sm text-ink placeholder:text-ink/40 focus:border-blue focus:outline-none"
          />

          {status === "error" && (
            <p className="text-sm text-red-600">{errorMsg}</p>
          )}

          <button
            type="submit"
            disabled={status === "sending"}
            className="w-full rounded-xl bg-blue px-6 py-3.5 text-sm font-semibold text-cream transition-colors hover:bg-blue-deep disabled:opacity-60"
          >
            {status === "sending" ? "Sending…" : "Send Enquiry"}
          </button>
        </form>
      )}
    </div>
  );
}
