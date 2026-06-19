-- ============================================================
-- 360 Travellers — per-package SEO fields
-- Lets each package override its page title / meta description /
-- keywords for search engines. Falls back to defaults when null.
-- Safe to re-run.
-- ============================================================

alter table public.packages add column if not exists meta_title       text;
alter table public.packages add column if not exists meta_description text;
alter table public.packages add column if not exists keywords         jsonb not null default '[]'::jsonb;
