---
type: morphism
class: morphism
symbol: "\\phi"
depends-on: [predication-settling, residuated-lattice, entity-set, predicate-category, settling-bound, predication-fiber-algebra, bilattice-homomorphism, knowledge-order]
---

# Predication settling morphism

Let $v, v'$ be [predication settlings](../objects/predication-settling.md) over $(\mathbf{L}, \mathcal{C}, E, \lambda)$ and $(\mathbf{L}', \mathcal{C}', E', \lambda')$ respectively. A **predication-settling base-morphism** $\phi : v \to v'$ is the cross-base notion: it consists of

1. A homomorphism $\ell : \mathbf{L} \to \mathbf{L}'$ of integral commutative [residuated lattices](../objects/residuated-lattice.md).
2. A function $e : E \to E'$ between [entity sets](../objects/entity-set.md).
3. A functor $\pi : \mathcal{C} \to \mathcal{C}'$ between [predicate categories](../objects/predicate-category.md), preserving generator classes.
4. An order-preserving map $\phi_\lambda : \lambda \to \lambda'$ between [settling bounds](../objects/settling-bound.md).
5. A family $\phi = (\phi_{p, \tau})$ of [bilattice homomorphisms](bilattice-homomorphism.md) $\phi_{p, \tau} : A_p \to A_{\pi(p)}'$ on the [predication fiber algebras](../objects/predication-fiber-algebra.md), each induced by $\ell^\bowtie$ and $e \times e$, such that
$$\phi_{p, \tau}(v_\tau(p)) \leq_k v'_{\phi_\lambda(\tau)}(\pi(p))$$
for all $p, \tau$, where $\leq_k$ is the [knowledge order](../concepts/knowledge-order.md).

The cross-base data $(\ell, e, \pi, \phi_\lambda)$ is the morphism in the [parameter base category](../objects/parameter-base-category.md) $\mathbf{B}$; the bilattice-hom family $(\phi_{p, \tau})$ is the cellwise lift to fiber algebras. Predication-settling base-morphisms are the 1-cells of the total category over $\mathbf{B}$.

## Two other morphism notions

Two same-base notions on predication settlings carry different structure and have their own files:

- The [predication-settling preorder morphism](predication-settling-preorder-morphism.md) is the same-base $\leq_k$-preorder relation: $v \to v'$ exists iff $v \leq_k v'$ pointwise. This is the morphism class of the [predication-settling category](../objects/predication-settling-category.md) and underwrites $\leq_k$-completeness theorems.
- The [settling-morphism](settling-morphism.md) is the same-base strict notion: state *equality* with ordinal shift $\delta$, plus [settling endofunctor](settling-endofunctor.md) commutation. This underwrites [mutually-locally-derivable](../concepts/mutually-locally-derivable.md) equivalence and the [aperiodic-regime classification theorem](../theorems/aperiodic-regime-classification.md).

Predication-settling base-morphisms (this file), predication-settling preorder morphisms, and settling-morphisms are three genuinely different mathematical objects. See [equivalence hierarchy](../narratives/equivalence-hierarchy.md) for how they assemble at the moduli level.
