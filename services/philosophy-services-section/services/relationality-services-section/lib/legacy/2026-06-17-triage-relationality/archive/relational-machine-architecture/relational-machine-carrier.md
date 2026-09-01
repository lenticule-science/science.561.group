---
component-of: relational-machine
specialization: coalgebra
over: directed-comonad
equipped-with: relational-machine-stepping-map
satisfies:
  - counit-law
  - coassociativity-law
date-created: 2026-03-18
date-modified: 2026-03-18
---

# Relational Machine Carrier

## What this is

The **RelationalMachineCarrier** is a G_s-coalgebra in R: a sheaf X ∈ R equipped with a family of stepping maps, one per step s ∈ Σ and history t ∈ T.

The carrier is what holds current state and advances it.
It is the covariant pole of the [Passage](../../../science/domains/math/passage.md): restriction maps go backward along histories (from longer to shorter); carrier stepping maps go forward (from shorter to longer).

The carrier name comes from the [Chu construction](https://ncatlab.org/nlab/show/Chu+construction): the points object A in a Chu space (A, r, X) is the input-side object — the carrier of atomic content.
In our system, the atomic class A from [generative-act](../../../science/domains/math/generative-act.md) fills this role: A ⊆ Obj(R) is always generated, and every carrier is built from atomic content upward.

## Mathematical grounding

The full construction is in [directed-comonad](../../../science/domains/math/directed-comonad.md).
Fix a step s ∈ Σ.
The directed comonad G_s on R sends F ↦ F(s★−).
A RelationalMachineCarrier is a G_s-coalgebra: a pair (X, γ) where X ∈ R and γ : X → G_s X is a natural transformation.
Concretely, γ is a family of maps γ_t : X(t) → X(s★t), natural in t — the [RelationalMachineSteppingMap](relational-machine-stepping-map.md) of this carrier.

The stepping maps must satisfy two laws derived from the comonad structure:

**Counit law** — ε_X ∘ γ = id_X.
The counit ε_X(t) : X(s★t) → X(t) is the restriction map back to the shorter history.
Stepping forward then restricting back recovers the original state.
γ is a section of ε_X.

**Coassociativity law** — γ_{s★t} ∘ γ_t = ν_X(t).
Two sequential applications of γ cohere with the comonad comultiplication ν_X.
Stepping twice by s is the same as applying the comultiplication first.

## In the FARS

In a [FlatfileAgentialResourceSystem](flatfile-agential-resource-system.md) locale, the RelationalMachineCarrier is the collection of entity files — the markdown files holding the locale's current state.
The stepping maps are instantiated each session: the improvement skill reads the carrier at history t, processes incoming steps, and writes updated files, producing the carrier at history s★t.

A RelationalMachineCarrier MUST have stepping maps γ_t : X(t) → X(s★t) for each step s ∈ Σ and each history t.
It MUST satisfy the counit law — stepping forward then restricting back is the identity.
It MUST satisfy the coassociativity law — sequential stepping coheres with comultiplication.
It MUST contain elements of the atomic class A — the carrier must be built from atomic content.

## Open questions
