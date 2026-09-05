---
type: morphism
realizes: [cohomological-equivalence]
class: function
symbol: "\\mathcal{I}_B"
depends-on: [coarse-settling-moduli, settling-associated-sheaf, biequivalence-cohomological-collapse, cohomological-equivalence]
---

# Moduli classifying function

The function on the [coarse settling moduli](../objects/coarse-settling-moduli.md) sending each MLD-class to its [settling-associated sheaf](../objects/settling-associated-sheaf.md)'s isomorphism class.

For a base $B = (\mathbf{L}, \mathcal{C}, E, \lambda)$, define

$$\mathcal{I}_B \,:\, |\mathrm{KP}^{\mathrm{vis}}(B)| \;\longrightarrow\; \big\{ \text{sheaf-iso classes of } \mathcal{F}_U \text{ on } \mathbf{T}^*(B) \big\}, \qquad [v] \mapsto [\mathcal{F}_U]_\sim.$$

## Well-definedness

By [biequivalence-cohomological collapse](../theorems/biequivalence-cohomological-collapse.md): MLD-equivalent settlings have isomorphic settling-associated sheaves (possibly with settling-shift). Hence $\mathcal{I}_B$ is well-defined on MLD-classes, hence on the coarse moduli.

## Injectivity per regime

By the same theorem, the converse holds *on each regime stratum* under regime-specific hypotheses: the [partial converse](../theorems/biequivalence-cohomological-collapse.md) gives that sheaf-iso of $\mathcal{F}_U$ implies MLD-equivalence on each [regime stratum](../theorems/regime-decomposition.md). Consequently $\mathcal{I}_B$ is *injective* on each regime stratum.

The injectivity is regime-indexed:

- **Aperiodic regime** (with $|E| \geq \omega_1$): [aperiodic-regime moduli classification](../theorems/aperiodic-regime-moduli-classification.md) — detected via $H^1$-class agreement.
- **Transfinite-bounded regime**: [transfinite-bounded-regime moduli classification](../theorems/transfinite-bounded-regime-moduli-classification.md) — detected via $H^1 \cong \bigoplus_{L_{\mathrm{ns}}} \mathbb{Z}$ class agreement.
- **Strict and Scott-continuous regimes**: $H^1 = 0$, so cohomological detection is vacuous; injectivity reduces to combinatorial cell-pattern matching ([stabilizing-regimes combinatorial classification](../theorems/stabilizing-regimes-combinatorial-classification.md)).

## Target depends on the base

The target set of $\mathcal{I}_B$ — sheaf-iso classes of $\mathcal{F}_U$ — depends on $B$: different bases produce different classes of sheaves. For base-varying moduli questions, the target assembles into a universal sheaf-iso-class object via the descent layer of the moduli layer.

## What is open

The *image* of $\mathcal{I}_B$ — which sheaf-iso classes are realized by some MLD-class of settlings over $B$ — is open in general: see [realizability of cohomology classes](../questions/realizability-of-cohomology-classes.md).
