---
title: "Predicate-category disentangling status"
date-started: 2026-05-28
---

# predicate-category/ disentangling status

This subtree was written before the 2026-05-27 four-regime grammar stabilized. Its contents need re-derivation against the stabilized grammar and slotting into the correct regime tier. This file tracks what has been disentangled and what remains.

## Why the prior layout is stale

The path `…/predicate-category/` once held a mixed bag: value-algebras of predication cells (variety/lattice/...), claim-tracking morphisms (claim/...), math-content cells (math/...), the generic notion of object (object/...), and ~50 operational morphisms (categorizing, closing, committing, ...). The pre-stabilization grammar conflated "category whose objects are predicates" with "everything that has anything to do with predication," so the namespace collected unrelated subjects.

In stabilized grammar, `predicate-category` is exactly the category whose objects are *predicates as labels* (each predicate type carries the four morphism classes: `specializing`, `conversing`, `projecting-to-subject`, `projecting-to-object`). The rest of what was here belongs at the regime-prefixed categories of articulating / predicating / positing / settling.

## Disentangled so far (2026-05-28)

| What moved | From here | To | Reason |
|---|---|---|---|
| `library/variety/` (with whole lattice subtree) | `library/variety/` | `…/transfinite-predication-category/hacking/library/variety/` | value-algebra of predication-cell codomain |
| `hacking/library/claim/` (with records + 4 ops) | `hacking/library/claim/` | `…/scott-continuous-posit-category/hacking/library/claim/` | claim = positing-tier vocabulary |
| `hacking/library/math/` (with 10 record schemas) | `hacking/library/math/` | `…/transfinite-predication-category/hacking/library/math/` | each record is a typed predication cell |

Translation journal at each new location: `docs/dev/journal/2026-05-28-rederivation.md`.

## Remaining work

### `hacking/library/object/` — large subtree

The `object/` subtree contains:
- `object.md` / `object.schema.json` / `object.jsonl` — the generic notion of "an element of Ob(C)".
- `slicing/`, `realizing/`, `specializing/` — three morphisms on objects.
- `hacking/extending/` — an extending morphism.
- `library/form/` — a sub-term.
- `library/thing/` — the large nested subtree containing `thing/library/{transformer, system, heartbeat, category, ...}/`.

The `thing/library/system/library/operating-system/library/computer-operating-system/…/spotcomp/…/typed-resource-catalog/…` chain lives inside `object/library/thing/library/`. That whole chain needs re-derivation as a unit, as it carries the substrate-level (SPOTCOMP) machinery, not predicate-category machinery.

Tentative re-derivation:
- `object` itself — the generic Ob(C) notion. Probably articulating tier (it precedes regime distinction), or remains as a hacked term of predicate-category (which is itself a sub-thing of entity-category in the corrected hierarchy, per the open task list in CLAUDE.md).
- `object/library/thing/library/system/.../computer-operating-system/.../spotcomp/.../typed-resource-catalog/` — SPOTCOMP substrate; lives wherever SPOTCOMP lives in current grammar (separate disentangling job).

### `hacking/<morphism>/` — ~50 operational morphism directories

These are operations: `advancing-draft-status`, `categorizing`, `citing`, `closing`, `co-settling-build`, `collecting-firable-entities`, `combining`, `committing`, `conflating`, `detecting-cheating-algebraically`, `disqualifying-rate-limited-endpoint`, `emitting-readiness`, `exploring`, `extending-triage`, `extracting`, `filtering`, `going-to-adjacent-region`, `installing`, `judging`, `linting`, `looking-at-current-location`, `making`, `marking`, `matching`, `moving`, `negating`, `opening`, `partitioning-into-image-and-shadow`, `picking`, `proposing`, `pushing`, `reading-triage`, `receiving`, `reformatting`, `renaming`, `resolving`, `responding`, `running`, `running-initial-pipeline`, `sending`, `sorting`, `starting`, `structuring`, `surveying`, `teaching`, `transforming`, `validating`, `withdrawing`.

These morphisms span tiers. Each needs reading to determine which tier its substantive action lands at:
- Operations on predication-cells / their values → predicating tier
- Operations that issue or validate claims / norms → positing tier
- Operations that close / settle / commit → settling tier
- Operations that articulate something new → articulating tier

This is the next disentangling pass. They are not yet moved; they remain under `hacking/<morphism>/` here.

### `library/` (now empty)

Was `library/variety/`. Now empty (an empty dir; git ignores it). No content lost.

## Heuristic for next pass

Read each $thing's content (the `.md` and/or `.schema.json`), identify the substantive claim it's making, decide which of the four regime tiers that claim lives at, and `git mv` to the corresponding `hacking/library/` of the regime category. Then write a `docs/dev/journal/2026-05-28-rederivation.md` at the new location stating what the old name was trying to say and why the move was needed.
