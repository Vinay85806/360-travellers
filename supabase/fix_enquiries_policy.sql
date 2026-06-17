-- ============================================================
-- Fix: ensure anonymous visitors can submit enquiries.
-- Re-creates the INSERT policy explicitly for the anon + authenticated
-- roles. Run if enquiry submissions return a 42501 RLS error.
-- Safe to re-run.
-- ============================================================

alter table public.enquiries enable row level security;

drop policy if exists "Anyone can submit an enquiry" on public.enquiries;
create policy "Anyone can submit an enquiry"
  on public.enquiries
  for insert
  to anon, authenticated
  with check (true);

-- (Read/update policies for the admin dashboard, unchanged.)
drop policy if exists "Authenticated can read enquiries" on public.enquiries;
create policy "Authenticated can read enquiries"
  on public.enquiries for select
  to authenticated
  using (true);

drop policy if exists "Authenticated can update enquiries" on public.enquiries;
create policy "Authenticated can update enquiries"
  on public.enquiries for update
  to authenticated
  using (true);
