import Link from "next/link";
import { Tent, Star } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { TitlePoster } from "@/components/site/title-poster";
import type { TitleSummary } from "@/lib/types";

export function Hero({ featured }: { featured: TitleSummary[] }) {
  if (featured.length === 0) return null;
  const [spotlight, ...rest] = featured;

  return (
    <section className="relative overflow-hidden border-b-4 border-primary">
      <div
        className="absolute inset-0 -z-10"
        style={{
          background:
            "radial-gradient(1600px 900px at 20% -20%, color-mix(in oklch, var(--secondary) 14%, var(--background)) 0%, var(--background) 75%)",
        }}
        aria-hidden="true"
      />

      <div className="mx-auto grid max-w-6xl gap-8 px-4 py-12 sm:px-6 md:grid-cols-[220px_1fr] md:py-16">
        <div className="hidden w-full max-w-[220px] md:block">
          <TitlePoster
            name={spotlight.name}
            hue={spotlight.hue}
            type={spotlight.type}
            posterUrl={spotlight.poster_url}
            size="lg"
          />
        </div>

        <div className="flex flex-col justify-center gap-4">
          <Badge className="w-fit gap-1 bg-primary text-primary-foreground hover:bg-primary">
            <Tent className="size-3" /> Center ring pick
          </Badge>
          <h1 className="font-heading text-3xl tracking-tight text-primary sm:text-5xl">
            {spotlight.name}
          </h1>
          {spotlight.tagline && (
            <p className="max-w-xl text-base italic text-muted-foreground">
              “{spotlight.tagline}”
            </p>
          )}
          <div className="flex flex-wrap items-center gap-3 text-sm text-muted-foreground">
            <span className="inline-flex items-center gap-1 font-bold text-primary">
              <Star className="size-4 fill-secondary text-secondary" />
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
            <Button asChild size="lg" className="rounded-full">
              <Link href={`/title/${spotlight.slug}`}>View details</Link>
            </Button>
            <Button asChild variant="outline" size="lg" className="rounded-full">
              <Link href="#browse">Step right up</Link>
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
                <TitlePoster name={t.name} hue={t.hue} type={t.type} posterUrl={t.poster_url} size="sm" />
                <p className="mt-1 truncate text-xs text-muted-foreground">{t.name}</p>
              </Link>
            ))}
          </div>
        </div>
      )}
    </section>
  );
}
