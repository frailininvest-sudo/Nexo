-- NEXO V0.11 - Create Drops setup (run once in Supabase SQL Editor)
create table if not exists public.drops (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  caption text check (char_length(caption) <= 500),
  media_url text not null,
  media_type text not null check (media_type in ('image','video')),
  created_at timestamptz not null default now()
);
alter table public.drops enable row level security;
grant select on table public.drops to anon, authenticated;
grant insert, update, delete on table public.drops to authenticated;
drop policy if exists "Drops are publicly readable" on public.drops;
drop policy if exists "Users create own drops" on public.drops;
drop policy if exists "Users update own drops" on public.drops;
drop policy if exists "Users delete own drops" on public.drops;
create policy "Drops are publicly readable" on public.drops for select using (true);
create policy "Users create own drops" on public.drops for insert to authenticated with check ((select auth.uid()) = user_id);
create policy "Users update own drops" on public.drops for update to authenticated using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
create policy "Users delete own drops" on public.drops for delete to authenticated using ((select auth.uid()) = user_id);
create index if not exists drops_created_at_idx on public.drops (created_at desc);
create index if not exists drops_user_id_idx on public.drops (user_id);
insert into storage.buckets (id,name,public,file_size_limit,allowed_mime_types)
values ('drop-media','drop-media',true,52428800,array['image/jpeg','image/png','image/webp','image/gif','video/mp4','video/webm','video/quicktime'])
on conflict (id) do update set public=true,file_size_limit=52428800;
drop policy if exists "Public drop media read" on storage.objects;
drop policy if exists "Users upload own drop media" on storage.objects;
drop policy if exists "Users update own drop media" on storage.objects;
drop policy if exists "Users delete own drop media" on storage.objects;
create policy "Public drop media read" on storage.objects for select using (bucket_id='drop-media');
create policy "Users upload own drop media" on storage.objects for insert to authenticated with check (bucket_id='drop-media' and (storage.foldername(name))[1]=(select auth.uid()::text));
create policy "Users update own drop media" on storage.objects for update to authenticated using (bucket_id='drop-media' and (storage.foldername(name))[1]=(select auth.uid()::text));
create policy "Users delete own drop media" on storage.objects for delete to authenticated using (bucket_id='drop-media' and (storage.foldername(name))[1]=(select auth.uid()::text));
