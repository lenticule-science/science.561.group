---

name: project_computer-system-taxonomy
description: "Four-sort taxonomy for computer system specs: flatfile|local|networked|primitive — added as computer-system-type frontmatter field across hundreds of files in 2026-04-02 session"
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
title: project_computer-system-taxonomy
---

The repo's computer system specs fall into four sorts, tracked via `computer-system-type:` frontmatter:

1. **flatfile** — FARS, files ARE the system (what we run on now)
2. **local** — service specs running on one machine (runtime, storage, orchestrator, etc.)
3. **networked** — distributed relationality, replication, multi-user
4. **primitive** — the bare ISA, cells, traces, acts of relationality, operators, structures

Also added `readiness:` field (raw|shaped|specced|implementable) which maps to the settlement metadata concept (`given:` defect eigenvalue).

**2026-04-02 tagging session** tagged these locations:
- `library/theories/science/theories/relationality/theories/technology/theories/computing/theories/computer-architecture/` — 30 specs, `local`, `specced`
- `library/theories/science/theories/relationality/theories/technology/theories/computing/theories/relational-computer/architecture.md` — `primitive`, `specced`
- `library/theories/science/theories/relationality/docs/app/spec/` — ~100 app ideas
- `library/theories/science/theories/relationality/docs/math/acts/` — ~100 acts, `primitive`
- `library/theories/science/theories/relationality/docs/math/operator/` — ~200 operators, `primitive`
- `library/theories/science/theories/relationality/docs/math/structure/` — ~200 structures, `primitive`
- `operations/engineering/fars/docs/terms/` — ~92 FARS terms, `flatfile`
- `operations/command/.../ideas/specifications/` — ~36 old simulation specs, `local`
- `operations/command/.../ideas/semiotic-cell-machine/` — 13 specs, `primitive`
- `operations/command/.../ideas/event-stream-record-spec/` — 6 specs, `flatfile`
- `operations/engineering/triage/content/buckets/tech/relational-system/` — 8 specs, `local`

**Still needs tagging:** Delta Register (80+ files), remaining triage content, the `docs/app/spec/` files may need `computer-system-type` added in a follow-up pass.

**Priority:** The local system is the most urgent — the user needs physical infrastructure control (3D printers specifically) and that requires a running process. Don't over-index on the MUD, OS, or distributed system when the user has concrete hardware needs.

**Why:** `computer-system-type` cuts across project boundaries — shows what CLASS of system a spec belongs to regardless of which specific project it's part of. Enables queries like "show me everything flatfile" to find FARS AND old iterations AND future flatfile systems.
