export const dynamic = "force-dynamic";

import Navbar from "@/components/Navbar";
import Hero from "@/components/Hero";
import PackagesSection from "@/components/PackagesSection";
import Testimonials from "@/components/Testimonials";
import Footer from "@/components/Footer";

type Props = { searchParams: Promise<{ filter?: string }> };

export default async function HomePage({ searchParams }: Props) {
  const { filter } = await searchParams;
  return (
    <main className="overflow-x-hidden">
      <Navbar />
      <Hero />
      <PackagesSection filter={filter} />
      <Testimonials />
      <Footer />
    </main>
  );
}
