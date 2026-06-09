"use client";

import Link from "next/link";
import { useEffect, useState } from "react";
import { Compass, Menu, Close } from "./icons";

const links = [
  { label: "Destinations", href: "#destinations" },
  { label: "Packages", href: "#packages" },
  { label: "Experiences", href: "#packages" },
  { label: "Reviews", href: "#testimonials" },
  { label: "About", href: "#footer" },
];

export default function Navbar() {
  const [scrolled, setScrolled] = useState(false);
  const [open, setOpen] = useState(false);

  useEffect(() => {
    const onScroll = () => setScrolled(window.scrollY > 24);
    onScroll();
    window.addEventListener("scroll", onScroll, { passive: true });
    return () => window.removeEventListener("scroll", onScroll);
  }, []);

  useEffect(() => {
    document.body.style.overflow = open ? "hidden" : "";
    return () => {
      document.body.style.overflow = "";
    };
  }, [open]);

  return (
    <header
      className={`fixed inset-x-0 top-0 z-50 backdrop-blur-md transition-all duration-500 ${
        scrolled
          ? "bg-cream/95 shadow-soft py-3"
          : "bg-cream/80 py-5"
      }`}
    >
      <nav className="mx-auto flex max-w-7xl items-center justify-between px-5 sm:px-8">
        {/* Brand */}
        <Link href="#top" className="group flex items-center gap-2.5">
          <span className="grid h-10 w-10 place-items-center rounded-full border border-blue/25 text-blue">
            <Compass className="h-5 w-5 transition-transform duration-700 group-hover:rotate-[110deg]" />
          </span>
          <span className="font-display text-xl leading-none tracking-tight text-ink">
            360 <span className="text-blue">Travellers</span>
          </span>
        </Link>

        {/* Desktop links */}
        <ul className="hidden items-center gap-8 lg:flex">
          {links.map((l) => (
            <li key={l.label}>
              <Link
                href={l.href}
                className="relative text-sm font-medium tracking-wide text-ink/75 transition-colors after:absolute after:-bottom-1.5 after:left-0 after:h-px after:w-0 after:bg-blue after:transition-all hover:text-ink hover:after:w-full"
              >
                {l.label}
              </Link>
            </li>
          ))}
        </ul>

        {/* CTA + mobile toggle */}
        <div className="flex items-center gap-3">
          <Link
            href="#search"
            className="hidden rounded-full bg-blue px-5 py-2.5 text-sm font-semibold text-cream transition-all duration-300 hover:bg-blue-deep sm:inline-flex"
          >
            Plan My Trip
          </Link>
          <button
            aria-label="Open menu"
            onClick={() => setOpen(true)}
            className="grid h-10 w-10 place-items-center rounded-full border border-ink/15 text-ink lg:hidden"
          >
            <Menu />
          </button>
        </div>
      </nav>

      {/* Mobile drawer */}
      <div
        className={`fixed inset-0 z-50 lg:hidden ${
          open ? "pointer-events-auto" : "pointer-events-none"
        }`}
      >
        <div
          onClick={() => setOpen(false)}
          className={`absolute inset-0 bg-coal/50 transition-opacity duration-300 ${
            open ? "opacity-100" : "opacity-0"
          }`}
        />
        <aside
          className={`absolute right-0 top-0 h-full w-[82%] max-w-sm bg-cream px-7 py-7 shadow-lift transition-transform duration-400 ${
            open ? "translate-x-0" : "translate-x-full"
          }`}
        >
          <div className="flex items-center justify-between">
            <span className="font-display text-lg text-ink">
              360 <span className="text-gold-deep">Travellers</span>
            </span>
            <button
              aria-label="Close menu"
              onClick={() => setOpen(false)}
              className="grid h-10 w-10 place-items-center rounded-full border border-ink/15 text-ink"
            >
              <Close />
            </button>
          </div>
          <ul className="mt-10 space-y-1">
            {links.map((l) => (
              <li key={l.label}>
                <Link
                  href={l.href}
                  onClick={() => setOpen(false)}
                  className="block border-b border-ink/8 py-4 font-display text-2xl text-ink transition-colors hover:text-gold-deep"
                >
                  {l.label}
                </Link>
              </li>
            ))}
          </ul>
          <Link
            href="#search"
            onClick={() => setOpen(false)}
            className="mt-8 inline-flex w-full items-center justify-center rounded-full bg-pine px-6 py-3.5 text-sm font-semibold text-cream"
          >
            Plan My Trip
          </Link>
        </aside>
      </div>
    </header>
  );
}
