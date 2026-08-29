---
kind: morphism
realizes: [cohomological-equivalence]
type: function
symbol: "\\mathrm{cl}\\text{-}\\mathrm{inv}^{(0, 1)}"
depends-on: [settling-cohomology, settling-associated-sheaf, aperiodic-classifying-invariant, coarse-settling-moduli, moduli-classifying-function, parameter-base-category]
---

# Combined cohomology classifying morphism

The unified classifying morphism on the [coarse settling moduli](../objects/coarse-settling-moduli.md) extending the regime-specific [aperiodic classifying invariant](../objects/aperiodic-classifying-invariant.md) and [moduli classifying function](moduli-classifying-function.md) into a single statement that works across all four regimes.

For a fixed base $B$, define

$$\mathrm{cl}\text{-}\mathrm{inv}^{(0, 1)} \,:\, |\mathrm{KP}^{\mathrm{vis}}(B)| \;\to\; H^0(\mathbf{T}^*(B),\, \mathcal{F}_U) \,\oplus\, H^1(\mathbf{T}^*(B),\, \mathcal{F}_U)$$

sending an MLD-class $[v]$ to the pair

$$\mathrm{cl}\text{-}\mathrm{inv}^{(0, 1)}([v]) \;:=\; ([\mathbf{1}_{H^0(v)}],\; \mathrm{cl}\text{-}\mathrm{inv}(v)),$$

where $[\mathbf{1}_{H^0(v)}] \in H^0$ is the class of the global identity section (one generator per eventually-designated cell) and $\mathrm{cl}\text{-}\mathrm{inv}(v) \in H^1$ is the [aperiodic classifying invariant](../objects/aperiodic-classifying-invariant.md).

## Why combine $H^0$ and $H^1$

The [settling cohomology vanishes above degree 1](../theorems/settling-cohomology-vanishes-above-degree-1.md), so all classifying content is concentrated in $H^0$ and $H^1$. The two contributions split by regime:

- **the strict and Scott-continuous regimes.** $H^1 = 0$. Classification is $H^0$-driven (designated-cell counts). The $\mathrm{cl}\text{-}\mathrm{inv}$ component is zero; the $H^0$ component is the discriminating data.
- **the transfinite-bounded and aperiodic regimes.** $H^1 \neq 0$. Classification has both $H^0$ (cell counts) and $H^1$ (firing-ordinal pattern) contributions.

A single function $\mathrm{cl}\text{-}\mathrm{inv}^{(0, 1)}$ captures both consistently. By [combined classifying MLD-invariance](../theorems/combined-classifying-mld-invariance.md), the function is well-defined on MLD-classes. Injectivity on each regime stratum: [aperiodic-regime moduli classification](../theorems/aperiodic-regime-moduli-classification.md) and [transfinite-bounded-regime moduli classification](../theorems/transfinite-bounded-regime-moduli-classification.md) handle the aperiodic and transfinite-bounded strata via $H^1$-class agreement; [stabilizing-regimes combinatorial classification](../theorems/stabilizing-regimes-combinatorial-classification.md) handles the strict and Scott-continuous strata combinatorially via $H^0$-pattern matching. Together, $\mathrm{cl}\text{-}\mathrm{inv}^{(0, 1)}$ is injective on every regime stratum.

## As a stack morphism

Globalizing across the [parameter base category](../objects/parameter-base-category.md), the combined classifying morphism becomes a morphism of 1-stacks (see [classifying morphism is a stack morphism](../theorems/classifying-morphism-is-stack-morphism.md)):

$$\mathrm{cl}\text{-}\mathrm{inv}^{(0, 1)} \,:\, \mathscr{M}^{\mathrm{vis}} \;\to\; \underline{H}^{(0, 1)}$$

where $\underline{H}^{(0, 1)}$ is the stack whose fiber at $B$ is the set of cohomology classes $H^0(\mathbf{T}^*(B)) \oplus H^1(\mathbf{T}^*(B))$. This is the moduli-stack-level statement of the classification.

## Bigraded refinement

For paraconsistent settlings, the bigraded variant

$$\mathrm{cl}\text{-}\mathrm{inv}^{(k, t)} \,:\, [v] \mapsto (\mathrm{cl}\text{-}\mathrm{inv}^{(t)}(v),\, \mathrm{cl}\text{-}\mathrm{inv}^{(k)}(v),\, \mathrm{cl}\text{-}\mathrm{inv}^{(\top)}(v))$$

separately tracks the truth-side, knowledge-side, and inconsistency-side contributions, supplying the [bigraded aperiodic-regime trichotomy](../theorems/bigraded-aperiodic-regime-trichotomy.md). The combined and bigraded versions are complementary: $\mathrm{cl}\text{-}\mathrm{inv}^{(0, 1)}$ unifies across regimes, $\mathrm{cl}\text{-}\mathrm{inv}^{(k, t)}$ refines within a regime by paraconsistency content.
