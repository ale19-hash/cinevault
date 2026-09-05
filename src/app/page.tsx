import { Hero } from "@/components/site/hero";
import { BrowseSection } from "@/components/site/browse-section";
import { getAllTitles, getFeaturedTitles, getGenres } from "@/lib/queries";

export default async function Home() {
  const [titles, featured, genres] = await Promise.all([
    getAllTitles(),
    getFeaturedTitles(),
    getGenres(),
  ]);

  return (
    <>
      <Hero featured={featured} />
      <BrowseSection titles={titles} genres={genres} />
    </>
  );
}
