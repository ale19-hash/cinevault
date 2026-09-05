"use client";

import { useState } from "react";
import Image from "next/image";
import { cn } from "@/lib/utils";
import { PosterArt } from "@/components/site/poster-art";
import type { TitleType } from "@/lib/types";

/**
 * Renders a title's real poster image when one is on file, falling back to
 * the generated film-strip art (see PosterArt) when there isn't one, or if
 * the remote image fails to load.
 */
export function TitlePoster({
  name,
  hue,
  type,
  posterUrl,
  className,
  size = "md",
}: {
  name: string;
  hue: number;
  type: TitleType;
  posterUrl: string | null;
  className?: string;
  size?: "sm" | "md" | "lg";
}) {
  const [errored, setErrored] = useState(false);

  if (!posterUrl || errored) {
    return <PosterArt name={name} hue={hue} type={type} className={className} size={size} />;
  }

  return (
    <div
      className={cn(
        "relative aspect-[2/3] w-full overflow-hidden rounded-lg border-2 border-primary bg-muted shadow-lg",
        className
      )}
    >
      <Image
        src={posterUrl}
        alt={`${name} poster`}
        fill
        sizes="(min-width: 1024px) 220px, (min-width: 640px) 25vw, 40vw"
        className="object-cover"
        onError={() => setErrored(true)}
      />
    </div>
  );
}
