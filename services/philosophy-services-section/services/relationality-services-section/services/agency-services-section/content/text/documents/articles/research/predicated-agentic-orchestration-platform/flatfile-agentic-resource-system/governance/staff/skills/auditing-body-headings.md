---
name: auditing-body-headings
description: Skill for auditing whether any entity body contains a level-1 heading, in violation of theory-encoding.md R13.
title: auditing-body-headings
---

## What this checks

R13 of theory-encoding.md: no entity body may contain a level-1 heading (`# ...
`).

The canonical name of an entity is in `name:` frontmatter (R9).
A body H1 that repeats it is redundant and misleads processors that treat the first heading as the document title.
H2 and deeper headings are permitted in the body.

## Why no H1

In a FARS substrate, `name:` is the machine-readable title — the authoritative label for the entity.
A `# Title` heading in the body is a presentation artifact from single-file markdown conventions where frontmatter did not exist.
Since FARS requires frontmatter (R9), the body H1 is never needed.

Processors that want to render a title should read `name:` from frontmatter, not parse the first `# ` line from the body.
A body H1 creates two sources of truth for the entity's name — the frontmatter wins, and the H1 creates confusion about which is authoritative.

## How to fix a violation

Remove the `# Title` line from the body.
The body should begin with a paragraph or an H2 heading.

If the H1 carried information not in the `name:` key (e.g., a longer human title), consider whether that information belongs in `description:` or in an H2 section in the body.

## How to run

```
node governance/staff/skills/auditing-theory-conformance/scripts/audit-theory.mjs --root <theory-root> | grep R13
```

## When to re-run

- After migrating files from other formats that included H1 headings.
- After creating a new entity — check that the scaffold does not accidentally include an H1.

## Note on skill files themselves

The existing skill files under `governance/skills/` were written before R13 was specified and may contain H1 headings.
They are entities in $E$ and are subject to R13.
The audit will flag them; fix them the same way as any other entity.
