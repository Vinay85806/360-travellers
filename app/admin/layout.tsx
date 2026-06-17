"use client";

import { useEffect, useState } from "react";
import { usePathname, useRouter } from "next/navigation";
import Link from "next/link";
import Image from "next/image";
import { supabase } from "@/lib/supabase";
import { LayoutGrid, PackageIcon, Plus, LogOut, Eye, Mail } from "@/components/icons";
import type { User } from "@supabase/supabase-js";

const LOGO =
  "https://fqrghsvqijxnglbrjhwo.supabase.co/storage/v1/object/public/images/logos/360travellers_logo.png";

const NAV = [
  { href: "/admin", label: "Dashboard", Icon: LayoutGrid, exact: true },
  { href: "/admin/packages", label: "Packages", Icon: PackageIcon, exact: false },
  { href: "/admin/enquiries", label: "Enquiries", Icon: Mail, exact: false },
];

export default function AdminLayout({ children }: { children: React.ReactNode }) {
  const pathname = usePathname();
  const router = useRouter();
  const [user, setUser] = useState<User | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    // Check current session on mount
    supabase.auth.getSession().then(({ data: { session } }) => {
      if (!session && pathname !== "/admin/login") {
        router.replace("/admin/login");
      } else {
        setUser(session?.user ?? null);
        setLoading(false);
      }
    });

    // Listen for auth changes
    const { data: { subscription } } = supabase.auth.onAuthStateChange(
      (_event, session) => {
        if (!session && pathname !== "/admin/login") {
          router.replace("/admin/login");
        }
        setUser(session?.user ?? null);
      }
    );
    return () => subscription.unsubscribe();
  }, [pathname]);

  const handleLogout = async () => {
    await supabase.auth.signOut();
    router.push("/admin/login");
  };

  // Login page — render without sidebar
  if (pathname === "/admin/login") {
    return <>{children}</>;
  }

  // Splash while checking auth
  if (loading) {
    return (
      <div className="flex min-h-screen items-center justify-center bg-ivory">
        <div className="h-8 w-8 animate-spin rounded-full border-4 border-blue border-t-transparent" />
      </div>
    );
  }

  return (
    <div className="flex min-h-screen bg-ivory">
      {/* ── Sidebar ── */}
      <aside className="fixed inset-y-0 left-0 flex w-60 flex-col bg-navy text-cream shadow-lift z-40">
        {/* Logo */}
        <div className="border-b border-white/10 px-5 py-5">
          <Image
            src={LOGO}
            alt="360 Travellers"
            width={140}
            height={37}
            className="h-8 w-auto brightness-0 invert"
          />
          <p className="mt-1.5 text-[0.65rem] font-semibold uppercase tracking-widest text-white/40">
            Admin Panel
          </p>
        </div>

        {/* Nav */}
        <nav className="flex-1 space-y-1 px-3 py-4">
          {NAV.map(({ href, label, Icon, exact }) => {
            const active = exact
              ? pathname === href
              : pathname.startsWith(href) && pathname !== "/admin";
            return (
              <Link
                key={href}
                href={href}
                className={`flex items-center gap-3 rounded-xl px-3 py-2.5 text-sm font-medium transition-colors ${
                  active
                    ? "bg-white/15 text-white"
                    : "text-white/60 hover:bg-white/8 hover:text-white"
                }`}
              >
                <Icon className="h-4 w-4 shrink-0" />
                {label}
              </Link>
            );
          })}

          <div className="pt-2 border-t border-white/10 mt-2">
            <Link
              href="/admin/packages/new"
              className="flex items-center gap-3 rounded-xl bg-blue/80 px-3 py-2.5 text-sm font-semibold text-white hover:bg-blue transition-colors"
            >
              <Plus className="h-4 w-4 shrink-0" />
              Add Package
            </Link>
          </div>
        </nav>

        {/* Bottom: view site + logout */}
        <div className="border-t border-white/10 px-3 py-4 space-y-1">
          <a
            href="/"
            target="_blank"
            rel="noopener noreferrer"
            className="flex items-center gap-3 rounded-xl px-3 py-2.5 text-sm text-white/50 hover:bg-white/8 hover:text-white transition-colors"
          >
            <Eye className="h-4 w-4 shrink-0" />
            View Live Site
          </a>
          <div className="px-3 py-2">
            <p className="truncate text-xs text-white/35">{user?.email}</p>
          </div>
          <button
            onClick={handleLogout}
            className="flex w-full items-center gap-3 rounded-xl px-3 py-2.5 text-sm text-white/50 hover:bg-red-500/20 hover:text-red-300 transition-colors"
          >
            <LogOut className="h-4 w-4 shrink-0" />
            Sign Out
          </button>
        </div>
      </aside>

      {/* ── Main content ── */}
      <main className="ml-60 flex-1 p-8 min-w-0">
        {children}
      </main>
    </div>
  );
}
