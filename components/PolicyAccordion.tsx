"use client";

import { useState } from "react";
import { ChevronRight } from "@/components/icons";

const POLICIES = [
  {
    title: "Confirmation Policy",
    content:
      "Your booking is confirmed instantly upon receipt of full or partial payment as specified at the time of booking. A confirmation voucher will be sent to your registered email address within 24 hours of successful payment. Please carry a printed or digital copy of the voucher along with a valid photo ID for all travellers.",
  },
  {
    title: "Refund Policy",
    content:
      "Refunds are processed within 7–10 business days of cancellation approval. The refund amount depends on the date of cancellation relative to the departure date and is subject to the cancellation policy below. Refunds are credited back to the original payment method. No refunds are applicable for partially used services.",
  },
  {
    title: "Cancellation Policy",
    content: `Cancellations must be submitted in writing to support@360travellers.com.\n\n• Cancelled 30+ days before departure: 90% refund\n• Cancelled 15–29 days before departure: 50% refund\n• Cancelled 7–14 days before departure: 25% refund\n• Cancelled within 7 days of departure: No refund\n\nCancellations due to natural calamities, government restrictions, or medical emergencies will be reviewed on a case-by-case basis.`,
  },
  {
    title: "Payment Policy",
    content:
      "A minimum booking deposit of 25% of the total package cost is required to confirm your reservation. The remaining balance must be paid at least 15 days prior to the departure date. We accept UPI, net banking, credit/debit cards, and bank transfers. All prices are inclusive of applicable GST unless stated otherwise.",
  },
  {
    title: "More on 360 Travellers",
    content:
      "360 Travellers is a curated travel company specialising in handcrafted domestic and international tour packages for Indian travellers. We focus on personalised experiences, reliable service, and transparent pricing — no hidden costs, no surprises. Our team is passionate about travel and committed to making every trip a memory that lasts a lifetime.",
  },
];

function Item({ title, content }: { title: string; content: string }) {
  const [open, setOpen] = useState(false);
  return (
    <div className="border-b border-ink/10 last:border-none">
      <button
        onClick={() => setOpen((o) => !o)}
        className="flex w-full items-center justify-between gap-4 py-5 text-left"
      >
        <span className="text-base font-semibold text-ink">{title}</span>
        <ChevronRight
          className={`h-4 w-4 shrink-0 text-ink/40 transition-transform duration-200 ${
            open ? "rotate-90" : ""
          }`}
        />
      </button>
      {open && (
        <div className="pb-5 text-sm leading-relaxed text-ink/65 whitespace-pre-line">
          {content}
        </div>
      )}
    </div>
  );
}

export default function PolicyAccordion() {
  return (
    <section className="border-t border-ink/8 bg-cream py-12">
      <div className="mx-auto max-w-7xl px-5 sm:px-8">
        <div className="mx-auto max-w-3xl divide-y divide-ink/10 rounded-2xl border border-ink/10 bg-white px-6">
          {POLICIES.map((p) => (
            <Item key={p.title} title={p.title} content={p.content} />
          ))}
        </div>
      </div>
    </section>
  );
}
