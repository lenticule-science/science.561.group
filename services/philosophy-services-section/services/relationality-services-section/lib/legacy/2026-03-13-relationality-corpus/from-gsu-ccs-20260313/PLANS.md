---
name: PLANS
---

## Open

### math-section-reference-migration

**Added:** 2026-03-16
**Status:** open
**Action:** Migrate all `§anchor-id` references in `math/*.md` to markdown
**Why:** `links-not-sigils` principle (root SOUL.md). Tracked in math/INBOX.md.

### proof-section-reference-migration

**Added:** 2026-03-16
**Status:** open
**Action:** Migrate all `§anchor-id` references in `proof/skills/*.md` to
**Why:** Same as `math-section-reference-migration`.

### audit-math-compliance-skill

**Added:** 2026-03-16
**Status:** open
**Action:** Write `math/skills/audit-math-compliance.md` — the compliance
**Why:** `do-math-work.md` references this skill; without it, the math

### next-math-target-skill

**Added:** 2026-03-16
**Status:** open
**Action:** Write `math/skills/next-math-target.md` — the discovery skill for
**Why:** `do-math-work.md` references this skill; without it, the math

### do-src-work-skill

**Added:** 2026-03-16
**Status:** open
**Action:** Write `src/skills/do-src-work.md` — the executor skill for the
**Why:** `improve-src.md` references this as its executor; without it the src

### improve-proofs-thin-wrapper

**Added:** 2026-03-16
**Status:** open
**Action:** Refactor `proof/skills/improve-proofs.md` as a thin wrapper calling
**Why:** improve-proofs.md is the last department loop not using the general

### build-pipeline-broken

**Added:** 2026-03-17
**Status:** open
**Action:** `math/build.py` was deleted; `build/clusters.ttl` and `build/relational-hyperverse.ttl` are gone. Decide whether to restore or replace the build pipeline. If the TTL outputs are still needed, write a replacement script in `src/` that reads `math/*.md` and outputs them.
**Why:** The build artifacts are referenced in `build/relational-hyperverse.md` and were the primary RDF export of the math corpus. Their absence means no machine-readable graph output.

### deleted-commands-audit

**Added:** 2026-03-17
**Status:** open
**Action:** The following `.claude/commands/` files were deleted and may not have skill equivalents: `debt-check.md`, `improve-prose.md`, `name-unnamed.md`, `status-report.md`, `triage-idea.md`, `write-act.md`, `write-concept.md`, `write-lesson.md`, `write-object.md`, `write-term.md`, `write-topic.md`. Audit each: either confirm a skill covers it or write the missing skill.
**Why:** These were potential entry-point commands. Deleting without replacement leaves gaps in the operator workflow.

### hurwitz-zeno-python-implementation

**Added:** 2026-03-17
**Status:** open
**Action:** Implement the ~100-line Python script described in `math/PLANS.md` (Computational Goal section): enumerate FML₀ normal forms at each depth, apply context equations, compute new-modes sheaf fiberwise, run Čech cohomology for the diamond cover. Place in `src/math-exploration/` or `src/scripts/`.
**Why:** The Hurwitz-Zeno Conjecture verification requires this computation. The math is settled (Option B, syntactic model); only the implementation is missing.

## Deferred

### entry-point-naming-exception

**Added:** 2026-03-16
**Status:** deferred
**Why blocked:** Requires user decision.
**Action:** Either rename all `improve-*` and `familiarize` entry-point skills
**Why:** `spec/name.md` rejects `improve-` prefix. All department entry-points

