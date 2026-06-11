-- ============================================================
-- 360 Travellers — rich package fields migration
-- Adds the columns needed for a full Thrillophilia-style detail
-- page + SEO. All columns are nullable / defaulted, so existing
-- rows keep working and pages render with graceful fallbacks.
--
-- Safe to re-run (uses IF NOT EXISTS).
-- ============================================================

-- SEO-friendly slug (e.g. "ladakh-adventure-expedition")
alter table public.packages add column if not exists slug text;

-- Marketing + detail content
alter table public.packages add column if not exists highlights   jsonb not null default '[]'::jsonb; -- ["Ride a camel in Nubra", ...]
alter table public.packages add column if not exists inclusions   jsonb not null default '[]'::jsonb; -- ["3 nights stay in Leh", ...]
alter table public.packages add column if not exists exclusions   jsonb not null default '[]'::jsonb; -- ["Domestic flights", ...]
alter table public.packages add column if not exists know_before  jsonb not null default '[]'::jsonb; -- ["Carry warm clothes", ...]
alter table public.packages add column if not exists gallery      jsonb not null default '[]'::jsonb; -- ["https://.../img1.jpg", ...]

-- Route + at-a-glance facts
alter table public.packages add column if not exists route         jsonb not null default '[]'::jsonb; -- ["Leh","Nubra Valley","Pangong","Leh"]
alter table public.packages add column if not exists nights        int;
alter table public.packages add column if not exists days          int;
alter table public.packages add column if not exists location      text;   -- "Leh, Ladakh"

-- Pricing
alter table public.packages add column if not exists original_price numeric; -- struck-through "was" price
alter table public.packages add column if not exists rating        numeric;  -- e.g. 4.7
alter table public.packages add column if not exists review_count  int;      -- e.g. 778

-- ---- Backfill slug for existing rows (lowercase, hyphenated title) ----
update public.packages
set slug = regexp_replace(regexp_replace(lower(title), '[^a-z0-9]+', '-', 'g'), '(^-|-$)', '', 'g')
where slug is null;

-- Enforce uniqueness so slugs can be used as URLs
create unique index if not exists packages_slug_key on public.packages (slug);
