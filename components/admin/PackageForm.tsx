"use client";

import { useEffect, useState } from "react";
import { useRouter } from "next/navigation";
import { supabase } from "@/lib/supabase";
import { type TravelPackage, type ItineraryDay, type Destination } from "@/lib/packages";
import ListEditor from "./ListEditor";
import ImageInput from "./ImageInput";
import ItineraryEditor from "./ItineraryEditor";
import { Check, ArrowRight } from "@/components/icons";

const slugify = (s: string) =>
  s
    .toLowerCase()
    .replace(/[^a-z0-9\s-]/g, "")
    .trim()
    .replace(/\s+/g, "-");

type FormState = {
  title: string;
  slug: string;
  category: "domestic" | "international";
  destination_slug: string;
  location: string;
  nights: string;
  days: string;
  price: string;
  original_price: string;
  rating: string;
  review_count: string;
  description: string;
  image_url: string;
  gallery: string[];
  highlights: string[];
  route: string[];
  inclusions: string[];
  exclusions: string[];
  know_before: string[];
  itinerary: ItineraryDay[];
};

const DEFAULT: FormState = {
  title: "",
  slug: "",
  category: "domestic",
  destination_slug: "",
  location: "",
  nights: "",
  days: "",
  price: "",
  original_price: "",
  rating: "",
  review_count: "",
  description: "",
  image_url: "",
  gallery: [],
  highlights: [],
  route: [],
  inclusions: [],
  exclusions: [],
  know_before: [],
  itinerary: [],
};

function pkgToForm(pkg: TravelPackage): FormState {
  return {
    title: pkg.title ?? "",
    slug: pkg.slug ?? "",
    category: pkg.category ?? "domestic",
    destination_slug: pkg.destination_slug ?? "",
    location: pkg.location ?? "",
    nights: pkg.nights != null ? String(pkg.nights) : "",
    days: pkg.days != null ? String(pkg.days) : "",
    price: pkg.price != null ? String(pkg.price) : "",
    original_price: pkg.original_price != null ? String(pkg.original_price) : "",
    rating: pkg.rating != null ? String(pkg.rating) : "",
    review_count: pkg.review_count != null ? String(pkg.review_count) : "",
    description: pkg.description ?? "",
    image_url: pkg.image_url ?? "",
    gallery: Array.isArray(pkg.gallery) ? pkg.gallery : [],
    highlights: Array.isArray(pkg.highlights) ? pkg.highlights : [],
    route: Array.isArray(pkg.route) ? pkg.route : [],
    inclusions: Array.isArray(pkg.inclusions) ? pkg.inclusions : [],
    exclusions: Array.isArray(pkg.exclusions) ? pkg.exclusions : [],
    know_before: Array.isArray(pkg.know_before) ? pkg.know_before : [],
    itinerary: Array.isArray(pkg.itinerary) ? pkg.itinerary : [],
  };
}

function Section({ title, children }: { title: string; children: React.ReactNode }) {
  return (
    <div className="rounded-2xl border border-ink/10 bg-white p-6">
      <h2 className="mb-5 font-display text-lg text-ink">{title}</h2>
      <div className="space-y-5">{children}</div>
    </div>
  );
}

function Field({
  label,
  hint,
  children,
}: {
  label: string;
  hint?: string;
  children: React.ReactNode;
}) {
  return (
    <div>
      <label className="block text-sm font-semibold text-ink">{label}</label>
      {hint && <p className="mt-0.5 text-xs text-ink/45">{hint}</p>}
      <div className="mt-1.5">{children}</div>
    </div>
  );
}

const inputCls =
  "w-full rounded-xl border border-ink/15 bg-ivory px-3 py-2.5 text-sm text-ink placeholder:text-ink/35 focus:border-blue focus:outline-none transition-colors";

