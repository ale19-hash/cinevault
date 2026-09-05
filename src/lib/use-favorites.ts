"use client";

import { useCallback, useSyncExternalStore } from "react";

const STORAGE_KEY = "cinevault:favorites";
const CHANGE_EVENT = "cinevault:favorites-changed";
const EMPTY_SNAPSHOT: string[] = [];

// Module-level cache so getSnapshot can return a stable reference between
// renders instead of re-parsing (and re-allocating) on every call.
let cache: string[] | null = null;

function readFromStorage(): string[] {
  try {
    const raw = window.localStorage.getItem(STORAGE_KEY);
    return raw ? (JSON.parse(raw) as string[]) : [];
  } catch {
    return [];
  }
}

function writeToStorage(slugs: string[]) {
  try {
    window.localStorage.setItem(STORAGE_KEY, JSON.stringify(slugs));
  } catch {
    // Storage unavailable (private browsing, disabled cookies, etc.) — no-op.
  }
}

function getSnapshot(): string[] {
  if (cache === null) cache = readFromStorage();
  return cache;
}

function getServerSnapshot(): string[] {
  return EMPTY_SNAPSHOT;
}

function subscribe(onStoreChange: () => void) {
  const handleChange = () => {
    cache = readFromStorage();
    onStoreChange();
  };
  window.addEventListener(CHANGE_EVENT, handleChange);
  window.addEventListener("storage", handleChange);
  return () => {
    window.removeEventListener(CHANGE_EVENT, handleChange);
    window.removeEventListener("storage", handleChange);
  };
}

/**
 * Per-browser favorites list, kept in localStorage. There's no user account
 * system in this project, so "favoriting" is a lightweight, device-local
 * bookmark rather than data synced through Supabase. Built on
 * `useSyncExternalStore` so reads stay hydration-safe without an
 * effect-driven setState round trip.
 */
export function useFavorites() {
  const favorites = useSyncExternalStore(subscribe, getSnapshot, getServerSnapshot);

  const toggle = useCallback((slug: string) => {
    const current = getSnapshot();
    const next = current.includes(slug)
      ? current.filter((s) => s !== slug)
      : [...current, slug];
    cache = next;
    writeToStorage(next);
    window.dispatchEvent(new Event(CHANGE_EVENT));
  }, []);

  const isFavorite = useCallback((slug: string) => favorites.includes(slug), [favorites]);

  return { favorites, isFavorite, toggle };
}
