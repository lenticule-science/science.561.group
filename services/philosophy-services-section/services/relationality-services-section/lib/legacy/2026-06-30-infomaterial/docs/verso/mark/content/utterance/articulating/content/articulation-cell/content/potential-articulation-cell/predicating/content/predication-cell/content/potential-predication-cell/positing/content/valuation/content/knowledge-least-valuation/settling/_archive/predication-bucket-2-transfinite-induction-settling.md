---
type: example
depends-on: [aperiodic-settling, four-regime-dichotomy, aperiodicity-characterization, scott-continuous-closure, closure-2-monad, temporal-2-category, settling-bound, closure-ordinal]
instantiates: [aperiodic-settling, four-regime-dichotomy, closure-2-monad-lax-idempotence, closure-rule, closure-rule-system, closure-rule-language, non-scott-continuous-firing-ordinal]
lineage: 4
---

# Transfinite-induction settling

A concrete realization of the [aperiodic settling](../concepts/aperiodic-settling.md) regime, replacing the qualitative [aperiodic sketch](aperiodic-settling-sketch.md) with a fully-specified construction whose closure ordinal is exactly $\omega_1$.

## Construction

Fix $\mathbf{L} = \mathbf{2}$, [entity set](../objects/entity-set.md) $E = \omega_1$ (the first uncountable ordinal), [predicate set](../objects/predicate-set.md) $\Pi = \{P\}$ with $\mathrm{dom}(P) = \Delta_E = \{(\alpha, \alpha) : \alpha < \omega_1\}$, [predicate category](../objects/predicate-category.md) $\mathcal{C}$ the one-object category on $P$, and [settling bound](../objects/settling-bound.md) $\lambda = \omega_1 + 1$. The [closure operator](../morphisms/closure-operator.md) $\mathrm{cl}_P$ is the single inference rule

$$(\forall \alpha < \beta.\; v(P)(\alpha, \alpha) = \mathbf{t}) \;\Longrightarrow\; \mathrm{cl}_P(v)(P)(\beta, \beta) \geq_k \mathbf{t} \qquad (\beta < \omega_1).$$

[Increment sequence](../objects/increment-sequence.md): $u_0(P)(0, 0) = \mathbf{t}$ and $u_\tau = \bot$ for $\tau > 0$. Initial state $v_0(P)(0, 0) = \mathbf{t}$, all other cells $\bot$.

## Settling stages

For every $\tau < \omega_1$, the settling state $v_\tau$ has $\mathbf{t}$-support exactly $S_\tau := \{(\alpha, \alpha) : \alpha \leq \tau\}$; all other cells are $\bot$.

*Proof by transfinite induction on $\tau$.*
- $\tau = 0$: by initial data.
- $\tau = \sigma + 1$: by induction, every $\alpha \leq \sigma$ has $v_\sigma(P)(\alpha, \alpha) = \mathbf{t}$. Applying $\mathrm{cl}_P$ with $\beta = \sigma + 1$: all $\alpha < \sigma + 1$ satisfy the hypothesis, so $\mathrm{cl}_P(v_\sigma)(P)(\sigma + 1, \sigma + 1) \geq_k \mathbf{t}$. No earlier cell changes.
- $\tau = \mu$ countable limit: [settling continuity](../concepts/settling-continuity.md) gives $v_\mu(P)(\alpha, \alpha) = \bigvee_k\{v_\sigma(P)(\alpha, \alpha) : \sigma < \mu\}$. For $\alpha < \mu$ some $\sigma < \mu$ has $v_\sigma(P)(\alpha, \alpha) = \mathbf{t}$; the join is $\mathbf{t}$. For $\alpha = \mu$ every $\sigma < \mu$ gives $\bot$; join is $\bot$. Closure then fires at $\tau = \mu + 1$ to derive $v_{\mu+1}(P)(\mu, \mu) = \mathbf{t}$. $\square$

## Closure ordinal

The closure ordinal is $\kappa = \omega_1$.

For every $\tau < \omega_1$ the settling strictly increases at step $\tau + 1$ (or $\tau + 2$ at limits): a new diagonal cell transitions from $\bot$ to $\mathbf{t}$. No countable ordinal is a strict fixed point. At $\tau = \omega_1$ every $\alpha < \omega_1$ has $v_{\omega_1}(P)(\alpha, \alpha) = \mathbf{t}$, but $\omega_1 \notin E$, so the rule cannot fire further; $v_{\omega_1} = v_{\omega_1+1}$. The closure ordinal is exactly $\omega_1$, attaining equality in the [aperiodicity definition](../concepts/aperiodic-settling.md).

## Non-Scott-continuity

The closure $\mathrm{cl}_P$ is not [Scott-continuous](../concepts/scott-continuous-closure.md). Take the directed family $\{w_n\}_{n < \omega} \subseteq A_P$ with $w_n(P)(k, k) = \mathbf{t}$ for $k \leq n$ and $\bot$ elsewhere. The directed $\leq_k$-join is $w_\omega$ with $\mathbf{t}$-support $\{(k, k) : k < \omega\}$.

