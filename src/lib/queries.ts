import { createClient } from "@/lib/supabase/server";
import type { TitleDetail, TitleSummary } from "@/lib/types";

// Raw shapes as they come back from PostgREST's nested-select syntax.
interface RawTitleRow {
  id: string;
  slug: string;
  name: string;
  type: "movie" | "tv";
  release_year: number;
  runtime_minutes: number | null;
  seasons: number | null;
  critic_score: number;
  director: string;
  tagline: string | null;
  poster_url: string | null;
  hue: number;
  featured: boolean;
  title_genres: { genres: { name: string } | null }[] | null;
}

function toSummary(row: RawTitleRow): TitleSummary {
  return {
    id: row.id,
    slug: row.slug,
    name: row.name,
    type: row.type,
    release_year: row.release_year,
    runtime_minutes: row.runtime_minutes,
    seasons: row.seasons,
    critic_score: Number(row.critic_score),
    director: row.director,
    tagline: row.tagline,
    poster_url: row.poster_url,
    hue: row.hue,
    featured: row.featured,
    genres: (row.title_genres ?? [])
      .map((tg) => tg.genres?.name)
      .filter((name): name is string => Boolean(name)),
  };
}

/** All titles for the browse grid, newest-added first. */
export async function getAllTitles(): Promise<TitleSummary[]> {
  const supabase = await createClient();
  const { data, error } = await supabase
    .from("titles")
    .select(
      `id, slug, name, type, release_year, runtime_minutes, seasons,
       critic_score, director, tagline, poster_url, hue, featured,
       title_genres ( genres ( name ) )`
    )
    .order("critic_score", { ascending: false });

  if (error) {
    console.error("getAllTitles failed:", error.message);
    return [];
  }

  return (data as unknown as RawTitleRow[]).map(toSummary);
}

/** The hand-picked titles shown in the homepage hero. */
export async function getFeaturedTitles(): Promise<TitleSummary[]> {
  const all = await getAllTitles();
  return all.filter((t) => t.featured);
}

/** Every distinct genre name, alphabetized, for the filter bar. */
export async function getGenres(): Promise<string[]> {
  const supabase = await createClient();
  const { data, error } = await supabase
    .from("genres")
    .select("name")
    .order("name");

  if (error) {
    console.error("getGenres failed:", error.message);
    return [];
  }
  return data.map((g) => g.name);
}

/** One title with its full cast list and visitor reviews, by slug. */
export async function getTitleBySlug(
  slug: string
): Promise<TitleDetail | null> {
  const supabase = await createClient();
  const { data, error } = await supabase
    .from("titles")
    .select(
      `id, slug, name, type, release_year, runtime_minutes, seasons,
       critic_score, director, tagline, poster_url, synopsis, language, country, hue, featured,
       title_genres ( genres ( name ) ),
       title_cast ( character_name, sort_order, cast_members ( name, photo_url ) ),
       reviews ( id, author_name, rating, body, created_at )`
    )
    .eq("slug", slug)
    .maybeSingle();

  if (error) {
    console.error("getTitleBySlug failed:", error.message);
    return null;
  }
  if (!data) return null;

  const row = data as unknown as RawTitleRow & {
    synopsis: string;
    language: string;
    country: string;
    title_cast: {
      character_name: string;
      sort_order: number;
      cast_members: { name: string; photo_url: string | null } | null;
    }[];
    reviews: {
      id: string;
      author_name: string;
      rating: number;
      body: string;
      created_at: string;
    }[];
  };

  return {
    ...toSummary(row),
    synopsis: row.synopsis,
    language: row.language,
    country: row.country,
    cast: (row.title_cast ?? [])
      .map((c) => ({
        name: c.cast_members?.name ?? "Unknown",
        character_name: c.character_name,
        sort_order: c.sort_order,
        photo_url: c.cast_members?.photo_url ?? null,
      }))
      .sort((a, b) => a.sort_order - b.sort_order),
    reviews: (row.reviews ?? [])
      .map((r) => ({ ...r, rating: Number(r.rating) }))
      .sort(
        (a, b) =>
          new Date(b.created_at).getTime() - new Date(a.created_at).getTime()
      ),
  };
}
