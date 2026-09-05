import { Popcorn } from "lucide-react";

export function SiteFooter() {
  return (
    <footer className="mt-auto border-t-4 border-primary">
      <div className="big-top-stripes h-1.5 w-full" aria-hidden="true" />
      <div className="mx-auto max-w-6xl px-4 py-8 text-center text-xs text-muted-foreground sm:px-6">
        <p className="inline-flex items-center gap-1.5 justify-center font-medium text-foreground">
          <Popcorn className="size-4 text-secondary" />
          CineVault — a big-top catalog of movies &amp; TV, built with Next.js, shadcn/ui, and Supabase.
        </p>
        <p className="mt-1">Ratings and cast data are illustrative and sourced for demo purposes.</p>
      </div>
    </footer>
  );
}
