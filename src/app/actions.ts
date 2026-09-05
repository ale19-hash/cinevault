"use server";

import { revalidatePath } from "next/cache";
import { createClient } from "@/lib/supabase/server";

export interface SubmitReviewState {
  status: "idle" | "success" | "error";
  message?: string;
}

/**
 * Server Action backing the "Leave a review" dialog on a title's page.
 * Inserts directly into `reviews`; RLS on that table only allows inserts
 * (no update/delete), so this is safe to expose to anonymous visitors.
 */
export async function submitReview(
  titleId: string,
  slug: string,
  _prevState: SubmitReviewState,
  formData: FormData
): Promise<SubmitReviewState> {
  const authorName = String(formData.get("author_name") ?? "").trim();
  const ratingRaw = String(formData.get("rating") ?? "");
  const body = String(formData.get("body") ?? "").trim();
  const rating = Number(ratingRaw);

  if (authorName.length < 1 || authorName.length > 60) {
    return { status: "error", message: "Name must be 1-60 characters." };
  }
  if (body.length < 1 || body.length > 1000) {
    return { status: "error", message: "Review must be 1-1000 characters." };
  }
  if (Number.isNaN(rating) || rating < 0 || rating > 10) {
    return { status: "error", message: "Rating must be between 0 and 10." };
  }

  const supabase = await createClient();
  const { error } = await supabase.from("reviews").insert({
    title_id: titleId,
    author_name: authorName,
    rating,
    body,
  });

  if (error) {
    return { status: "error", message: "Could not save your review. Please try again." };
  }

  revalidatePath(`/title/${slug}`);
  return { status: "success", message: "Thanks for your review!" };
}
