---
type: example
status: draft
instantiates: [recurrent-practice]
depends-on: [recurrent-practice, regime-of-recurrent-practice, function-as-aperiodic-settling]
---

# Generational review as transfinite-bounded recurrence

A worked instance of a [recurrent practice](../terms/recurrent-practice.md) whose closure rules genuinely *limit-aggregate* across all prior cycles, placing the practice in the [transfinite-bounded regime](./regime-of-recurrent-practice.md) ($\omega < \kappa < \omega_1$). The practice: an *N-yearly state-of-the-function review* (e.g., a generational review every 25 years for a multi-generational endeavor) whose closure rule is *not* finite-history but reads aggregations across all prior cycles cumulatively.

This is the worked counterpart to [weekly-calendar-as-recurrent-practice](weekly-calendar-as-recurrent-practice.md): same shape (a recurrent-practice triple) but a different aggregation structure that lifts the regime above Scott-continuous.

## Setup

A working community committed to a long-horizon endeavor — say, a confederacy whose function persists across multiple generations. The community holds a *generational review* every 25 years. The review's purpose: take stock of the function's pursuit by aggregating evidence across *all* prior generations, identify cumulative patterns, and feed the integrated view into the next generation's planning.

## Data

The practice $R = (\mathcal{S}_R, T_R, \alpha_R)$:

- $\mathcal{S}_R$ — the closure-rule subsystem comprising:
  1. *Cycle-trigger.* On stage $\tau \in T_R$, mark `generational-review-active-at-stage` cell at $\mathbf{t}$.
  2. *Cumulative-evidence aggregation.* For every prior cycle $\tau_i < \tau$, gather the cells $\langle \mathrm{cycle}_i, \texttt{lessons-learned}, L_i\rangle = \mathbf{t}$ and produce a `cumulative-lessons` cell whose value is the meet/join across all $L_i$.
  3. *Pattern detection.* Closure rule whose antecedent reads the cumulative-lessons cell and produces `pattern-detected-at-cycle-$j$` cells when the cumulative pattern crosses some threshold.
  4. *Function-state assertion.* The review's terminal closure rule asserts `state-of-function-at-cycle-$j$` cells whose values depend on the cumulative aggregation.

- $T_R = \{\tau_0, \tau_0 + 25\,\text{yr}, \tau_0 + 50\,\text{yr}, \ldots\}$ — cycle-boundary ordinals every 25 years.

- $\alpha_R$ — *limit-aggregating*. The cumulative-evidence aggregation rule's antecedent quantifies over *all* $\tau_i < \tau$, not a finite-history slice. At cycle $\tau_n$ for $n < \omega$, the aggregation is over $n$ prior cycles (finite). At the $\omega$-th cycle (which exists in principle for an indefinite endeavor — that's $25\omega$ years out, an idealization), the aggregation reads the limit of the sequence of finite-prior aggregations: the $\omega$-th aggregation is *not derivable* from any finite stage's aggregation alone.

## Why this is non-Scott-continuous

The math program's [Scott-continuous closure](../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/concepts/scott-continuous-closure.md) requires that closures commute with directed joins:

$$\mathrm{cl}\bigl(\bigvee_{i<\omega} v_i\bigr) \;=\; \bigvee_{i<\omega} \mathrm{cl}(v_i)$$

For the generational review's aggregation rule, this fails: the closure operator at the $\omega$-th cycle reads $\bigvee_k\{v_n : n<\omega\}$ — the *limit* of all prior cycle settings — and applies the pattern-detection consequent. Pattern detection on the limit is *not* the join of pattern detections on each finite prior:

- Patterns visible only across infinitely-many cycles (e.g., "every prior cycle has shown pattern $P$") cannot be detected at any finite stage.
- The closure rule's consequent at $\omega$ depends on a property of the *whole sequence*, not on any single prior cycle.

This is the substrate-algebraic content of "cumulative wisdom" — wisdom that emerges from the totality of history rather than from any finite slice.

## Regime placement

By the [regime-of-recurrent-practice theorem](./regime-of-recurrent-practice.md):

- Cofinality of the limit-aggregation: countable (each cycle's aggregation is over a countable set of prior cycles; the meta-aggregation across cycles uses ordinal $\omega$ and beyond, but stays countable for any finite-time reach).
- $\kappa$: the closure ordinal exceeds $\omega$ (because of the non-Scott-continuous step) but stays below $\omega_1$ (because cofinality is countable).

Therefore: *transfinite-bounded regime*, $\omega < \kappa < \omega_1$.

Cohomological consequence: $H^1$ of the practice's settling is *non-trivial*. The practice carries a [classifying invariant in $H^1$](../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/transfinite-bounded-regime-h1-generators.md) — the cumulative-pattern structure of the practice's history.

## What this means operationally

- *Two communities running the same generational-review structure but with different histories carry different $H^1$-classes.* Their cumulative pattern structure is structurally distinguishable. This is the substrate-algebraic ground for "different traditions" — same practice form, different cohomological invariant.
- *MLD-equivalent generational reviews are those whose cumulative patterns agree up to cycle-bijection-with-base-shift.* Two reviews that look different but generate the same pattern structure are MLD-equivalent; their substantive content is the same up to relabeling.
- *The practice is not aperiodic.* Its closure ordinal is countable. It does not fully exhaust the cohomological discrimination of the math program's [aperiodic regime](../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/concepts/aperiodic-settling.md). For genuine aperiodicity, the closure rule would need uncountable-cofinality aggregation — which the [function-as-aperiodic-settling theorem](../theorems/function-as-aperiodic-settling.md) places at the function level, not at the practice level.

## Comparison to weekly-calendar

| | weekly-calendar | generational-review |
|---|---|---|
| Aggregation $\alpha_R$ | Markov (1 prior cycle) | Limit-aggregating (all prior) |
| Regime | Scott-continuous | Transfinite-bounded |
| $\kappa$ | $\omega$ | $\omega < \kappa < \omega_1$ |
| $H^1$ | $0$ (trivial) | non-trivial |
| Substrate cost | finite per-cycle computation | requires limit-stage support |
| Operational use | day-to-day rhythm | generational continuity |

The two practices are both real operational shapes; the math distinguishes them by regime and cohomology. The weekly-calendar is the dominant pattern (most work-cadence is Markov or finite-history); the generational-review is the rarer but structurally-richer pattern.

## What this example does *not* show

- *A computed $H^1$-class.* The example asserts non-trivial $H^1$ but doesn't compute the class explicitly. That would require a specific instance — concrete cycle history, concrete pattern-detection rules — and the [aperiodic-regime classification](../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/aperiodic-regime-classification.md)'s direct-limit machinery to compute the invariant.
- *Implementation detail.* A working substrate must support transfinite-stage settling, which most operational implementations don't natively. The math program's *closure ordinal* concept admits ordinals beyond $\omega$ as theoretical objects; a runtime that wants to compute at stage $\omega$ needs explicit limit-aggregation primitives.

## Position in the program

This is the third worked example in [`predicated-work/examples/`](./) and the first to exhibit non-trivial cohomology. Together with [weekly-calendar-as-recurrent-practice](weekly-calendar-as-recurrent-practice.md) and [dispatch-of-a-pr-review](dispatch-of-a-pr-review.md), the example set now spans:

- Strict-regime: dispatch.
- Scott-continuous regime: weekly calendar.
- Transfinite-bounded regime: generational review.

Aperiodic-regime examples would require concrete worked-out functions — see [function-closure-rules](../questions/function-closure-rules.md) for the open question.
