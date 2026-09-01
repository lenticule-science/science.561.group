---
type: narrative
introduces: [settling-moduli-prestack, settling-fiber-groupoid]
see-also: [aperiodic-regime-classification, settling-associated-sheaf, settling-automorphism-1-truncation, settling-moduli-stack-theorem, combined-cohomology-classifying-morphism, moduli-classifying-function, mutually-locally-derivable, predication-fiber-algebra, priestley-dual-cover-topology, regime-decomposition, regime-stratification-non-semicontinuity, visible-settling-fiber-groupoid]
---

# Moduli layer

A settling is a particular predication settling with particular parameters. The moduli layer asks the structural questions one level up: what does the *space of settlings* look like? Given a base $B = (\mathbf{L}, \mathcal{C}, E, \lambda)$ — a residuated lattice, a predicate category, an entity set, a settling bound — what are the settlings over $B$ up to natural equivalence, and how do they vary as $B$ varies?

Two layers of structure:

- **Fixed base.** Over a single $B$, the settlings form a groupoid: the [settling fiber groupoid](../objects/settling-fiber-groupoid.md) $\mathrm{KP}^\simeq(B)$, with settlings as objects and biequivalences as morphisms. By [settling-automorphism 1-truncation](../theorems/settling-automorphism-1-truncation.md), this is genuinely a 1-groupoid — the lax-idempotent KZ apparatus does not produce moduli-level 2-cells. The [visible settling fiber groupoid](../objects/visible-settling-fiber-groupoid.md) is the quotient by automorphisms that act trivially on the [settling-associated sheaf](../objects/settling-associated-sheaf.md), and its components coincide with [MLD-equivalence](../concepts/mutually-locally-derivable.md) classes.

- **Varying base.** As the base varies, the moduli assembles into a stack on the [parameter base category](../objects/parameter-base-category.md) $\mathbf{B}$ equipped with the [Priestley-dual cover topology](../objects/priestley-dual-cover-topology.md). The [settling moduli stack theorem](../theorems/settling-moduli-stack-theorem.md) establishes this assembly: the settling prestack is in fact a 1-stack, with effective descent driven by the [predication fiber algebra](../objects/predication-fiber-algebra.md) being a sheaf of equational algebras on $\mathbf{B}$.

The moduli layer's central output is the [moduli classifying function](../morphisms/moduli-classifying-function.md): an MLD-class is sent to its settling-associated-sheaf isomorphism class, and that classification is refined by the [combined cohomology classifying morphism](../morphisms/combined-cohomology-classifying-morphism.md) into a stack-level statement. The [regime decomposition](../theorems/regime-decomposition.md) stratifies the moduli set-theoretically; the [aperiodic-regime classification](../theorems/aperiodic-regime-classification.md) classifies the most intractable stratum cohomologically. The image of the classifying function — which classes are *realized* by some MLD-class over each base — is characterized by the [realizability program](realizability-program.md) regime-by-regime and axis-by-axis.

The moduli is a 1-stack — not a 2-stack — and the regime stratification is set-theoretic, not topological ([regime-stratification non-semicontinuity](../theorems/regime-stratification-non-semicontinuity.md)). Both facts shape what kind of object the moduli is and what downstream constructions (deformation theory, representation theory, $(\infty,1)$-refinements) can be built on it.

Two concrete moduli points anchor the regime stratification: the [transfinite-bounded moduli point](../examples/transfinite-bounded-regime-moduli-point.md) — smallest concrete non-zero $H^1$ at the moduli level, with a single firing at $\omega$ — and the [transfinite-induction moduli point](../examples/transfinite-induction-moduli-point.md) — the canonical aperiodic-regime example with $H^1 \cong \bigoplus_{\aleph_1} \mathbb{Z}$ and an all-ones classifying invariant. Together they exhibit the cohomological invariants doing real work on rigid moduli points across regime boundaries.
