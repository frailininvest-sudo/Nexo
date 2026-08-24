NEXO V0.11.1 — Feed Fix

- Fixes Home feed loading for real Drops.
- Drops and profiles are loaded separately so the feed does not depend on an inferred database relationship.
- Existing published Drops remain intact and should appear automatically.
- No new Supabase SQL setup is required for this fix.
