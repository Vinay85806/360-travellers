"use client";

import { useEffect, useState } from "react";
import { supabase } from "@/lib/supabase";
import { Search } from "@/components/icons";

type Enquiry = {
  id: string;
  name: string;
  email: string;
  phone: string;
  travel_date: string | null;
  travellers: number | null;
  message: string | null;
  package_title: string | null;
  package_slug: string | null;
  status: string;
  created_at: string;
};

const STATUSES = ["new", "contacted", "closed"] as const;

export default function EnquiriesPage() {
  const [enquiries, setEnquiries] = useState<Enquiry[]>([]);
  const [loading, setLoading] = useState(true);
  const [query, setQuery] = useState("");

  const load = async () => {
    setLoading(true);
    const { data } = await supabase
      .from("enquiries")
      .select("*")
      .order("created_at", { ascending: false });
    setEnquiries((data as Enquiry[]) ?? []);
    setLoading(false);
  };

  useEffect(() => {
    load();
  }, []);

  const setStatus = async (id: string, status: string) => {
    setEnquiries((prev) =>
      prev.map((e) => (e.id === id ? { ...e, status } : e))
    );
    await supabase.from("enquiries").update({ status }).eq("id", id);
  };

  const filtered = enquiries.filter((e) => {
    const q = query.toLowerCase();
    return (
      e.name.toLowerCase().includes(q) ||
      e.email.toLowerCase().includes(q) ||
      e.phone.includes(q) ||
      (e.package_title ?? "").toLowerCase().includes(q)
    );
  });

  const fmtDate = (iso: string) =>
    new Date(iso).toLocaleString("en-IN", {
      day: "numeric",
      month: "short",
      hour: "2-digit",
      minute: "2-digit",
    });

  const statusColor = (s: string) =>
    s === "new"
      ? "bg-blue/10 text-blue"
      : s === "contacted"
      ? "bg-amber-100 text-amber-700"
      : "bg-ink/8 text-ink/50";

  return (
    <div className="space-y-6">
      <div>
        <h1 className="font-display text-3xl text-ink">Enquiries</h1>
        <p className="mt-1 text-sm text-ink/45">
          {enquiries.length} enquir{enquiries.length !== 1 ? "ies" : "y"} total
          {" · "}
          {enquiries.filter((e) => e.status === "new").length} new
        </p>
      </div>

      <div className="relative">
        <Search className="absolute left-3.5 top-1/2 h-4 w-4 -translate-y-1/2 text-ink/35" />
        <input
          type="search"
          value={query}
          onChange={(e) => setQuery(e.target.value)}
          placeholder="Search by name, email, phone, package…"
          className="w-full rounded-xl border border-ink/15 bg-white py-3 pl-10 pr-4 text-sm text-ink placeholder:text-ink/35 focus:border-blue focus:outline-none transition-colors sm:max-w-sm"
        />
      </div>

      <div className="overflow-hidden rounded-2xl border border-ink/10 bg-white">
        {loading ? (
          <div className="divide-y divide-ink/6">
            {Array.from({ length: 5 }).map((_, i) => (
              <div key={i} className="px-6 py-4">
                <div className="h-4 w-1/3 rounded bg-ink/8 animate-pulse" />
                <div className="mt-2 h-3 w-1/2 rounded bg-ink/6 animate-pulse" />
              </div>
            ))}
          </div>
        ) : filtered.length === 0 ? (
          <div className="py-20 text-center text-ink/40">
            {query ? "No enquiries match your search." : "No enquiries yet."}
          </div>
        ) : (
          <div className="divide-y divide-ink/6">
            {filtered.map((e) => (
              <div key={e.id} className="px-6 py-4 hover:bg-ivory/60 transition-colors">
                <div className="flex flex-wrap items-start justify-between gap-3">
                  <div className="min-w-0">
                    <div className="flex items-center gap-2">
                      <p className="font-semibold text-ink">{e.name}</p>
                      <span
                        className={`rounded-full px-2 py-0.5 text-[0.65rem] font-semibold uppercase tracking-wide ${statusColor(
                          e.status
                        )}`}
                      >
                        {e.status}
                      </span>
                    </div>
                    <div className="mt-1 flex flex-wrap gap-x-4 gap-y-0.5 text-sm text-ink/60">
                      <a href={`mailto:${e.email}`} className="hover:text-blue">
                        {e.email}
                      </a>
                      <a href={`tel:${e.phone}`} className="hover:text-blue">
                        {e.phone}
                      </a>
                    </div>
                    <div className="mt-1 flex flex-wrap gap-x-4 gap-y-0.5 text-xs text-ink/45">
                      {e.package_title && (
                        <span className="font-medium text-ink/60">
                          {e.package_title}
                        </span>
                      )}
                      {e.travel_date && <span>📅 {e.travel_date}</span>}
                      {e.travellers != null && <span>👥 {e.travellers}</span>}
                      <span>{fmtDate(e.created_at)}</span>
                    </div>
                    {e.message && (
                      <p className="mt-2 rounded-lg bg-ivory px-3 py-2 text-sm text-ink/70">
                        {e.message}
                      </p>
                    )}
                  </div>

                  <div className="flex shrink-0 gap-1">
                    {STATUSES.map((s) => (
                      <button
                        key={s}
                        onClick={() => setStatus(e.id, s)}
                        className={`rounded-lg px-2.5 py-1 text-xs font-medium capitalize transition-colors ${
                          e.status === s
                            ? statusColor(s)
                            : "text-ink/40 hover:bg-ink/5"
                        }`}
                      >
                        {s}
                      </button>
                    ))}
                  </div>
                </div>
              </div>
            ))}
          </div>
        )}
      </div>
    </div>
  );
}
