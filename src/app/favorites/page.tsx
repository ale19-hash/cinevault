import { FavoritesGrid } from "@/components/site/favorites-grid";
import { getAllTitles } from "@/lib/queries";

export const metadata = { title: "Your favorites — CineVault" };

export default async function FavoritesPage() {
  const titles = await getAllTitles();

  return (
    <div className="mx-auto max-w-6xl px-4 py-10 sm:px-6">
      <h1 className="mb-1 font-heading text-2xl font-semibold">Your favorites</h1>
      <p className="mb-8 text-sm text-muted-foreground">
        Saved on this device — favorites live in your browser, not an account.
      </p>
      <FavoritesGrid titles={titles} />
    </div>
  );
}
