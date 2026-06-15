"use client";

import { useEffect, useState } from "react";
import { useParams } from "next/navigation";
import Link from "next/link";
import { supabase } from "@/lib/supabase";
import { ArrowRight } from "@/components/icons";
import PackageForm from "@/components/admin/PackageForm";
import type { TravelPackage } from "@/lib/packages";

export default function EditPackagePage() {
  const params = useParams();
  const id = params.id as string;
  const [pkg, setPkg] = useState<TravelPackage | null>(null);
  const [loading, setLoading] = useState(true);
  const [notFound, setNotFound] = useState(false);

  useEffect(() => {
    supabase
      .from("packages")
      .select("*")
      .eq("id", id)
      .maybeSingle()
      .then(({ data }) => {
        if (!data) setNotFound(true);
        else setPkg(data as TravelPackage);
        setLoading(false);
      });
  }, [id]);

  if (loading) {
    return (
      <div className="flex items-center justify-center py-32">
        <div className="h-8 w-8 animate-spin rounded-full border-4 border-blue border-t-transparent" />
      </div>
    );
  }

  if (notFound) {
    return (
      <div className="py-32 text-center">
        <p className="text-ink/40">Package not found.</p>
        <Link href="/admin/packages" className="mt-3 inline-flex items-center gap-1.5 text-sm font-semibold text-blue">
          <ArrowRight className="h-3.5 w-3.5 rotate-180" />
          Back to packages
        </Link>
      </div>
    );
  }

  return (
    <div className="space-y-6">
      <div>
        <Link
          href="/admin/packages"
          className="inline-flex items-center gap-1.5 text-sm text-ink/45 hover:text-ink transition-colors mb-3"
        >
          <ArrowRight className="h-3.5 w-3.5 rotate-180" />
          Back to packages
        </Link>
        <h1 className="font-display text-3xl text-ink">Edit Package</h1>
        <p className="mt-1 truncate text-sm text-ink/45">{pkg!.title}</p>
      </div>

      <PackageForm initial={pkg!} />
    </div>
  );
}
