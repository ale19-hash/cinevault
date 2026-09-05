import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/avatar";
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
    <div className="flex gap-5 overflow-x-auto pb-2">
      {cast.map((member) => (
        <div key={member.name} className="flex w-24 shrink-0 flex-col items-center gap-2 text-center">
          <Avatar className="size-16">
            {member.photo_url && <AvatarImage src={member.photo_url} alt={member.name} />}
            <AvatarFallback className="bg-secondary text-sm font-medium text-secondary-foreground">
              {initials(member.name)}
            </AvatarFallback>
          </Avatar>
          <div className="w-full space-y-0.5">
            <p className="truncate text-xs font-medium leading-tight">{member.name}</p>
            <p className="line-clamp-2 text-[11px] leading-tight text-muted-foreground">
              {member.character_name}
            </p>
          </div>
        </div>
      ))}
    </div>
  );
}
