import { Avatar, AvatarFallback } from "@/components/ui/avatar";
import type { CastEntry } from "@/lib/types";

function initials(name: string) {
  return name
    .split(/\s+/)
    .filter(Boolean)
    .slice(0, 2)
    .map((w) => w[0]?.toUpperCase())
    .join("");
}

export function CastRow({ cast }: { cast: CastEntry[] }) {
  if (cast.length === 0) return null;

  return (
    <div className="flex gap-4 overflow-x-auto pb-2">
      {cast.map((member) => (
        <div key={member.name} className="flex w-20 shrink-0 flex-col items-center gap-2 text-center">
          <Avatar className="size-14">
            <AvatarFallback className="bg-secondary text-sm font-medium">
              {initials(member.name)}
            </AvatarFallback>
          </Avatar>
          <div>
            <p className="truncate text-xs font-medium">{member.name}</p>
            <p className="truncate text-[11px] text-muted-foreground">{member.character_name}</p>
          </div>
        </div>
      ))}
    </div>
  );
}
