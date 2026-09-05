import Link from "next/link";
import { Clapperboard, Heart } from "lucide-react";

export function SiteHeader() {
  return (
    <header className="sticky top-0 z-40 border-b border-white/10 bg-background/80 backdrop-blur-md">
      <div className="mx-auto flex max-w-6xl items-center justify-between px-4 py-3 sm:px-6">
        <Link href="/" className="flex items-center gap-2 font-heading text-lg font-bold tracking-tight">
          <Clapperboard className="size-5 text-amber-400" />
          CineVault
        </Link>
        <nav className="flex items-center gap-4 text-sm">
          <Link href="/#browse" className="text-muted-foreground transition hover:text-foreground">
            Browse
          </Link>
          <Link
            href="/favorites"
            className="inline-flex items-center gap-1 text-muted-foreground transition hover:text-foreground"
          >
            <Heart className="size-4" />
            <span className="hidden sm:inline">Favorites</span>
          </Link>
        </nav>
      </div>
    </header>
  );
}
