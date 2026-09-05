---
kind: example
status: verified
depends-on: [spatiotemporal-knowledge-presheaf, closure-rule, closure-operator, predicate-category, predicate-specialization, predicate-category-naturality, four-regime-dichotomy, non-scott-continuous-firing-ordinal, settling-associated-sheaf, transfinite-bounded-regime-h1-generators, c-naturality-coupling-realizability-refinement]
instantiates: [predicate-category-naturality, transfinite-bounded-regime-h1-generators, c-naturality-coupling-realizability-refinement, closure-rule, closure-rule-system, closure-rule-language, non-scott-continuous-firing-ordinal]
---

# Coupled-predicate transfinite settling

A [transfinite-bounded-regime](../theorems/four-regime-dichotomy.md) settling on a non-discrete [predicate category](../objects/predicate-category.md) with a [predicate specialization](../morphisms/predicate-specialization.md) morphism, demonstrating how [predicate-category naturality](../concepts/predicate-category-naturality.md) couples the settling's behavior across predicates. The smallest example showing that closure firings at distinct predicates are not independently realizable when $\mathcal{C}$ has non-trivial morphisms.

## Construction

$\mathbf{L} = \mathbf{2}$, [entity set](../objects/entity-set.md) $E = \omega + 1$, [predicate set](../objects/predicate-set.md) $\Pi = \{P, Q\}$ with:

- $\mathrm{dom}(P) = \Delta_E = \{(\alpha, \alpha) : \alpha \leq \omega\}$ — the full diagonal of $E$.
- $\mathrm{dom}(Q) = \Delta_E \setminus \{(\omega, \omega)\} = \{(\alpha, \alpha) : \alpha < \omega\}$ — the *natural-number* diagonal, a strict sub-support.

[Predicate category](../objects/predicate-category.md) $\mathcal{C}$ has objects $\{P, Q\}$ and a single non-identity generator: a [predicate specialization](../morphisms/predicate-specialization.md) $f : Q \to P$ with sub-support inclusion $\iota_f : \mathrm{dom}(Q) \hookrightarrow \mathrm{dom}(P)$.

[Settling bound](../objects/settling-bound.md) $\lambda = \omega + 2$.

A single [closure rule](../concepts/closure-rule.md) at $P$, the transfinite-induction $\Pi_1$-schema:

$$(\forall \alpha < \beta.\; v(P)(\alpha, \alpha) \geq_k \mathbf{t}) \;\Longrightarrow\; v(P)(\beta, \beta) \geq_k \mathbf{t}, \qquad \beta < \omega + 1.$$

The closure operator's $\mathcal{C}$-naturality axiom $f^* \circ \mathrm{cl}_P = \mathrm{cl}_Q \circ f^*$ determines $\mathrm{cl}_Q$ from $\mathrm{cl}_P$: a rule firing at $P$ for $\beta$ propagates to $Q$ if $\beta \in \mathrm{dom}(Q)$, and is discarded otherwise.

[Increment sequence](../objects/increment-sequence.md): $u_0(P)(0, 0) = \mathbf{t}$. By $\mathcal{C}$-naturality of increments, $u_0(Q)(0, 0) = f^*(u_0(P))(0, 0) = \mathbf{t}$.

## Settling stages

Both fibers evolve coherently under $\mathcal{C}$-naturality:

- For $\tau \leq \omega$: $v_\tau(P)$ has support $\{(\alpha, \alpha) : \alpha \leq \tau\}$ on $P$'s full diagonal, and $v_\tau(Q) = f^*(v_\tau(P))$ has support $\{(\alpha, \alpha) : \alpha \leq \min(\tau, \omega - 1)\}$ on $Q$'s natural-number diagonal. ($Q$'s support equals $P$'s restricted to $\mathrm{dom}(Q)$.)

- At $\tau = \omega$ (limit): $v_\omega(P)$ has support $\{(\alpha, \alpha) : \alpha < \omega\}$, missing $(\omega, \omega)$. By $\mathcal{C}$-naturality, $v_\omega(Q)$ has the same restriction, missing nothing $Q$-relevant since $(\omega, \omega) \notin \mathrm{dom}(Q)$.

