-- ============================================================
-- 360 Travellers — destination grouping migration
-- Adds a 'destination' (display) + 'destination_slug' (for tabs/URLs)
-- so packages can be grouped Thrillophilia-style (Ladakh, Spiti, …).
-- Safe to re-run.
-- ============================================================

alter table public.packages add column if not exists destination       text;
alter table public.packages add column if not exists destination_slug  text;

-- Helpful index for grouping queries
create index if not exists packages_destination_slug_idx
  on public.packages (destination_slug);
