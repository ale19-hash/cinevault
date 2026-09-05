import { Star } from "lucide-react";
import { cn } from "@/lib/utils";

export function RatingBadge({
  score,
  className,
}: {
  score: number;
  className?: string;
}) {
  return (
    <span
      className={cn(
        "inline-flex items-center gap-1 rounded-full bg-black/60 px-2 py-0.5 text-xs font-semibold text-amber-300 backdrop-blur-sm",
        className
      )}
    >
      <Star className="size-3 fill-amber-300 text-amber-300" />
      {score.toFixed(1)}
    </span>
  );
}
