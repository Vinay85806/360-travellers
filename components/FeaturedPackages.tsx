import Image from "next/image";
import Link from "next/link";
import { packages } from "@/lib/data";
import { inr } from "@/lib/format";
import { Star, Clock, MapPin, ArrowRight } from "./icons";
import SectionHeading from "./SectionHeading";
import Reveal from "./Reveal";

export default function FeaturedPackages() {
  return (
    <section
      id="packages"
      className="grain relative overflow-hidden bg-pine-deep py-20 sm:py-28"
    >
      {/* Ambient glow */}
      <div className="pointer-events-none absolute -left-40 top-10 h-96 w-96 rounded-full bg-gold/10 blur-3xl" />
      <div className="pointer-events-none absolute -right-40 bottom-0 h-96 w-96 rounded-full bg-pine-soft/30 blur-3xl" />

      <div className="relative z-10 mx-auto max-w-7xl px-5 sm:px-8">
        <SectionHeading
          dark
          kicker="Signature collection"
          title={
            <>
              Featured packages, <br className="hidden sm:block" />
              ready when you are
            </>
          }
          description="Fixed-price journeys with everything sorted — stays, transfers, experiences and a concierge on call. Tweak any detail; we'll handle the rest."
          ctaLabel="Browse all packages"
          ctaHref="#"
        />

        {/* Rail on mobile, grid on desktop */}
        <div className="no-scrollbar mt-12 flex snap-x snap-mandatory gap-5 overflow-x-auto pb-2 lg:grid lg:grid-cols-4 lg:overflow-visible">
          {packages.map((p, i) => (
            <Reveal
              key={p.title}
              delay={i * 80}
              className="w-[80%] shrink-0 snap-start sm:w-[44%] lg:w-auto"
            >
              <article className="group flex h-full flex-col overflow-hidden rounded-3xl bg-cream shadow-lift">
                {/* Image */}
                <div className="relative aspect-[5/4] overflow-hidden">
                  <Image
                    src={p.image}
                    alt={p.title}
                    fill
                    sizes="(max-width: 1024px) 80vw, 25vw"
                    className="object-cover transition-transform duration-700 ease-out group-hover:scale-110"
                  />
                  <div className="absolute inset-0 bg-gradient-to-t from-coal/40 to-transparent" />
                  {p.tag && (
                    <span className="absolute left-3.5 top-3.5 rounded-full bg-gold px-3 py-1 text-[0.7rem] font-bold uppercase tracking-wider text-coal">
                      {p.tag}
                    </span>
                  )}
                  <span className="absolute right-3.5 top-3.5 inline-flex items-center gap-1 rounded-full bg-coal/55 px-2.5 py-1 text-xs font-semibold text-cream backdrop-blur-sm">
                    <Clock className="h-3.5 w-3.5" />
                    {p.nights}N / {p.days}D
                  </span>
                </div>

                {/* Body */}
                <div className="flex flex-1 flex-col p-5">
                  <span className="inline-flex items-center gap-1.5 text-xs font-medium text-ink/55">
                    <MapPin className="h-3.5 w-3.5 text-gold-deep" />
                    {p.location}
                  </span>
                  <h3 className="mt-1.5 font-display text-xl leading-snug text-ink">
                    {p.title}
                  </h3>

                  {/* Rating */}
                  <div className="mt-2 flex items-center gap-1.5 text-sm">
                    <Star className="h-4 w-4 text-gold" />
                    <span className="font-semibold text-ink">{p.rating}</span>
                    <span className="text-ink/45">({p.reviews})</span>
                  </div>

                  {/* Highlights */}
                  <ul className="mt-3 flex flex-wrap gap-1.5">
                    {p.highlights.map((h) => (
                      <li
                        key={h}
                        className="rounded-full bg-pine/8 px-2.5 py-1 text-[0.7rem] font-medium text-pine"
                      >
                        {h}
                      </li>
                    ))}
                  </ul>

                  {/* Price + CTA */}
                  <div className="mt-auto flex items-end justify-between pt-5">
                    <div>
                      {p.oldPrice && (
                        <span className="block text-xs text-ink/40 line-through">
                          {inr(p.oldPrice)}
                        </span>
                      )}
                      <span className="font-display text-2xl text-ink">
                        {inr(p.price)}
                      </span>
                      <span className="ml-1 text-xs text-ink/50">/ person</span>
                    </div>
                    <Link
                      href="#"
                      aria-label={`View ${p.title}`}
                      className="grid h-11 w-11 place-items-center rounded-full bg-pine text-cream transition-all duration-300 group-hover:bg-gold group-hover:text-coal"
                    >
                      <ArrowRight className="h-4 w-4" />
                    </Link>
                  </div>
                </div>
              </article>
            </Reveal>
          ))}
        </div>
      </div>
    </section>
  );
}
