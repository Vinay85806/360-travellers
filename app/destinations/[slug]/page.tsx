import { notFound } from "next/navigation";
import type { Metadata } from "next";
import Image from "next/image";
import Link from "next/link";
import Navbar from "@/components/Navbar";
import Footer from "@/components/Footer";
import { Clock, MapPin, ArrowRight, Star } from "@/components/icons";
import { inr } from "@/lib/format";
import {
  getPackagesByDestinationSlug,
  getDestinations,
  packageImage,
  type TravelPackage,
} from "@/lib/packages";

type Props = { params: Promise<{ slug: string }> };

const SITE = "https://360travellers.com";

export async function generateStaticParams() {
  const destinations = await getDestinations();
  return destinations.map((d) => ({ slug: d.slug }));
}

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { slug } = await params;
  const destinations = await getDestinations();
  const dest = destinations.find((d) => d.slug === slug);
  if (!dest) return { title: "Destination not found — 360 Travellers" };

  const title = `${dest.name} Tour Packages — 360 Travellers`;
  const description = `Explore handcrafted ${dest.name} tour packages. Curated itineraries, best prices, 24/7 on-trip support.`;

  return {
    title,
    description,
    alternates: { canonical: `${SITE}/destinations/${slug}` },
    openGraph: { title, description, type: "website" },
  };
}

function PackageCard({ pkg }: { pkg: TravelPackage }) {
  return (
    <article>
      <Link
        href={`/packages/${pkg.slug ?? pkg.id}`}
        className="group flex h-full flex-col overflow-hidden rounded-3xl border border-ink/8 bg-cream shadow-soft transition-all duration-300 hover:-translate-y-1 hover:shadow-lift"
      >
        {/* Image */}
        <div className="relative aspect-[5/4] overflow-hidden">
          <Image
            src={packageImage(pkg)}
            alt={pkg.title}
            fill
            sizes="(max-width: 640px) 100vw, (max-width: 1024px) 50vw, 33vw"
            className="object-cover transition-transform duration-700 ease-out group-hover:scale-110"
          />
          <span className="absolute right-3.5 top-3.5 inline-flex items-center gap-1 rounded-full bg-coal/55 px-2.5 py-1 text-xs font-semibold text-cream backdrop-blur-sm">
            <Clock className="h-3.5 w-3.5" />
            {pkg.duration}
          </span>
          {pkg.original_price && pkg.original_price > pkg.price && (
            <span className="absolute left-3.5 top-3.5 rounded-full bg-green-500 px-2.5 py-1 text-xs font-bold text-white">
              Save {inr(pkg.original_price - pkg.price)}
            </span>
          )}
        </div>

        {/* Body */}
        <div className="flex flex-1 flex-col p-5">
          <span className="text-xs font-semibold uppercase tracking-wider text-blue/70">
            {pkg.location ?? pkg.destination ?? "India"}
          </span>
          <h3 className="mt-1 font-display text-lg leading-snug text-ink">
            {pkg.title}
          </h3>
          <p className="mt-2 line-clamp-2 text-sm leading-relaxed text-ink/55">
            {pkg.description}
          </p>

          {pkg.highlights && pkg.highlights.length > 0 && (
            <ul className="mt-3 flex flex-wrap gap-1.5">
              {pkg.highlights.slice(0, 3).map((h, i) => (
                <li
                  key={i}
                  className="rounded-full bg-tint px-2.5 py-0.5 text-xs text-ink/65"
                >
                  {h}
                </li>
              ))}
            </ul>
          )}

          <div className="mt-auto flex items-end justify-between pt-5">
            <div>
              {pkg.original_price && pkg.original_price > pkg.price && (
                <span className="block text-xs text-ink/40 line-through">
                  {inr(pkg.original_price)}
                </span>
              )}
              <span className="font-display text-xl text-ink">
                {inr(pkg.price)}
              </span>
              <span className="ml-1 text-xs text-ink/50">/ person</span>
            </div>

            <div className="flex flex-col items-end gap-1.5">
              {pkg.rating && (
                <span className="inline-flex items-center gap-1 text-xs text-ink/60">
                  <Star className="h-3.5 w-3.5 text-amber-400" />
                  <strong className="text-ink">{pkg.rating}</strong>
                  {pkg.review_count ? `(${pkg.review_count})` : ""}
                </span>
              )}
              <span className="inline-flex items-center gap-1.5 rounded-full bg-tint px-3 py-1.5 text-xs font-semibold text-blue transition-colors group-hover:bg-blue group-hover:text-cream">
                View <ArrowRight className="h-3.5 w-3.5" />
              </span>
            </div>
          </div>
        </div>
      </Link>
    </article>
  );
}

export default async function DestinationPage({ params }: Props) {
  const { slug } = await params;

  const [destinations, packages] = await Promise.all([
    getDestinations(),
    getPackagesByDestinationSlug(slug),
  ]);

  const dest = destinations.find((d) => d.slug === slug);
  if (!dest) notFound();

  const sorted = [...packages].sort((a, b) => a.price - b.price);

  return (
    <main className="min-h-screen overflow-x-hidden bg-cream">
      <Navbar />

      {/* Page header */}
      <div className="border-b border-ink/8 bg-cream pt-24 pb-8 sm:pt-28">
        <div className="mx-auto max-w-7xl px-5 sm:px-8">
          <Link
            href="/#all-packages"
            className="inline-flex items-center gap-1.5 text-sm text-blue hover:underline"
          >
            <ArrowRight className="h-3.5 w-3.5 rotate-180" />
            All destinations
          </Link>

          <div className="mt-4 flex flex-wrap items-end justify-between gap-4">
            <div>
              <div className="inline-flex items-center gap-2 text-sm text-ink/55">
                <MapPin className="h-4 w-4" />
                India
              </div>
              <h1 className="mt-1 font-display text-3xl tracking-tight text-ink sm:text-4xl">
                Tours in {dest.name}
              </h1>
            </div>
            <p className="text-sm text-ink/55">
              <strong className="text-ink">{packages.length}</strong> packages
              available
            </p>
          </div>
        </div>
      </div>

      {/* Package grid */}
      <div className="mx-auto max-w-7xl px-5 py-12 sm:px-8">
        {packages.length === 0 ? (
          <div className="rounded-2xl border border-dashed border-ink/15 py-20 text-center">
            <p className="text-ink/50">
              New {dest.name} packages are on the way.
            </p>
            <Link
              href="/#search"
              className="mt-4 inline-flex items-center gap-2 rounded-full bg-blue px-5 py-2.5 text-sm font-semibold text-cream hover:bg-blue-deep"
            >
              Plan a custom trip
            </Link>
          </div>
        ) : (
          <div className="grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
            {sorted.map((pkg) => (
              <PackageCard key={pkg.id} pkg={pkg} />
            ))}
          </div>
        )}
      </div>

      <Footer />
    </main>
  );
}
