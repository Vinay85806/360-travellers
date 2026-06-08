"use client";

import Image from "next/image";
import { useState } from "react";
import { Search, MapPin, Calendar, Users, Star } from "./icons";

const tabs = ["Destinations", "Experiences", "Honeymoon", "Luxury"];

export default function Hero() {
  const [tab, setTab] = useState("Destinations");

  return (
    <section id="top" className="relative min-h-[100svh] overflow-hidden">
      {/* Background */}
      <div className="absolute inset-0 -z-10">
        <Image
          src="https://images.unsplash.com/photo-1505228395891-9a51e7e86bf6?auto=format&fit=crop&w=2400&q=80"
          alt="A traveller overlooking a misty mountain valley at golden hour"
          fill
          priority
          sizes="100vw"
          className="animate-slow-zoom object-cover"
        />
        <div className="absolute inset-0 bg-gradient-to-b from-coal/70 via-coal/35 to-coal/85" />
        <div className="absolute inset-0 bg-gradient-to-r from-coal/60 to-transparent" />
      </div>

      <div className="mx-auto flex min-h-[100svh] max-w-7xl flex-col justify-center px-5 pb-12 pt-32 sm:px-8">
        {/* Headline */}
        <div className="max-w-3xl">
          <span className="kicker animate-fade-up text-gold-soft">
            <span className="h-px w-8 bg-gold-soft" />
            Curated journeys, effortlessly yours
          </span>

          <h1
            className="mt-6 animate-fade-up font-display text-[2.7rem] leading-[1.04] tracking-tight text-cream sm:text-6xl lg:text-7xl"
            style={{ animationDelay: "0.08s", opacity: 0 }}
          >
            Travel the world,
            <br />
            <span className="italic text-gold-soft">beautifully</span> arranged.
          </h1>

          <p
            className="mt-6 max-w-xl animate-fade-up text-base leading-relaxed text-cream/80 sm:text-lg"
            style={{ animationDelay: "0.16s", opacity: 0 }}
          >
            Handcrafted holidays, private experiences and stays you&rsquo;ll
            never forget. From the Maldives to the Himalayas — designed around
            you, delivered down to the last detail.
          </p>
        </div>

        {/* Search card */}
        <div
          id="search"
          className="mt-10 animate-fade-up scroll-mt-28"
          style={{ animationDelay: "0.24s", opacity: 0 }}
        >
          <div className="max-w-4xl rounded-3xl border border-white/15 bg-white/10 p-2.5 backdrop-blur-xl shadow-lift">
            {/* Tabs */}
            <div className="flex flex-wrap gap-1 px-1.5 pb-2.5 pt-1.5">
              {tabs.map((t) => (
                <button
                  key={t}
                  onClick={() => setTab(t)}
                  className={`rounded-full px-4 py-1.5 text-xs font-semibold tracking-wide transition-all sm:text-sm ${
                    tab === t
                      ? "bg-gold text-coal"
                      : "text-cream/80 hover:bg-white/10 hover:text-cream"
                  }`}
                >
                  {t}
                </button>
              ))}
            </div>

            {/* Fields */}
            <div className="grid grid-cols-1 gap-1.5 rounded-2xl bg-cream p-2 md:grid-cols-[1.4fr_1fr_1fr_auto]">
              <Field icon={<MapPin className="text-pine" />} label="Where to">
                <input
                  list="dest-list"
                  placeholder="Search a destination"
                  className="w-full bg-transparent text-sm font-medium text-ink placeholder:text-ink/40 focus:outline-none"
                />
                <datalist id="dest-list">
                  <option value="Bali, Indonesia" />
                  <option value="Maldives" />
                  <option value="Kashmir, India" />
                  <option value="Santorini, Greece" />
                  <option value="Swiss Alps" />
                </datalist>
              </Field>

              <div className="hidden w-px self-stretch bg-ink/10 md:block" />

              <Field icon={<Calendar className="text-pine" />} label="When">
                <input
                  type="text"
                  onFocus={(e) => (e.currentTarget.type = "date")}
                  onBlur={(e) => {
                    if (!e.currentTarget.value) e.currentTarget.type = "text";
                  }}
                  placeholder="Add dates"
                  className="w-full bg-transparent text-sm font-medium text-ink placeholder:text-ink/40 focus:outline-none"
                />
              </Field>

              <div className="hidden w-px self-stretch bg-ink/10 md:block" />

              <Field icon={<Users className="text-pine" />} label="Travellers">
                <select className="w-full cursor-pointer appearance-none bg-transparent text-sm font-medium text-ink focus:outline-none">
                  <option>2 Adults</option>
                  <option>1 Adult</option>
                  <option>2 Adults, 2 Kids</option>
                  <option>Group of 4+</option>
                </select>
              </Field>

              <button className="group flex items-center justify-center gap-2 rounded-xl bg-pine px-6 py-4 text-sm font-semibold text-cream transition-all hover:bg-pine-deep">
                <Search className="h-4 w-4" />
                <span>Search</span>
              </button>
            </div>
          </div>

          {/* Trust row */}
          <div
            className="mt-6 flex flex-wrap items-center gap-x-7 gap-y-3 text-sm text-cream/80"
            style={{ animationDelay: "0.3s" }}
          >
            <span className="inline-flex items-center gap-2">
              <span className="flex">
                {Array.from({ length: 5 }).map((_, i) => (
                  <Star key={i} className="h-4 w-4 text-gold-soft" />
                ))}
              </span>
              <strong className="font-semibold text-cream">4.9/5</strong> from
              12,000+ travellers
            </span>
            <span className="hidden h-4 w-px bg-cream/25 sm:block" />
            <span>Fully customisable itineraries</span>
            <span className="hidden h-4 w-px bg-cream/25 sm:block" />
            <span>24/7 on-trip concierge</span>
          </div>
        </div>
      </div>
    </section>
  );
}

function Field({
  icon,
  label,
  children,
}: {
  icon: React.ReactNode;
  label: string;
  children: React.ReactNode;
}) {
  return (
    <label className="flex cursor-text items-center gap-3 rounded-xl px-4 py-2.5 transition-colors hover:bg-ink/[0.03]">
      <span className="shrink-0">{icon}</span>
      <span className="min-w-0 flex-1">
        <span className="block text-[0.65rem] font-semibold uppercase tracking-[0.18em] text-ink/45">
          {label}
        </span>
        {children}
      </span>
    </label>
  );
}
