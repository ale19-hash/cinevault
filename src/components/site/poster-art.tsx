import { Clapperboard, Film, Tv } from "lucide-react";
import { cn } from "@/lib/utils";
import type { TitleType } from "@/lib/types";

function initials(name: string) {
  return name
    .split(/\s+/)
    .filter((w) => /[a-zA-Z0-9]/.test(w[0]))
    .slice(0, 2)
    .map((w) => w[0]!.toUpperCase())
    .join("");
}

/**
 * Generated "poster" art — since the catalog has no licensed images, every
 * title gets a deterministic gradient (from its stored `hue`) styled like a
 * strip of film, with the type icon and initials standing in for artwork.
 */
export function PosterArt({
  name,
  hue,
  type,
  className,
  size = "md",
}: {
  name: string;
  hue: number;
  type: TitleType;
  className?: string;
  size?: "sm" | "md" | "lg";
}) {
  const Icon = type === "tv" ? Tv : Film;
  const iconSize = size === "lg" ? "size-12" : size === "md" ? "size-8" : "size-6";
  const textSize = size === "lg" ? "text-4xl" : size === "md" ? "text-2xl" : "text-lg";

  return (
    <div
      className={cn(
        "relative flex aspect-[2/3] w-full items-center justify-center overflow-hidden rounded-lg border border-white/10 shadow-lg",
        className
      )}
      style={{
        background: `linear-gradient(155deg, hsl(${hue} 65% 24%) 0%, hsl(${hue} 70% 12%) 55%, hsl(${(hue + 40) % 360} 60% 8%) 100%)`,
      }}
      aria-hidden="true"
    >
      {/* film-strip perforations */}
      <div className="absolute inset-y-0 left-0 flex w-3 flex-col items-center justify-around bg-black/25 py-2">
        {Array.from({ length: 8 }).map((_, i) => (
          <span key={i} className="h-2 w-1.5 rounded-[1px] bg-black/60" />
        ))}
      </div>
      <div className="absolute inset-y-0 right-0 flex w-3 flex-col items-center justify-around bg-black/25 py-2">
        {Array.from({ length: 8 }).map((_, i) => (
          <span key={i} className="h-2 w-1.5 rounded-[1px] bg-black/60" />
        ))}
      </div>

      <div className="flex flex-col items-center gap-2 px-6 text-center">
        <Icon className={cn(iconSize, "text-white/25")} strokeWidth={1.5} />
        <span className={cn(textSize, "font-heading font-semibold tracking-wide text-white/85")}>
          {initials(name)}
        </span>
      </div>

      <Clapperboard className="absolute -bottom-3 -right-3 size-16 rotate-12 text-black/10" strokeWidth={1} />
    </div>
  );
}
