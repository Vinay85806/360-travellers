import { getPackages, groupByDestination } from "@/lib/packages";
import CategoryTabs, { type TabItem } from "./CategoryTabs";
import PackageRail from "./PackageRail";

export default async function PackagesSection() {
  // Pull all packages so every destination rail is populated.
  const packages = await getPackages(100);

  if (packages.length === 0) {
    return (
      <section id="all-packages" className="bg-cream py-20">
        <p className="mx-auto max-w-7xl px-5 text-center text-ink/55 sm:px-8">
          We&rsquo;re curating new packages right now. Please check back soon.
        </p>
      </section>
    );
  }

  const groups = groupByDestination(packages);

  const tabs: TabItem[] = groups.map((g) => ({
    id: `rail-${g.destination_slug}`,
    label: g.destination,
  }));

  return (
    <div id="all-packages" className="bg-cream">
      <CategoryTabs tabs={tabs} />

      <div className="py-8">
        {groups.map((g) => (
          <PackageRail
            key={g.destination_slug}
            id={`rail-${g.destination_slug}`}
            title={`Tours in ${g.destination}`}
            packages={g.packages}
          />
        ))}
      </div>
    </div>
  );
}