export default function PackageForm({ initial }: { initial?: TravelPackage }) {
  const router = useRouter();
  const isEdit = Boolean(initial?.id);

  const [form, setForm] = useState<FormState>(
    initial ? pkgToForm(initial) : DEFAULT
  );
  const [destinations, setDestinations] = useState<Destination[]>([]);
  const [saving, setSaving] = useState(false);
  const [saved, setSaved] = useState(false);
  const [error, setError] = useState("");
  const [newGalleryUrl, setNewGalleryUrl] = useState("");

  useEffect(() => {
    supabase
      .from("destinations")
      .select("id, name, slug")
      .eq("active", true)
      .order("sort_order")
      .then(({ data }) => setDestinations((data as Destination[]) ?? []));
  }, []);

  const set = <K extends keyof FormState>(key: K, value: FormState[K]) =>
    setForm((f) => ({ ...f, [key]: value }));

  const handleTitleChange = (title: string) => {
    setForm((f) => ({
      ...f,
      title,
      slug: f.slug && f.slug !== slugify(f.title) ? f.slug : slugify(title),
    }));
  };

  const duration =
    form.nights && form.days
      ? `${form.nights} Nights / ${form.days} Days`
      : form.nights
      ? `${form.nights} Nights`
      : "";

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setError("");

    if (!form.title.trim()) { setError("Package title is required."); return; }
    if (!form.price) { setError("Price is required."); return; }
    if (!form.image_url) { setError("Hero image is required."); return; }

    setSaving(true);

    const payload = {
      title: form.title.trim(),
      slug: form.slug.trim() || slugify(form.title),
      category: form.category,
      destination_slug: form.destination_slug || null,
      destination: destinations.find((d) => d.slug === form.destination_slug)?.name ?? null,
      location: form.location.trim() || null,
      nights: form.nights ? Number(form.nights) : null,
      days: form.days ? Number(form.days) : null,
      duration: duration || form.title,
      price: Number(form.price),
      original_price: form.original_price ? Number(form.original_price) : null,
      rating: form.rating ? Number(form.rating) : null,
      review_count: form.review_count ? Number(form.review_count) : null,
      description: form.description.trim(),
      image_url: form.image_url,
      gallery: form.gallery,
      highlights: form.highlights,
      route: form.route,
      inclusions: form.inclusions,
      exclusions: form.exclusions,
      know_before: form.know_before,
      itinerary: form.itinerary,
    };

    const { error: dbError } = isEdit
      ? await supabase.from("packages").update(payload).eq("id", initial!.id)
      : await supabase.from("packages").insert(payload);

    setSaving(false);

    if (dbError) {
      setError(dbError.message);
      return;
    }

    setSaved(true);
    setTimeout(() => {
      router.push("/admin/packages");
      router.refresh();
    }, 1200);
  };

  if (saved) {
    return (
      <div className="flex flex-col items-center justify-center gap-4 py-24 text-center">
        <span className="grid h-16 w-16 place-items-center rounded-full bg-green-100 text-green-600">
          <Check className="h-8 w-8" />
        </span>
        <p className="font-display text-2xl text-ink">
          Package {isEdit ? "updated" : "created"}!
        </p>
        <p className="text-sm text-ink/50">Redirecting to packages list…</p>
      </div>
    );
  }

  return (
    <form onSubmit={handleSubmit} className="space-y-6">
      {error && (
        <div className="rounded-xl bg-red-50 border border-red-200 px-4 py-3 text-sm text-red-600">
          {error}
        </div>
      )}

      {/* ── Basic Info ─────────────────────────────────────────────── */}
      <Section title="Basic Information">
        <Field label="Package Title *">
          <input
            type="text"
            required
            value={form.title}
            onChange={(e) => handleTitleChange(e.target.value)}
            placeholder="e.g. Spiti Valley Explorer — 7 Days"
            className={inputCls}
          />
        </Field>

        <div className="grid gap-5 sm:grid-cols-2">
          <Field label="URL Slug" hint="Auto-generated from title — you can edit it">
            <input
              type="text"
              value={form.slug}
              onChange={(e) => set("slug", e.target.value.toLowerCase().replace(/[^a-z0-9-]/g, ""))}
              placeholder="spiti-valley-explorer-7-days"
              className={inputCls}
            />
          </Field>

          <Field label="Category *">
            <select
              value={form.category}
              onChange={(e) => set("category", e.target.value as "domestic" | "international")}
              className={inputCls}
            >
              <option value="domestic">India (Domestic)</option>
              <option value="international">International</option>
            </select>
          </Field>
        </div>

        <div className="grid gap-5 sm:grid-cols-2">
          <Field label="Destination" hint="Which destination group does this belong to?">
            <select
              value={form.destination_slug}
              onChange={(e) => set("destination_slug", e.target.value)}
              className={inputCls}
            >
              <option value="">— None —</option>
              {destinations.map((d) => (
                <option key={d.slug} value={d.slug}>{d.name}</option>
              ))}
            </select>
          </Field>

          <Field label="Location" hint="Shown on the package page, e.g. Kaza, Spiti Valley">
            <input
              type="text"
              value={form.location}
              onChange={(e) => set("location", e.target.value)}
              placeholder="Kaza, Spiti Valley, Himachal Pradesh"
              className={inputCls}
            />
          </Field>
        </div>

        <div className="grid gap-5 sm:grid-cols-3">
          <Field label="Nights">
            <input
              type="number"
              min={0}
              value={form.nights}
              onChange={(e) => set("nights", e.target.value)}
              placeholder="5"
              className={inputCls}
            />
          </Field>
          <Field label="Days">
            <input
              type="number"
              min={0}
              value={form.days}
              onChange={(e) => set("days", e.target.value)}
              placeholder="6"
              className={inputCls}
            />
          </Field>
          <Field label="Duration (auto)">
            <input
              type="text"
              readOnly
              value={duration}
              placeholder="Fill Nights & Days above"
              className={`${inputCls} bg-ivory/50 text-ink/50 cursor-not-allowed`}
            />
          </Field>
        </div>

        <div className="grid gap-5 sm:grid-cols-2">
          <Field label="Rating" hint="Out of 5, e.g. 4.8">
            <input
              type="number"
              min={0}
              max={5}
              step={0.1}
              value={form.rating}
              onChange={(e) => set("rating", e.target.value)}
              placeholder="4.8"
              className={inputCls}
            />
          </Field>
          <Field label="Review Count">
            <input
              type="number"
              min={0}
              value={form.review_count}
              onChange={(e) => set("review_count", e.target.value)}
              placeholder="263"
              className={inputCls}
            />
          </Field>
        </div>
      </Section>

      {/* ── Pricing ────────────────────────────────────────────────── */}
      <Section title="Pricing">
        <div className="grid gap-5 sm:grid-cols-2">
          <Field label="Price (₹) *" hint="Price per person">
            <div className="relative">
              <span className="absolute left-3.5 top-1/2 -translate-y-1/2 text-sm font-semibold text-ink/40">₹</span>
              <input
                type="number"
                min={0}
                required
                value={form.price}
                onChange={(e) => set("price", e.target.value)}
                placeholder="22999"
                className={`${inputCls} pl-7`}
              />
            </div>
          </Field>
          <Field label="Original Price (₹)" hint="Strike-through price to show a discount">
            <div className="relative">
              <span className="absolute left-3.5 top-1/2 -translate-y-1/2 text-sm font-semibold text-ink/40">₹</span>
              <input
                type="number"
                min={0}
                value={form.original_price}
                onChange={(e) => set("original_price", e.target.value)}
                placeholder="27999"
                className={`${inputCls} pl-7`}
              />
            </div>
          </Field>
        </div>
      </Section>

      {/* ── Hero Image ─────────────────────────────────────────────── */}
      <Section title="Hero Image">
        <ImageInput
          label="Main package image *"
          hint="This is the primary photo shown on the package card and detail page"
          value={form.image_url}
          onChange={(url) => set("image_url", url)}
        />
      </Section>

      {/* ── Gallery ────────────────────────────────────────────────── */}
      <Section title="Photo Gallery">
        <p className="text-xs text-ink/45 -mt-3">
          Add extra photos for the gallery on the package detail page.
        </p>

        {/* Existing gallery items */}
        <div className="grid grid-cols-2 gap-3 sm:grid-cols-3">
          {form.gallery.map((url, i) => (
            <div key={i} className="relative group">
              <div className="relative aspect-[4/3] overflow-hidden rounded-xl border border-ink/10">
                <img src={url} alt="" className="h-full w-full object-cover" />
              </div>
              <button
                type="button"
                onClick={() => set("gallery", form.gallery.filter((_, idx) => idx !== i))}
                className="absolute -top-2 -right-2 grid h-6 w-6 place-items-center rounded-full bg-red-500 text-white shadow opacity-0 group-hover:opacity-100 transition-opacity"
              >
                <XMark className="h-3.5 w-3.5" />
              </button>
            </div>
          ))}
        </div>

        {/* Add to gallery */}
        <div className="rounded-xl border border-dashed border-ink/15 p-4">
          <p className="mb-3 text-xs font-semibold uppercase tracking-wide text-ink/40">
            Add Photo
          </p>
          <ImageInput
            label=""
            value={newGalleryUrl}
            onChange={(url) => {
              if (url) {
                set("gallery", [...form.gallery, url]);
                setNewGalleryUrl("");
              }
            }}
          />
        </div>
      </Section>

      {/* ── Description ────────────────────────────────────────────── */}
      <Section title="Overview & Description">
        <Field label="Description *" hint="2–4 sentences shown as the package overview">
          <textarea
            rows={5}
            required
            value={form.description}
            onChange={(e) => set("description", e.target.value)}
            placeholder="Describe the overall experience, who it's for, and what makes it special…"
            className={`${inputCls} resize-none`}
          />
        </Field>

        <ListEditor
          label="Trip Highlights"
          hint="Key activities or experiences — shown as bullet points"
          items={form.highlights}
          onChange={(v) => set("highlights", v)}
          placeholder="e.g. Visit Key Monastery at sunrise"
        />

        <ListEditor
          label="Destination Route"
          hint="Places visited in order — e.g. Manali, then Kaza, then Spiti"
          items={form.route}
          onChange={(v) => set("route", v)}
          placeholder="e.g. Manali"
        />
      </Section>

      {/* ── Inclusions & Exclusions ────────────────────────────────── */}
      <Section title="What's Included / Excluded">
        <div className="grid gap-8 sm:grid-cols-2">
          <ListEditor
            label="Inclusions ✓"
            hint="Everything covered in the package price"
            items={form.inclusions}
            onChange={(v) => set("inclusions", v)}
            placeholder="e.g. Hotel accommodation (twin-sharing)"
          />
          <ListEditor
            label="Exclusions ✗"
            hint="What the traveller needs to arrange separately"
            items={form.exclusions}
            onChange={(v) => set("exclusions", v)}
            placeholder="e.g. Airfare / train tickets"
          />
        </div>
      </Section>

      {/* ── Know Before You Go ─────────────────────────────────────── */}
      <Section title="Know Before You Go">
        <ListEditor
          label="Important notes & tips"
          hint="Health tips, ID requirements, what to carry, etc."
          items={form.know_before}
          onChange={(v) => set("know_before", v)}
          placeholder="e.g. Carry a valid photo ID for all travellers"
        />
      </Section>

      {/* ── Itinerary ──────────────────────────────────────────────── */}
      <Section title="Day-by-Day Itinerary">
        <p className="text-xs text-ink/45 -mt-3">
          Add each day's plan. Click a day card to expand and fill in details.
        </p>
        <ItineraryEditor
          days={form.itinerary}
          onChange={(v) => set("itinerary", v)}
        />
      </Section>

      {/* ── Save button ────────────────────────────────────────────── */}
      <div className="sticky bottom-0 -mx-8 -mb-8 border-t border-ink/10 bg-white/95 px-8 py-4 backdrop-blur-sm">
        <div className="flex items-center justify-between gap-4">
          <button
            type="button"
            onClick={() => router.push("/admin/packages")}
            className="text-sm text-ink/50 hover:text-ink transition-colors"
          >
            Cancel
          </button>
          <button
            type="submit"
            disabled={saving}
            className="inline-flex items-center gap-2 rounded-xl bg-blue px-6 py-3 text-sm font-semibold text-white hover:bg-blue-deep transition-colors disabled:opacity-60"
          >
            {saving ? "Saving…" : isEdit ? "Save Changes" : "Create Package"}
            {!saving && <ArrowRight className="h-4 w-4" />}
          </button>
        </div>
      </div>
    </form>
  );
}

// Re-export XMark for inline use in gallery
function XMark({ className }: { className?: string }) {
  return (
    <svg
      className={className}
      viewBox="0 0 24 24"
      fill="none"
      stroke="currentColor"
      strokeWidth={2}
      strokeLinecap="round"
      strokeLinejoin="round"
    >
      <line x1="6" y1="6" x2="18" y2="18" />
      <line x1="18" y1="6" x2="6" y2="18" />
    </svg>
  );
}
