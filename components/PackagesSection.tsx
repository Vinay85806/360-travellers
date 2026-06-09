import { getPackages } from "@/lib/packages";
import CategoryTabs, { type TabItem } from "./CategoryTabs";
import PackageRail from "./PackageRail";

export default async function PackagesSection() {
  // Pull a generous pool so each rail has cards to scroll through.
  const packages = await getPackages(30);

  const domestic = packages.filter((p) => p.category === "domestic");
  const international = packages.filter((p) => p.category === "international");

  const tabs: TabItem[] = [];
  if (domestic.length) tabs.push({ id: "rail-domestic", label: "Domestic" });
  if (international.length)
    tabs.push({ id: "rail-international", label: "International" });

  if (packages.length === 0) {
    return (
      <section id="all-packages" className="bg-cream py-20">
        <p className="mx-auto max-w-7xl px-5 text-center text-ink/55 sm:px-8">
          We&rsquo;re curating new packages right now. Please check back soon.
        </p>
      </section>
    );
  }

  return (
    <div id="all-packages" className="bg-cream">
      <CategoryTabs tabs={tabs} />

      <div className="py-8">
        <PackageRail
          id="rail-domestic"
          title="India Packages"
          packages={domestic}
        />
        <PackageRail
          id="rail-international"
          title="International Packages"
          packages={international}
        />
      </div>
    </div>
  );
}
