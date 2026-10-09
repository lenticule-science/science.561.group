---
type: concept
class: morphism-class
depends-on:
  - bilattice-homomorphism
  - bilattice-homomorphism-naturality
  - predication-fiber-algebra
  - entity-set
  - relaxed-bilattice-homomorphism-classification
see-also:
  - predicate-specialization
  - predicate-converse
  - predicate-subject-projection
  - predicate-object-projection
  - boundary-extended-predicate-category
---

# Orbit-coloring generator

A **$\mathrm{Sym}(E)$-orbit-coloring generator** is a natural [bilattice homomorphism](../morphisms/bilattice-homomorphism.md) $\phi : A_q \to A_p$ between [predication fiber algebras](../objects/predication-fiber-algebra.md) that paints at least one $\mathrm{Sym}(E)$-orbit of $E\times E$ with the constant value $\top$, regardless of the source valuation.

By the [relaxed bilattice homomorphism classification](../theorems/relaxed-bilattice-homomorphism-classification.md), every natural bilattice homomorphism is determined by an orbit-by-orbit choice of $\alpha_O : \mathbf L^{E\times E} \to \mathbf L$ for $O \in \{\Delta, \Delta^c\}$, with each $\alpha_O$ a lattice homomorphism preserving $\wedge, \vee$ but not necessarily bounds. Bottom-preservation is exactly the condition $\alpha_O \neq \mathrm{constant\text{-}}\top$ on every orbit. An orbit-coloring generator is a natural bilattice homomorphism that fails this on at least one orbit.

## The eight orbit-coloring generators

For $\mathbf L = \mathbf 2$ and $|E| \geq 3$, the eight orbit-coloring generator classes are:

| name | $\alpha_\Delta$ | $\alpha_{\Delta^c}$ | action on $v$ |
|---|---|---|---|
| $\eta_\top^\Delta$ | constant-$\top$ | constant-$\bot$ | $\top$ on diagonal, $\bot$ off-diagonal |
| $\eta_\top^{\Delta^c}$ | constant-$\bot$ | constant-$\top$ | $\bot$ on diagonal, $\top$ off-diagonal |
| $\eta_\top^\Delta \cdot \mathrm{id}$ | constant-$\top$ | $\mathrm{ev}_{\mathrm{id}}$ | $\top$ on diagonal, lookup off-diagonal |
| $\eta_\top^\Delta \cdot \mathrm{swap}$ | constant-$\top$ | $\mathrm{ev}_{\mathrm{swap}}$ | $\top$ on diagonal, swap off-diagonal |
| $\eta_\top^\Delta \cdot \mathrm{subj}$ | constant-$\top$ | $\mathrm{ev}_{\mathrm{subj}}$ | $\top$ on diagonal, subject-collapse off-diagonal |
| $\eta_\top^\Delta \cdot \mathrm{obj}$ | constant-$\top$ | $\mathrm{ev}_{\mathrm{obj}}$ | $\top$ on diagonal, object-collapse off-diagonal |
| $\mathrm{ev}_{\mathrm{diag}} \cdot \eta_\top^{\Delta^c}$ | $\mathrm{ev}_{\mathrm{diag}}$ | constant-$\top$ | diagonal lookup, $\top$ off-diagonal |
| $\eta_\top$ | constant-$\top$ | constant-$\top$ | $\top$ everywhere |

Each is a $\mathrm{Sym}(E)$-equivariant bilattice homomorphism that the chapter's bottom-preservation hypothesis silently excludes. The chapter's [predicate-generator exhaustiveness](../../../../../../predication-fiber-algebra/content/predication-fibration/explanations/exhaustiveness-of-four-predication-cell-complex-site-generators.md) catalogues the complementary 10-generator inventory in which both orbits avoid $\mathrm{constant\text{-}}\top$.

## Reading

The orbit-coloring generators are **inconsistency-injection morphisms**. Each post-composes any source valuation by overwriting at least one $\mathrm{Sym}(E)$-orbit with the maximally-overdetermined $\top$ value. Operationally, a settling that has been reindexed along an orbit-coloring generator is paraconsistently saturated on that orbit and carries no remaining truth-or-falsity information there.

The eight generators sort into three operational kinds:

- **Diagonal-painters** ($\eta_\top^\Delta \cdot \star$, four of them): assert paraconsistent collapse on identity-pair predications $(s, p, s)$ while preserving structured information on off-identity predications. These model "every entity is in maximally-conflicted relation to itself" overlays.
- **Off-diagonal-painters** (two of them, $\eta_\top^{\Delta^c}$ and $\mathrm{ev}_\mathrm{diag}\cdot\eta_\top^{\Delta^c}$): assert paraconsistent collapse on cross-entity predications while preserving structured information on identity-pair predications. These model "every relation between distinct entities is maximally-conflicted" overlays.
- **Total-collapse** ($\eta_\top$): paraconsistent collapse on everything. The terminal generator in the boundary-extended Hom-monoid.

These are not a continuum and not a Lindström extension; they are a finite, concrete addition to the chapter's morphism inventory whose operational role is to introduce native syntactic handles for "this orbit is paraconsistent."

## Position

The eight orbit-coloring generators plus the chapter's existing 10 (4 chapter generators × $\mathrm{Sym}(E)$-invariant sub-supports, with the trivial constant-$\bot$ counted once) make 18 total natural bilattice homomorphism classes, exhausting the $\mathbf L = \mathbf 2$ classification per the [relaxed bilattice homomorphism classification](../theorems/relaxed-bilattice-homomorphism-classification.md). The category whose Hom-sets include them is the [boundary-extended predicate category](../objects/boundary-extended-predicate-category.md). The structural-integration questions about how they interact with the [predication fibration](../objects/predication-fibration.md), the [predication hyperdoctrine](../objects/predication-hyperdoctrine.md), and the [closure 2-monad](../morphisms/closure-2-monad.md) are collected in [orbit-coloring generator structural integration](questions/orbit-coloring-generator-structural-integration.md).
