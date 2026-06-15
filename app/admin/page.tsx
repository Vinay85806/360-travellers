"use client";

import { useEffect, useState } from "react";
import Link from "next/link";
import { supabase } from "@/lib/supabase";
import { Plus, PackageIcon, ArrowRight } from "@/components/icons";
import type { TravelPackage } from "@/lib/packages";

type Stats = {
  total: number;
  byDest: { name: string; count: number }[];
  recent: TravelPackage[];
};

export default function AdminDashboard() {
  const [stats, setStats] = useState<Stats | null>(null);

  useEffect(() => {
    async function load() {
      const { data: packages } = await supabase
        .from("packages")
        .select("id, title, slug, destination, price, created_at")
        .order("created_at", { ascending: false });

      if (!packages) return;

      const byDest = Object.entries(
        (packages as TravelPackage[]).reduce<Record<string, number>>((acc, p) => {
          const d = p.destination ?? "Uncategorised";
          acc[d] = (acc[d] ?? 0) + 1;
          return acc;
        }, {})
      )
        .map(([name, count]) => ({ name, count }))
        .sort((a, b) => b.count - a.count)
        .slice(0, 8);

      setStats({
        total: packages.length,
        byDest,
        recent: (packages as TravelPackage[]).slice(0, 5),
      });
    }
    load();
  }, []);

  const inr = (n: number) =>
    `₹${n.toLocaleString("en-IN")}`;

  return (
    <div className="space-y-8">
      {/* Header */}
      <div className="flex items-center justify-between">
        <div>
          <h1 className="font-display text-3xl text-ink">Dashboard</h1>
          <p className="mt-1 text-sm text-ink/45">Welcome back! Here's an overview of your packages.</p>
        </div>
        <Link
          href="/admin/packages/new"
          className="inline-flex items-center gap-2 rounded-xl bg-blue px-5 py-2.5 text-sm font-semibold text-white hover:bg-blue-deep transition-colors"
        >
          <Plus className="h-4 w-4" />
          Add Package
        </Link>
      </div>

      {/* Stat cards */}
      <div className="grid gap-5 sm:grid-cols-2 lg:grid-cols-3">
        <StatCard
          label="Total Packages"
          value={stats?.total ?? "—"}
          icon={<PackageIcon className="h-5 w-5" />}
          color="blue"
        />
        <StatCard
          label="Destinations"
          value={stats?.byDest.length ?? "—"}
          icon={<span className="text-lg">🗺️</span>}
          color="pine"
        />
        <StatCard
          label="Avg Price"
          value={
            stats
              ? inr(
                  Math.round(
                    stats.recent.reduce((s, p) => s + (p.price ?? 0), 0) /
                      Math.max(stats.recent.length, 1)
                  )
                )
              : "—"
          }
          icon={<span className="text-lg">💰</span>}
          color="gold"
        />
      </div>

      <div className="grid gap-6 lg:grid-cols-[1fr_280px]">
        {/* Recent packages */}
        <div className="rounded-2xl border border-ink/10 bg-white">
          <div className="flex items-center justify-between border-b border-ink/8 px-6 py-4">
            <h2 className="font-display text-lg text-ink">Recent Packages</h2>
            <Link href="/admin/packages" className="text-sm font-semibold text-blue hover:text-blue-deep">
              View all →
            </Link>
          </div>
          <div className="divide-y divide-ink/6">
            {!stats
              ? Array.from({ length: 4 }).map((_, i) => (
                  <div key={i} className="flex items-center gap-3 px-6 py-4">
                    <div className="h-4 flex-1 rounded bg-ink/8 animate-pulse" />
                  </div>
                ))
              : stats.recent.map((p) => (
                  <div key={p.id} className="flex items-center gap-3 px-6 py-4">
                    <PackageIcon className="h-4 w-4 shrink-0 text-ink/30" />
                    <span className="flex-1 truncate text-sm text-ink">{p.title}</span>
                    <span className="shrink-0 text-sm font-semibold text-blue">
                      {inr(p.price)}
                    </span>
                    <Link
                      href={`/admin/packages/${p.id}/edit`}
                      className="shrink-0 rounded-lg border border-ink/10 px-2.5 py-1 text-xs font-semibold text-ink/50 hover:border-blue hover:text-blue transition-colors"
                    >
                      Edit
                    </Link>
                  </div>
                ))}
          </div>
        </div>

        {/* By destination */}
        <div className="rounded-2xl border border-ink/10 bg-white">
          <div className="border-b border-ink/8 px-6 py-4">
            <h2 className="font-display text-lg text-ink">By Destination</h2>
          </div>
          <div className="divide-y divide-ink/6">
            {!stats
              ? Array.from({ length: 5 }).map((_, i) => (
                  <div key={i} className="flex items-center gap-3 px-6 py-4">
                    <div className="h-4 flex-1 rounded bg-ink/8 animate-pulse" />
                  </div>
                ))
              : stats.byDest.map((d) => (
                  <div key={d.name} className="flex items-center justify-between px-6 py-3">
                    <span className="text-sm text-ink/70">{d.name}</span>
                    <span className="rounded-full bg-tint px-2.5 py-0.5 text-xs font-semibold text-blue">
                      {d.count}
                    </span>
                  </div>
                ))}
          </div>
        </div>
      </div>

      {/* Quick actions */}
      <div className="rounded-2xl border border-ink/10 bg-white px-6 py-5">
        <h2 className="mb-4 font-display text-lg text-ink">Quick Actions</h2>
        <div className="flex flex-wrap gap-3">
          <Link
            href="/admin/packages/new"
            className="inline-flex items-center gap-2 rounded-xl bg-blue/10 px-4 py-2.5 text-sm font-semibold text-blue hover:bg-blue hover:text-white transition-colors"
          >
            <Plus className="h-4 w-4" />
            Add New Package
          </Link>
          <Link
            href="/admin/packages"
            className="inline-flex items-center gap-2 rounded-xl bg-ink/5 px-4 py-2.5 text-sm font-semibold text-ink hover:bg-ink/10 transition-colors"
          >
            <PackageIcon className="h-4 w-4" />
            Manage Packages
          </Link>
          <a
            href="/"
            target="_blank"
            rel="noopener noreferrer"
            className="inline-flex items-center gap-2 rounded-xl bg-ink/5 px-4 py-2.5 text-sm font-semibold text-ink hover:bg-ink/10 transition-colors"
          >
            <ArrowRight className="h-4 w-4 -rotate-45" />
            View Live Site
          </a>
        </div>
      </div>
    </div>
  );
}

function StatCard({
  label,
  value,
  icon,
  color,
}: {
  label: string;
  value: string | number;
  icon: React.ReactNode;
  color: "blue" | "pine" | "gold";
}) {
  const colors = {
    blue: "bg-blue/10 text-blue",
    pine: "bg-tint text-blue",
    gold: "bg-amber-50 text-amber-600",
  };
  return (
    <div className="rounded-2xl border border-ink/10 bg-white p-6">
      <div className={`mb-4 inline-flex h-10 w-10 items-center justify-center rounded-xl ${colors[color]}`}>
        {icon}
      </div>
      <p className="text-2xl font-display text-ink">{value}</p>
      <p className="mt-1 text-sm text-ink/50">{label}</p>
    </div>
  );
}
