"use client";

import { useMemo, useState } from "react";
import { Search } from "lucide-react";
import { Input } from "@/components/ui/input";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import { Tabs, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { TitleCard } from "@/components/site/title-card";
import type { TitleSummary, TitleType } from "@/lib/types";

type TypeFilter = "all" | TitleType;

export function BrowseSection({
  titles,
  genres,
}: {
  titles: TitleSummary[];
  genres: string[];
}) {
  const [query, setQuery] = useState("");
  const [genre, setGenre] = useState<string>("all");
  const [type, setType] = useState<TypeFilter>("all");

  const filtered = useMemo(() => {
    const q = query.trim().toLowerCase();
    return titles.filter((t) => {
      if (type !== "all" && t.type !== type) return false;
      if (genre !== "all" && !t.genres.includes(genre)) return false;
      if (q && !t.name.toLowerCase().includes(q) && !t.director.toLowerCase().includes(q)) {
        return false;
      }
      return true;
    });
  }, [titles, query, genre, type]);

  return (
    <section id="browse" className="mx-auto max-w-6xl px-4 py-10 sm:px-6">
      <div className="mb-6 flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between">
        <h2 className="font-heading text-2xl font-semibold">Browse the vault</h2>
        <div className="flex flex-col gap-2 sm:flex-row">
          <div className="relative">
            <Search className="pointer-events-none absolute left-2.5 top-1/2 size-4 -translate-y-1/2 text-muted-foreground" />
            <Input
              value={query}
              onChange={(e) => setQuery(e.target.value)}
              placeholder="Search title or director…"
              className="w-full pl-8 sm:w-64"
            />
          </div>
          <Select value={genre} onValueChange={setGenre}>
            <SelectTrigger className="w-full sm:w-40">
              <SelectValue placeholder="Genre" />
            </SelectTrigger>
            <SelectContent>
              <SelectItem value="all">All genres</SelectItem>
              {genres.map((g) => (
                <SelectItem key={g} value={g}>
                  {g}
                </SelectItem>
              ))}
            </SelectContent>
          </Select>
        </div>
      </div>

      <Tabs value={type} onValueChange={(v) => setType(v as TypeFilter)} className="mb-6">
        <TabsList>
          <TabsTrigger value="all">All</TabsTrigger>
          <TabsTrigger value="movie">Movies</TabsTrigger>
          <TabsTrigger value="tv">TV Shows</TabsTrigger>
        </TabsList>
      </Tabs>

      {filtered.length === 0 ? (
        <p className="py-16 text-center text-sm text-muted-foreground">
          Nothing matches those filters. Try widening your search.
        </p>
      ) : (
        <div className="grid grid-cols-2 gap-x-4 gap-y-8 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-6">
          {filtered.map((title) => (
            <TitleCard key={title.id} title={title} />
          ))}
        </div>
      )}
    </section>
  );
}