- At $\tau = \omega + 1$: closure fires on $P$ at $\beta = \omega$, adding $(P, \omega, \omega) = \mathbf{t}$. The pulled-back consequent for $Q$ is $f^*((P, \omega, \omega))$ — but $(\omega, \omega) \notin \mathrm{dom}(Q)$, so the consequent is *vacuously satisfied* on $Q$ (no $Q$-cell to add).

## Closure ordinal and regime

$\kappa = \omega + 1$. The settling lies in the [transfinite-bounded regime](../theorems/four-regime-dichotomy.md).

## Non-Scott-continuous firings

$L_{\mathrm{ns}}(\kappa) = \{\omega\}$ — a single non-Scott-continuous firing ordinal. The firing happens on $P$'s fiber (adding $(P, \omega, \omega)$); $Q$'s fiber has no corresponding new cell because the consequent ordinal $\omega$ is outside $Q$'s support.

## Cohomology

The [settling-associated sheaf](../objects/settling-associated-sheaf.md) $\mathcal{F}_U^{(t)}$ at $(P, \omega + 1, U)$ has one new cell $(\omega, \omega)$ when $U$ contains the corresponding $+$-point. At $(Q, \omega + 1, U)$ there is no new cell — $Q$'s support doesn't include $(\omega, \omega)$.

By [transfinite-bounded-regime $H^1$-generators](../theorems/transfinite-bounded-regime-h1-generators.md): one $\mathbb{Z}$-generator per non-Scott-continuous firing ordinal. The generator at $\mu = \omega$ corresponds to the new cell at $(P, \omega, \omega)$. So $H^1_t \cong \mathbb{Z}$, with classifying invariant $\mathrm{cl}\text{-}\mathrm{inv}^{(t)}(v) = e_\omega$.

## Realizability observation

The example illustrates a *non-trivial $\mathcal{C}$-naturality coupling* on realizability:

The independent-firing-on-disjoint-predicates pattern of [mixed-stratum two-firing settling](mixed-stratum-two-firing-settling.md) — where $P$'s firings and $Q$'s firings are independently chosen — does *not* extend to non-discrete predicate categories. When $\mathcal{C}$ has a specialization $f : Q \to P$, $Q$'s firings are *determined* by $P$'s firings (via restriction along $\iota_f$). $Q$ has no independent realizability.

In particular, the realizable family for the pair $(L_{\mathrm{ns}}^{(P,t)}, L_{\mathrm{ns}}^{(Q,t)})$ is constrained by:

$$L_{\mathrm{ns}}^{(Q,t)} = L_{\mathrm{ns}}^{(P,t)} \cap \{\mu : (\mu, \mu) \in \mathrm{dom}(Q)\},$$

where $(\mu, \mu)$ is the cell added by the firing at $\mu$ in this transfinite-induction-rule construction. The two predicates' firings are not independent — they are coupled by the predicate-category structure.

This is the *first non-trivial dimension* of the realizability question that base-shift and bigraded independence don't capture: $\mathcal{C}$-naturality reduces dimensionality. With $\mathcal{C}$ richer (more morphisms, more constraints), realizability becomes correspondingly more constrained.

## What this opens

The coupling generalizes to all four predicate-category generators:

- *Specialization* (this example): $Q$'s firings are restrictions of $P$'s.
- *Converse*: $Q$'s firings are swaps of $P$'s.
- *Subject-projection*, *object-projection*: $Q$'s firings are specific cellwise diagonalizations of $P$'s.

Each generator-class imposes its own $\mathcal{C}$-naturality coupling on the realizable firing patterns. The *full realizable family* over an arbitrary $\mathcal{C}$ is the orbit of an initial-segment-realizing rule on a single "free" predicate, propagated to all $\mathcal{C}$-related predicates by the four-generator structure. Characterizing the resulting family precisely is part of the [realizability question](../questions/realizability-of-cohomology-classes.md).

## Role

The simplest concrete example showing $\mathcal{C}$-naturality coupling on realizability. Demonstrates that the realizability question depends not only on the rule language but also on $\mathcal{C}$'s morphism structure: richer $\mathcal{C}$ → more coupling → constrained realizable family. Pairs with [mixed-stratum two-firing settling](mixed-stratum-two-firing-settling.md) (no $\mathcal{C}$-coupling) to bracket the spectrum of $\mathcal{C}$-structures the realizability question must address.
