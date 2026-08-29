---
name: listing-skills
description: Lists skills, optionally scoped to a thing's path, and cross-checks against the registry. Use to discover what skills exist before choosing an approach or checking for stale registry entries.
---

## Requirements

- Access to `content/**/skills/` and `.claude/skills/registry.md`
- Optional: a thing path to scope the search

## Steps

1. If a thing path is given, find skills under that path: `find content/{path}/skills -name "SKILL.md"`.
2. If no path is given, find all skills: `find content -path "*/skills/*/SKILL.md" | sort`.
3. For each skill found, display: id, description, runtime, and file path.
4. Check `.claude/skills/registry.md` for entries that do not correspond to a file on disk (stale entries) and report them.

## Outcomes

- A list of skills with their id, description, runtime, and path is returned.
- Stale registry entries (listed but missing on disk) are flagged.
- If scoped to a path, only skills under that path are returned.
