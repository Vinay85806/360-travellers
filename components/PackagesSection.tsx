import {
  getPackages,
  getDestinations,
  groupByDestination,
} from "@/lib/packages";
import CategoryTabs, { type TabItem } from "./CategoryTabs";
import PackageRail from "./PackageRail";
import PopularDestinations from "./PopularDestinations";

const BEACH_SLUGS = new Set([
  "maldives", "bali", "goa", "andaman", "thailand", "lakshadweep",
  "singapore", "vietnam", "kerala",
]);

function interleave<T>(domestic: T[], intl: T[]): T[] {
  if (intl.length === 0) return domestic;
  if (domestic.length === 0) return intl;
  const ratio = domestic.length / intl.length;
  const result: T[] = [];
  let di = 0, ii = 0;
  while (ii < intl.length) {
    const target = Math.floor((ii + 1) * ratio);
    while (di < target && di < domestic.length) result.push(domestic[di++]);
    result.push(intl[ii++]);
  }
  while (di < domestic.length) result.push(domestic[di++]);
  return result;
}

export default async function PackagesSection({ filter }: { filter?: string }) {
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

  const allRows = useCatalog
    ? destinations.map((d) => ({
        slug: d.slug,
        name: d.name,
        packages: packagesBySlug.get(d.slug)?.packages ?? [],
        isInternational: d.sort_order >= 50,
      }))
    : grouped.map((g) => ({
        slug: g.destination_slug,
        name: g.destination,
        packages: g.packages,
        isInternational: false,
      }));

  const domestic = allRows.filter((r) => !r.isInternational);
  const international = allRows.filter((r) => r.isInternational);
  const interleavedRows = interleave(domestic, international);

  // Apply filter from search tab selection
  const rows =
    filter === "domestic"
      ? domestic
      : filter === "international"
      ? international
      : filter === "beach"
      ? interleavedRows.filter((r) => BEACH_SLUGS.has(r.slug))
      : interleavedRows;

  const tabs: TabItem[] = interleavedRows
    .filter((r) => r.packages.length > 0)
    .map((r) => ({
      id: `rail-${r.slug}`,
      label: r.name,
      slug: r.slug,
    }));

  const filterLabel =
    filter === "domestic"
      ? "Domestic India"
      : filter === "international"
      ? "International"
      : filter === "beach"
      ? "Beach & Islands"
      : null;

  return (
    <div id="all-packages" className="bg-cream">
      <CategoryTabs tabs={tabs} />
      <PopularDestinations />

      {filterLabel && (
        <div className="mx-auto max-w-7xl px-5 pb-2 pt-6 sm:px-8">
          <p className="text-sm font-semibold text-blue">
            Showing: {filterLabel} packages
          </p>
        </div>
      )}

      <div className="divide-y divide-ink/6">
        {rows
          .filter((r) => r.packages.length > 0)
          .map((r) => (
            <PackageRail
              key={r.slug}
              id={`rail-${r.slug}`}
              title={`Tours in ${r.name}`}
              packages={r.packages}
              totalCount={r.packages.length}
              destinationSlug={r.slug}
            />
          ))}
      </div>

      {rows.filter((r) => r.packages.length > 0).length === 0 && (
        <p className="mx-auto max-w-7xl px-5 py-16 text-center text-ink/55 sm:px-8">
          No packages found for this filter.
        </p>
      )}
    </div>
  );
}
