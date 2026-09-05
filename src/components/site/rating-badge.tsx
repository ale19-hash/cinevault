import { cn } from "@/lib/utils";

/** A little ticket stub — dashed tear-line and all — showing the critic score. */
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
        "ticket-perforation inline-flex items-center rounded-r-md bg-secondary py-0.5 pl-1.5 pr-2 text-xs font-bold text-secondary-foreground shadow-sm",
        className
      )}
    >
      {score.toFixed(1)}
    </span>
  );
}
