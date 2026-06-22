-- ============================================================
-- 360 Travellers — destinations seed
-- 15 serviced (domestic) destinations first (sort_order 1-15),
-- then international ones (sort_order 50+).
-- icon_index refers to the 4x3 sprite:
--   .../icons/12 domestic icons (1).png
-- Cells (0-based): 0 Kerala, 1 Amritsar, 2 Goa, 3 Delhi,
--   4 Himachal, 5 Rajasthan, 6 Sikkim, 7 Madurai,
--   8 Gujarat, 9 Assam, 10 Andaman, 11 Uttar Pradesh
-- Destinations without a sprite cell use the default map-pin.
-- Safe to re-run (upsert on slug).
-- ============================================================

insert into public.destinations (name, slug, icon_sprite, icon_index, sort_order)
values
  -- serviced destinations (real) — shown first
  ('Ladakh',            'ladakh',            null, null, 1),
  ('Spiti',             'spiti-valley',      null, null, 2),
  ('Himachal Pradesh',  'himachal-pradesh',  'https://fqrghsvqijxnglbrjhwo.supabase.co/storage/v1/object/public/images/icons/12 domestic icons (1).png', 4, 3),
  ('Chardham',          'chardham',          null, null, 4),
  ('Goa',               'goa',               'https://fqrghsvqijxnglbrjhwo.supabase.co/storage/v1/object/public/images/icons/12 domestic icons (1).png', 2, 5),
  ('Kerala',            'kerala',            'https://fqrghsvqijxnglbrjhwo.supabase.co/storage/v1/object/public/images/icons/12 domestic icons (1).png', 0, 6),
  ('Gujarat',           'gujarat',           'https://fqrghsvqijxnglbrjhwo.supabase.co/storage/v1/object/public/images/icons/12 domestic icons (1).png', 8, 7),
  ('Rajasthan',         'rajasthan',         'https://fqrghsvqijxnglbrjhwo.supabase.co/storage/v1/object/public/images/icons/12 domestic icons (1).png', 5, 8),
  ('Uttarakhand',       'uttarakhand',       null, null, 9),
  ('Uttar Pradesh',     'uttar-pradesh',     'https://fqrghsvqijxnglbrjhwo.supabase.co/storage/v1/object/public/images/icons/12 domestic icons (1).png', 11, 10),
  ('Kashmir',           'kashmir',           null, null, 11),
  ('Andaman',           'andaman',           'https://fqrghsvqijxnglbrjhwo.supabase.co/storage/v1/object/public/images/icons/12 domestic icons (1).png', 10, 12),
  ('Delhi',             'delhi',             'https://fqrghsvqijxnglbrjhwo.supabase.co/storage/v1/object/public/images/icons/12 domestic icons (1).png', 3, 13),
  ('Sikkim',            'sikkim',            'https://fqrghsvqijxnglbrjhwo.supabase.co/storage/v1/object/public/images/icons/12 domestic icons (1).png', 6, 14),
  ('Assam',             'assam',             'https://fqrghsvqijxnglbrjhwo.supabase.co/storage/v1/object/public/images/icons/12 domestic icons (1).png', 9, 15),

  -- existing international destinations — shown after
  ('Dubai',       'dubai',       null, null, 50),
  ('Singapore',   'singapore',   null, null, 51),
  ('Thailand',    'thailand',    null, null, 52),
  ('Bali',        'bali',        null, null, 53),
  ('Vietnam',     'vietnam',     null, null, 54),
  ('Japan',       'japan',       null, null, 55),
  ('Switzerland', 'switzerland', null, null, 56),
  ('Paris',       'paris',       null, null, 57),
  ('Maldives',    'maldives',    null, null, 58)
on conflict (slug) do update set
  name        = excluded.name,
  icon_sprite = excluded.icon_sprite,
  icon_index  = excluded.icon_index,
  sort_order  = excluded.sort_order,
  active      = true;
