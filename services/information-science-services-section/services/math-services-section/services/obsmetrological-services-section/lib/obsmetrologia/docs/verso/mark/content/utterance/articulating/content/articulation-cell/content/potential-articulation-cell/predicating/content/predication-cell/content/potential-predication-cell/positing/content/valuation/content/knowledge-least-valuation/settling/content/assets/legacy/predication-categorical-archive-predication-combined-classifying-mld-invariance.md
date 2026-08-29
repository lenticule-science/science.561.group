---
type: theorem
status: proved
depends-on: [combined-cohomology-classifying-morphism, mutually-locally-derivable, aperiodic-regime-classification, settling-morphism, settling-associated-sheaf]
---

# Combined classifying morphism is MLD-invariant across regimes

The [combined cohomology classifying morphism](../morphisms/combined-cohomology-classifying-morphism.md) $\mathrm{cl}\text{-}\mathrm{inv}^{(0, 1)}$ is well-defined on [MLD-classes](teaching/explanations/mutually-locally-derivable.md): if $v \sim_{\mathrm{MLD}} v'$ then

$$\mathrm{cl}\text{-}\mathrm{inv}^{(0, 1)}(v) \;=\; \mathrm{cl}\text{-}\mathrm{inv}^{(0, 1)}(v').$$

The statement holds in all four regimes.

## Proof

An invertible [settling-morphism](../morphisms/settling-morphism.md) $(\delta, \phi) : v \to v'$ induces a sheaf isomorphism $\phi_* : \mathcal{F}_U \xrightarrow{\sim} \mathcal{F}_{U'}[\delta]$ on the [bitopological settling site](../objects/bitopological-settling-site.md), as in the [aperiodic-regime classification](aperiodic-regime-classification.md) proof Step 3. Functoriality of cohomology then gives an iso $\phi_*$ on each cohomology group:

- $H^0$: $\phi_*$ sends the global identity section to the global identity section, so $[\mathbf{1}_{H^0(v)}] \mapsto [\mathbf{1}_{H^0(v')}]$.
- $H^1$: $\phi_*$ sends $\mathrm{cl}\text{-}\mathrm{inv}(v) \mapsto \mathrm{cl}\text{-}\mathrm{inv}(v')$ in the appropriate identification.

Both components of $\mathrm{cl}\text{-}\mathrm{inv}^{(0, 1)}$ are preserved. $\square$

## Applies in all regimes

The proof is regime-independent: it uses only that an MLD-morphism induces a sheaf isomorphism, which holds for any regime. In particular:

- **the strict and Scott-continuous regimes.** $H^1 = 0$, so the $H^1$-component is trivially preserved. MLD-invariance reduces to $H^0$-invariance, which holds because the morphism preserves designated-cell sets.
- **the transfinite-bounded and aperiodic regimes.** Both $H^0$ and $H^1$ components are preserved by the sheaf-iso.

## Consequence

$\mathrm{cl}\text{-}\mathrm{inv}^{(0, 1)}$ descends to a function on the [coarse settling moduli](../objects/coarse-settling-moduli.md). On each regime stratum, injectivity of the descent is the classification claim:

- Aperiodic regime: [aperiodic-regime moduli classification](aperiodic-regime-moduli-classification.md) gives injectivity (with $|E| \geq \omega_1$).
- Transfinite-bounded regime: [transfinite-bounded-regime moduli classification](transfinite-bounded-regime-moduli-classification.md) gives injectivity.
- the strict and Scott-continuous regimes: [combinatorial classification across regimes](combinatorial-classification-across-regimes.md) gives the combinatorial form, equivalent to MLD via [biequivalence-cohomological collapse](biequivalence-cohomological-collapse.md).
