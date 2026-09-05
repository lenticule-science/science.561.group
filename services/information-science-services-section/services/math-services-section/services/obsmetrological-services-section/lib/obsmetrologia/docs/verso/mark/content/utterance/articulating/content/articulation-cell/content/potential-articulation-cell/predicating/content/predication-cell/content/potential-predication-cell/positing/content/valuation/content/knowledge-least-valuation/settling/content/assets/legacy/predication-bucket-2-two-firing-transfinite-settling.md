---
type: example
status: verified
depends-on: [predication-settling, closure-rule, closure-operator, four-regime-dichotomy, non-scott-continuous-firing-ordinal, transfinite-bounded-regime-h1-generators, transfinite-bounded-regime-moduli-classification, transfinite-bounded-regime-realizability, closure-ordinal]
instantiates: [four-regime-dichotomy, transfinite-bounded-regime-h1-generators, transfinite-bounded-regime-realizability, closure-rule, closure-rule-system, closure-rule-language, non-scott-continuous-firing-ordinal]
lineage: 4
---

# Two-firing transfinite settling

A [transfinite-bounded-regime](../theorems/four-regime-dichotomy.md) settling with non-Scott-continuous firing-ordinal set of cardinality two — the smallest new example beyond [quantifier-induced transfinite settling](quantifier-induced-transfinite-settling.md)'s single-firing case.

## Construction

$\mathbf{L} = \mathbf{2}$, [entity set](../objects/entity-set.md) $E = \omega \cdot 2 + 1$, [predicate set](../objects/predicate-set.md) $\Pi = \{P\}$ with $\mathrm{dom}(P) = \Delta_E$, [predicate category](../objects/predicate-category.md) $\mathcal{C}$ the one-object category on $P$, [settling bound](../objects/settling-bound.md) $\lambda = \omega \cdot 2 + 2$. The single [closure rule](../concepts/closure-rule.md) is the transfinite-induction $\Pi_1$-schema:

$$(\forall \alpha < \beta.\; v(P)(\alpha, \alpha) \geq_k \mathbf{t}) \;\Longrightarrow\; v(P)(\beta, \beta) \geq_k \mathbf{t}, \qquad \beta < \omega \cdot 2 + 1.$$

[Increment sequence](../objects/increment-sequence.md): $u_0(P)(0, 0) = \mathbf{t}$, all other increments $\bot$.

## Settling stages

For each $\tau \leq \omega \cdot 2$, the settling state has $\mathbf{t}$-support $S_\tau := \{(\alpha, \alpha) : \alpha \leq \tau\}$.

- $\tau = 0$: by initial data, $S_0 = \{(0, 0)\}$.
- $\tau = \sigma + 1$ for $\sigma < \omega \cdot 2$: Rule fires at $\beta = \sigma + 1$ — antecedent "$\forall \alpha < \sigma + 1.\, v(P)(\alpha, \alpha) \geq_k \mathbf{t}$" holds by induction; consequent gives $v_{\sigma+1}(P)(\sigma+1, \sigma+1) \geq_k \mathbf{t}$.
- $\tau = \mu$ countable limit ($\mu \in \{\omega, \omega \cdot 2\}$): [settling continuity](../concepts/settling-continuity.md) gives $v_\mu(P)(\alpha, \alpha) = \bigvee_k\{v_\sigma(P)(\alpha, \alpha) : \sigma < \mu\}$. For $\alpha < \mu$, the join is $\mathbf{t}$. For $\alpha = \mu$, every $\sigma < \mu$ gives $\bot$, so the join is $\bot$. Closure then fires at $\tau = \mu + 1$ to add $(\mu, \mu)$ to the support.

By transfinite induction the $\mathbf{t}$-support at every stage is exactly $S_\tau$.

## Closure ordinal

$\kappa = \omega \cdot 2 + 1$. The settling strictly increases through $\tau = \omega \cdot 2$; at $\tau = \omega \cdot 2 + 1$ the rule fires for $\beta = \omega \cdot 2$ producing $v_{\omega \cdot 2 + 1}(P)(\omega \cdot 2, \omega \cdot 2) = \mathbf{t}$; thereafter the rule cannot fire because no $\beta \in E$ exceeds $\omega \cdot 2$.

