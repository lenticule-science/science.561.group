---
name: "Section"
type: "page"
date-created: 2026-03-19
description: "A Section is a morphism s: B → E satisfying p ∘ s = idB for a fibration p: E → B — a coherent assignment of one element per fiber to every base point."
---

A Section is a morphism s: B → E satisfying p ∘ s = id_B for a fibration p: E → B — a coherent assignment of one element per fiber to every base point.

Table of contents

- [Formal definition](#formal-definition)

- [What this is](#what-this-is)

- [Global sections in this system](#global-sections-in-this-system)

- [Relation to this system](#relation-to-this-system)

- [Open questions](#open-questions)

- [Key references](#key-references)


## Formal definition

A **Section** of a fibration $p : E \to B$ is a morphism $s : B \to E$ satisfying:

$p \circ s = \mathrm{id}_B$

For each base point $b \in B$, $s(b) \in E_b$ — the section selects one element from each fiber, and that element lies in the correct fiber over $b$.

**Global section.** A global section of a sheaf $F$ over a site $(C, J)$ is an element of F(1)F(\mathbf{1}), where $\mathbf{1}$ is the terminal object — equivalently, a compatible family {xc∈F(c)}c∈C\{x_c \in F(c)\}_{c \in C} satisfying F(f)(xd)=xcF(f)(x_d) = x_c for every morphism $f : c \to d$. In this system: a global section of H∗:Top→HAH^* : T^{\mathrm{op}} \to \mathbf{HA} is a choice of xt∈Ht∗x_t \in H^*_t for every $t \in T$ compatible with all restriction maps. This is the strongest form of structural occupancy — correctly placed at every history simultaneously.

**Relation to coalgebra.** The counit law $\varepsilon_A \circ \rho = \mathrm{id}_A$ of a coalgebra $(A, \rho)$ is the section condition for $\varepsilon_A : W(A) \to A$ — the structure map $\rho$ is a section of $\varepsilon_A$. Every coalgebra is a section; coassociativity adds coherence across iterated context steps that the bare section condition does not require.

## What this is

A **Section** of a fibration p: E → B is a morphism s: B → E satisfying p ∘ s = id_B. For each base point b ∈ B, s(b) is an element of the fiber E_b over b. The section occupies the correct fiber at every base position simultaneously.

The section condition p ∘ s = id_B is the mathematical statement of structural occupancy: a section provides one element per fiber position, and that element belongs to the correct fiber. Multiple sections over the same base can coexist. A section says nothing about dynamics, obligation, or cost — only that occupancy is correctly placed.

In sheaf theory, a global section of a sheaf F over a site (C, J) is an element of F(1), the value at the terminal object — a coherent assignment of local data at every object, compatible with all restriction maps. This is the most complete form of the section: one consistently chosen element across the entire site.

Relation to coalgebra: a comonad coalgebra (A, ρ: A → W(A)) satisfying the counit law ε_A ∘ ρ = id_A is a section of the counit ε_A. The counit law is the section condition. Every coalgebra is a section, with coassociativity adding coherence across multiple steps of context extension. This means the section concept is strictly weaker than the coalgebra concept: a section captures placement; a coalgebra captures sustained, step-coherent placement.

## Global sections in this system

A global section of H* = Fix(σ) ∩ Fix(Δ) is a coherent assignment of a doubly-quiescent proposition to every history in the site T, respecting all restriction maps. This is the strongest form of structural occupancy available in the framework: the agent is correctly placed at every level of the tower simultaneously, with no nucleus demanding further normalization.

The map π_t = σ_t ∘ Δ_t: H_t → H*_t sends each raw proposition to its canonical occupant in H*_t. A global section of H* is a choice of element in H*_t for every t, compatible with the reindexing functors. The section condition at each fiber is: σ_t(P) = P and Δ_t(P) = P.

## Relation to this system

In the FARS: every skill invocation produces a result that, if correctly formed, constitutes a section of the relevant output sheaf — one value per applicable locale, compatible with restriction. A result that fails the section condition is one where the output does not belong to the correct fiber at some base point — for instance, a claim that does not satisfy the spec constraint it was meant to occupy. The nuclear pipeline σ ∘ Δ provides the canonical retraction to the sheaf of sections that do satisfy the condition.

## Open questions

- Whether every serving act in this system corresponds to a section of a specific named sheaf, or whether the section formulation requires the full coalgebra structure to be complete.

- Whether the global sections of H* have a characterization in terms of the site topology J — what J must be for the sheaf of doubly-quiescent propositions to have enough global sections.

- The relationship between the section-of-a-fibration and the section-of-a-sheaf: these agree when the fibration is the display map of a sheaf, but in general they diverge. Which is the operative sense here?

## Key references

Mac Lane & Moerdijk, *Sheaves in Geometry and Logic*, Ch. II–III (Springer, 1992); Grothendieck, SGA 1; Jacobs, *Categorical Logic and Type Theory*, Ch. 1 (North-Holland, 1999).
