NEXO V0.12 — Search + Public Profiles

New:
- Search real NEXO users by display name or @username.
- Search results use the public profiles table in Supabase.
- Tap a result to open a real public profile.
- Public profile shows avatar, background, display name, @username, bio and that user's real Drops.
- Existing login, password recovery, Edit Profile, Create Drop and Home feed remain intact.

No new SQL is required because profiles are already publicly readable and Drops already have SELECT access.