- $\bigvee_k\{\mathrm{cl}_P(w_n) : n < \omega\}$: each $\mathrm{cl}_P(w_n) = w_{n+1}$, so the join is $\mathbf{t}$ on $\{(k, k) : k \leq \omega\} \setminus \{(\omega, \omega)\}$, $\bot$ at $(\omega, \omega)$.
- $\mathrm{cl}_P(w_\omega)$: all $\alpha < \omega$ satisfy the rule's hypothesis, so the rule fires at $\beta = \omega$, giving $\mathbf{t}$ at $(\omega, \omega)$.

The two disagree at $(\omega, \omega)$. By [aperiodicity characterization](../theorems/aperiodicity-characterization.md), non-Scott-continuity together with state-space cofinality $\geq \omega_1$ — witnessed by the strictly $\leq_k$-ascending chain $(v_\tau)_{\tau < \omega_1}$ — places the settling in [aperiodic regime](../theorems/four-regime-dichotomy.md).

## 2-cell structure

In the [temporal 2-category](../objects/temporal-2-category.md) $\mathbf{T}(\mathcal{C}, \omega_1 + 1)$, the settling orbit carries a non-identity 2-cell at every successor step $v_\tau \to v_{\tau+1}$ for $\tau < \omega_1$. Limit-step continuity 2-cells $\bigvee_k\{v_\sigma : \sigma < \mu\} \to v_\mu$ are identity by the strict-continuity convention. The "KZ-lax-idempotent diamond fully alive" — non-identity 2-cells throughout the $\omega_1$-indexed settling — manifests here.

## Minimality

The construction is minimal in three senses: $E = \omega_1$ is the least ordinal of uncountable cofinality (any countable $E$ forces $\kappa < \omega_1$, the strict and Scott-continuous regimes/C); $|\Pi| = 1$ is the smallest non-trivial predicate set; one closure rule suffices. Any concrete aperiodic settling must attain at least this complexity.

## Role

The anchor for the [aperiodic classifying invariant](../objects/aperiodic-classifying-invariant.md) of the [aperiodic-regime classification theorem](../theorems/aperiodic-regime-classification.md), and for the worked aperiodic-regime example in the cohomology layer.

## Position in Lineage 4

The entry point of **Lineage 4** — the transfinite-bounded $\Pi_1$-induction example chain. Establishes the vocabulary the rest of the lineage carries: $\mathbf{L} = \mathbf{2}$, $E$ an ordinal, single binary predicate $P$ with $\mathrm{dom}(P) = \Delta_E$, the $\Pi_1$-induction closure rule "$(\forall \alpha < \beta. v(P)(\alpha, \alpha) = \mathbf{t}) \Rightarrow v(P)(\beta, \beta) \geq_k \mathbf{t}$" (the L4 transfinite-induction rule).

Note: this file is at the *boundary* of L4 with $E = \omega_1$ (technically aperiodic). Lineage 4 proper has $E = \omega \cdot k + 1$ for finite $k$ (transfinite-bounded). This file serves as the L4-to-L5 transition example.

L4 members in order:
- (this file) — entry; L4-to-L5 transition with $E = \omega_1$.
- [two-firing-transfinite-settling](two-firing-transfinite-settling.md) — $E = \omega \cdot 2 + 1$; two NSC firings.
- [countably-many-firings-transfinite-settling](countably-many-firings-transfinite-settling.md) — $E = \omega^2 + 1$; countably many firings.
- [mixed-stratum-two-firing-settling](mixed-stratum-two-firing-settling.md) — mixed firing types.
- [transfinite-bounded-regime-moduli-point](transfinite-bounded-regime-moduli-point.md) — moduli stack instance.
- [transfinite-induction-moduli-point](transfinite-induction-moduli-point.md) — moduli stack at the $\omega_1$ limit.
- [transfinite-induction-d-frame-h1-generators](transfinite-induction-d-frame-h1-generators.md) (forthcoming) — d-frame $H^1$ generators $D_\mu$.
- [transfinite-induction-strong-mld-exchange-orbit](transfinite-induction-strong-mld-exchange-orbit.md) (forthcoming) — strong-MLD orbit.
- [transfinite-induction-verdier-dual](transfinite-induction-verdier-dual.md) (forthcoming) — Verdier dual.
- [transfinite-induction-co-classification](transfinite-induction-co-classification.md) (forthcoming) — aperiodic co-class.
- [transfinite-induction-meta-classification](transfinite-induction-meta-classification.md) (forthcoming) — meta-classifier.
- [transfinite-induction-deformation-tangent](transfinite-induction-deformation-tangent.md) (forthcoming) — deformation tangent.
- [mixed-stratum-bigraded-refinement](mixed-stratum-bigraded-refinement.md) (forthcoming) — bigraded refinement.

L4's role: the *workhorse* benchmark — first lineage where NSC firings produce non-trivial classifying invariants and where predication categories' distinctive content (d-frame H^1, strong-MLD orbits, Verdier dual, etc.) actually has room to live without going to full $\omega_1$ aperiodic.
