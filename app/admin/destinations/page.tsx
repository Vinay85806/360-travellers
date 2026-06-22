"use client";

import { useEffect, useState } from "react";
import { supabase } from "@/lib/supabase";
import { Trash, MapPin } from "@/components/icons";

type Destination = {
  id: string;
  name: string;
  slug: string;
  active: boolean;
  sort_order: number | null;
  package_count?: number;
};

export default function DestinationsPage() {
  const [destinations, setDestinations] = useState<Destination[]>([]);
  const [loading, setLoading] = useState(true);
  const [deleting, setDeleting] = useState<string | null>(null);
  const [toggling, setToggling] = useState<string | null>(null);

  const load = async () => {
    setLoading(true);

    const [{ data: dests }, { data: pkgs }] = await Promise.all([
      supabase.from("destinations").select("id, name, slug, active, sort_order").order("sort_order"),
      supabase.from("packages").select("destination_slug"),
    ]);

    const countMap: Record<string, number> = {};
    (pkgs ?? []).forEach((p: { destination_slug: string }) => {
      countMap[p.destination_slug] = (countMap[p.destination_slug] ?? 0) + 1;
    });

    setDestinations(
      (dests ?? []).map((d) => ({ ...d, package_count: countMap[d.slug] ?? 0 }))
    );
    setLoading(false);
  };

  useEffect(() => { load(); }, []);

  const toggleActive = async (dest: Destination) => {
    setToggling(dest.id);
    await supabase
      .from("destinations")
      .update({ active: !dest.active })
      .eq("id", dest.id);
    setDestinations((prev) =>
      prev.map((d) => d.id === dest.id ? { ...d, active: !d.active } : d)
    );
    setToggling(null);
  };

  const handleDelete = async (dest: Destination) => {
    if (
      !window.confirm(
        `Delete "${dest.name}"?\n\nThis will not delete packages assigned to this destination, but they will no longer be grouped under it.`
      )
    ) return;
    setDeleting(dest.id);
    await supabase.from("destinations").delete().eq("id", dest.id);
    setDestinations((prev) => prev.filter((d) => d.id !== dest.id));
    setDeleting(null);
  };

  const active = destinations.filter((d) => d.active);
  const inactive = destinations.filter((d) => !d.active);

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="flex items-center justify-between">
        <div>
          <h1 className="font-display text-3xl text-ink">Destinations</h1>
          <p className="mt-1 text-sm text-ink/45">
            {active.length} active · {inactive.length} hidden
          </p>
        </div>
      </div>

      {/* Stats */}
      <div className="grid gap-4 sm:grid-cols-3">
        <div className="rounded-2xl border border-ink/10 bg-white p-5">
          <p className="text-2xl font-display text-ink">{destinations.length}</p>
          <p className="mt-1 text-sm text-ink/50">Total Destinations</p>
        </div>
        <div className="rounded-2xl border border-ink/10 bg-white p-5">
          <p className="text-2xl font-display text-ink">{active.length}</p>
          <p className="mt-1 text-sm text-ink/50">Active</p>
        </div>
        <div className="rounded-2xl border border-ink/10 bg-white p-5">
          <p className="text-2xl font-display text-ink">{inactive.length}</p>
          <p className="mt-1 text-sm text-ink/50">Hidden</p>
        </div>
      </div>

      {/* Table */}
      <div className="overflow-hidden rounded-2xl border border-ink/10 bg-white">
        <div className="border-b border-ink/8 px-6 py-4">
          <h2 className="font-display text-lg text-ink">All Destinations</h2>
        </div>

        {loading ? (
          <div className="divide-y divide-ink/6">
            {Array.from({ length: 6 }).map((_, i) => (
              <div key={i} className="flex items-center gap-4 px-6 py-4">
                <div className="h-9 w-9 rounded-xl bg-ink/8 animate-pulse shrink-0" />
                <div className="flex-1 space-y-2">
                  <div className="h-4 w-1/3 rounded bg-ink/8 animate-pulse" />
                  <div className="h-3 w-1/4 rounded bg-ink/6 animate-pulse" />
                </div>
              </div>
            ))}
          </div>
        ) : destinations.length === 0 ? (
          <div className="py-20 text-center">
            <p className="text-ink/40">No destinations found.</p>
          </div>
        ) : (
          <div className="divide-y divide-ink/6">
            {destinations.map((dest) => (
              <div
                key={dest.id}
                className={`flex items-center gap-4 px-6 py-4 transition-colors hover:bg-ivory/60 ${
                  !dest.active ? "opacity-50" : ""
                }`}
              >
                {/* Icon */}
                <div className="grid h-9 w-9 shrink-0 place-items-center rounded-xl bg-blue/10 text-blue">
                  <MapPin className="h-4 w-4" />
                </div>

                {/* Info */}
                <div className="min-w-0 flex-1">
                  <p className="text-sm font-semibold text-ink">{dest.name}</p>
                  <p className="mt-0.5 text-xs text-ink/40">
                    slug: <span className="font-mono">{dest.slug}</span>
                    {dest.sort_order != null && (
                      <> · order: {dest.sort_order}</>
                    )}
                  </p>
                </div>

                {/* Package count */}
                <span className="shrink-0 rounded-full bg-tint px-2.5 py-0.5 text-xs font-semibold text-blue">
                  {dest.package_count} pkg{dest.package_count !== 1 ? "s" : ""}
                </span>

                {/* Active badge */}
                <span
                  className={`shrink-0 rounded-full px-2.5 py-0.5 text-xs font-semibold ${
                    dest.active
                      ? "bg-green-50 text-green-600"
                      : "bg-ink/6 text-ink/40"
                  }`}
                >
                  {dest.active ? "Active" : "Hidden"}
                </span>

                {/* Actions */}
                <div className="flex shrink-0 items-center gap-2">
                  <button
                    onClick={() => toggleActive(dest)}
                    disabled={toggling === dest.id}
                    title={dest.active ? "Hide destination" : "Make active"}
                    className={`rounded-lg border px-3 py-1.5 text-xs font-semibold transition-colors disabled:opacity-40 ${
                      dest.active
                        ? "border-ink/10 text-ink/50 hover:border-amber-400 hover:text-amber-600"
                        : "border-ink/10 text-ink/50 hover:border-green-400 hover:text-green-600"
                    }`}
                  >
                    {dest.active ? "Hide" : "Show"}
                  </button>
                  <button
                    onClick={() => handleDelete(dest)}
                    disabled={deleting === dest.id}
                    title="Delete destination"
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

      <p className="text-xs text-ink/35">
        Tip: to remove Egypt and other destinations from the live database, run the delete SQL in Supabase → SQL Editor.
      </p>
    </div>
  );
}
