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
---

Body in [`SKILL.md`](SKILL.md).

Runs as a git pre-commit hook (`.git/hooks/pre-commit`, installed by [`installing-a-git-pre-commit-hook`](../installing-a-git-pre-commit-hook/SKILL.md)). The router itself is fail-closed: if it cannot read the index, cannot reach a gate, or a gate throws, the commit aborts. A misbehaving router must not silently let conformance violations land.

The current gate set is:

- [`linting-a-resource-file`](../linting-a-resource-file/SKILL.md) — frontmatter shape, role coherence, banned-jargon enforcement.
- [`linting-a-citation`](../linting-a-citation/SKILL.md) — citation form in body text.
- [`linting-a-references-section`](../linting-a-references-section/SKILL.md) — `## References` section discipline.
- [`resolving-links-in-a-file`](../resolving-links-in-a-file/SKILL.md) — every repository-local markdown link resolves on disk.

New gates are added by listing them in the router script's `GATES` array and listing the skill here under `composes:`. The router currently lints the worktree copy of each staged path; staged content that differs from the worktree is detected and a warning is printed, asking the author to `git add` again to gate the exact staged bytes.
