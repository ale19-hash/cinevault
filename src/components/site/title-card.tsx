import Link from "next/link";
import { Clock, Tv2 } from "lucide-react";
import { Badge } from "@/components/ui/badge";
import { TitlePoster } from "@/components/site/title-poster";
import { RatingBadge } from "@/components/site/rating-badge";
import { FavoriteButton } from "@/components/site/favorite-button";
import type { TitleSummary } from "@/lib/types";

export function TitleCard({ title }: { title: TitleSummary }) {
  return (
    <Link
      href={`/title/${title.slug}`}
      className="group block focus-visible:outline-none"
    >
      <div className="relative">
        <TitlePoster name={title.name} hue={title.hue} type={title.type} posterUrl={title.poster_url} />
        <div className="absolute inset-0 rounded-lg ring-1 ring-inset ring-white/0 transition group-hover:ring-white/30 group-focus-visible:ring-2 group-focus-visible:ring-amber-400" />
        <RatingBadge score={title.critic_score} className="absolute left-2 top-2" />
        <FavoriteButton slug={title.slug} className="absolute right-2 top-2" />
      </div>

      <div className="mt-2 space-y-1">
        <h3 className="truncate font-heading text-sm font-semibold leading-tight text-foreground group-hover:text-amber-300">
          {title.name}
        </h3>
        <div className="flex items-center gap-2 text-xs text-muted-foreground">
          <span>{title.release_year}</span>
          <span className="text-muted-foreground/40">•</span>
          {title.type === "tv" ? (
            <span className="inline-flex items-center gap-1">
              <Tv2 className="size-3" />
              {title.seasons} {title.seasons === 1 ? "season" : "seasons"}
            </span>
          ) : (
            <span className="inline-flex items-center gap-1">
              <Clock className="size-3" />
              {title.runtime_minutes}m
            </span>
          )}
        </div>
        <div className="flex flex-wrap gap-1">
          {title.genres.slice(0, 2).map((genre) => (
            <Badge key={genre} variant="secondary" className="text-[10px]">
              {genre}
            </Badge>
          ))}
        </div>
      </div>
    </Link>
  );
}
