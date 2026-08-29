---
title: "2026-08-21 Agent Science Founding"
---

# 2026-08-21 Agent Science Founding

Record of the founding of `agent-science-services-section` and the
`social-science-services-section` relocation into it as its first
subsection, executed 2026-08-21 at the owner's direction.

## Founding

The Agent was recognized by the owner as the top-level entity of this
research program. Science-side, that recognition is expressed as a new
section:

```
lib/emsenn/services/561-group/services/science-services-section/services/agent-science-services-section/
```

defining agent science as **the science of agents** — agents and their
activities as an object of scientific study. This is the paired,
science-side counterpart to the engineering-side move recorded the same day
in `agent-computer-system-services-section/data/records/2026-08-21-agent-computer-system-relocation.md`
(the "engineering spine" rename, `relational-computer-system-services-section`
→ `agent-computer-system-services-section`, nine packages: `relating`,
`animating`, `communicating`, `knowing`, `playing`, `computing`, `gaming`,
`socializing`, `organizing`).

New files:

- `agent-science-services-section/README.md`
- `agent-science-services-section/package.json`
  (`@lenticule-science/agent-science-services-section`)

## Move (via `git mv`)

`social-science-services-section` is recognized as agent science's first
subsection — social science is the study of agents in relation:

```
science-services-section/services/social-science-services-section
  → science-services-section/services/agent-science-services-section/services/social-science-services-section
```

One `git mv` of the whole directory tree; no files inside
`social-science-services-section` were rewritten.

## Live references updated

Per witness discipline, only current/live material naming the old direct
path (`science-services-section/services/social-science-services-section`)
was updated; dated notes, `lib/legacy/`, and `data/records/` content were
left untouched:

- `science-services-section/README.md` — the top-level services list:
  removed the standalone `social-science-services-section` bullet, added an
  `agent-science-services-section` bullet (founding note, pointer to the
  paired engineering section, and the social-science subdomain summary
  folded in as its first-subsection description).
- Two duplicate copies of a live FOAM glossary topic doc
  (`.../foam-services-section/content/text/glossary/topics/what-foam-is-and-is-not.md`,
  present both directly under `biological-science-services-section` and
  again nested under `physical-science-services-section/services/biological-science-services-section`
  — a pre-existing, unrelated duplication not addressed by this task) —
  each had one relative link into
  `social-science-services-section/.../political-economy-services-section/.../commons.md`;
  both links were updated to route through the new
  `agent-science-services-section/services/social-science-services-section/`
  path and confirmed to resolve.

No repo-wide `package.json`, `tsconfig*.json`, or root workspace config was
found referencing the old path (checked with a repo-wide grep restricted to
those file types); none needed updating.

## Coexistence: `agent-services-section` (recorded debt)

A pre-existing, differently-named section already lives directly under
`science-services-section/services/`:

```
science-services-section/services/agent-services-section/
  services/play-services-section/
    services/game-science-services-section/  (Ilinx Research: ludics, regime taxonomy, market teardowns)
```

This section is *also* "scientific work concerning agents and their
activities" — i.e., it and the new `agent-science-services-section` name
overlapping territory. This task's instructions were scoped to founding
`agent-science-services-section` and relocating
`social-science-services-section` into it only; `agent-services-section`
was **not** touched, renamed, or merged. The naming collision between
`agent-services-section` and `agent-science-services-section` is recorded
here as known debt and raised for owner attention in this task's
accompanying survey/proposal report; resolving it (e.g. folding
`agent-services-section`'s subtree into `agent-science-services-section`,
or renaming one) is left for a separate, deliberate move.

## Pre-existing unrelated modifications

The working tree already carried unrelated, unstaged modifications
throughout the repo, including elsewhere under `science-services-section`.
None of that unrelated content was authored, staged, or committed by this
task; only the exact paths listed above were staged.
