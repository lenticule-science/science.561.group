---
type: concept
class: ordinal-condition
depends-on: [closure-operator, settling-continuity]
see-also: [scott-continuous-closure, closure-rule]
---

# Non-Scott-continuous firing ordinal

A specific kind of ordinal where a settling's [closure operator](../morphisms/closure-operator.md) fails to commute with directed $\leq_k$-joins — the structural source of [transfinite-bounded and aperiodic regime](../../../../../../../references/four-regime-dichotomy.md) cohomology generators.

Let $v$ be a settling with closure operator $\mathrm{cl}$. An ordinal $\mu < \kappa$ is a **non-Scott-continuous firing ordinal** iff

$$\mathrm{cl}\bigl(\textstyle\bigvee_k\{v_\sigma : \sigma < \mu\}\bigr) \;\neq\; \textstyle\bigvee_k\{\mathrm{cl}(v_\sigma) : \sigma < \mu\}.$$

The set of all such ordinals below $\kappa$ is

$$L_{\mathrm{ns}}(\kappa) \;:=\; \{\mu < \kappa \,:\, \mu \text{ is a non-Scott-continuous firing ordinal}\}.$$

## What happens at such an ordinal

At a non-Scott-continuous firing ordinal, the closure produces cells *not obtainable* as filtered-colimit values of earlier settling stages. The settling has a "jump": some cell $(s_\mu, o_\mu) \in E \times E$ is newly added at $\mu$ that no finite sub-stage's closure would have produced. The responsible inference is a [closure rule](closure-rule.md) with a $\forall$-antecedent over the earlier layers: such a rule fires only when the full $\leq_k$-join is available, and not at any finite sub-stage.

In a [Scott-continuous closure](../../../../../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/closure-operator/content/scott-continuous-closure/scott-continuous-closure.md), $L_{\mathrm{ns}}(\kappa)$ is empty: every settling firing is determined by some finite sub-collection of antecedents, so every settling value commutes with directed joins. In a non-Scott-continuous closure, $L_{\mathrm{ns}}(\kappa)$ records exactly the limit ordinals where infinitary firings happen.

## Cohomological role

By the [transfinite-bounded-regime $H^1$-generator theorem](../theorems/transfinite-bounded-regime-h1-generators.md), each $\mu \in L_{\mathrm{ns}}(\kappa)$ contributes exactly one $\mathbb{Z}$-generator to $H^1(\mathbf{T}^*_{\leq \kappa}, \mathcal{F}_U)$. The [aperiodic classifying invariant](../objects/aperiodic-classifying-invariant.md) is the sum of these generators across all non-Scott-continuous firings.

For the [transfinite-induction settling](../examples/transfinite-induction-settling.md), $L_{\mathrm{ns}}(\omega_1)$ is the set of countable limit ordinals — every countable limit ordinal is a non-Scott-continuous firing.
