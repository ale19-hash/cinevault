"use client";

import { useState } from "react";
import Link from "next/link";
import { ChevronRight, Tent, Star } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { TitlePoster } from "@/components/site/title-poster";
import { cn } from "@/lib/utils";
import type { TitleSummary } from "@/lib/types";

export function Hero({ featured }: { featured: TitleSummary[] }) {
  const [selected, setSelected] = useState(0);

  if (featured.length === 0) return null;
  const spotlight = featured[selected % featured.length];

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
        <Link
          href={`/title/${spotlight.slug}`}
          className="hidden w-full max-w-[220px] md:block"
        >
          <TitlePoster
            name={spotlight.name}
            hue={spotlight.hue}
            type={spotlight.type}
            posterUrl={spotlight.poster_url}
            size="lg"
          />
        </Link>

        <div className="flex flex-col justify-center gap-4">
          <div className="flex items-center gap-2">
            <Badge className="w-fit gap-1 bg-primary text-primary-foreground hover:bg-primary">
              <Tent className="size-3" /> Center ring pick
            </Badge>
            {featured.length > 1 && (
              <button
                type="button"
                onClick={() => setSelected((s) => (s + 1) % featured.length)}
                aria-label="Show the next center ring pick"
                className="inline-flex size-6 items-center justify-center rounded-full border border-primary text-primary transition hover:bg-primary hover:text-primary-foreground"
              >
                <ChevronRight className="size-3.5" />
              </button>
            )}
          </div>
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
              {/* Plain anchor, not next/link: Link's client-side transition scrolls to
                  the top of the page even for a same-page hash, which cancels the jump. */}
              <a href="#browse">Step right up</a>
            </Button>
          </div>
        </div>
      </div>

      {featured.length > 1 && (
        <div className="mx-auto max-w-6xl px-4 pb-8 sm:px-6">
          <div className="flex gap-4 overflow-x-auto pb-2">
            {featured.map((t, i) => (
              <button
                key={t.id}
                type="button"
                onClick={() => setSelected(i)}
                aria-current={i === selected}
                aria-label={`Show ${t.name} in the center ring`}
                className={cn(
                  "w-24 shrink-0 text-left transition hover:-translate-y-1 sm:w-28",
                  i === selected && "-translate-y-1"
                )}
              >
                <TitlePoster
                  name={t.name}
                  hue={t.hue}
                  type={t.type}
                  posterUrl={t.poster_url}
                  size="sm"
                  className={cn(
                    "transition ring-offset-2 ring-offset-background",
                    i === selected ? "ring-2 ring-primary" : "opacity-80"
                  )}
                />
                <p
                  className={cn(
                    "mt-1 truncate text-xs",
                    i === selected ? "font-medium text-primary" : "text-muted-foreground"
                  )}
                >
                  {t.name}
                </p>
              </button>
            ))}
          </div>
        </div>
      )}
    </section>
  );
}
