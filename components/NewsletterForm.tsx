"use client";

import { useState } from "react";
import { Mail, ArrowRight } from "./icons";

export default function NewsletterForm() {
  const [email, setEmail] = useState("");
  const [status, setStatus] = useState<"idle" | "sending" | "done" | "error">(
    "idle"
  );
  const [msg, setMsg] = useState("");

  const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    setStatus("sending");
    setMsg("");
    try {
      const res = await fetch("/api/subscribe", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ email }),
      });
      const data = await res.json();
      if (!res.ok) throw new Error(data.error || "Something went wrong.");
      setStatus("done");
      setEmail("");
    } catch (err) {
      setStatus("error");
      setMsg(err instanceof Error ? err.message : "Something went wrong.");
    }
  };

  if (status === "done") {
    return (
      <div className="rounded-2xl bg-cream/10 p-4 text-sm text-cream">
        🎉 You&rsquo;re subscribed! Look out for handpicked itineraries soon.
      </div>
    );
  }

  return (
    <>
      <form onSubmit={handleSubmit} className="flex max-w-md flex-col gap-2.5 sm:flex-row">
        <div className="flex flex-1 items-center gap-2.5 rounded-full bg-cream px-5 py-3.5">
          <Mail className="h-4 w-4 text-blue" />
          <input
            required
            type="email"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            placeholder="Your email address"
            className="w-full bg-transparent text-sm text-ink placeholder:text-ink/40 focus:outline-none"
          />
        </div>
        <button
          type="submit"
          disabled={status === "sending"}
          className="group inline-flex items-center justify-center gap-2 rounded-full bg-gold px-6 py-3.5 text-sm font-semibold text-coal transition-colors hover:bg-gold-soft disabled:opacity-60"
        >
          {status === "sending" ? "Subscribing…" : "Subscribe"}
          <ArrowRight className="h-4 w-4 transition-transform group-hover:translate-x-1" />
        </button>
      </form>
      {status === "error" ? (
        <p className="mt-3 text-xs text-red-300">{msg}</p>
      ) : (
        <p className="mt-3 text-xs text-cream/45">
          By subscribing you agree to our privacy policy.
        </p>
      )}
    </>
  );
}
