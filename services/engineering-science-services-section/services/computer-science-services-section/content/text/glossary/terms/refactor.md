---
type: object
class: substrate-automorphism-candidate
status: draft
depends-on: [codebase-cell-system, settling-morphism, invisible-automorphism-subgroup]
name: Refactor
description: A refactor of a codebase settling $v^{\mathrm{code}}$ under witness language $W$ is an element of the invisible-automorphism subgroup $NW(v^{\mathrm{code}})$ — an automorphism of the codebase cell-system that fixes every cell of $W$ that…
---

# Refactor

A **refactor** of a codebase settling $v^{\mathrm{code}}$ under witness language $W$ is an element of the [invisible-automorphism subgroup](../../../../../../../philosophy-services-section/services/logic-services-section/content/text/glossary/concepts/invisible-automorphism-subgroup.md) $N_W(v^{\mathrm{code}})$ — an automorphism of the codebase cell-system that fixes every cell of $W$ that has been newly designated by the settling.

Equivalently — and this is the disciplinary reading — a refactor is a triple $(\pi_E, \pi_\Pi, g)$ acting on the codebase cell-system that:

1. is an automorphism (the relabeled cell-system reproduces the original cell-by-cell), and
2. fixes every newly-designated cell of $W$.

Clause 1 says the refactor is structurally well-formed: applying it leaves a syntactically valid codebase that means the same thing internally. Clause 2 says it is invisible under $W$: no witness in $W$ can tell the difference between $v^{\mathrm{code}}$ and its image under the refactor.

## What a refactor is *not*

- A refactor is not a *patch*. A patch is a sequence of cell-increments; a refactor is an automorphism of the cell-system. The relationship is: a refactor's *implementation* is the patch that takes the pre-image cells to the image cells; the refactor itself is the abstract permutation of cell positions.
- A refactor is not a *commit*. A commit is a witnessed increment to the settling. A refactor is the structural content of the increment, distinguishable from the witness data.
- A refactor is not an *intent*. An author intending to refactor may produce a patch that is not in $N_W(v^{\mathrm{code}})$ — in which case the patch is a *substantive* change, regardless of intent. Intent is operator data; whether the change is a refactor is substrate data.

## The catalog

Particular refactors — rename, extract-method, inline-method, move-class, replace-conditional-with-polymorphism, etc. — are particular elements (or rather, particular conjugacy classes of elements) of $N_W(v^{\mathrm{code}})$. Each catalog entry corresponds to a *kind* of automorphism: rename is a $\pi_E$-permutation acting on identifier entities while fixing all witness-bearing positions; extract is a $\pi_\Pi$-permutation on the predicate alphabet that introduces a new predicate (a new function signature) while fixing the witness-bearing positions in the old alphabet; etc.

The [refactor-graph](../../documents/articles/research/2026/07/31/lenticule-import/computing/software/software-development/archive/teaching/explanations/refactor-graph.md) concept makes this precise: the catalog is a generating set for $N_W(v^{\mathrm{code}})$ under composition, and the graph of refactors-as-edges is the Cayley graph of that subgroup with respect to the catalog generating set.

## Where used

- [refactor-as-invisible-automorphism](../concepts/refactor-as-invisible-automorphism.md) — the central characterization.
- [rename](rename.md), [extract](extract.md), etc. — particular refactor classes.
