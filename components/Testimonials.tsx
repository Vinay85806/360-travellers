import Image from "next/image";
import { testimonials, stats } from "@/lib/data";
import { Star, Quote } from "./icons";
import SectionHeading from "./SectionHeading";
import Reveal from "./Reveal";

export default function Testimonials() {
  return (
    <section id="testimonials" className="bg-ivory py-20 sm:py-28">
      <div className="mx-auto max-w-7xl px-5 sm:px-8">
        {/* Stats band */}
        <Reveal className="mb-16">
          <div className="grid grid-cols-2 gap-px overflow-hidden rounded-3xl border border-ink/8 bg-ink/8 text-center md:grid-cols-4">
            {stats.map((s) => (
              <div key={s.label} className="bg-cream px-4 py-8">
                <div className="font-display text-3xl text-pine sm:text-4xl">
                  {s.value}
                </div>
                <div className="mt-1 text-xs font-medium uppercase tracking-[0.15em] text-ink/50">
                  {s.label}
                </div>
              </div>
            ))}
          </div>
        </Reveal>

        <SectionHeading
          align="center"
          kicker="Traveller stories"
          title="Loved by people who travel well"
          description="We measure success in the small things travellers remember years later. Here's what a few of them had to say."
        />

        <div className="mt-12 grid gap-5 md:grid-cols-3">
          {testimonials.map((t, i) => (
            <Reveal key={t.name} delay={i * 90}>
              <figure
                className={`flex h-full flex-col rounded-3xl border p-7 transition-all duration-300 hover:-translate-y-1 ${
                  i === 1
                    ? "border-transparent bg-pine text-cream shadow-lift"
                    : "border-ink/8 bg-cream shadow-soft hover:shadow-lift"
                }`}
              >
                <Quote
                  className={`h-9 w-9 ${
                    i === 1 ? "text-gold-soft" : "text-gold-deep"
                  }`}
                />
                <div className="mt-3 flex gap-0.5">
                  {Array.from({ length: t.rating }).map((_, s) => (
                    <Star key={s} className="h-4 w-4 text-gold" />
                  ))}
                </div>
                <blockquote
                  className={`mt-4 flex-1 font-display text-lg leading-relaxed ${
                    i === 1 ? "text-cream/95" : "text-ink/80"
                  }`}
                >
                  &ldquo;{t.quote}&rdquo;
                </blockquote>
                <figcaption className="mt-6 flex items-center gap-3.5">
                  <span className="relative h-12 w-12 overflow-hidden rounded-full ring-2 ring-gold/40">
                    <Image
                      src={t.avatar}
                      alt={t.name}
                      fill
                      sizes="48px"
                      className="object-cover"
                    />
                  </span>
                  <span>
                    <span
                      className={`block font-semibold ${
                        i === 1 ? "text-cream" : "text-ink"
                      }`}
                    >
                      {t.name}
                    </span>
                    <span
                      className={`block text-xs ${
                        i === 1 ? "text-cream/60" : "text-ink/50"
                      }`}
                    >
                      {t.trip}
                    </span>
                  </span>
                </figcaption>
              </figure>
            </Reveal>
          ))}
        </div>
      </div>
    </section>
  );
}
