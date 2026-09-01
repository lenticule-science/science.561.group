---
title: "Theorem placement convention (Round 6 starts here)"
date: 2026-05-28
applies-to: all theorems placed in the chain
---

# Theorem placement convention

Per the plan for Round 6 of the predication-categories archive pull (137 theorems total), each theorem is placed at its **primary object**'s `docs/dev/theorems/<theorem-slug>.md`.

## Rules

1. **Each theorem is documentation of its primary object**, not a separate substrate object. So it lives under that object's `docs/dev/`, not as its own $thing dir.
2. **Choose the primary object** by reading the theorem's statement: which object is it *about*? (Usually the most-cited or most-novel dependency.) When the theorem ties multiple objects together with no single primary, place at the object whose definition the theorem most directly characterizes.
3. **Preserve archive frontmatter**: keep `status:` (proved/sketch/open), `depends-on:`, and any Lean module references intact.
4. **Add a `derives-from:` pointer** to the archive scrap (which is at the archive's `theorems/<slug>.md` path; under the pull it has moved with the theorem itself, so the pointer is to the file's prior archive path).
5. **No rename unless needed** — theorem names stay as-is unless the four-object grammar requires changing "settling" to "settlement" in the slug.

## Status preservation

The substrate's epistemic standing depends on theorem status being honest. The `cohomological-framework` derivation (settling tier) notes that several theorems' status downgrades from `proved` to `sketch` in light of the framework distinction. When a theorem's status is downgraded, the body should make the downgrade explicit (which framework's assumptions the theorem relies on, what gaps remain).

## First batch (this commit)

Four theorems placed under their primary objects:

| Theorem | Primary object | Status |
|---|---|---|
| closure-driven-settling-monotonicity | closure-drivenness | proved |
| bitopological-settling-site-axioms | bitopological-settling-site | proved |
| closure-ordinal-mld-shift | closure-ordinal | proved |
| aperiodicity-characterization | aperiodic-articulation-category (the regime itself) | proved |

This is a small first batch to demonstrate the placement convention. Subsequent batches will work through theorems clustered by their primary object.
