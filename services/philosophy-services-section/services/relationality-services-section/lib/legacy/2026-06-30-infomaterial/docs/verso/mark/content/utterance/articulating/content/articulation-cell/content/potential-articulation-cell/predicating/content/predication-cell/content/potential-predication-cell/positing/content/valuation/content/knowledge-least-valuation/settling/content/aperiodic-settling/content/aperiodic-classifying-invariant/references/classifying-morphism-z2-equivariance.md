---
kind: theorem
status: proved
depends-on: [combined-cohomology-classifying-morphism, internal-z2-gauge, equivariant-settling-cohomology, bigraded-settling-cohomology]
---

# Classifying morphism $\mathbb{Z}/2$-equivariance

The [combined cohomology classifying morphism](../morphisms/combined-cohomology-classifying-morphism.md) (and its [bigraded](../objects/bigraded-settling-cohomology.md) refinement) is $\mathbb{Z}/2$-equivariant for the [internal $\mathbb{Z}/2$-gauge](../concepts/internal-z2-gauge.md) action induced by bilattice negation.

The action discussed here is the *external* gauge action on the cohomology target — what gauge does to classes in $H^1$.
This is distinct from the *intrinsic* gauge action on a single settling's automorphism group analyzed in [visible-automorphism sources](visible-automorphism-sources.md): that action's cellwise reindexing is the identity on $E \times E$ (gauge fixes cell positions and acts only on values), so gauge that stabilizes a settling sits in $N(v)$ and never contributes to $\mathrm{Aut}^{\mathrm{vis}}(v)$.
The two are consistent: gauge fixes cell positions (intrinsic) while permuting the value labels carried by those cells (external).

The action splits as:

- **Trivial on the $\top$-summand.** The inconsistency-sheaf $\mathcal{F}_U^{(\top)}$ is gauge-fixed because $\top$ is a $\sim$-fixed bilattice value.
- **Sign-flipping on the $t$-summand.** The truth-side settling-associated sheaf $\mathcal{F}_U^{(t)}$ is gauge-acted on by the $\mathbf{t} \leftrightarrow \mathbf{f}$ swap: a $\mathbf{t}$-firing maps to an $\mathbf{f}$-firing, which under $\mathbf{t}$-designation reads as a negated contribution.

## Proof

The internal $\mathbb{Z}/2$-gauge $\sim$ on each [predication fiber algebra](../objects/predication-fiber-algebra.md) acts on the classifying invariants via the [equivariant settling cohomology](equivariant-settling-cohomology.md) refinement:

- $\sim$ fixes $\bot, \top$ pointwise — so $\mathcal{F}_U^{(\top)}$, which tracks $\top$-cells alone, is gauge-fixed.
  The $\mathbb{Z}/2$-action on the $\top$-summand of the bigraded invariant is trivial.
- $\sim$ swaps $\mathbf{t}, \mathbf{f}$ — so $\mathcal{F}_U^{(t)}$, which tracks $\mathbf{t}$-cells, is gauge-acted on by sending $\mathbf{t}$-cells to $\mathbf{f}$-cells.
  Under the convention that $\mathcal{F}_U^{(t)}$ counts only $\mathbf{t}$-cells (not $\mathbf{f}$-cells), the gauge action sends a $\mathbf{t}$-firing class $e_\mu \in H^1$ to its negation $-e_\mu$ — a sign-flip on the $\mathbf{t}$-summand.

Combining: the [combined classifying morphism](../morphisms/combined-cohomology-classifying-morphism.md) is $\mathbb{Z}/2$-equivariant with the indicated action splitting. $\square$

## Reading

The equivariance refines the [bigraded aperiodic-regime trichotomy](bigraded-aperiodic-regime-trichotomy.md): paraconsistent moduli points are gauge-stable (trivial action on the $\top$-only invariant), while classical points have non-trivial gauge action via sign-flipping.
The mixed stratum has partial gauge-stability depending on the relative weights of the two summands.

This equivariance is what makes the [equivariant settling cohomology](equivariant-settling-cohomology.md) machinery applicable at the moduli level: the Hochschild–Serre spectral sequence relates the moduli's classifying group to its gauge-equivariant refinement, with concrete structure on each sub-stratum of the trichotomy.

For the basic $\mathbf{t}$-designated settling-associated sheaves (no $\mathbf{f}$-cell tracking), the gauge action is *effectively trivial* on the moduli's classifying data — the sign-flip preserves the moduli class because both $e_\mu$ and $-e_\mu$ correspond to the same firing pattern up to orientation.
