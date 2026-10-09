---
name: routing a git pre-commit
description: Blocks a git pre-commit event when any gate skill rejects a staged markdown file.
specializing: git-pre-commit
closure-position: process
operation-kind: guard
composes:
  - linting-a-resource-file
  - linting-a-citation
  - linting-a-references-section
  - resolving-links-in-a-file
hooks:
  - event: git-pre-commit
    command: node library/object/library/thing/library/system/library/git/library/git-pre-commit/doing/working/routing-a-git-pre-commit/scripts/route-a-git-pre-commit.mjs
    description: Permits or blocks a git pre-commit event based on whether the dispatched gates accept every staged markdown file.
title: routing a git pre-commit
---

Body in [`SKILL.md`](routing-a-git-pre-commit-skill.md).

Runs as a git pre-commit hook (`.git/hooks/pre-commit`, installed by [`installing-a-git-pre-commit-hook`](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/system/library/git/library/git-pre-commit/doing/working/installing-a-git-pre-commit-hook/SKILL.md)). The router itself is fail-closed: if it cannot read the index, cannot reach a gate, or a gate throws, the commit aborts. A misbehaving router must not silently let conformance violations land.

The current gate set is:

- [`linting-a-resource-file`](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/system/library/git/library/git-pre-commit/doing/working/linting-a-resource-file/SKILL.md) — frontmatter shape, role coherence, banned-jargon enforcement.
- [`linting-a-citation`](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/system/library/git/library/git-pre-commit/doing/working/linting-a-citation/SKILL.md) — citation form in body text.
- [`linting-a-references-section`](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/system/library/git/library/git-pre-commit/doing/working/linting-a-references-section/SKILL.md) — `## References` section discipline.
- [`resolving-links-in-a-file`](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/system/library/git/library/git-pre-commit/doing/working/resolving-links-in-a-file/SKILL.md) — every repository-local markdown link resolves on disk.

New gates are added by listing them in the router script's `GATES` array and listing the skill here under `composes:`. The router currently lints the worktree copy of each staged path; staged content that differs from the worktree is detected and a warning is printed, asking the author to `git add` again to gate the exact staged bytes.
