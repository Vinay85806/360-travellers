export const dynamic = "force-dynamic";

import Link from "next/link";
import { notFound } from "next/navigation";
import type { Metadata } from "next";
import Navbar from "@/components/Navbar";
import Footer from "@/components/Footer";
import Reveal from "@/components/Reveal";
import PackageGallery from "@/components/PackageGallery";
import ItineraryAccordion from "@/components/ItineraryAccordion";
import DurationSwitcher from "@/components/DurationSwitcher";
import EnquiryForm from "@/components/EnquiryForm";
import TrustBadges from "@/components/TrustBadges";
import PolicyAccordion from "@/components/PolicyAccordion";
import { Clock, MapPin, Star, Check, XMark, Info, ArrowRight } from "@/components/icons";
import {
  getPackageBySlug,
  getPackageById,
  getAllPackageSlugs,
  getPackagesByDestinationSlug,
  packageImage,
  type TravelPackage,
} from "@/lib/packages";

const UUID_RE =
  /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i;

/** Resolve by slug, or by id if the param looks like a UUID (pre-migration). */
async function resolvePackage(param: string): Promise<TravelPackage | null> {
  const bySlug = await getPackageBySlug(param);
  if (bySlug) return bySlug;
  if (UUID_RE.test(param)) return getPackageById(param);
  return null;
}

type Props = { params: Promise<{ slug: string }> };

const SITE = "https://360travellers.com";

// Pre-render every package page at build time for speed + SEO.
export async function generateStaticParams() {
  const rows = await getAllPackageSlugs();
  return rows.map((r) => ({ slug: r.slug }));
}

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { slug } = await params;
  const pkg = await resolvePackage(slug);

  if (!pkg) return { title: "Package not found — 360 Travellers" };

  // Prefer per-package SEO fields; fall back to sensible defaults.
  const title = pkg.meta_title || `${pkg.title} — ${pkg.duration} | 360 Travellers`;
  const description =
    pkg.meta_description || pkg.description.slice(0, 160);
  const image = pkg.image_url || `${SITE}/images/placeholder.svg`;

  return {
    title,
    description,
    keywords: pkg.keywords && pkg.keywords.length ? pkg.keywords : undefined,
    alternates: { canonical: `${SITE}/packages/${pkg.slug}` },
    openGraph: {
      title,
      description,
      url: `${SITE}/packages/${pkg.slug}`,
      type: "website",
      images: [{ url: image }],
    },
    twitter: {
      card: "summary_large_image",
      title,
      description,
      images: [image],
    },
  };
}

// ---- Fallback content so the page looks complete before real data is added ----
const DEFAULT_INCLUSIONS = [
  "Accommodation as per itinerary",
  "Daily breakfast",
  "Private transfers and sightseeing",
  "Experienced local guide",
  "All applicable taxes",
];
const DEFAULT_EXCLUSIONS = [
  "Airfare / train tickets",
  "Travel insurance",
  "Personal expenses",
  "Anything not mentioned in inclusions",
];
const DEFAULT_KNOW_BEFORE = [
  "Carry a valid government-issued photo ID for all travellers.",
  "Itinerary may be adjusted due to weather or local conditions.",
  "Rates are per person on twin-sharing basis unless stated otherwise.",
];

function jsonLd(pkg: TravelPackage) {
  // Modelled as a Product so Google accepts aggregateRating + offers for
  // rich results. (aggregateRating is NOT valid on TouristTrip.)
  return {
    "@context": "https://schema.org",
    "@type": "Product",
    name: pkg.title,
    description: pkg.description,
    image: pkg.image_url || `${SITE}/images/placeholder.svg`,
    category: pkg.category === "domestic" ? "Domestic Tour" : "International Tour",
    brand: {
      "@type": "Brand",
      name: "360 Travellers",
    },
    offers: {
      "@type": "Offer",
      price: pkg.price,
      priceCurrency: "INR",
      availability: "https://schema.org/InStock",
      url: `${SITE}/packages/${pkg.slug}`,
    },
    ...(pkg.rating && pkg.review_count
      ? {
          aggregateRating: {
            "@type": "AggregateRating",
            ratingValue: pkg.rating,
            reviewCount: pkg.review_count,
            bestRating: 5,
            worstRating: 1,
          },
        }
      : {}),
  };
}

