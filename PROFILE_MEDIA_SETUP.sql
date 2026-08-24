-- NEXO Edit Profile: run once in Supabase SQL Editor
insert into storage.buckets (id, name, public)
values ('profile-media', 'profile-media', true)
on conflict (id) do update set public = true;

drop policy if exists "Public profile media read" on storage.objects;
drop policy if exists "Users upload own profile media" on storage.objects;
drop policy if exists "Users update own profile media" on storage.objects;
drop policy if exists "Users delete own profile media" on storage.objects;

create policy "Public profile media read" on storage.objects
for select using (bucket_id = 'profile-media');

create policy "Users upload own profile media" on storage.objects
for insert to authenticated
with check (bucket_id = 'profile-media' and (storage.foldername(name))[1] = (select auth.uid()::text));

create policy "Users update own profile media" on storage.objects
for update to authenticated
using (bucket_id = 'profile-media' and (storage.foldername(name))[1] = (select auth.uid()::text))
with check (bucket_id = 'profile-media' and (storage.foldername(name))[1] = (select auth.uid()::text));

create policy "Users delete own profile media" on storage.objects
for delete to authenticated
using (bucket_id = 'profile-media' and (storage.foldername(name))[1] = (select auth.uid()::text));