Since $\omega < \kappa < \omega_1$, the settling lies in the [transfinite-bounded regime](../theorems/four-regime-dichotomy.md).

## Non-Scott-continuous firings

The closure rule fires non-Scott-continuously at exactly $\mu \in \{\omega, \omega \cdot 2\}$:

- At $\mu = \omega$: the antecedent "$\forall \alpha < \omega.\, v(P)(\alpha, \alpha) \geq_k \mathbf{t}$" is satisfied at the directed join $\bigvee_k\{v_n : n < \omega\}$ but not at any individual $v_n$ (the cell $(n+1, n+1)$ is still $\bot$ at $v_n$, so $\alpha = n+1$ is a witness). The closure jumps at $\omega$.
- At $\mu = \omega \cdot 2$: similarly, the antecedent for $\beta = \omega \cdot 2$ is satisfied only at the full $\mu$-join; the firing at the cell $(\omega \cdot 2, \omega \cdot 2)$ is non-Scott-continuous.

So $L_{\mathrm{ns}}(\kappa) = \{\omega, \omega \cdot 2\}$.

## Classifying invariant

By [transfinite-bounded-regime $H^1$-generators](../theorems/transfinite-bounded-regime-h1-generators.md):

$$H^1(\mathbf{T}^*_{\leq \omega \cdot 2 + 1},\, \mathcal{F}_U) \;\cong\; \mathbb{Z} \oplus \mathbb{Z},$$

with generators $e_\omega$ and $e_{\omega \cdot 2}$. The [aperiodic classifying invariant](../objects/aperiodic-classifying-invariant.md) is

$$\mathrm{cl}\text{-}\mathrm{inv}(v) \;=\; e_\omega + e_{\omega \cdot 2},$$

the all-ones element on the two-generator basis.

## Realizability observation

The construction realizes the $L_{\mathrm{ns}}$-subset $\{\omega, \omega \cdot 2\}$ from the [closure-rule language](../concepts/closure-rule.md) — using the same uniform $\Pi_1$-rule as [transfinite-induction-settling](transfinite-induction-settling.md), differing only in the entity-set choice $E$. The example illustrates a realizability mechanism: a *single* uniform $\Pi_1$-rule, parametrized by the entity set, realizes a family of $L_{\mathrm{ns}}$-sets — for each ordinal $\eta$, taking $E = \eta + 1$ realizes $L_{\mathrm{ns}} = \{\mu \leq \eta : \mu \text{ a countable limit ordinal}\}$.

**Scope of this observation.** This concerns the *truth-side* $L_{\mathrm{ns}}^{(t)}$ of a *consistent* (no $\top$-cells), *single-predicate*, $\{\bot, \mathbf{t}\}$-valued settling — a single dimension of the [realizability question](../questions/realizability-of-cohomology-classes.md). The full realizability question respects the bigraded structure ($\mathbf{t}$-side vs $\top$-side via the bigraded classifying invariant), the multi-predicate structure ($\mathcal{C}$-naturality coupling between predicates), and the $H^0$-component of the combined classifying invariant. The base-shift family captures only the truth-side single-predicate consistent piece. Other realizability dimensions are addressed in other examples — see [mixed-stratum two-firing settling](mixed-stratum-two-firing-settling.md) for the bigraded refinement and [coupled-predicate transfinite settling](coupled-predicate-transfinite-settling.md) for the $\mathcal{C}$-naturality dimension.

## Role

Smallest example after the single-firing case. Bridges the gap between [quantifier-induced transfinite settling](quantifier-induced-transfinite-settling.md) ($|L_{\mathrm{ns}}| = 1$) and [transfinite-induction settling](transfinite-induction-settling.md) ($|L_{\mathrm{ns}}| = \aleph_1$). Demonstrates that the realizable $L_{\mathrm{ns}}$-sets include arbitrary finite subsets of countable limit ordinals reachable by base-shift.
