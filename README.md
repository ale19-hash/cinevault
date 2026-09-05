# CineVault

A movie & TV catalog built with **Next.js (App Router)**, **shadcn/ui**, and **Supabase** — browse acclaimed films and shows, filter by genre/type, search, save personal favorites (stored in the browser), and leave reviews that are saved to the database.

## Stack

- **Next.js 16** (TypeScript, App Router, Server Actions)
- **shadcn/ui** (Radix-based components: Card, Badge, Dialog, Select, Tabs, Avatar, Sonner, …)
- **Supabase** (Postgres + Row Level Security) as the database, queried with `@supabase/ssr`
- **Vercel** for deployment

Poster art is generated (a gradient + film-strip motif keyed off each title) rather than pulling licensed images, so the whole thing runs with just a Postgres schema — no image hosting needed.

## Database design

Six tables in `supabase/schema.sql`:

- `titles` — the core catalog (movie or tv, year, runtime/seasons, critic score, director, synopsis, …)
- `genres` and `title_genres` — many-to-many genre tags
- `cast_members` and `title_cast` — many-to-many cast, with a character name and sort order per role
- `reviews` — one-to-many visitor reviews, insert-only from the client (see RLS below)

Row Level Security is enabled on every table: everything is publicly readable, and `reviews` additionally allows public `insert` (with a check constraint on field lengths/rating range) but no `update`/`delete` — so the "Write a review" feature works for anonymous visitors without exposing the rest of the schema to writes.

`supabase/seed.sql` loads 36 well-known movies/shows spanning 1972–2022, their genres, ~100 cast rows, and a set of sample reviews.

## Local setup

1. **Install dependencies**
   ```bash
   npm install
   ```

2. **Create a Supabase project** at [supabase.com](https://supabase.com) (free tier is fine).

3. **Run the schema and seed** — in the Supabase dashboard, open **SQL Editor → New query**, paste and run `supabase/schema.sql`, then do the same for `supabase/seed.sql`.

4. **Set environment variables** — copy `.env.local.example` to `.env.local` and fill in your project's URL and anon key from **Project Settings → API**:
   ```bash
   cp .env.local.example .env.local
   ```

5. **Run the dev server**
   ```bash
   npm run dev
   ```
   Visit http://localhost:3000.

## Deploying to Vercel

1. Push this repo to GitHub (see below).
2. In [vercel.com/new](https://vercel.com/new), import the GitHub repo (connect your GitHub account to Vercel if you haven't already — Vercel prompts for this the first time you click "Import").
3. Add the two environment variables from `.env.local` in the Vercel project's **Settings → Environment Variables** (`NEXT_PUBLIC_SUPABASE_URL`, `NEXT_PUBLIC_SUPABASE_ANON_KEY`).
4. Deploy. Every push to `main` redeploys automatically.

## Project structure

```
src/app/                  routes: home, /title/[slug], /favorites
src/app/actions.ts        server action for submitting a review
src/components/site/      page-specific components (hero, browse grid, poster art, cast row, review dialog, …)
src/components/ui/        shadcn/ui primitives
src/lib/queries.ts        Supabase data-fetching functions
src/lib/supabase/         server/browser Supabase client factories
src/lib/use-favorites.ts  localStorage-backed favorites (no user accounts)
supabase/schema.sql       table definitions + RLS policies
supabase/seed.sql         sample dataset (36 titles, genres, cast, reviews)
```
