import Link from "next/link";
import { Popcorn, Heart } from "lucide-react";

export function SiteHeader() {
  return (
    <header className="sticky top-0 z-40 border-b-4 border-primary bg-background/95 backdrop-blur-md">
      <div className="mx-auto flex max-w-6xl items-center justify-between px-4 py-3 sm:px-6">
        <Link href="/" className="flex items-center gap-2 font-heading text-lg tracking-wide text-primary">
          <Popcorn className="size-6 text-secondary" strokeWidth={2} />
          CineVault
        </Link>
        <nav className="flex items-center gap-4 text-sm font-medium">
          <Link href="/#browse" className="text-muted-foreground transition hover:text-primary">
            Browse
          </Link>
          <Link
            href="/favorites"
            className="inline-flex items-center gap-1 text-muted-foreground transition hover:text-primary"
          >
            <Heart className="size-4" />
            <span className="hidden sm:inline">Favorites</span>
          </Link>
        </nav>
      </div>
      <div className="big-top-stripes h-1.5 w-full" aria-hidden="true" />
    </header>
  );
}
