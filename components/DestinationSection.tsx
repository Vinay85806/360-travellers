import Link from "next/link";
import Image from "next/image";
import { ArrowRight, Clock } from "@/components/icons";
import { inr } from "@/lib/format";
import { packageImage, type TravelPackage } from "@/lib/packages";

function PackageCard({ pkg }: { pkg: TravelPackage }) {
  return (
    <article>
      <Link
        href={`/packages/${pkg.slug ?? pkg.id}`}
        className="group flex h-full flex-col overflow-hidden rounded-3xl border border-ink/8 bg-cream shadow-soft transition-all duration-300 hover:-translate-y-1 hover:shadow-lift"
      >
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
                <li key={i} className="rounded-full bg-tint px-2.5 py-0.5 text-xs text-ink/65">
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
              <span className="font-display text-xl text-ink">{inr(pkg.price)}</span>
              <span className="ml-1 text-xs text-ink/50">/ person</span>
            </div>
            <span className="inline-flex items-center gap-1.5 rounded-full bg-tint px-3 py-1.5 text-xs font-semibold text-blue transition-colors group-hover:bg-blue group-hover:text-cream">
              View <ArrowRight className="h-3.5 w-3.5" />
            </span>
          </div>
        </div>
      </Link>
    </article>
  );
}

export default function DestinationSection({
  id,
  name,
  slug,
  packages,
}: {
  id: string;
  name: string;
  slug: string;
  packages: TravelPackage[];
}) {
  const shown = packages.slice(0, 6);
  const total = packages.length;

  return (
    <section id={id} className="border-b border-ink/6 py-14 last:border-0">
      <div className="mx-auto max-w-7xl px-5 sm:px-8">
        {/* Header */}
        <div className="mb-8 flex flex-wrap items-end justify-between gap-4">
          <div>
            <p className="mb-1 text-xs font-semibold uppercase tracking-wider text-blue/70">
              {total} packages available
            </p>
            <h2 className="font-display text-2xl text-ink sm:text-3xl lg:text-[2.2rem]">
              Tours in {name}
            </h2>
          </div>
          <Link
            href={`/destinations/${slug}`}
            className="inline-flex shrink-0 items-center gap-2 rounded-full border border-blue/30 px-5 py-2.5 text-sm font-semibold text-blue transition-colors hover:bg-blue hover:text-cream"
          >
            View all {total} packages <ArrowRight className="h-3.5 w-3.5" />
          </Link>
        </div>

        {/* Grid */}
        <div className="grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
          {shown.map((pkg) => (
            <PackageCard key={pkg.id} pkg={pkg} />
          ))}
        </div>

        {total > 6 && (
          <div className="mt-10 text-center">
            <Link
              href={`/destinations/${slug}`}
              className="inline-flex items-center gap-2 rounded-full bg-blue px-8 py-3 text-sm font-semibold text-cream transition-colors hover:bg-blue-deep"
            >
              See all {total} {name} packages <ArrowRight className="h-4 w-4" />
            </Link>
          </div>
        )}
      </div>
    </section>
  );
}
