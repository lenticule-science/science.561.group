---
type: question
status: open
title: Is automated refactoring a substrate operation or a tool that emits substrate operations?
description: "IDE-driven refactorings (rename-symbol, extract-method, inline) are typically atomic from the user's perspective: one keystroke produces a coordinated change across many files."
---

# Is automated refactoring a substrate operation or a tool that emits substrate operations?

IDE-driven refactorings (rename-symbol, extract-method, inline) are typically *atomic* from the user's perspective: one keystroke produces a coordinated change across many files. Inside the substrate, that single user-action is a *batch* of cell increments — many cells changing at once.

The question: should we model an automated refactoring as
- (a) a single substrate operation — one morphism whose effect is a coordinated update, or
- (b) a tool that emits a batch of primitive substrate operations the substrate then settles?

(a) treats refactor-as-primitive: the operation has substrate-level guarantees (atomic, invariant-preserving, cohomology-trivial) baked in. (b) treats refactor-as-orchestration: the substrate sees only the primitive increments; the structure-preservation claim is a property of the *sequence* the tool produces, not of the substrate's reaction to it.

The literature on language-aware IDEs favors (a) — refactorings are language-server primitives. The substrate-algebraic framing is more naturally (b) — primitives are cell increments; everything else is composition. A reconciliation: model automated refactorings as morphisms in the [predicated-software-refactoring](../../research/2026/07/predicated-computing/theories/predicated-software-engineering/theories/predicated-software-development/theories/predicated-software-refactoring/_index.md) layer that are *defined* by their batch of primitive cell increments, but carry a proof-obligation (they remain in the invisible subgroup) that the substrate can check.

This is unresolved at the level of running infrastructure: how should agent-driven refactorings, which arrive as a coordinated patch from outside the substrate, be admitted? The cleanest answer treats them as proposed automorphisms of the codebase settling, with the substrate verifying invisibility before admitting the increments.
