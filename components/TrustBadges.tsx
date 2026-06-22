const badges = [
  {
    icon: (
      <svg viewBox="0 0 48 48" fill="none" className="h-14 w-14">
        <circle cx="24" cy="24" r="22" fill="#FFF4E5" />
        <path d="M24 14c-4.4 0-8 3.6-8 8 0 3 1.6 5.6 4 7.1V32h8v-2.9c2.4-1.5 4-4.1 4-7.1 0-4.4-3.6-8-8-8Z" fill="#F4A628" opacity=".25"/>
        <path d="M24 36l-2-4h4l-2 4Z" fill="#F4A628" opacity=".4"/>
        <circle cx="24" cy="22" r="6" stroke="#F4A628" strokeWidth="1.8" fill="none"/>
        <path d="M21 22l2 2 4-4" stroke="#F4A628" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round"/>
        <path d="M16 38c0-4.4 3.6-8 8-8s8 3.6 8 8" stroke="#F4A628" strokeWidth="1.8" strokeLinecap="round" fill="none"/>
      </svg>
    ),
    stat: "10,000+",
    label: "Happy Travellers",
    sub: "Customers from across India and abroad",
  },
  {
    icon: (
      <svg viewBox="0 0 48 48" fill="none" className="h-14 w-14">
        <circle cx="24" cy="24" r="22" fill="#FFF4E5" />
        <path d="M24 14l2.9 6 6.6 1-4.8 4.7 1.1 6.5L24 29.2l-5.8 3 1.1-6.5L14.5 21l6.6-1L24 14Z" fill="#F4A628" opacity=".35"/>
        <path d="M24 14l2.9 6 6.6 1-4.8 4.7 1.1 6.5L24 29.2l-5.8 3 1.1-6.5L14.5 21l6.6-1L24 14Z" stroke="#F4A628" strokeWidth="1.8" strokeLinejoin="round"/>
      </svg>
    ),
    stat: "4.8 / 5",
    label: "Traveller Rating",
    sub: "Rated across Google and TripAdvisor",
  },
  {
    icon: (
      <svg viewBox="0 0 48 48" fill="none" className="h-14 w-14">
        <circle cx="24" cy="24" r="22" fill="#FFF4E5" />
        <path d="M24 34S13 27 13 20a7 7 0 0 1 11-5.7A7 7 0 0 1 35 20c0 7-11 14-11 14Z" fill="#F4A628" opacity=".3"/>
        <path d="M24 34S13 27 13 20a7 7 0 0 1 11-5.7A7 7 0 0 1 35 20c0 7-11 14-11 14Z" stroke="#F4A628" strokeWidth="1.8" strokeLinejoin="round"/>
        <path d="M20 20l2.5 2.5L28 17" stroke="#F4A628" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round"/>
      </svg>
    ),
    stat: "Curated",
    label: "With Care",
    sub: "Personalised itineraries for every traveller",
  },
  {
    icon: (
      <svg viewBox="0 0 48 48" fill="none" className="h-14 w-14">
        <circle cx="24" cy="24" r="22" fill="#FFF4E5" />
        <rect x="14" y="14" width="20" height="20" rx="10" fill="#F4A628" opacity=".2"/>
        <path d="M20 24a9 9 0 0 0 4 3.5M28 24a9 9 0 0 0-4-3.5" stroke="#F4A628" strokeWidth="1.8" strokeLinecap="round"/>
        <text x="24" y="27" textAnchor="middle" fontSize="10" fontWeight="bold" fill="#F4A628">24</text>
        <path d="M31 17l2-2M17 17l-2-2M24 13v-2" stroke="#F4A628" strokeWidth="1.5" strokeLinecap="round"/>
      </svg>
    ),
    stat: "24 / 7",
    label: "On-Trip Support",
    sub: "Always there — before, during and after your trip",
  },
];

export default function TrustBadges() {
  return (
    <section className="border-t border-ink/8 bg-white py-12">
      <div className="mx-auto max-w-7xl px-5 sm:px-8">
        <div className="grid grid-cols-2 gap-8 sm:grid-cols-4">
          {badges.map((b) => (
            <div key={b.label} className="flex flex-col items-center text-center">
              <div className="mb-4">{b.icon}</div>
              <p className="text-xl font-display font-bold text-ink">{b.stat}</p>
              <p className="mt-0.5 text-sm font-semibold text-ink/80">{b.label}</p>
              <p className="mt-1 text-xs leading-relaxed text-ink/50">{b.sub}</p>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
