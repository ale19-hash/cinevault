import Link from "next/link";
import { Film, Star } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { PosterArt } from "@/components/site/poster-art";
import type { TitleSummary } from "@/lib/types";

export function Hero({ featured }: { featured: TitleSummary[] }) {
  if (featured.length === 0) return null;
  const [spotlight, ...rest] = featured;

  return (
    <section className="relative overflow-hidden border-b border-white/10">
      <div
        className="absolute inset-0 -z-10"
        style={{
          background: `radial-gradient(1200px 500px at 15% -10%, hsl(${spotlight.hue} 55% 20%) 0%, transparent 60%), linear-gradient(180deg, hsl(${spotlight.hue} 40% 8%) 0%, var(--background) 100%)`,
        }}
        aria-hidden="true"
      />

      <div className="mx-auto grid max-w-6xl gap-8 px-4 py-12 sm:px-6 md:grid-cols-[220px_1fr] md:py-16">
        <div className="hidden w-full max-w-[220px] md:block">
          <PosterArt name={spotlight.name} hue={spotlight.hue} type={spotlight.type} size="lg" />
        </div>

        <div className="flex flex-col justify-center gap-4">
          <Badge className="w-fit gap-1 bg-amber-400/15 text-amber-300 hover:bg-amber-400/15">
            <Film className="size-3" /> Spotlight pick
          </Badge>
          <h1 className="font-heading text-3xl font-bold tracking-tight sm:text-5xl">
            {spotlight.name}
          </h1>
          {spotlight.tagline && (
            <p className="max-w-xl text-base italic text-muted-foreground">
              “{spotlight.tagline}”
            </p>
          )}
          <div className="flex flex-wrap items-center gap-3 text-sm text-muted-foreground">
            <span className="inline-flex items-center gap-1 font-medium text-amber-300">
              <Star className="size-4 fill-amber-300 text-amber-300" />
              {spotlight.critic_score.toFixed(1)}
            </span>
            <span>{spotlight.release_year}</span>
            <span>Dir. {spotlight.director}</span>
            <div className="flex gap-1">
              {spotlight.genres.map((g) => (
                <Badge key={g} variant="outline">
                  {g}
                </Badge>
              ))}
            </div>
          </div>
          <div className="flex gap-3 pt-2">
            <Button asChild size="lg">
              <Link href={`/title/${spotlight.slug}`}>View details</Link>
            </Button>
            <Button asChild variant="outline" size="lg">
              <Link href="#browse">Browse the vault</Link>
            </Button>
          </div>
        </div>
      </div>

      {rest.length > 0 && (
        <div className="mx-auto max-w-6xl px-4 pb-8 sm:px-6">
          <div className="flex gap-4 overflow-x-auto pb-2">
            {rest.map((t) => (
              <Link
                key={t.id}
                href={`/title/${t.slug}`}
                className="w-24 shrink-0 transition hover:-translate-y-1 sm:w-28"
              >
                <PosterArt name={t.name} hue={t.hue} type={t.type} size="sm" />
                <p className="mt-1 truncate text-xs text-muted-foreground">{t.name}</p>
              </Link>
            ))}
          </div>
        </div>
      )}
    </section>
  );
}
