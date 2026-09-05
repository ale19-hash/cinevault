import type { Metadata } from "next";
import { notFound } from "next/navigation";
import { Clock, Globe2, Star, Tv2, User } from "lucide-react";
import { Badge } from "@/components/ui/badge";
import { Separator } from "@/components/ui/separator";
import { TitlePoster } from "@/components/site/title-poster";
import { FavoriteButton } from "@/components/site/favorite-button";
import { CastRow } from "@/components/site/cast-row";
import { ReviewList } from "@/components/site/review-list";
import { ReviewDialog } from "@/components/site/review-dialog";
import { getTitleBySlug } from "@/lib/queries";

type Params = Promise<{ slug: string }>;

export async function generateMetadata({ params }: { params: Params }): Promise<Metadata> {
  const { slug } = await params;
  const title = await getTitleBySlug(slug);
  if (!title) return { title: "Not found — CineVault" };
  return {
    title: `${title.name} (${title.release_year}) — CineVault`,
    description: title.synopsis,
  };
}

export default async function TitlePage({ params }: { params: Params }) {
  const { slug } = await params;
  const title = await getTitleBySlug(slug);
  if (!title) notFound();

  const avgReviewRating =
    title.reviews.length > 0
      ? title.reviews.reduce((sum, r) => sum + r.rating, 0) / title.reviews.length
      : null;

  return (
    <div className="mx-auto max-w-5xl px-4 py-10 sm:px-6">
      <div className="grid gap-8 md:grid-cols-[240px_1fr]">
        <div className="mx-auto w-full max-w-[240px] md:mx-0">
          <TitlePoster
            name={title.name}
            hue={title.hue}
            type={title.type}
            posterUrl={title.poster_url}
            size="lg"
          />
        </div>

        <div className="space-y-4">
          <div>
            <div className="flex flex-wrap items-center gap-2">
              {title.genres.map((g) => (
                <Badge key={g} variant="secondary">
                  {g}
                </Badge>
              ))}
            </div>
            <h1 className="mt-2 font-heading text-3xl font-bold tracking-tight sm:text-4xl">
              {title.name}
            </h1>
            {title.tagline && (
              <p className="mt-1 italic text-muted-foreground">“{title.tagline}”</p>
            )}
          </div>

          <div className="flex flex-wrap items-center gap-x-5 gap-y-2 text-sm text-muted-foreground">
            <span className="inline-flex items-center gap-1 text-base font-bold text-primary">
              <Star className="size-4 fill-secondary text-secondary" />
              {title.critic_score.toFixed(1)}
            </span>
            <span>{title.release_year}</span>
            <span className="inline-flex items-center gap-1">
              <User className="size-4" /> {title.director}
            </span>
            <span className="inline-flex items-center gap-1">
              <Globe2 className="size-4" /> {title.language} · {title.country}
            </span>
            {title.type === "tv" ? (
              <span className="inline-flex items-center gap-1">
                <Tv2 className="size-4" />
                {title.seasons} {title.seasons === 1 ? "season" : "seasons"}
              </span>
            ) : (
              <span className="inline-flex items-center gap-1">
                <Clock className="size-4" />
                {title.runtime_minutes} min
              </span>
            )}
          </div>

          <p className="max-w-2xl leading-relaxed text-foreground/90">{title.synopsis}</p>

          <FavoriteButton slug={title.slug} variant="full" />
        </div>
      </div>

      {title.cast.length > 0 && (
        <>
          <Separator className="my-8" />
          <section>
            <h2 className="mb-4 font-heading text-xl font-semibold">Cast</h2>
            <CastRow cast={title.cast} />
          </section>
        </>
      )}

      <Separator className="my-8" />
      <section>
        <div className="mb-4 flex items-center justify-between gap-4">
          <h2 className="font-heading text-xl font-semibold">
            Reviews
            {avgReviewRating !== null && (
              <span className="ml-2 text-sm font-normal text-muted-foreground">
                ({title.reviews.length} · avg {avgReviewRating.toFixed(1)})
              </span>
            )}
          </h2>
          <ReviewDialog titleId={title.id} slug={title.slug} />
        </div>
        <ReviewList reviews={title.reviews} />
      </section>
    </div>
  );
}
