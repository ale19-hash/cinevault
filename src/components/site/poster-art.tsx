import { Tent, Popcorn, Tv } from "lucide-react";
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
 * Generated "poster" art, shown only when a title has no real poster on file
 * (or the remote image fails to load) — a little circus-tent card in the
 * CineVault big-top palette, tinted per-title by the stored `hue`.
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
  const Icon = type === "tv" ? Tv : Tent;
  const iconSize = size === "lg" ? "size-12" : size === "md" ? "size-8" : "size-6";
  const textSize = size === "lg" ? "text-4xl" : size === "md" ? "text-2xl" : "text-lg";

  return (
    <div
      className={cn(
        "relative flex aspect-[2/3] w-full flex-col items-center justify-center overflow-hidden rounded-lg border-2 border-primary bg-[#fff8ec] shadow-lg",
        className
      )}
      style={{ backgroundColor: `hsl(${hue} 45% 95%)` }}
      aria-hidden="true"
    >
      {/* circus-tent bunting across the top */}
      <div className="big-top-stripes absolute inset-x-0 top-0 h-5" />

      <div className="flex flex-col items-center gap-2 px-6 text-center">
        <Icon className="size-8 text-primary" strokeWidth={1.75} />
        <span className={cn(textSize, "font-heading tracking-wide text-primary")}>
          {initials(name)}
        </span>
      </div>

      <Popcorn
        className={cn(iconSize, "absolute -bottom-2 -right-2 rotate-12 text-secondary/70")}
        strokeWidth={1.5}
      />
    </div>
  );
}
