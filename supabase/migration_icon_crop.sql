-- ============================================================
-- 360 Travellers — manual icon crop coordinates
-- Lets each destination specify the EXACT pixel rectangle of its
-- icon within the sprite sheet (x, y, w, h). When set, these
-- override the automatic grid slicing. Also store the sprite's
-- natural pixel size so percentages can be computed precisely.
-- Safe to re-run.
-- ============================================================

alter table public.destinations add column if not exists icon_x        int;  -- left of icon in sprite (px)
alter table public.destinations add column if not exists icon_y        int;  -- top of icon in sprite (px)
alter table public.destinations add column if not exists icon_w        int;  -- icon width (px)
alter table public.destinations add column if not exists icon_h        int;  -- icon height (px)
alter table public.destinations add column if not exists sprite_w      int;  -- full sprite width (px)
alter table public.destinations add column if not exists sprite_h      int;  -- full sprite height (px)
