"use client";

import { ThemeProvider as NextThemesProvider } from "next-themes";
import type { ComponentProps } from "react";

/** CineVault is light-themed only ("Big Top" palette) — this wires shadcn's toast styling to it. */
export function ThemeProvider({
  children,
  ...props
}: ComponentProps<typeof NextThemesProvider>) {
  return (
    <NextThemesProvider forcedTheme="light" attribute="class" {...props}>
      {children}
    </NextThemesProvider>
  );
}
