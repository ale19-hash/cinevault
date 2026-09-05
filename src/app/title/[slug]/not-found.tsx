import Link from "next/link";
import { Film } from "lucide-react";
import { Button } from "@/components/ui/button";

export default function TitleNotFound() {
  return (
    <div className="mx-auto flex max-w-lg flex-col items-center gap-4 px-4 py-24 text-center">
      <Film className="size-10 text-muted-foreground/40" />
      <h1 className="font-heading text-2xl font-semibold">Title not found</h1>
      <p className="text-sm text-muted-foreground">
        We couldn&apos;t find that title in the vault. It may have been removed or the link is wrong.
      </p>
      <Button asChild>
        <Link href="/">Back to browsing</Link>
      </Button>
    </div>
  );
}
