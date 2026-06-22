"use client";

import { useState } from "react";
import { WhatsApp, XMark } from "./icons";
import EnquiryForm from "./EnquiryForm";

const WHATSAPP_NUMBER = "919876543210";

export default function PackageCardActions({
  title,
  slug,
  price,
  originalPrice,
  duration,
}: {
  title: string;
  slug: string;
  price: number;
  originalPrice?: number | null;
  duration: string;
}) {
  const [open, setOpen] = useState(false);

  const waText = encodeURIComponent(
    `Hi 360 Travellers! I'm interested in booking:\n\n*${title}*\nDuration: ${duration}\nPrice: ₹${price.toLocaleString("en-IN")}/person\n\nCould you please share more details?`
  );
  const waUrl = `https://wa.me/${WHATSAPP_NUMBER}?text=${waText}`;

  return (
    <>
      {/* Two action buttons */}
      <div className="grid grid-cols-2 gap-2 border-t border-ink/8 px-5 py-4">
        <a
          href={waUrl}
          target="_blank"
          rel="noopener noreferrer"
          onClick={(e) => e.stopPropagation()}
          className="flex items-center justify-center gap-1.5 rounded-xl bg-[#25D366] px-3 py-2.5 text-xs font-semibold text-white transition-colors hover:bg-[#1ebe5d]"
        >
          <WhatsApp className="h-4 w-4" />
          WhatsApp
        </a>
        <button
          onClick={(e) => { e.preventDefault(); e.stopPropagation(); setOpen(true); }}
          className="flex items-center justify-center gap-1.5 rounded-xl bg-blue px-3 py-2.5 text-xs font-semibold text-cream transition-colors hover:bg-blue-deep"
        >
          Enquire Now
        </button>
      </div>

      {/* Enquiry modal */}
      {open && (
        <div
          className="fixed inset-0 z-50 flex items-end justify-center p-4 sm:items-center"
          style={{ background: "rgba(0,0,0,0.55)" }}
          onClick={(e) => { if (e.target === e.currentTarget) setOpen(false); }}
        >
          <div className="relative w-full max-w-md max-h-[90vh] overflow-y-auto rounded-3xl">
            <button
              onClick={() => setOpen(false)}
              aria-label="Close"
              className="absolute right-4 top-4 z-10 grid h-8 w-8 place-items-center rounded-full bg-ink/10 text-ink transition-colors hover:bg-ink/20"
            >
              <XMark className="h-4 w-4" />
            </button>
            <EnquiryForm
              packageTitle={title}
              packageSlug={slug}
              price={price}
              originalPrice={originalPrice}
            />
          </div>
        </div>
      )}
    </>
  );
}
