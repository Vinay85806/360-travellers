import {
  getPackages,
  getDestinations,
  groupByDestination,
} from "@/lib/packages";
import CategoryTabs, { type TabItem } from "./CategoryTabs";
import PackageRail from "./PackageRail";
import DestinationSection from "./DestinationSection";
import PopularDestinations from "./PopularDestinations";

/** Destinations with this many or more packages get a full grid section. */
const FEATURED_THRESHOLD = 5;

export default async function PackagesSection() {
  const [packages, destinations] = await Promise.all([
    getPackages(200),
    getDestinations(),
  ]);

  if (packages.length === 0 && destinations.length === 0) {
    return (
      <section id="all-packages" className="bg-cream py-20">
        <p className="mx-auto max-w-7xl px-5 text-center text-ink/55 sm:px-8">
          We&rsquo;re curating new packages right now. Please check back soon.
        </p>
      </section>
    );
  }

  const grouped = groupByDestination(packages);
  const packagesBySlug = new Map(grouped.map((g) => [g.destination_slug, g]));

  const useCatalog = destinations.length > 0;

  const rows = useCatalog
    ? destinations.map((d) => ({
        slug: d.slug,
        name: d.name,
        packages: packagesBySlug.get(d.slug)?.packages ?? [],
      }))
    : grouped.map((g) => ({
        slug: g.destination_slug,
        name: g.destination,
        packages: g.packages,
      }));

  // Destinations with 5+ packages get a dedicated grid section.
  // The rest stay as horizontal rails.
  const featured = rows.filter((r) => r.packages.length >= FEATURED_THRESHOLD);
  const small = rows.filter((r) => r.packages.length < FEATURED_THRESHOLD && r.packages.length > 0);

  const tabs: TabItem[] = rows
    .filter((r) => r.packages.length > 0)
    .map((r) => ({
      id: `rail-${r.slug}`,
      label: r.name,
      slug: r.slug,
    }));

  return (
    <div id="all-packages" className="bg-cream">
      <CategoryTabs tabs={tabs} />
      <PopularDestinations />

      {/* Featured destinations — full grid sections */}
      {featured.map((r) => (
        <DestinationSection
          key={r.slug}
          id={`rail-${r.slug}`}
          name={r.name}
          slug={r.slug}
          packages={r.packages}
        />
      ))}

      {/* Small destinations — horizontal scroll rails */}
      {small.length > 0 && (
        <div className="py-8">
          {small.map((r) => (
            <PackageRail
              key={r.slug}
              id={`rail-${r.slug}`}
              title={`Tours in ${r.name}`}
              packages={r.packages}
              destinationSlug={r.slug}
            />
          ))}
        </div>
      )}
    </div>
  );
}