export default async function PackageDetailPage({ params }: Props) {
  const { slug } = await params;
  const pkg = await resolvePackage(slug);
  if (!pkg) notFound();

  // Sibling packages of the same destination → duration options.
  const siblings = pkg.destination_slug
    ? await getPackagesByDestinationSlug(pkg.destination_slug)
    : [];

  const itinerary = pkg.itinerary ?? [];
  const gallery =
    pkg.gallery && pkg.gallery.length > 0 ? pkg.gallery : [packageImage(pkg)];
  const highlights = pkg.highlights ?? [];
  const inclusions =
    pkg.inclusions && pkg.inclusions.length ? pkg.inclusions : DEFAULT_INCLUSIONS;
  const exclusions =
    pkg.exclusions && pkg.exclusions.length ? pkg.exclusions : DEFAULT_EXCLUSIONS;
  const knowBefore =
    pkg.know_before && pkg.know_before.length
      ? pkg.know_before
      : DEFAULT_KNOW_BEFORE;
  const route = pkg.route ?? [];
  const locationLabel =
    pkg.location ?? (pkg.category === "domestic" ? "India" : "Worldwide");

  return (
    <main className="overflow-x-hidden bg-cream">
      <Navbar />

      {/* JSON-LD structured data for SEO */}
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd(pkg)) }}
      />

      <div className="mx-auto max-w-7xl px-5 pt-24 sm:px-8 sm:pt-28">
        {/* Gallery */}
        <Reveal>
          <PackageGallery images={gallery} alt={pkg.title} />
        </Reveal>
      </div>

      <div className="mx-auto grid max-w-7xl gap-10 px-5 py-10 sm:px-8 lg:grid-cols-[1fr_360px]">
        {/* ---- Left: content ---- */}
        <div className="min-w-0">
          {/* Title block */}
          <span className="inline-flex items-center gap-1.5 rounded-full bg-blue/10 px-3 py-1 text-xs font-bold uppercase tracking-wider text-blue">
            {pkg.category === "domestic" ? "India Package" : "International"}
          </span>
          <h1 className="mt-3 font-display text-2xl leading-tight text-ink sm:text-3xl lg:text-4xl">
            {pkg.title}
          </h1>

          <div className="mt-4 flex flex-wrap items-center gap-x-5 gap-y-2 text-sm text-ink/65">
            <span className="inline-flex items-center gap-1.5 rounded-full bg-blue px-3 py-1 font-semibold text-cream">
              {pkg.duration}
            </span>
            <span className="inline-flex items-center gap-1.5">
              <MapPin className="h-4 w-4 text-blue" />
              {locationLabel}
            </span>
            {pkg.rating && (
              <span className="inline-flex items-center gap-1.5">
                <Star className="h-4 w-4 text-blue" />
                <strong className="text-ink">{pkg.rating}</strong>
                {pkg.review_count ? (
                  <span className="text-ink/50">({pkg.review_count})</span>
                ) : null}
              </span>
            )}
          </div>

          {/* Choose Trip Duration (sibling packages of same destination) */}
          <DurationSwitcher siblings={siblings} currentSlug={pkg.slug} />

          {/* Route */}
          {route.length > 0 && (
            <div className="mt-6 rounded-2xl border border-blue/20 bg-tint/60 px-4 py-3">
              <span className="text-xs font-semibold uppercase tracking-wide text-ink/50">
                Destination Route
              </span>
              <div className="mt-1.5 flex flex-wrap items-center gap-2 text-sm font-medium text-ink">
                {route.map((stop, i) => (
                  <span key={`${stop}-${i}`} className="inline-flex items-center gap-2">
                    {stop}
                    {i < route.length - 1 && (
                      <ArrowRight className="h-3.5 w-3.5 text-blue" />
                    )}
                  </span>
                ))}
              </div>
            </div>
          )}

          {/* Overview */}
          <div className="mt-8">
            <h2 className="font-display text-2xl text-ink">Overview</h2>
            <p className="mt-3 text-base leading-relaxed text-ink/70">
              {pkg.description}
            </p>
          </div>

          {/* Highlights */}
          {highlights.length > 0 && (
            <div className="mt-10">
              <h2 className="font-display text-2xl text-ink">Trip Highlights</h2>
              <ul className="mt-4 space-y-2.5">
                {highlights.map((h, i) => (
                  <li key={i} className="flex gap-3 text-sm leading-relaxed text-ink/75">
                    <Check className="mt-0.5 h-4 w-4 shrink-0 text-blue" />
                    <span>{h}</span>
                  </li>
                ))}
              </ul>
            </div>
          )}

          {/* Itinerary */}
          {itinerary.length > 0 && (
            <div className="mt-12">
              <h2 className="font-display text-2xl text-ink">
                Day-by-Day Itinerary
              </h2>
              <div className="mt-5">
                <ItineraryAccordion itinerary={itinerary} />
              </div>
            </div>
          )}

          {/* Inclusions / Exclusions */}
          <div className="mt-12">
            <h2 className="font-display text-2xl text-ink">
              What&rsquo;s inside the package?
            </h2>
            <div className="mt-5 grid gap-8 rounded-2xl border border-ink/10 p-4 sm:grid-cols-2 sm:p-6">
              <div>
                <h3 className="font-semibold text-ink">Inclusions</h3>
                <ul className="mt-3 space-y-2.5">
                  {inclusions.map((inc, i) => (
                    <li key={i} className="flex gap-2.5 text-sm text-ink/75">
                      <Check className="mt-0.5 h-4 w-4 shrink-0 text-green-600" />
                      <span>{inc}</span>
                    </li>
                  ))}
                </ul>
              </div>
              <div>
                <h3 className="font-semibold text-ink">Exclusions</h3>
                <ul className="mt-3 space-y-2.5">
                  {exclusions.map((exc, i) => (
                    <li key={i} className="flex gap-2.5 text-sm text-ink/75">
                      <XMark className="mt-0.5 h-4 w-4 shrink-0 text-red-500" />
                      <span>{exc}</span>
                    </li>
                  ))}
                </ul>
              </div>
            </div>
          </div>

          {/* Know before you go */}
          <div className="mt-12">
            <h2 className="font-display text-2xl text-ink">Know Before You Go</h2>
            <ul className="mt-4 space-y-2.5">
              {knowBefore.map((k, i) => (
                <li key={i} className="flex gap-3 text-sm leading-relaxed text-ink/70">
                  <Info className="mt-0.5 h-4 w-4 shrink-0 text-blue" />
                  <span>{k}</span>
                </li>
              ))}
            </ul>
          </div>

          <Link
            href="/#all-packages"
            className="group mt-12 inline-flex items-center gap-2 text-sm font-semibold text-blue transition-colors hover:text-blue-deep"
          >
            <ArrowRight className="h-4 w-4 rotate-180 transition-transform group-hover:-translate-x-1" />
            Back to all packages
          </Link>
        </div>

        {/* ---- Right: sticky enquiry ---- */}
        <aside className="min-w-0 lg:sticky lg:top-24 lg:self-start">
          <EnquiryForm
            packageTitle={pkg.title}
            packageSlug={pkg.slug ?? pkg.id}
            price={pkg.price}
            originalPrice={pkg.original_price}
          />

          <div className="mt-5 flex items-center gap-3 rounded-2xl border border-ink/10 bg-cream p-4 text-sm text-ink/65">
            <Clock className="h-5 w-5 shrink-0 text-blue" />
            <span>
              <strong className="text-ink">24/7 on-trip support.</strong> Our
              experts handle every detail.
            </span>
          </div>
        </aside>
      </div>

      <TrustBadges />
      <PolicyAccordion />

      <Footer />
    </main>
  );
}
