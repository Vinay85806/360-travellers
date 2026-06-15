"use client";

import Link from "next/link";
import { ArrowRight } from "@/components/icons";
import PackageForm from "@/components/admin/PackageForm";

export default function NewPackagePage() {
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
        <h1 className="font-display text-3xl text-ink">New Package</h1>
        <p className="mt-1 text-sm text-ink/45">Fill in the details below to add a new travel package.</p>
      </div>

      <PackageForm />
    </div>
  );
}
