import Image from "next/image";
import Link from "next/link";
import { destinations } from "@/lib/data";
import { inr } from "@/lib/format";
import { ArrowUpRight, MapPin } from "./icons";
import SectionHeading from "./SectionHeading";
import Reveal from "./Reveal";

export default function PopularDestinations() {
  return (
    <section id="destinations" className="bg-cream py-20 sm:py-28">
      <div className="mx-auto max-w-7xl px-5 sm:px-8">
        <SectionHeading
          kicker="Most loved"
          title={
            <>
              Popular destinations <br className="hidden sm:block" />
              our travellers adore
            </>
          }
          description="From the valleys of Kashmir to the beaches of Goa — explore India's most-loved destinations, each one handpicked and trip-tested."
          ctaLabel="View all destinations"
          ctaHref="/destinations"
        />

        {/* Bento grid: first card spans larger */}
        <div className="mt-12 grid grid-cols-2 gap-4 sm:gap-5 lg:grid-cols-4">
          {destinations.map((d, i) => (
            <Reveal
              key={d.name}
              delay={i * 70}
              className={
                d.featured
                  ? "col-span-2 lg:col-span-2 lg:row-span-2"
                  : "col-span-1"
              }
            >
              <Link
                href={d.slug ? `/destinations/${d.slug}` : "#packages"}
                className="group relative block h-full overflow-hidden rounded-3xl shadow-soft"
              >
                <div
                  className={`relative w-full ${
                    d.featured
                      ? "aspect-[4/3] lg:aspect-auto lg:h-full"
                      : "aspect-[4/5]"
                  }`}
                >
                  <Image
                    src={d.image}
                    alt={`${d.name}, ${d.region}`}
                    fill
                    sizes="(max-width: 1024px) 50vw, 25vw"
                    className="object-cover transition-transform duration-700 ease-out group-hover:scale-110"
                  />
                  <div className="absolute inset-0 bg-gradient-to-t from-coal/85 via-coal/15 to-transparent" />
                </div>

                {/* Badge */}
                <span className="absolute right-3.5 top-3.5 grid h-9 w-9 place-items-center rounded-full bg-cream/15 text-cream backdrop-blur-md transition-all duration-300 group-hover:bg-gold group-hover:text-coal">
                  <ArrowUpRight className="h-4 w-4" />
                </span>

                {/* Content */}
                <div className="absolute inset-x-0 bottom-0 p-5">
                  <span className="inline-flex items-center gap-1.5 text-xs font-medium text-cream/75">
                    <MapPin className="h-3.5 w-3.5" />
                    {d.region}
                  </span>
                  <h3
                    className={`mt-1 font-display tracking-tight text-cream ${
                      d.featured ? "text-3xl sm:text-4xl" : "text-2xl"
                    }`}
                  >
                    {d.name}
                  </h3>
                  <div className="mt-2 flex items-center justify-between text-sm text-cream/80">
                    <span>{d.experiences} experiences</span>
                    <span className="font-medium text-gold-soft">
                      from {inr(d.fromPrice)}
                    </span>
                  </div>
                </div>
              </Link>
            </Reveal>
          ))}
        </div>
      </div>
    </section>
  );
}
