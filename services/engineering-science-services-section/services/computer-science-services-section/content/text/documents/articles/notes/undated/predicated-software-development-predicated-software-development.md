---
title: Predicated Software Development
description: A subtheory of predicated-software-engineering.
---
# Predicated Software Development

A subtheory of [predicated-software-engineering](../../research/2026/07/31/lenticule-import/computing/software/_index.md). Studies the activity-slice that changes the codebase: the operations whose increments land on source-content cells, witnessed by tests, reviewers, and downstream consumers, classified by their action on the [settling-associated sheaf](../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/apps/agentic-relation-engine/lib/relating/docs/settling-associated-sheaf.md).

Sibling content — operating-the-codebase, observing-it, decommissioning-it — lives elsewhere in [predicated-software-engineering](../../research/2026/07/31/lenticule-import/computing/software/_index.md). This subtheory is specifically about *transformations of the codebase as substrate content*. Its leaf, [predicated-software-refactoring](../../research/2026/07/31/lenticule-import/computing/software/software-development/archive/theories/predicated-software-refactoring/_index.md), studies the special class of transformations that lie in the invisible-automorphism subgroup; this parent develops the surrounding vocabulary so that classification is meaningful.

## Why a subtheory rather than a sibling theory

Three reasons, parallel to the predicated-software-engineering / predicated-computing pattern.

1. **Library structure.** [Software-development](../../research/2026/07/31/software-engineering/theories/software-development/_index.md) is treated as an activity-slice of software-engineering in the engineering tree; this subtheory mirrors that.
2. **Substrate inheritance.** Inherits the codebase-cell-system from the parent fusion; does not re-derive it.
3. **Co-content.** Refactoring, the leaf, presupposes development — there is no refactoring without first something-having-been-developed. The subtheory shape captures this dependency.

## Convention

Following the [predication-categories convention](../../../humanities/theories/math/theories/categories/theories/predication-categories/_index.md).

## Layout

- `concepts/` — semantic anchors specific to development: development-episode, behavior-as-observable, structure-as-cell-arrangement.
- `objects/` — codebase-state, development-trajectory, episode-bound.
- `morphisms/` — feature-add, bug-fix, deletion (each a class of substrate operations distinguished by their action on the settling).
- `theorems/` — classifying claims about which activity classes are which.
- `questions/` — open.
- `examples/` — worked development episodes as substrate operations.
- `narratives/` — synthesis.
- `references/` — disciplinary literature.
- `theories/` — subtheories.

## Subtheories

- [`predicated-software-refactoring/`](../../research/2026/07/31/lenticule-import/computing/software/software-development/archive/theories/predicated-software-refactoring/_index.md) — refactorings as the invisible-automorphism subgroup of the codebase settling. The leaf where the math earns its keep.

## What this subtheory commits to

- **An activity class is determined by its action on the settling.** Feature work moves the codebase to a settling with new designated cells; bug fix moves it to one with corrected witness values at existing cells; deletion removes designated cells; refactoring moves it to a settling whose [associated sheaf](../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/apps/agentic-relation-engine/lib/relating/docs/settling-associated-sheaf.md) is unchanged. The classification is substrate-algebraic, not stipulative.
- **An episode is a sequence of operations bounded by witness quiescence.** A development episode starts when increments begin landing on a purpose-cell and ends when the witnesses for that purpose-cell reach quiescence (or are abandoned). This makes "when does the episode end" precise.
- **Development is one of three activity-slices of software-engineering** — alongside operations (running-instance changes) and organization (team-cell changes). The substrate distinguishes them by which cell-system the increments land on.

## Status

Drafted as a thin parent for [predicated-software-refactoring](../../research/2026/07/31/lenticule-import/computing/software/software-development/archive/theories/predicated-software-refactoring/_index.md). The activity-class theorems are stated programmatically; their full development is downstream of the leaf, where the structure-preservation case has been worked out and the others can borrow the technique.
