NEXO V0.9 — Supabase Auth

Connected project:
https://nisiywhlgmjhznmbswly.supabase.co

Included:
- Real Create Account flow
- Email confirmation redirect to GitHub Pages
- Email/password login
- Persistent Supabase session
- Logout
- First authenticated login creates the user's public profile row
- Profile screen uses the logged-in username/display name
- Existing NEXO black + neon green design and centered official logo retained
- Existing World DROP, Loops, Spaces, customization and prototype features retained
- YouTube Profile Music remains experimental / pending

Security:
- Uses only the Supabase publishable browser key.
- No secret/service_role key is included.
- Profile writes remain protected by the RLS policies already created in Supabase.


V0.9.1 FIX:
- Restored the missing pages variable declaration in navigation JavaScript.
- Home, Loops, Create, Spaces, Profile, World Drop and data-go navigation work again.
- Supabase authentication/session/profile integration retained.
