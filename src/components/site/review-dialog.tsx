"use client";

import { useRef, useState, useTransition } from "react";
import { toast } from "sonner";
import { PenLine } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Textarea } from "@/components/ui/textarea";
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogFooter,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
} from "@/components/ui/dialog";
import { submitReview, type SubmitReviewState } from "@/app/actions";

const initialState: SubmitReviewState = { status: "idle" };

export function ReviewDialog({ titleId, slug }: { titleId: string; slug: string }) {
  const [open, setOpen] = useState(false);
  const [pending, startTransition] = useTransition();
  const formRef = useRef<HTMLFormElement>(null);

  function handleSubmit(formData: FormData) {
    startTransition(async () => {
      const result = await submitReview(titleId, slug, initialState, formData);
      if (result.status === "success") {
        toast.success(result.message ?? "Review posted!");
        formRef.current?.reset();
        setOpen(false);
      } else if (result.status === "error") {
        toast.error(result.message ?? "Something went wrong.");
      }
    });
  }

  return (
    <Dialog open={open} onOpenChange={setOpen}>
      <DialogTrigger asChild>
        <Button variant="outline">
          <PenLine className="size-4" />
          Write a review
        </Button>
      </DialogTrigger>
      <DialogContent>
        <form ref={formRef} action={handleSubmit}>
          <DialogHeader>
            <DialogTitle>Leave a review</DialogTitle>
            <DialogDescription>
              Your review is posted publicly and can&apos;t be edited afterward.
            </DialogDescription>
          </DialogHeader>

          <div className="grid gap-4 py-4">
            <div className="grid gap-2">
              <Label htmlFor="author_name">Your name</Label>
              <Input id="author_name" name="author_name" maxLength={60} required placeholder="e.g. FilmBuff42" />
            </div>
            <div className="grid gap-2">
              <Label htmlFor="rating">Rating (0-10)</Label>
              <Input
                id="rating"
                name="rating"
                type="number"
                min={0}
                max={10}
                step={0.1}
                required
                placeholder="8.5"
              />
            </div>
            <div className="grid gap-2">
              <Label htmlFor="body">Review</Label>
              <Textarea
                id="body"
                name="body"
                maxLength={1000}
                required
                rows={4}
                placeholder="What did you think?"
              />
            </div>
          </div>

          <DialogFooter>
            <Button type="submit" disabled={pending}>
              {pending ? "Posting…" : "Post review"}
            </Button>
          </DialogFooter>
        </form>
      </DialogContent>
    </Dialog>
  );
}
