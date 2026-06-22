"use client";

import Image from "next/image";
import { useRef, useState } from "react";
import { useRouter } from "next/navigation";
import { Search, MapPin, Calendar, Users, Star } from "./icons";
import { heroBackground } from "@/lib/heroImages";

const tabs = [
  { id: "all",           label: "All Trips" },
  { id: "domestic",      label: "Domestic India" },
  { id: "international", label: "International" },
  { id: "beach",         label: "Beach & Islands" },
];

// Map common typed strings → destination slug
const DEST_SLUG: Record<string, string> = {
  bali: "bali", "bali indonesia": "bali",
  maldives: "maldives",
  kashmir: "kashmir", "kashmir india": "kashmir",
  dubai: "dubai", "dubai uae": "dubai",
  thailand: "thailand", "thailand bangkok": "thailand",
  kerala: "kerala",
  goa: "goa",
  rajasthan: "rajasthan",
  himachal: "himachal-pradesh", "himachal pradesh": "himachal-pradesh",
  andaman: "andaman", "andaman nicobar": "andaman",
  assam: "assam",
  uttarakhand: "uttarakhand",
  gujarat: "gujarat",
  "uttar pradesh": "uttar-pradesh", up: "uttar-pradesh",
  vietnam: "vietnam",
  japan: "japan",
  singapore: "singapore",
  ladakh: "ladakh",
  spiti: "spiti-valley", "spiti valley": "spiti-valley",
  meghalaya: "meghalaya",
  sikkim: "sikkim",
  lakshadweep: "lakshadweep",
  maharashtra: "maharashtra",
  karnataka: "karnataka",
  "west bengal": "west-bengal",
};

