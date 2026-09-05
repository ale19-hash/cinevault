"use client";

import { Heart } from "lucide-react";
import { Button } from "@/components/ui/button";
import { cn } from "@/lib/utils";
import { useFavorites } from "@/lib/use-favorites";

export function FavoriteButton({
  slug,
  className,
  variant = "icon",
}: {
  slug: string;
  className?: string;
  variant?: "icon" | "full";
}) {
  const { isFavorite, toggle } = useFavorites();
  const active = isFavorite(slug);

  if (variant === "full") {
    return (
      <Button
        variant={active ? "default" : "outline"}
        onClick={() => toggle(slug)}
        className={className}
      >
        <Heart className={cn("size-4", active && "fill-current")} />
        {active ? "Saved to favorites" : "Add to favorites"}
      </Button>
    );
  }

  return (
    <button
      type="button"
      onClick={(e) => {
        e.preventDefault();
        e.stopPropagation();
        toggle(slug);
      }}
      aria-label={active ? "Remove from favorites" : "Add to favorites"}
      aria-pressed={active}
      className={cn(
        "flex size-8 items-center justify-center rounded-full bg-black/55 text-white/80 backdrop-blur-sm transition hover:text-white",
        className
      )}
    >
      <Heart className={cn("size-4", active && "fill-rose-500 text-rose-500")} />
    </button>
  );
}
