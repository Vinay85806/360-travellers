"use client";

import { useState } from "react";
import { WhatsApp } from "@/components/icons";

const PHONE = "918580610324";
const DEFAULT_MSG = encodeURIComponent(
  "Hi 360 Travellers! I'm interested in planning a trip. Can you help me?"
);

export default function WhatsAppFloat() {
  const [hovered, setHovered] = useState(false);

  return (
    <a
      href={`https://wa.me/${PHONE}?text=${DEFAULT_MSG}`}
      target="_blank"
      rel="noopener noreferrer"
      aria-label="Chat on WhatsApp"
      onMouseEnter={() => setHovered(true)}
      onMouseLeave={() => setHovered(false)}
      className="fixed bottom-6 right-6 z-50 flex items-center gap-3 overflow-hidden rounded-full bg-[#25D366] text-white shadow-lift transition-all duration-300 hover:shadow-xl"
      style={{ maxWidth: hovered ? "240px" : "52px" }}
    >
      {/* Icon — always visible */}
      <span className="grid h-[52px] w-[52px] shrink-0 place-items-center">
        <WhatsApp className="h-6 w-6" />
      </span>
      {/* Label — slides in on hover */}
      <span
        className="shrink-0 pr-5 text-sm font-semibold whitespace-nowrap transition-opacity duration-200"
        style={{ opacity: hovered ? 1 : 0 }}
      >
        Chat with us
      </span>
    </a>
  );
}
