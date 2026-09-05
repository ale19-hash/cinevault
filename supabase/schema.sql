-- CineVault database schema
-- Run this once in the Supabase SQL Editor (Project > SQL Editor > New query) before running seed.sql.

create extension if not exists "pgcrypto";

-- ─────────────────────────────────────────────────────────────
-- Reference tables
-- ─────────────────────────────────────────────────────────────

create table if not exists genres (
  id   smallserial primary key,
  name text not null unique
);

create table if not exists cast_members (
  id   serial primary key,
  name text not null unique
);

-- ─────────────────────────────────────────────────────────────
-- Core entity: a movie or TV show
-- ─────────────────────────────────────────────────────────────

create table if not exists titles (
  id              uuid primary key default gen_random_uuid(),
  slug            text not null unique,
  name            text not null,
  type            text not null check (type in ('movie', 'tv')),
  release_year    int  not null check (release_year between 1900 and 2100),
  runtime_minutes int  check (runtime_minutes > 0),
  seasons         int  check (seasons > 0),
  critic_score    numeric(3,1) not null check (critic_score between 0 and 10),
  director        text not null,
  tagline         text,
  synopsis        text not null,
  language        text not null default 'English',
  country         text not null default 'USA',
  hue             int  not null default 220 check (hue between 0 and 360), -- drives the generated poster art
  featured        boolean not null default false,
  created_at      timestamptz not null default now()
);

create index if not exists titles_type_idx on titles (type);
create index if not exists titles_release_year_idx on titles (release_year);

-- Many-to-many: a title can belong to several genres
create table if not exists title_genres (
  title_id uuid not null references titles (id) on delete cascade,
  genre_id smallint not null references genres (id) on delete cascade,
  primary key (title_id, genre_id)
);

-- Many-to-many: a title has several cast members, each with a character name
create table if not exists title_cast (
  title_id       uuid not null references titles (id) on delete cascade,
  person_id      int  not null references cast_members (id) on delete cascade,
  character_name text not null,
  sort_order     int  not null default 0,
  primary key (title_id, person_id)
);

-- One-to-many: visitor reviews left on a title from the website itself
create table if not exists reviews (
  id           uuid primary key default gen_random_uuid(),
  title_id     uuid not null references titles (id) on delete cascade,
  author_name  text not null check (char_length(author_name) between 1 and 60),
  rating       numeric(2,1) not null check (rating between 0 and 10),
  body         text not null check (char_length(body) between 1 and 1000),
  created_at   timestamptz not null default now()
);

create index if not exists reviews_title_id_idx on reviews (title_id);

-- ─────────────────────────────────────────────────────────────
-- Row Level Security
-- Everything is publicly readable (this is a public catalog).
-- Only new reviews may be written by visitors, and only through
-- the anon key used by the website (no update/delete from the client).
-- ─────────────────────────────────────────────────────────────

alter table genres        enable row level security;
alter table cast_members  enable row level security;
alter table titles        enable row level security;
alter table title_genres  enable row level security;
alter table title_cast    enable row level security;
alter table reviews       enable row level security;

create policy "public read genres"       on genres        for select using (true);
create policy "public read cast_members" on cast_members  for select using (true);
create policy "public read titles"       on titles        for select using (true);
create policy "public read title_genres" on title_genres  for select using (true);
create policy "public read title_cast"   on title_cast    for select using (true);
create policy "public read reviews"      on reviews       for select using (true);

create policy "public insert reviews" on reviews
  for insert
  with check (
    char_length(author_name) between 1 and 60
    and char_length(body) between 1 and 1000
    and rating between 0 and 10
  );

-- Convenience view: everything a title's detail page needs about its genres
create or replace view title_genre_names as
select tg.title_id, g.name as genre_name
from title_genres tg
join genres g on g.id = tg.genre_id;
