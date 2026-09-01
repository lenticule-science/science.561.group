---
title: "Decision: Canonical paths are physical paths"
date-created: 2026-03-09T00:00:00
authors:
  - emsenn
  - claude
type: decision
status: accepted
keywords:
  - DirectoryOrganization
  - AgentialSemioverse
---

## Context

The repository had two path conventions in use:

1. **Logical paths**: `technology/specifications/agential-semioverse-repository/`,
   `technology/specifications/semiotic-endeavor/`, etc. Used in AGENTS.md,
   the conceptual dependency map, and various references.

2. **Physical paths**: `mathematics/objects/universes/agential-semioverse/specifications/agential-semioverse-repository/`,
   `mathematics/objects/universes/agential-semioverse/concepts/semiotic-endeavor/`,
   etc. Where the files actually live on disk.

The logical paths treated `technology/specifications/` as a central
namespace for all specifications. But this contradicts the placement
principle: specifications go with the most specific Thing they specify.
The semiotic-* specifications specify aspects of the agential semioverse,
so they live under the agential semioverse directory.

## Decision

Canonical paths are physical paths. All references in documentation
(AGENTS.md, CLAUDE.md, dependency maps, decision records) use the
actual filesystem path where the file lives.

There is no central specifications namespace. `technology/specifications/`
holds only specifications about technology in general (e.g.,
`specification-specification`). `part-of` frontmatter may reference a
logical grouping, but path references always use physical locations.

## Consequences

- AGENTS.md and CLAUDE.md updated to use physical paths
- Conceptual dependency map updated to use physical paths
- Future agents will not look for specs at `technology/specifications/`
  when they belong elsewhere
- `technology/specifications/index.md` needs updating (deferred to
  Phase 5 of plan 0057)
- Paths are longer but unambiguous

## Alternatives considered

- **Symlinks**: create `technology/specifications/semiotic-*` as
  symlinks to the physical locations. Rejected — adds filesystem
  complexity, not portable across platforms.
- **Move specs to technology/**: physically relocate all specs to
  `technology/specifications/`. Rejected — contradicts the placement
  principle. Specs about the agential semioverse belong with the
  agential semioverse.
- **Maintain dual paths with part-of**: accept the split and use
  `part-of` as the logical namespace. Rejected — having two different
  "correct" paths for the same file causes confusion. One canonical
  path is simpler.