export default function Hero() {
  const [tab, setTab] = useState("all");
  const destRef = useRef<HTMLInputElement>(null);
  const router = useRouter();

  const handleSearch = () => {
    const raw = destRef.current?.value.trim().toLowerCase() ?? "";
    const slug = DEST_SLUG[raw];
    if (slug) {
      // Jump straight to that destination's rail
      router.push(`/#rail-${slug}`);
      setTimeout(() => {
        document.getElementById(`rail-${slug}`)?.scrollIntoView({ behavior: "smooth" });
      }, 100);
    } else if (raw) {
      // Unknown destination — go to packages with filter
      router.push(`/?filter=all#all-packages`);
      setTimeout(() => {
        document.getElementById("all-packages")?.scrollIntoView({ behavior: "smooth" });
      }, 100);
    } else {
      // No input — just scroll down
      document.getElementById("all-packages")?.scrollIntoView({ behavior: "smooth" });
    }
  };

  const handleTab = (id: string) => {
    setTab(id);
    if (id === "all") {
      router.push("/#all-packages");
    } else {
      router.push(`/?filter=${id}#all-packages`);
    }
    setTimeout(() => {
      document.getElementById("all-packages")?.scrollIntoView({ behavior: "smooth" });
    }, 80);
  };

  return (
    <section
      id="top"
      className="relative flex min-h-[72svh] items-center overflow-hidden lg:min-h-[78svh]"
    >
      {/* Background */}
      <div className="absolute inset-0 -z-10">
        <Image
          src={heroBackground}
          alt="Discover the world with 360 Travellers"
          fill
          priority
          sizes="100vw"
          className="animate-slow-zoom object-cover"
        />
        <div className="absolute inset-0 bg-gradient-to-b from-navy/75 via-navy/45 to-navy/85" />
        <div className="absolute inset-0 bg-gradient-to-r from-navy/70 to-transparent" />
      </div>

      <div className="mx-auto flex w-full max-w-7xl flex-col items-center px-5 pb-16 pt-28 text-center sm:px-8 sm:pt-32">
        {/* Headline */}
        <div className="max-w-3xl">
          <span className="kicker animate-fade-up justify-center text-sky-soft">
            <span className="h-px w-8 bg-sky-soft" />
            Curated journeys, effortlessly yours
            <span className="h-px w-8 bg-sky-soft" />
          </span>

          <h1
            className="mt-6 animate-fade-up font-display text-[1.75rem] leading-[1.04] tracking-tight text-cream sm:text-[2.7rem] lg:text-6xl xl:text-7xl"
            style={{ animationDelay: "0.08s", opacity: 0 }}
          >
            Your Tour,
            <br />
            Perfectly <span className="text-sky">Personalised</span>
            <span className="text-sky-soft">!</span>
          </h1>

          <p
            className="mx-auto mt-6 max-w-xl animate-fade-up text-base leading-relaxed text-cream/85 sm:text-lg"
            style={{ animationDelay: "0.16s", opacity: 0 }}
          >
            Explore expertly curated multi-day tours — handcrafted holidays and
            private experiences across 60+ destinations, designed around you.
          </p>
        </div>

        {/* Search card */}
        <div
          id="search"
          className="mt-10 w-full max-w-4xl animate-fade-up scroll-mt-28"
          style={{ animationDelay: "0.24s", opacity: 0 }}
        >
          <div className="rounded-3xl border border-white/15 bg-white/10 p-2.5 text-left shadow-lift backdrop-blur-xl">
            {/* Tabs */}
            <div className="flex flex-wrap gap-1 px-1.5 pb-2.5 pt-1.5">
              {tabs.map((t) => (
                <button
                  key={t.id}
                  onClick={() => handleTab(t.id)}
                  className={`rounded-full px-4 py-1.5 text-xs font-semibold tracking-wide transition-all sm:text-sm ${
                    tab === t.id
                      ? "bg-sky text-navy"
                      : "text-cream/80 hover:bg-white/10 hover:text-cream"
                  }`}
                >
                  {t.label}
                </button>
              ))}
            </div>

            {/* Fields */}
            <div className="grid grid-cols-1 gap-1.5 rounded-2xl bg-cream p-2 md:grid-cols-[1.4fr_1fr_1fr_auto]">
              <Field icon={<MapPin className="text-blue" />} label="Where to">
                <input
                  ref={destRef}
                  list="dest-list"
                  placeholder="Search a destination"
                  onKeyDown={(e) => e.key === "Enter" && handleSearch()}
                  className="w-full bg-transparent text-sm font-medium text-ink placeholder:text-ink/40 focus:outline-none"
                />
                <datalist id="dest-list">
                  <option value="Bali" />
                  <option value="Maldives" />
                  <option value="Kashmir" />
                  <option value="Dubai" />
                  <option value="Thailand" />
                  <option value="Goa" />
                  <option value="Kerala" />
                  <option value="Rajasthan" />
                  <option value="Uttarakhand" />
                  <option value="Himachal Pradesh" />
                  <option value="Vietnam" />
                  <option value="Japan" />
                  <option value="Singapore" />
                  <option value="Andaman" />
                  <option value="Ladakh" />
                </datalist>
              </Field>

              <div className="hidden w-px self-stretch bg-ink/10 md:block" />

              <Field icon={<Calendar className="text-blue" />} label="When">
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

              <Field icon={<Users className="text-blue" />} label="Travellers">
                <select className="w-full cursor-pointer appearance-none bg-transparent text-sm font-medium text-ink focus:outline-none">
                  <option>2 Adults</option>
                  <option>1 Adult</option>
                  <option>2 Adults, 2 Kids</option>
                  <option>Group of 4+</option>
                </select>
              </Field>

              <button
                onClick={handleSearch}
                className="group flex items-center justify-center gap-2 rounded-xl bg-blue px-6 py-4 text-sm font-semibold text-cream transition-all hover:bg-blue-deep"
              >
                <Search className="h-4 w-4" />
                <span>Search</span>
              </button>
            </div>
          </div>

          {/* Trust row */}
          <div className="mt-6 flex flex-wrap items-center justify-center gap-x-7 gap-y-3 text-sm text-cream/80">
            <span className="inline-flex items-center gap-2">
              <span className="flex">
                {Array.from({ length: 5 }).map((_, i) => (
                  <Star key={i} className="h-4 w-4 text-sky-soft" />
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
