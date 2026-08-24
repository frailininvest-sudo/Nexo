NEXO V0.11.4 — Password Recovery Fix

Fix:
- NEXO now remembers when Forgot Password was initiated.
- Supabase PKCE recovery callbacks that return with only ?code=... are correctly recognized.
- Recovery opens Create New Password instead of Home/Profile.
- Recovery marker is cleared only after the password is successfully changed.
- No SQL or Supabase configuration changes required.
