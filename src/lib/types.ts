export type TitleType = "movie" | "tv";

export interface TitleSummary {
  id: string;
  slug: string;
  name: string;
  type: TitleType;
  release_year: number;
  runtime_minutes: number | null;
  seasons: number | null;
  critic_score: number;
  director: string;
  tagline: string | null;
  poster_url: string | null;
  hue: number;
  featured: boolean;
  genres: string[];
}

export interface CastEntry {
  name: string;
  character_name: string;
  sort_order: number;
}

export interface Review {
  id: string;
  author_name: string;
  rating: number;
  body: string;
  created_at: string;
}

export interface TitleDetail extends TitleSummary {
  synopsis: string;
  language: string;
  country: string;
  cast: CastEntry[];
  reviews: Review[];
}
