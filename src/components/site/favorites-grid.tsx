"use client";

import Link from "next/link";
import { Heart } from "lucide-react";
import { Button } from "@/components/ui/button";
import { TitleCard } from "@/components/site/title-card";
import { useFavorites } from "@/lib/use-favorites";
import type { TitleSummary } from "@/lib/types";

export function FavoritesGrid({ titles }: { titles: TitleSummary[] }) {
  const { favorites } = useFavorites();
  const saved = titles.filter((t) => favorites.includes(t.slug));

  if (saved.length === 0) {
    return (
      <div className="flex flex-col items-center gap-4 py-20 text-center">
        <Heart className="size-10 text-muted-foreground/40" />
        <div>
          <p className="font-medium">No favorites yet</p>
          <p className="text-sm text-muted-foreground">
            Tap the heart on any title to save it here. It&apos;s stored in this browser only.
          </p>
        </div>
        <Button asChild variant="outline">
          <Link href="/#browse">Browse the vault</Link>
        </Button>
      </div>
    );
  }

  return (
    <div className="grid grid-cols-2 gap-x-4 gap-y-8 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-6">
      {saved.map((title) => (
        <TitleCard key={title.id} title={title} />
      ))}
    </div>
  );
}
