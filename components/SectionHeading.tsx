import Link from "next/link";
import { ArrowRight } from "./icons";
import Reveal from "./Reveal";

type Props = {
  kicker: string;
  title: React.ReactNode;
  description?: string;
  ctaLabel?: string;
  ctaHref?: string;
  align?: "left" | "center";
  dark?: boolean;
};

export default function SectionHeading({
  kicker,
  title,
  description,
  ctaLabel,
  ctaHref = "#",
  align = "left",
  dark = false,
}: Props) {
  const centered = align === "center";
  return (
    <div
      className={`flex flex-col gap-6 ${
        centered
          ? "items-center text-center"
          : "md:flex-row md:items-end md:justify-between"
      }`}
    >
      <Reveal className={centered ? "max-w-2xl" : "max-w-xl"}>
        <span
          className={`kicker ${dark ? "text-gold-soft" : "text-gold-deep"}`}
        >
          <span
            className={`h-px w-8 ${dark ? "bg-gold-soft" : "bg-gold-deep"}`}
          />
          {kicker}
        </span>
        <h2
          className={`mt-4 font-display text-2xl leading-tight tracking-tight sm:text-3xl lg:text-[2.6rem] ${
            dark ? "text-cream" : "text-ink"
          }`}
        >
          {title}
        </h2>
        {description && (
          <p
            className={`mt-4 text-base leading-relaxed ${
              dark ? "text-cream/70" : "text-ink/65"
            }`}
          >
            {description}
          </p>
        )}
      </Reveal>

      {ctaLabel && (
        <Reveal delay={120}>
          <Link
            href={ctaHref}
            className={`group inline-flex items-center gap-2 whitespace-nowrap text-sm font-semibold transition-colors ${
              dark
                ? "text-cream hover:text-gold-soft"
                : "text-pine hover:text-gold-deep"
            }`}
          >
            {ctaLabel}
            <ArrowRight className="h-4 w-4 transition-transform group-hover:translate-x-1" />
          </Link>
        </Reveal>
      )}
    </div>
  );
}
