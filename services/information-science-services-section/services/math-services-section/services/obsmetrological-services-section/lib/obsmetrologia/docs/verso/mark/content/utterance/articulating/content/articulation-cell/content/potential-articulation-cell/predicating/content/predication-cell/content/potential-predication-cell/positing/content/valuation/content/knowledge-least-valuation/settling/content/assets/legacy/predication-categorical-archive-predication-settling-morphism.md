---
type: morphism
realizes: [mutually-locally-derivable]
class: morphism-class
depends-on: [predication-settling, settling-endofunctor, settling-bound, predication-fiber-algebra]
---

# Settling-morphism

A **settling-morphism** $\phi : v \to v'$ between [predication settlings](../objects/predication-settling.md) over a common base $(\mathbf{L}, \mathcal{C}, E, \lambda)$ respects both the settling orbit's state at each ordinal step and the structural action of the [settling endofunctor](settling-endofunctor.md). Concretely, $\phi$ consists of:

- An **ordinal shift** $\delta \in \lambda$.
- A family $\phi = (\phi_{q, \tau})$ of [bilattice homomorphisms](bilattice-homomorphism.md) $\phi_{q, \tau} : A_q \to A_q$ on each [predication fiber algebra](../objects/predication-fiber-algebra.md),

satisfying, for every $q \in \mathcal{C}$ and $\tau < \lambda - \delta$:

1. **State compatibility.** $\phi_{q, \tau}(v_\tau(q)) = v'_{\tau + \delta}(q)$.
2. **Settling-endofunctor commutation.** $\phi_{q, \tau + 1} \circ (F_U)_q = (F_{U'})_q \circ \phi_{q, \tau}$, up to canonical 2-isomorphism.

A settling-morphism is **invertible** if there exists $\psi : v' \to v$ with $\psi \circ \phi$ and $\phi \circ \psi$ equal to identity up to ordinal shifts $\delta, -\delta$.

## Reading

A settling-morphism is the natural notion of equivalence-up-to-settling-shift between two predication settlings over a common base. The state-compatibility condition pins down what each $\phi_{q, \tau}$ does on values; the settling-endofunctor commutation pins down that $\phi$ respects the *structural closure pattern*, not just the values.

This is what makes it possible to compare two settlings with potentially different closure rules but matching structural behaviour: the $F_U$-commutation forces $\phi$ to track inferential dynamics, not just static state. Settling-morphisms compose as expected, with shifts adding.

## Use

The basic ingredient of [mutually-locally-derivable](teaching/explanations/mutually-locally-derivable.md) equivalence on [aperiodic-regime](../theorems/four-regime-dichotomy.md) settlings, and of the [aperiodic-regime classification theorem](../theorems/aperiodic-regime-classification.md).

## Two other morphism notions

- The [predication-settling base-morphism](predication-settling-base-morphism.md) is the cross-base notion that varies the base parameters $(\mathbf{L}, \mathcal{C}, E, \lambda)$ themselves, with bilattice-hom family data and a $\leq_k$-inequality constraint along each base-change. It is the morphism class of the total category over the [parameter base category](../objects/parameter-base-category.md).
- The [predication-settling preorder morphism](predication-settling-preorder-morphism.md) is the same-base preorder relation: $v \to v'$ exists iff $v \leq_k v'$ pointwise. It is the morphism class of the [predication-settling category](../objects/predication-settling-category.md).

A settling-morphism is strictly stronger than either: state *equality* with shift, plus $F_U$-commutation. Every invertible settling-morphism implies a preorder morphism, but a preorder morphism alone is just a $\leq_k$-witness and need not extend to a settling-morphism. Settling-morphisms track inferential dynamics (via $F_U$-commutation); preorder morphisms track only state ordering.

See [equivalence hierarchy](prose/teaching/explanations/equivalence-hierarchy.md) for the role of settling-morphisms as 1-cells in the 2-category whose biequivalences are MLD.
