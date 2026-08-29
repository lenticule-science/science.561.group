---
type: concept
class: pattern
status: draft
depends-on: [invisible-automorphism-subgroup, codebase-cell-system, refactor]
realizes: [structure-preservation, behavior-preservation]
---

# Refactor as invisible automorphism

The substrate-algebraic content of "structure-preserving transformation that does not change observable behavior" is the [invisible-automorphism subgroup](../../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/invisible-automorphism-subgroup.md): the kernel of the action of $\mathrm{Aut}^\simeq(v^{\mathrm{code}})$ on the [settling-associated sheaf](../../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-associated-sheaf.md) $\mathcal{F}^{\mathrm{code}}_U$.

A transformation of the [codebase cell-system](../objects/codebase-cell-system.md) is a refactor under witness language $W$ iff its action on $\mathcal{F}^{\mathrm{code}}_U$ (restricted to $W$-witness-bearing positions) is the identity.

## Why "invisible"

Visible to *what*? To the cohomology of the settling. The bigraded cohomology classes $H^n(\mathbf{T}^*, \mathcal{F}^{\mathrm{code}}_U)$ are exactly the things any witness language built on $W$ can compute about the codebase: regression-test outcomes, public-API stability, persistence-format compatibility, etc. An automorphism that acts trivially on $\mathcal{F}^{\mathrm{code}}_U$ acts trivially on every $H^n$; no witness language built on $W$ can distinguish before from after.

Equivalent reading: refactorings sit in the *normal subgroup* $N_W(v^{\mathrm{code}}) \trianglelefteq \mathrm{Aut}^\simeq(v^{\mathrm{code}})$. The visible automorphism quotient $\mathrm{Aut}^{\mathrm{vis}}_W(v^{\mathrm{code}}) = \mathrm{Aut}^\simeq(v^{\mathrm{code}}) / N_W(v^{\mathrm{code}})$ is the group of *substantive* transformations modulo refactorings. A breaking change is a non-trivial element of this quotient.

## The substrate's reason

This is not a definition we are imposing — it is forced by the structure of the cell-system. The settling-associated sheaf is the substrate's record of *what has been observed*. An automorphism whose effect is recoverable from the sheaf is, by construction, a substantive change. An automorphism whose effect is not recoverable from the sheaf is, by construction, invisible to any witness language definable on the cell-system. The classical refactoring discipline is the engineering practice of producing automorphisms in the second class.

## What the concept rules out

- "Refactoring is a stylistic preference" — wrong. Whether a transformation is a refactor is a substrate-algebraic fact (relative to $W$), not a matter of taste.
- "Refactoring sometimes breaks things, that's normal" — wrong. If a transformation breaks something, it is not a refactor under the witness language that observed the break. The transformation may be a *useful* substantive change; it is not in $N_W$.
- "All transformations that pass the tests are refactorings" — wrong. Tests are *one* witness language; the transformation may be visible to other witness languages (downstream consumers, monitoring, debugger paths). The classification is witness-language-relative; passing one set of witnesses does not place the transformation in every $N_W$.

## Where the pattern appears

- **[Rename](../morphisms/rename.md)** — entity-permutation $\pi_E$ on identifiers; cosmetic iff every renamed identifier is private to the witness language.
- **[Extract](../morphisms/extract.md)** — predicate-extension introducing a new function-signature predicate while preserving caller-witness cells.
- **[Inline](../morphisms/inline.md)** — predicate-collapse, the inverse of extract.
- **[Move](../morphisms/move.md)** — entity-permutation rearranging the `defined-in` predicate values while fixing every other cell.

Each catalog entry is a generator (or class of generators) of $N_W$.
