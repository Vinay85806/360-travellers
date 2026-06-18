import {
  getPackages,
  getDestinations,
  groupByDestination,
} from "@/lib/packages";
import CategoryTabs, { type TabItem } from "./CategoryTabs";
import PackageRail from "./PackageRail";
import PopularDestinations from "./PopularDestinations";

/** Number of preview cards shown per destination on the homepage. */
const PREVIEW_COUNT = 3;

/**
 * Interleaves domestic and international destinations proportionally.
 * e.g. 15 domestic + 7 international → D D I D D I … (2:1 ratio)
 */
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

  // Interleave domestic + international proportionally
  const domestic = allRows.filter((r) => !r.isInternational);
  const international = allRows.filter((r) => r.isInternational);
  const rows = interleave(domestic, international);

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

      <div className="divide-y divide-ink/6">
        {rows.map((r) => (
          <PackageRail
            key={r.slug}
            id={`rail-${r.slug}`}
            title={`Tours in ${r.name}`}
            packages={r.packages.slice(0, PREVIEW_COUNT)}
            totalCount={r.packages.length}
            destinationSlug={r.slug}
          />
        ))}
      </div>
    </div>
  );
}
