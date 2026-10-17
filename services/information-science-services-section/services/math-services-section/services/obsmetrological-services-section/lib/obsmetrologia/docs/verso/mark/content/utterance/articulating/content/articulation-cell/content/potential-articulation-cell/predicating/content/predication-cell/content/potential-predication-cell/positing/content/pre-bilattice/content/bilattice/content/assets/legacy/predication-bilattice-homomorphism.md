---
type: morphism
realizes: [bilattice-homomorphism-naturality]
class: morphism
symbol: h
lean: PredicationCategories.Homebrew.Algebra.BilatticeHom.BilatticeHom
depends-on: [bilattice]
kind: morphism
---

# Bilattice homomorphism

A function $h : \mathbf{B}_1 \to \mathbf{B}_2$ between [bilattices](../objects/bilattice.md) preserving all four lattice operations and the [negation](../morphisms/negation.md):

- $h(a \wedge_t b) = h(a) \wedge_t h(b)$ and $h(a \vee_t b) = h(a) \vee_t h(b)$;
- $h(a \wedge_k b) = h(a) \wedge_k h(b)$ and $h(a \vee_k b) = h(a) \vee_k h(b)$;
- $h(\sim a) = \sim h(a)$.

When the bilattices carry a [conflation](../morphisms/conflation.md), a bilattice homomorphism is additionally required to preserve it: $h(-a) = -h(a)$.

A bilattice homomorphism need not preserve bounds. A homomorphism that additionally preserves the knowledge-order bottom — $h(\bot) = \bot$ — is called *bottom-preserving*; the natural bottom-preserving bilattice homomorphisms between [predication fiber algebras](../objects/predication-fiber-algebra.md) are exactly the maps induced by the four predicate-category generator classes.
