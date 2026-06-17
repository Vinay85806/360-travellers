import type { Metadata } from "next";
import { Fraunces, Manrope } from "next/font/google";
import Script from "next/script";
import "./globals.css";

const fraunces = Fraunces({
  subsets: ["latin"],
  weight: ["400", "500", "600"],
  style: ["normal", "italic"],
  variable: "--font-fraunces",
  display: "swap",
});

const manrope = Manrope({
  subsets: ["latin"],
  weight: ["400", "500", "600", "700"],
  variable: "--font-manrope",
  display: "swap",
});

export const metadata: Metadata = {
  metadataBase: new URL("https://360travellers.com"),
  title: "360 Travellers — Curated Luxury Journeys, Effortlessly Yours",
  description:
    "Handcrafted holidays, private experiences and unforgettable stays across 60+ destinations. Bali, Maldives, Kashmir, Santorini and beyond — designed around you.",
  icons: {
    icon: "https://fqrghsvqijxnglbrjhwo.supabase.co/storage/v1/object/public/images/logos/360%20Travellers%20favicon.jpg",
  },
  keywords: [
    "luxury travel",
    "custom holidays",
    "travel packages",
    "Bali",
    "Maldives",
    "Kashmir",
    "honeymoon packages",
  ],
  openGraph: {
    title: "360 Travellers — Curated Luxury Journeys",
    description:
      "Handcrafted holidays and private experiences across 60+ destinations.",
    type: "website",
  },
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en" className={`${fraunces.variable} ${manrope.variable}`}>
      <body className="font-sans antialiased">{children}</body>

      {/* Microsoft Clarity — website analytics & session recordings */}
      <Script id="microsoft-clarity" strategy="afterInteractive">
        {`(function(c,l,a,r,i,t,y){
            c[a]=c[a]||function(){(c[a].q=c[a].q||[]).push(arguments)};
            t=l.createElement(r);t.async=1;t.src="https://www.clarity.ms/tag/"+i;
            y=l.getElementsByTagName(r)[0];y.parentNode.insertBefore(t,y);
        })(window, document, "clarity", "script", "x8dgyqpp9w");`}
      </Script>
    </html>
  );
}
