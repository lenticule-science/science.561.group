---
title: "Software Refactoring"
component-of: software-development
locates: activity-aspect
teleology: "The activity of transforming a codebase's structure while preserving its observable behavior — the discipline of structure-as-distinct-from-behavior in software."
method: "Identification of structure-preserving transformations on codebases (rename, extract, inline, move, merge, split), characterization of the equivalence relation they generate, and study of the discipline by which a sequence of refactorings is composed safely."
description: Refactoring is the software-development activity that changes structure without changing observable behavior.
---

Refactoring is the [software-development](../../research/2026/07/31/lenticule-import/computing/software/_index.md) activity that *changes structure without changing observable behavior*. The phrase "observable behavior" is doing all the work in that definition; making it precise is the principal task of this theory and is fully delivered in the predicated fusion ([predicated-software-refactoring](../../research/2026/07/31/predicated-computing/theories/predicated-software-engineering/theories/predicated-software-development/theories/predicated-software-refactoring/_index.md)).

Treated informally: rename a private variable, extract a method, inline a method, move a class, replace a conditional with polymorphism. Each leaves the program's externally-witnessable behavior — what it returns, what it persists, what it emits — unchanged, while reorganizing the internal arrangement of the code.

## Why a sub-theory rather than just an activity-name

Three reasons.

1. **Structure / behavior is a substantive distinction.** "Same behavior, different structure" is a non-trivial equivalence relation on codebases. Naming it makes the rest of development more precise: a feature-work episode is one that crosses an equivalence-class; a refactoring episode is one that stays within one.
2. **Substrate inheritance is the right shape.** The substrate-algebraic content of "same observable behavior" turns out to be the [invisible-automorphism subgroup](../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/glossary/concepts/invisible-automorphism-subgroup.md) of a codebase's predication settling — the same construct that work uses for cosmetic restructuring. Inheriting that substrate gives the theory its theorems for free; building it parallel would be wasted effort.
3. **The activity has a long disciplinary literature** (Opdyke, Fowler, Kerievsky, Mens & Tourwé, the IDE-tooling community). Naming the sub-theory gives the literature a destination in the tree and lets the math program inherit its vocabulary rather than reinventing it.

## What "observable" depends on

Observable behavior is not absolute — it is relative to a *witness language*: the predicates that observers (tests, users, downstream code, monitoring) use to tell what the program does. Renaming a private variable is invisible to all sane witness languages. Renaming a public-API function is visible to callers who name it; if no caller does, the rename collapses back to invisible. The witness language is therefore a parameter of the refactoring discipline, not a fact about the code. Most ambiguity in real refactoring is ambiguity about which witness language is in scope.

This relativity is fully reflected in the predicated form: the [settling-associated sheaf](../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/apps/agentic-relation-engine/lib/relating/docs/settling-associated-sheaf.md) is parameterized by the cell-positions deemed "newly designated" — exactly the witness-language choice — and the visible/invisible dichotomy follows.

## Layout

- [`questions/`](../../research/2026/07/31/lenticule-import/computing/software/software-development/archive/questions) — open questions about refactoring as an activity.
- [`texts/`](../../research/2026/07/31/lenticule-import/computing/software/software-development/archive/texts) — long-form treatments (forthcoming).

## Status

Drafted as the leaf where the math earns its keep. The bulk of the content lives in [predicated-software-refactoring](../../research/2026/07/31/predicated-computing/theories/predicated-software-engineering/theories/predicated-software-development/theories/predicated-software-refactoring/_index.md); this unpredicated index exists to host disciplinary-literature material and to anchor the predicated fusion in the engineering tree.
