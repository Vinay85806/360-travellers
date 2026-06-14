import Link from "next/link";
import Image from "next/image";
import {
  Mail,
  Phone,
  ArrowRight,
  Instagram,
  Facebook,
  Twitter,
} from "./icons";
import Reveal from "./Reveal";

const LOGO =
  "https://fqrghsvqijxnglbrjhwo.supabase.co/storage/v1/object/public/images/logos/360travellers_logo.png";

const columns = [
  {
    title: "Destinations",
    links: ["Bali", "Maldives", "Kashmir", "Santorini", "Swiss Alps", "Kyoto"],
  },
  {
    title: "Company",
    links: ["About us", "How we plan", "Careers", "Press", "Blog", "Contact"],
  },
  {
    title: "Support",
    links: [
      "Help centre",
      "Booking policy",
      "Travel insurance",
      "Visa guidance",
      "FAQs",
    ],
  },
];

export default function Footer() {
  return (
    <footer id="footer" className="bg-coal text-cream">
      {/* CTA + newsletter band */}
      <div className="mx-auto max-w-7xl px-5 sm:px-8">
        <Reveal>
          <div className="-mt-px grid gap-10 rounded-b-[2.5rem] border-x border-b border-white/8 bg-gradient-to-br from-pine to-pine-deep px-7 py-12 sm:px-12 lg:grid-cols-2 lg:items-center">
            <div>
              <h2 className="font-display text-3xl leading-tight tracking-tight sm:text-4xl">
                Your next journey
                <br />
                <span className="italic text-gold-soft">begins with hello.</span>
              </h2>
              <p className="mt-4 max-w-md text-cream/70">
                Join the list for handpicked itineraries, members-only fares and
                quiet-season escapes — no noise, just good travel.
              </p>
            </div>
            <div className="lg:justify-self-end lg:text-right">
              <div className="flex max-w-md flex-col gap-2.5 sm:flex-row">
                <div className="flex flex-1 items-center gap-2.5 rounded-full bg-cream px-5 py-3.5">
                  <Mail className="h-4 w-4 text-pine" />
                  <input
                    type="email"
                    placeholder="Your email address"
                    className="w-full bg-transparent text-sm text-ink placeholder:text-ink/40 focus:outline-none"
                  />
                </div>
                <button className="group inline-flex items-center justify-center gap-2 rounded-full bg-gold px-6 py-3.5 text-sm font-semibold text-coal transition-colors hover:bg-gold-soft">
                  Subscribe
                  <ArrowRight className="h-4 w-4 transition-transform group-hover:translate-x-1" />
                </button>
              </div>
              <p className="mt-3 text-xs text-cream/45">
                By subscribing you agree to our privacy policy.
              </p>
            </div>
          </div>
        </Reveal>
      </div>

      {/* Main footer */}
      <div className="mx-auto max-w-7xl px-5 py-16 sm:px-8">
        <div className="grid gap-10 lg:grid-cols-[1.4fr_1fr_1fr_1fr]">
          {/* Brand */}
          <div>
            <Link href="#top" className="flex items-center" aria-label="360 Travellers — home">
              <Image
                src={LOGO}
                alt="360 Travellers"
                width={170}
                height={45}
                className="h-10 w-auto"
              />
            </Link>
            <p className="mt-5 max-w-xs text-sm leading-relaxed text-cream/55">
              A boutique travel studio crafting personalised luxury journeys
              across 60+ destinations worldwide.
            </p>

            <div className="mt-6 space-y-2.5 text-sm text-cream/70">
              <a
                href="tel:+919876543210"
                className="flex items-center gap-2.5 transition-colors hover:text-gold-soft"
              >
                <Phone className="h-4 w-4 text-gold-soft" />
                +91 98765 43210
              </a>
              <a
                href="mailto:hello@360travellers.com"
                className="flex items-center gap-2.5 transition-colors hover:text-gold-soft"
              >
                <Mail className="h-4 w-4 text-gold-soft" />
                hello@360travellers.com
              </a>
            </div>

            <div className="mt-6 flex gap-3">
              {[
                { Icon: Instagram, label: "Instagram" },
                { Icon: Facebook, label: "Facebook" },
                { Icon: Twitter, label: "Twitter" },
              ].map(({ Icon, label }) => (
                <a
                  key={label}
                  href="#"
                  aria-label={label}
                  className="grid h-10 w-10 place-items-center rounded-full border border-white/12 text-cream/70 transition-all hover:border-gold/50 hover:text-gold-soft"
                >
                  <Icon className="h-[18px] w-[18px]" />
                </a>
              ))}
            </div>
          </div>

          {/* Link columns */}
          {columns.map((col) => (
            <div key={col.title}>
              <h3 className="text-xs font-semibold uppercase tracking-[0.2em] text-cream/45">
                {col.title}
              </h3>
              <ul className="mt-5 space-y-3">
                {col.links.map((l) => (
                  <li key={l}>
                    <Link
                      href="#"
                      className="text-sm text-cream/70 transition-colors hover:text-gold-soft"
                    >
                      {l}
                    </Link>
                  </li>
                ))}
              </ul>
            </div>
          ))}
        </div>

        {/* Bottom bar */}
        <div className="mt-14 flex flex-col items-center justify-between gap-4 border-t border-white/8 pt-7 text-sm text-cream/45 sm:flex-row">
          <p>© {new Date().getFullYear()} 360 Travellers. All rights reserved.</p>
          <div className="flex flex-wrap items-center gap-x-6 gap-y-2">
            <Link href="#" className="transition-colors hover:text-gold-soft">
              Privacy
            </Link>
            <Link href="#" className="transition-colors hover:text-gold-soft">
              Terms
            </Link>
            <Link href="#" className="transition-colors hover:text-gold-soft">
              Cookies
            </Link>
            <span className="text-cream/30">Made for explorers ✦</span>
          </div>
        </div>
      </div>
    </footer>
  );
}
