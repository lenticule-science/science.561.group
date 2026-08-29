---
type: definition
class: prestack
symbol: "\\mathscr{M}^{\\mathrm{pre}}"
depends-on: [parameter-base-category, parameter-base-topology, visible-settling-fiber-groupoid, settling-fiber-groupoid]
---

# Settling moduli prestack

The pseudo-functor $\mathbf{B}^{\mathrm{op}} \to \mathbf{Gpd}$ sending each base $(\mathbf{L}, \mathcal{C}, E, \lambda) \in \mathbf{B}$ to its [visible settling fiber groupoid](visible-settling-fiber-groupoid.md):

$$\mathscr{M}^{\mathrm{pre}} \,:\, \mathbf{B}^{\mathrm{op}} \to \mathbf{Gpd}, \qquad (\mathbf{L}, \mathcal{C}, E, \lambda) \mapsto \mathrm{KP}^{\mathrm{vis}}(\mathbf{L}, \mathcal{C}, E, \lambda).$$

Equivalently, the fibered category $\int \mathscr{M}^{\mathrm{pre}} \to \mathbf{B}$ whose fiber over $B$ is $\mathrm{KP}^{\mathrm{vis}}(B)$.

## Functoriality on morphisms

A base-change $(\ell, e, \pi, \phi_\lambda) : B \to B'$ in [$\mathbf{B}$](parameter-base-category.md) induces a base-change functor

$$(\ell, e, \pi, \phi_\lambda)^* \,:\, \mathrm{KP}^{\mathrm{vis}}(B') \to \mathrm{KP}^{\mathrm{vis}}(B)$$

by pullback: each component acts cellwise on the [predication fiber algebras](predication-fiber-algebra.md), settling-stage-wise on $\lambda$, etc. For a [settling](predication-settling.md) $v' = (\mathcal{E}', c')$ over $B'$, $(\ell, e, \pi, \phi_\lambda)^* v'$ is the fiberwise pullback along the 4-tuple base-change.

## Prestack vs stack

A *prestack* is a pseudo-functor valued in groupoids whose Hom-sheaves are sheaves (the local-Hom-condition); a *stack* additionally satisfies effective descent for objects (the local-object-condition).

- The prestack property — Hom-sheaves are sheaves — is established in [settling moduli prestack property](../theorems/settling-moduli-prestack-property.md).
- The full stack property — effective descent — is established in the [settling moduli stack theorem](../theorems/settling-moduli-stack-theorem.md), which shows $\mathscr{M}^{\mathrm{pre}}$ is already a stack, no further stackification needed: $\mathscr{M} := \mathscr{M}^{\mathrm{pre}}$.

## Why visible, not fine

The settling moduli prestack uses the [visible settling fiber groupoid](visible-settling-fiber-groupoid.md), not the unquotiented [settling fiber groupoid](settling-fiber-groupoid.md). The fine moduli — retaining the full $\mathrm{Aut}^\simeq(v)$ including the large [invisible automorphism subgroup](../concepts/invisible-automorphism-subgroup.md) — is recorded as a secondary structure (see [fine vs visible moduli](../narratives/fine-vs-visible-moduli.md)). The relation is structurally an $N$-gerbe of the visible over fine.

## What the prestack does not yet do

- It does not classify settlings by cohomological invariants; that's the [combined cohomology classifying morphism](combined-cohomology-classifying-morphism.md).
- It does not yet establish descent of settling data from local pieces; that's the stack theorem.
- It does not yet extract regime structure; that's the [regime decomposition](../theorems/regime-decomposition.md) per fiber.

These build on the prestack as a foundation.
