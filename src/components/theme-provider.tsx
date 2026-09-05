"use client";

import { ThemeProvider as NextThemesProvider } from "next-themes";
import type { ComponentProps } from "react";

/** CineVault is dark-themed only — this just wires shadcn's toast styling to it. */
export function ThemeProvider({
  children,
  ...props
}: ComponentProps<typeof NextThemesProvider>) {
  return (
    <NextThemesProvider forcedTheme="dark" attribute="class" {...props}>
      {children}
    </NextThemesProvider>
  );
}
