---
kind: example
status: verified
depends-on: [meta-moduli-stack-theorem, meta-stratification-by-regime, meta-realizability-map, transfinite-induction-strong-mld-exchange-orbit, transfinite-induction-settling, social-network-meta-classification, trivial-base-meta-classification]
instantiates: [meta-moduli-stack-theorem, meta-stratification-by-regime]
lineage: 4
type: example
---

# Meta-classification of the transfinite-induction closure rule

The L4 instance of the [meta-moduli stack](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/meta-moduli-stack-theorem.md) at non-trivial level. **Lineage 4** instance — first concrete meta-classification of a transfinite-bounded / aperiodic-flavored closure rule.

## The closure-rule meta-point

The L4 closure rule:

$$\mathcal{S}_{\Pi_1} \;:=\; \{\text{the rule } (\forall \alpha < \beta. v(P)(\alpha, \alpha) = \mathbf{t}) \Rightarrow v(P)(\beta, \beta) \geq_k \mathbf{t}\}$$

is a single-rule system. Its rule-language fragment is **$\Pi_1$** (one universal quantifier over earlier ordinals).

## Meta-stratum

Per [meta-stratification by regime theorem](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/meta-stratification-by-regime.md), the rule-language fragment determines the meta-stratum:

- $\Pi_0$ rules → meta-strict.
- $\Sigma_0 / \Pi_0$ + finite Boolean → meta-Scott-continuous.
- $\Pi_1$ rules → meta-transfinite-bounded.
- $\Pi_2$ or higher → meta-aperiodic.

$\mathcal{S}_{\Pi_1}$ has $\Pi_1$ rule-language, so $[\mathcal{S}_{\Pi_1}] \in \mathscr{M}^{\mathrm{meta}}_{\mathrm{TB}}$ — **meta-transfinite-bounded**.

## Closure-equivalence class

Other rule systems closure-equivalent to $\mathcal{S}_{\Pi_1}$:

- $\mathcal{S}_{\Pi_1} \cup \{r_{\text{vacuous}}\}$ for any vacuous self-rule — same closure operator.
- $\mathcal{S}_{\Pi_1}$ with the universal quantifier replaced by an equivalent formula — same closure.
- Variants of the rule restricted to a different ordinal range (e.g., for $\beta < \omega \cdot 2$ only) — these are *different* meta-points (different closure operators), in different sub-cases of meta-transfinite-bounded.

## Realizability map's image

For $[\mathcal{S}_{\Pi_1}]$, the realizability map's fiber is the moduli of all settlings $v_{\mathcal{S}_{\Pi_1}}^U$ for varying increment sequences $U$. The fiber contains:

- The trivial settling $v^{U = \bot}$ — strict regime (no firings).
- The successor-rule-only settling at each ordinal — Scott-continuous to transfinite-bounded depending on $E$.
- The full $\Pi_1$-induction settling at $E = \omega_1$ — aperiodic (the [transfinite-induction settling](transfinite-induction-settling.md)).

The fiber has settlings in *multiple* regime strata (strict / SC / TB / aperiodic depending on the increment sequence and entity-set choice). This matches the meta-stratification's "supremum-of-settling-regime" definition: $\mathcal{S}_{\Pi_1}$ is meta-transfinite-bounded because it CAN reach the transfinite-bounded regime under appropriate $U$ — but it can also stay strict under trivial $U$.

## Position in Lineage 4

The L4 meta-classification instance. Compared with:

- L1 [trivial-base-meta-classification](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/trivial-base-meta-classification.md): meta-strict, 4 points.
- L2 [social-network-meta-classification](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/social-network-meta-classification.md): meta-strict, dozens of points.
- L4 (this file): meta-transfinite-bounded, with one canonical point ($[\mathcal{S}_{\Pi_1}]$) plus its closure-equivalent variants.

The progression L1 → L2 → L4 exhibits the meta-stratum hierarchy: meta-strict at finite bases, meta-transfinite-bounded once $\Pi_1$ rules become available.
