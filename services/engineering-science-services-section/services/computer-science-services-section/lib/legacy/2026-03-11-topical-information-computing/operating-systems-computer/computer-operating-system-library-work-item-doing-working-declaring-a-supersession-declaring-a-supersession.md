---
name: declaring-a-supersession
description: Writes (new, supersedes, old) — asserts that a new decision/spec/work-item replaces an older one. The old one's has-status transitions to superseded.
specializing: asserting-positing-morphism
status: stub
---

A **declaring-a-supersession** call is the asserting positing that records the supersession relation between two work-items (most commonly decisions).
The old work-item's has-status transitions to a kind-specific superseded value (decisions have {pending, recorded, superseded} as their status-set); the new one's frontmatter carries (new, supersedes, old).

## Stub

Implementation is a stub — it accepts arguments, validates them shallowly, prints the operation it would perform, and appends a witness row to the work-item jsonl.
Substantive logic (walking the dependency graph, computing critical paths, computing burn-downs from velocity) follows in later sessions.
