"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import Image from "next/image";
import { supabase } from "@/lib/supabase";

const LOGO =
  "https://fqrghsvqijxnglbrjhwo.supabase.co/storage/v1/object/public/images/logos/360travellers_logo.png";

export default function LoginPage() {
  const router = useRouter();
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");
  const [loading, setLoading] = useState(false);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setError("");
    setLoading(true);

    const { error: authError } = await supabase.auth.signInWithPassword({
      email,
      password,
    });

    if (authError) {
      setError(authError.message);
      setLoading(false);
    } else {
      router.push("/admin");
    }
  };

  return (
    <div className="flex min-h-screen items-center justify-center bg-ivory p-5">
      <div className="w-full max-w-sm">
        <div className="mb-8 text-center">
          <Image
            src={LOGO}
            alt="360 Travellers"
            width={160}
            height={42}
            className="mx-auto h-10 w-auto"
          />
          <h1 className="mt-4 font-display text-2xl text-ink">Admin Dashboard</h1>
          <p className="mt-1 text-sm text-ink/45">Sign in to manage packages</p>
        </div>

        <form
          onSubmit={handleSubmit}
          className="space-y-4 rounded-3xl border border-ink/10 bg-white p-8 shadow-soft"
        >
          {error && (
            <div className="rounded-xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-600">
              {error}
            </div>
          )}

          <div>
            <label className="mb-1.5 block text-xs font-semibold uppercase tracking-wide text-ink/45">
              Email
            </label>
            <input
              type="email"
              required
              autoComplete="email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              placeholder="your@email.com"
              className="w-full rounded-xl border border-ink/15 bg-ivory px-4 py-3 text-sm text-ink placeholder:text-ink/35 focus:border-blue focus:outline-none transition-colors"
            />
          </div>

          <div>
            <label className="mb-1.5 block text-xs font-semibold uppercase tracking-wide text-ink/45">
              Password
            </label>
            <input
              type="password"
              required
              autoComplete="current-password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              placeholder="••••••••"
              className="w-full rounded-xl border border-ink/15 bg-ivory px-4 py-3 text-sm text-ink placeholder:text-ink/35 focus:border-blue focus:outline-none transition-colors"
            />
          </div>

          <button
            type="submit"
            disabled={loading}
            className="w-full rounded-xl bg-blue py-3.5 text-sm font-semibold text-white transition-colors hover:bg-blue-deep disabled:opacity-60"
          >
            {loading ? "Signing in…" : "Sign In"}
          </button>
        </form>
      </div>
    </div>
  );
}
