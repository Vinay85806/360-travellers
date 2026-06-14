-- ============================================================
-- 360 Travellers — destinations catalog table
-- Holds the destinations we service (name, slug, icon, order),
-- independent of whether packages exist yet. The homepage reads
-- this for the tab bar + icons; rails still pull packages by slug.
-- Safe to re-run.
-- ============================================================

create table if not exists public.destinations (
  id            uuid primary key default gen_random_uuid(),
  name          text not null,
  slug          text not null unique,
  -- Sprite image URL + which cell (0-based, left-to-right, top-to-bottom).
  -- icon_sprite is null when using the default map-pin.
  icon_sprite   text,
  icon_index    int,
  -- Sprite grid so the slicer knows the layout (defaults match the 4x3 sheet).
  sprite_cols   int not null default 4,
  sprite_rows   int not null default 3,
  -- Display ordering (lower = earlier). Real/serviced destinations first.
  sort_order    int not null default 100,
  active        boolean not null default true,
  created_at    timestamptz not null default now()
);

-- Public read (anon) for the website
alter table public.destinations enable row level security;

drop policy if exists "Public destinations are viewable by everyone" on public.destinations;
create policy "Public destinations are viewable by everyone"
  on public.destinations for select using (true);
