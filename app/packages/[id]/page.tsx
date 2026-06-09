import Image from "next/image";
import Link from "next/link";
import { notFound } from "next/navigation";
import type { Metadata } from "next";
import Navbar from "@/components/Navbar";
import Footer from "@/components/Footer";
import Reveal from "@/components/Reveal";
import { Clock, MapPin, ArrowRight } from "@/components/icons";
import { inr } from "@/lib/format";
import { getPackageById, packageImage } from "@/lib/packages";

type Props = {
  params: Promise<{ id: string }>;
};

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { id } = await params;
  const pkg = await getPackageById(id);

  if (!pkg) {
    return { title: "Package not found — 360 Travellers" };
  }

  return {
    title: `${pkg.title} — 360 Travellers`,
    description: pkg.description,
    openGraph: {
      title: `${pkg.title} — 360 Travellers`,
      description: pkg.description,
      images: pkg.image_url ? [pkg.image_url] : undefined,
    },
  };
}

export default async function PackageDetailPage({ params }: Props) {
  const { id } = await params;
  const pkg = await getPackageById(id);

  if (!pkg) {
    notFound();
  }

  const itinerary = Array.isArray(pkg.itinerary) ? pkg.itinerary : [];

  return (
    <main className="overflow-x-hidden">
      <Navbar />

      {/* Hero */}
      <section className="relative h-[60vh] min-h-[420px] w-full overflow-hidden">
        <Image
          src={packageImage(pkg)}
          alt={pkg.title}
          fill
          priority
          sizes="100vw"
          className="object-cover"
        />
        <div className="absolute inset-0 bg-gradient-to-t from-coal/80 via-coal/30 to-coal/20" />

        <div className="absolute inset-x-0 bottom-0">
          <div className="mx-auto max-w-5xl px-5 pb-12 sm:px-8 sm:pb-16">
            <span className="inline-flex items-center gap-1.5 rounded-full bg-gold px-3 py-1 text-[0.7rem] font-bold uppercase tracking-wider text-coal">
              {pkg.category === "domestic" ? "Domestic" : "International"}
            </span>
            <h1 className="mt-4 font-display text-4xl leading-tight text-cream sm:text-5xl">
              {pkg.title}
            </h1>
            <div className="mt-4 flex flex-wrap items-center gap-x-5 gap-y-2 text-sm text-cream/85">
              <span className="inline-flex items-center gap-1.5">
                <Clock className="h-4 w-4 text-gold-soft" />
                {pkg.duration}
              </span>
              <span className="inline-flex items-center gap-1.5">
                <MapPin className="h-4 w-4 text-gold-soft" />
                {pkg.category === "domestic" ? "India" : "Worldwide"}
              </span>
            </div>
          </div>
        </div>
      </section>

      {/* Body */}
      <section className="bg-cream py-16 sm:py-20">
        <div className="mx-auto grid max-w-5xl gap-12 px-5 sm:px-8 lg:grid-cols-[1fr_320px]">
          {/* Itinerary */}
          <div>
            <Reveal>
              <span className="kicker text-gold-deep">
                <span className="h-px w-8 bg-gold-deep" />
                The journey
              </span>
              <h2 className="mt-4 font-display text-3xl leading-tight text-ink">
                About this trip
              </h2>
              <p className="mt-4 text-base leading-relaxed text-ink/65">
                {pkg.description}
              </p>
            </Reveal>

            {itinerary.length > 0 && (
              <div className="mt-12">
                <h3 className="font-display text-2xl text-ink">
                  Day-by-day itinerary
                </h3>
                <ol className="mt-6 space-y-6 border-l border-pine/15 pl-8">
                  {itinerary.map((day, i) => (
                    <Reveal key={day.day ?? i} delay={i * 60} as="li">
                      <div className="relative">
                        <span className="absolute -left-[2.6rem] grid h-9 w-9 place-items-center rounded-full bg-pine text-sm font-bold text-cream">
                          {day.day ?? i + 1}
                        </span>
                        <h4 className="font-display text-lg text-ink">
                          {day.title}
                        </h4>
                        <p className="mt-1.5 text-sm leading-relaxed text-ink/65">
                          {day.description}
                        </p>
                      </div>
                    </Reveal>
                  ))}
                </ol>
              </div>
            )}
          </div>

          {/* Booking card */}
          <aside className="lg:sticky lg:top-28 lg:self-start">
            <div className="rounded-3xl bg-pine-deep p-7 shadow-lift">
              <span className="text-sm text-cream/70">From</span>
              <div className="mt-1 flex items-baseline gap-1.5">
                <span className="font-display text-4xl text-cream">
                  {inr(pkg.price)}
                </span>
                <span className="text-sm text-cream/60">/ person</span>
              </div>
              <p className="mt-3 text-sm leading-relaxed text-cream/70">
                Includes stays, transfers and curated experiences. Tweak any
                detail — our concierge handles the rest.
              </p>
              <Link
                href="#search"
                className="mt-6 inline-flex w-full items-center justify-center gap-2 rounded-full bg-gold px-6 py-3.5 text-sm font-semibold text-coal transition-colors hover:bg-gold-soft"
              >
                Plan this trip
                <ArrowRight className="h-4 w-4" />
              </Link>
            </div>

            <Link
              href="/#all-packages"
              className="group mt-6 inline-flex items-center gap-2 text-sm font-semibold text-pine transition-colors hover:text-gold-deep"
            >
              <ArrowRight className="h-4 w-4 rotate-180 transition-transform group-hover:-translate-x-1" />
              Back to all packages
            </Link>
          </aside>
        </div>
      </section>

      <Footer />
    </main>
  );
}
