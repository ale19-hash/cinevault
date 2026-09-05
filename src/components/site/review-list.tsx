import { Star } from "lucide-react";
import type { Review } from "@/lib/types";

export function ReviewList({ reviews }: { reviews: Review[] }) {
  if (reviews.length === 0) {
    return (
      <p className="text-sm text-muted-foreground">
        No reviews yet — be the first to share what you thought.
      </p>
    );
  }

  return (
    <ul className="space-y-4">
      {reviews.map((review) => (
        <li key={review.id} className="rounded-lg border border-border bg-card p-4">
          <div className="flex items-center justify-between gap-3">
            <p className="font-medium">{review.author_name}</p>
            <span className="inline-flex items-center gap-1 text-sm font-bold text-primary">
              <Star className="size-3.5 fill-secondary text-secondary" />
              {review.rating.toFixed(1)}
            </span>
          </div>
          <p className="mt-2 text-sm text-muted-foreground">{review.body}</p>
          <p className="mt-2 text-xs text-muted-foreground/60">
            {new Date(review.created_at).toLocaleDateString(undefined, {
              year: "numeric",
              month: "short",
              day: "numeric",
            })}
          </p>
        </li>
      ))}
    </ul>
  );
}
