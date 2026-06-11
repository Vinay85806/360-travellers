"use client";

import { useState } from "react";
import Image from "next/image";
import { Images, Close } from "./icons";

export default function PackageGallery({
  images,
  alt,
}: {
  images: string[];
  alt: string;
}) {
  const [lightbox, setLightbox] = useState<number | null>(null);

  if (images.length === 0) return null;

  const main = images[0];
  const thumbs = images.slice(1, 5);
  const single = images.length === 1;

  // Single image → one clean, full-width banner (no collapsing grid).
  if (single) {
    return (
      <>
        <button
          onClick={() => setLightbox(0)}
          className="group relative block aspect-[16/9] w-full overflow-hidden rounded-2xl sm:aspect-[21/8]"
        >
          <Image
            src={main}
            alt={alt}
            fill
            priority
            sizes="100vw"
            className="object-cover transition-transform duration-700 group-hover:scale-105"
          />
        </button>
        {lightbox !== null && (
          <Lightbox images={images} alt={alt} index={lightbox} onClose={() => setLightbox(null)} />
        )}
      </>
    );
  }

  return (
    <>
      <div className="grid h-[280px] gap-2 sm:h-[420px] sm:grid-cols-[1.6fr_1fr] sm:grid-rows-2">
        {/* Main image */}
        <button
          onClick={() => setLightbox(0)}
          className="group relative h-full overflow-hidden rounded-2xl sm:row-span-2"
        >
          <Image
            src={main}
            alt={alt}
            fill
            priority
            sizes="(max-width: 640px) 100vw, 55vw"
            className="object-cover transition-transform duration-700 group-hover:scale-105"
          />
        </button>

        {/* Thumbnails */}
        {thumbs.map((src, i) => (
          <button
            key={src}
            onClick={() => setLightbox(i + 1)}
            className="group relative hidden h-full overflow-hidden rounded-2xl sm:block"
          >
            <Image
              src={src}
              alt={`${alt} ${i + 2}`}
              fill
              sizes="28vw"
              className="object-cover transition-transform duration-700 group-hover:scale-105"
            />
            {/* "View all" overlay on last thumb if more images exist */}
            {i === thumbs.length - 1 && images.length > 5 && (
              <span className="absolute inset-0 grid place-items-center bg-coal/55 text-sm font-semibold text-cream backdrop-blur-sm">
                <span className="inline-flex items-center gap-1.5">
                  <Images className="h-4 w-4" />
                  +{images.length - 5} more
                </span>
              </span>
            )}
          </button>
        ))}
      </div>

      {lightbox !== null && (
        <Lightbox images={images} alt={alt} index={lightbox} onClose={() => setLightbox(null)} />
      )}
    </>
  );
}

function Lightbox({
  images,
  alt,
  index,
  onClose,
}: {
  images: string[];
  alt: string;
  index: number;
  onClose: () => void;
}) {
  return (
    <div
      className="fixed inset-0 z-[60] grid place-items-center bg-coal/90 p-4"
      onClick={onClose}
    >
      <button
        aria-label="Close gallery"
        className="absolute right-5 top-5 grid h-11 w-11 place-items-center rounded-full bg-cream/15 text-cream backdrop-blur-md hover:bg-cream/25"
      >
        <Close className="h-5 w-5" />
      </button>
      <div className="relative h-[80vh] w-full max-w-5xl">
        <Image
          src={images[index]}
          alt={`${alt} ${index + 1}`}
          fill
          sizes="100vw"
          className="object-contain"
        />
      </div>
      <div className="absolute bottom-6 left-1/2 -translate-x-1/2 rounded-full bg-cream/15 px-4 py-1.5 text-sm text-cream backdrop-blur-md">
        {index + 1} / {images.length}
      </div>
    </div>
  );
}
