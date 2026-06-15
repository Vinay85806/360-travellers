"use client";

import { useEffect, useState } from "react";
import Link from "next/link";
import { supabase } from "@/lib/supabase";
import { Plus, Pencil, Trash, Eye, Search } from "@/components/icons";
import type { TravelPackage } from "@/lib/packages";

export default function PackagesPage() {
  const [packages, setPackages] = useState<TravelPackage[]>([]);
  const [loading, setLoading] = useState(true);
  const [query, setQuery] = useState("");
  const [deleting, setDeleting] = useState<string | null>(null);

  const load = async () => {
    setLoading(true);
    const { data } = await supabase
      .from("packages")
      .select("id, title, slug, destination, destination_slug, price, duration, nights, days, created_at, image_url")
      .order("created_at", { ascending: false });
    setPackages((data as TravelPackage[]) ?? []);
    setLoading(false);
  };

  useEffect(() => { load(); }, []);

  const filtered = packages.filter(
    (p) =>
      p.title.toLowerCase().includes(query.toLowerCase()) ||
      (p.destination ?? "").toLowerCase().includes(query.toLowerCase())
  );

  const handleDelete = async (pkg: TravelPackage) => {
    if (
      !window.confirm(
        `Delete "${pkg.title}"?\n\nThis cannot be undone.`
      )
    ) return;

    setDeleting(pkg.id);
    await supabase.from("packages").delete().eq("id", pkg.id);
    setPackages((prev) => prev.filter((p) => p.id !== pkg.id));
    setDeleting(null);
  };

  const inr = (n: number) => `₹${n.toLocaleString("en-IN")}`;

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="flex flex-wrap items-center justify-between gap-4">
        <div>
          <h1 className="font-display text-3xl text-ink">Packages</h1>
          <p className="mt-1 text-sm text-ink/45">
            {packages.length} package{packages.length !== 1 ? "s" : ""} total
          </p>
        </div>
        <Link
          href="/admin/packages/new"
          className="inline-flex items-center gap-2 rounded-xl bg-blue px-5 py-2.5 text-sm font-semibold text-white hover:bg-blue-deep transition-colors"
        >
          <Plus className="h-4 w-4" />
          Add Package
        </Link>
      </div>

      {/* Search */}
      <div className="relative">
        <Search className="absolute left-3.5 top-1/2 h-4 w-4 -translate-y-1/2 text-ink/35" />
        <input
          type="search"
          value={query}
          onChange={(e) => setQuery(e.target.value)}
          placeholder="Search by title or destination…"
          className="w-full rounded-xl border border-ink/15 bg-white py-3 pl-10 pr-4 text-sm text-ink placeholder:text-ink/35 focus:border-blue focus:outline-none transition-colors sm:max-w-sm"
        />
      </div>

      {/* Table */}
      <div className="overflow-hidden rounded-2xl border border-ink/10 bg-white">
        {loading ? (
          <div className="divide-y divide-ink/6">
            {Array.from({ length: 6 }).map((_, i) => (
              <div key={i} className="flex items-center gap-4 px-6 py-4">
                <div className="h-12 w-12 rounded-xl bg-ink/8 animate-pulse shrink-0" />
                <div className="flex-1 space-y-2">
                  <div className="h-4 w-2/3 rounded bg-ink/8 animate-pulse" />
                  <div className="h-3 w-1/3 rounded bg-ink/6 animate-pulse" />
                </div>
              </div>
            ))}
          </div>
        ) : filtered.length === 0 ? (
          <div className="py-20 text-center">
            <p className="text-ink/40">
              {query ? "No packages match your search." : "No packages yet."}
            </p>
            {!query && (
              <Link
                href="/admin/packages/new"
                className="mt-3 inline-flex items-center gap-2 text-sm font-semibold text-blue hover:text-blue-deep"
              >
                <Plus className="h-4 w-4" />
                Create your first package
              </Link>
            )}
          </div>
        ) : (
          <div className="divide-y divide-ink/6">
            {filtered.map((pkg) => (
              <div
                key={pkg.id}
                className="flex items-center gap-4 px-6 py-4 hover:bg-ivory/60 transition-colors"
              >
                {/* Thumb */}
                <div className="relative h-12 w-16 shrink-0 overflow-hidden rounded-xl bg-ink/8">
                  {pkg.image_url && (
                    <img
                      src={pkg.image_url}
                      alt=""
                      className="h-full w-full object-cover"
                    />
                  )}
                </div>

                {/* Info */}
                <div className="min-w-0 flex-1">
                  <p className="truncate text-sm font-semibold text-ink">
                    {pkg.title}
                  </p>
                  <div className="mt-0.5 flex flex-wrap items-center gap-x-3 gap-y-0.5 text-xs text-ink/45">
                    {pkg.destination && <span>{pkg.destination}</span>}
                    {pkg.duration && <span>· {pkg.duration}</span>}
                    <span className="font-semibold text-blue">{inr(pkg.price)}</span>
                  </div>
                </div>

                {/* Actions */}
                <div className="flex shrink-0 items-center gap-2">
                  {pkg.slug && (
                    <a
                      href={`/packages/${pkg.slug}`}
                      target="_blank"
                      rel="noopener noreferrer"
                      title="Preview on live site"
                      className="grid h-9 w-9 place-items-center rounded-xl border border-ink/10 text-ink/40 hover:border-blue hover:text-blue transition-colors"
                    >
                      <Eye className="h-4 w-4" />
                    </a>
                  )}
                  <Link
                    href={`/admin/packages/${pkg.id}/edit`}
                    title="Edit"
                    className="grid h-9 w-9 place-items-center rounded-xl border border-ink/10 text-ink/40 hover:border-blue hover:text-blue transition-colors"
                  >
                    <Pencil className="h-4 w-4" />
                  </Link>
                  <button
                    onClick={() => handleDelete(pkg)}
                    disabled={deleting === pkg.id}
                    title="Delete"
                    className="grid h-9 w-9 place-items-center rounded-xl border border-ink/10 text-ink/40 hover:border-red-400 hover:text-red-500 transition-colors disabled:opacity-40"
                  >
                    <Trash className="h-4 w-4" />
                  </button>
                </div>
              </div>
            ))}
          </div>
        )}
      </div>
    </div>
  );
}
