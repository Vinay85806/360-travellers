-- ============================================================
-- 360 Travellers — enquiries + newsletter subscribers
-- Public can INSERT (submit forms) but NOT read. Reading is
-- restricted to authenticated users (your admin dashboard).
-- Safe to re-run.
-- ============================================================

-- ---- Enquiries (package "Send Enquiry" form) ----
create table if not exists public.enquiries (
  id            uuid primary key default gen_random_uuid(),
  name          text not null,
  email         text not null,
  phone         text not null,
  travel_date   text,
  travellers    int,
  message       text,
  package_title text,        -- which package the enquiry came from
  package_slug  text,
  status        text not null default 'new',  -- new | contacted | closed
  created_at    timestamptz not null default now()
);

alter table public.enquiries enable row level security;

-- Anyone (anon) may submit an enquiry.
drop policy if exists "Anyone can submit an enquiry" on public.enquiries;
create policy "Anyone can submit an enquiry"
  on public.enquiries for insert
  with check (true);

-- Only signed-in (admin) users may read them.
drop policy if exists "Authenticated can read enquiries" on public.enquiries;
create policy "Authenticated can read enquiries"
  on public.enquiries for select
  using (auth.role() = 'authenticated');

-- Authenticated users may update status.
drop policy if exists "Authenticated can update enquiries" on public.enquiries;
create policy "Authenticated can update enquiries"
  on public.enquiries for update
  using (auth.role() = 'authenticated');

-- ---- Newsletter subscribers (footer form) ----
create table if not exists public.subscribers (
  id          uuid primary key default gen_random_uuid(),
  email       text not null unique,
  created_at  timestamptz not null default now()
);

alter table public.subscribers enable row level security;

drop policy if exists "Anyone can subscribe" on public.subscribers;
create policy "Anyone can subscribe"
  on public.subscribers for insert
  with check (true);

drop policy if exists "Authenticated can read subscribers" on public.subscribers;
create policy "Authenticated can read subscribers"
  on public.subscribers for select
  using (auth.role() = 'authenticated');
