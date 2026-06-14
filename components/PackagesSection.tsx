import {
  getPackages,
  getDestinations,
  groupByDestination,
} from "@/lib/packages";
import CategoryTabs, { type TabItem } from "./CategoryTabs";
import PackageRail from "./PackageRail";
import PopularDestinations from "./PopularDestinations";

export default async function PackagesSection() {
  const [packages, destinations] = await Promise.all([
    getPackages(100),
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

  // Packages grouped by their destination_slug.
  const grouped = groupByDestination(packages);
  const packagesBySlug = new Map(
    grouped.map((g) => [g.destination_slug, g])
  );

  // If the catalog table is populated, it drives order + icons + the full
  // (incl. empty) destination list. Otherwise fall back to package groups.
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

  const tabs: TabItem[] = rows.map((r) => ({
    id: `rail-${r.slug}`,
    label: r.name,
    slug: r.slug,
  }));

  return (
    <div id="all-packages" className="bg-cream">
      <CategoryTabs tabs={tabs} />

      {/* Popular destinations grid sits right under the tab bar */}
      <PopularDestinations />

      <div className="py-8">
        {rows.map((r) => (
          <PackageRail
            key={r.slug}
            id={`rail-${r.slug}`}
            title={`Tours in ${r.name}`}
            packages={r.packages}
          />
        ))}
      </div>
    </div>
  );
}
