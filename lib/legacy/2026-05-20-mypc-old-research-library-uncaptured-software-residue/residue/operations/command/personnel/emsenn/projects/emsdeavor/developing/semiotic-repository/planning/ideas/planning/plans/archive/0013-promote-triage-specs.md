---
title: "Promote triage specifications to ASR"
date-created: 2026-03-07T00:00:00
authors:
  - claude
status: draft
priority: high
depends-on: []
goal: "005"
milestone: "governance-foundation"
---

## Summary

emsenn already wrote specifications for how the repository should
work — Semiotic Markdown, Semiotic Git, typed knowledge graphs,
intake pipelines, baseline renewal, policy enforcement hooks, a
spec-spec, and more. These are sitting in `triage/engine/contracts/`
and `triage/specifications/`. They should be promoted to the ASR
specification directory.

## Motivation

The ASR specification directory at
`technology/specifications/agential-semioverse-repository/` defines
how the repository works. But emsenn's own specifications for key
subsystems are trapped in triage. The agent has been writing new
specs and plans for things emsenn already specified — this is
exactly the problem emsenn identified: "I bet you could find like
50 plans that you currently are making me repeat."

**Important caveat**: Do not assume triage specs are ready to promote
as-is. Some may be outdated — for example, Semiotic Markdown already
has a full published spec at `technology/specifications/semiotic-markdown/`
that is more recent than the triage version. Each triage spec must be
compared against existing published content before promotion.

## Specifications to promote

### From `triage/engine/contracts/`

1. **semiotic-markdown/** — Document format spec. NOTE: A more
   recent, published version already exists at
   `technology/specifications/semiotic-markdown/`. The triage
   version may contain ideas not yet in the published spec, but
   the published spec is authoritative.

2. **semiotic-git/** — Git as Heyting algebra of ancestry cones.
   Tagged commits as modal boundaries. This informs version control
   governance.

3. **semiotic-repository/** — Repository meta-identity via
   `semantics.yaml`. Typed repo identity selecting valid operations.

4. **semiotic-github/** — CI/CD as provenance-bearing interactions.

5. **spec-spec/** — Meta-specification for how specs are written.
   Versioning, canonicalization, conformance matrices.

### From `triage/specifications/`

6. **knowledge-graph.md** — Typed knowledge graph edges: citation,
   expands-on, contradicts, part-of, version-of.

7. **traceability-graph.md** — Dependency DAG from frontmatter,
   cycle/orphan validation, impact analysis.

8. **intake-stack.md** — Content intake pipeline: normalization,
   validation, context seeding, emission.

9. **baseline-renewal.md** — Content maturity as convergence based
   on edit velocity.

10. **policy.md** — Policy enforcement hooks: pre-commit validation,
    post-merge checks.

11. **audit.md** — Transformation provenance logging.

12. **information-engine.md** — Canonical content processing
    pipeline.

13. **storage.md** — Point-in-time content snapshots.

14. **activitypub.md** — External publication as projection.

## Steps

1. Read each triage spec and assess its current state:
   - Is it complete or a draft?
   - Does a more recent version already exist in the published repo?
   - Does it need adaptation for the current ASR structure?
   - Does it conflict with existing ASR specs?
2. For specs where a published version already exists (e.g. SMD):
   - Compare triage and published versions
   - Merge any ideas from triage into the published spec
   - Do NOT replace the published spec with the triage version
3. For specs that are genuinely new and ready:
   - Copy to ASR specification directory with proper frontmatter
   - Add to the ASR spec index
   - Update cross-references
4. For specs that need adaptation:
   - Note what needs changing
   - Adapt and then promote
5. For specs that conflict with existing ASR content:
   - Write a decision record resolving the conflict
5. Update existing plans (0001, 0003, 0005, 0012) to reference the
   promoted specs where relevant.

## Done when

- [ ] All 14 specs assessed
- [ ] Ready specs promoted to ASR directory
- [ ] Adapted specs promoted after adaptation
- [ ] Conflicts resolved via decision records
- [ ] Existing plans updated to reference promoted specs

## Dependencies

None — these specs already exist.

## Log

**2026-03-07** — Created. Second pass of plan 0006 (triage
governance mining) revealed that emsenn already wrote formal
specifications for most of the repository management infrastructure
the agent has been planning from scratch. Advisory report at
`technology/texts/triage-derived-repo-management-patterns.md`.

**2026-03-07** — Tempered. Downgraded from critical to high. emsenn
corrected: don't assume triage specs are as useful as they sound.
Semiotic Markdown already has a published spec more recent than the
triage version. Each triage spec needs comparison with existing
published content before promotion. Updated steps to include
comparison and merge rather than wholesale replacement.
