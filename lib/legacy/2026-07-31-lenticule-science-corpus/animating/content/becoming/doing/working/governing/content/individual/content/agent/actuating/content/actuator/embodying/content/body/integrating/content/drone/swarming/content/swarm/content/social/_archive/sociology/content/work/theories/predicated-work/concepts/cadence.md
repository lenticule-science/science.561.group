---
type: concept
class: semantic-anchor
status: draft
depends-on: [recurrent-practice, operations-settling, settle-cycle, work-regime]
---

# Cadence

The *temporal grain* of a [recurrent practice](../objects/recurrent-practice.md): the index set $T_R$ of cycle boundaries together with the spacing structure that lets cycles be identified, named, and counted by the working community.

A cadence is more than a partition of the settling ordinal $\lambda$ into intervals.
It is a community-recognized rhythm — *weekly*, *sprint-length*, *seasonal*, *generational* — whose boundaries are themselves substrate-recordable as cycle-start and cycle-end witnesses.
The cadence is what makes the recurrent practice *recurrent in practice* rather than merely formally periodic.

## Cadence boundaries as substrate facts

A cadence boundary $\tau_n \in T_R$ is not an externally imposed timestamp; it is a substrate-algebraic fact: a stage at which the practice's cycle-transition closure rule fires, asserting the cycle-boundary-witness cell $\langle R, \texttt{cycle-boundary-at}, \tau_n\rangle = \mathbf{t}$ (from [settle-cycle](../morphisms/settle-cycle.md)).

The two types of cadence-boundary triggers:

**Clock-driven cadence.** The cycle-transition rule's antecedent reads a clock-stage counter: "if this cadence has been running for $k$ stages since the last boundary, assert a new boundary."
This is a bare Π₁ rule (ground antecedent, finitely-satisfied).
Clock-driven cadences are the basis of calendrical governance: weekly, monthly, quarterly, fiscal-year.

**Condition-driven cadence.** The cycle-transition rule's antecedent reads an operational-state or ecological-state cell: "when the harvest-completion cell settles to $\mathbf{t}$, assert a seasonal boundary."
The boundary arrives when the condition is met, not at a pre-set clock time.
Condition-driven cadences are the basis of ecological governance (Anishinaabe seasonal calendar) and event-driven organizational rhythms (sprint-end on milestone achievement rather than by date).

Both are substrate-algebraically admissible; the predicated-work framework makes no privileged choice between them.

## The structural cases of interest

**Strict cadence.** $T_R$ has order type $\omega$ with uniform spacing relative to the settling ordinal.
Clock-driven weekly meetings, daily standups, monthly reviews.
The practice's settling in each cycle is bounded; the settle-cycle morphism stabilizes at a finite ordinal within each cycle.
The overall practice is Scott-continuous (infinitely many cycles, each finitely settling).

**Variable strict cadence.** $T_R$ has order type $\omega$ but spacing varies with operational state — a sprint cadence whose length adjusts to the milestone, a release cadence triggered by readiness rather than by date.
The cycle-transition rule has a condition-driven antecedent; cycle lengths are variable finite intervals.
The practice remains Scott-continuous because each cycle's antecedent depends on finite prior history.

**Transfinite cadence.** $T_R$ has order type $> \omega$; cycle boundaries occur at limit ordinals as well as successor ordinals.
Generational practices, cross-generational reviews.
The [generational-review-as-transfinite-bounded](../examples/generational-review-as-transfinite-bounded.md) example is the canonical instance.
The practice's settle-cycle morphism at a limit-ordinal cadence boundary must apply a limit-stage closure rule — reading the join of all prior cycles' settled content.

## Cadence and regime

The cadence determines an *upper bound* on the regime the recurrent practice can occupy:

| Cadence type | Order type of $T_R$ | Maximum regime |
|---|---|---|
| Strict (uniform or variable) | $\omega$ | Scott-continuous |
| Transfinite with countable cofinality | $\omega < \kappa < \omega_1$ | Transfinite-bounded |
| Transfinite with uncountable cofinality | $\kappa \geq \omega_1$ | Aperiodic |

The maximum regime from the cadence is an upper bound, not a guarantee: the practice lives in a *lower* regime if its aggregation structure $\alpha_R$ is Markov or finite-history even when $T_R$ has transfinite order type.
The regime is the *minimum* of the cadence's upper bound and the aggregation structure's complexity.

The cadence-regime relationship completes the analysis of [regime-of-recurrent-practice](../theorems/regime-of-recurrent-practice.md): the cadence fixes the cofinality class; the aggregation structure determines whether the limit-stage behavior is Scott-continuous (finite-history $\alpha_R$ keeps the limit-stage rule Scott-continuous even at transfinite boundaries) or genuinely limit-aggregating.

## Cadence multi-scale nesting

Cadences nest: a session-cadence $T_{\mathrm{sess}}$ is contained in a daily cadence $T_{\mathrm{day}} \supset T_{\mathrm{sess}}$, which is contained in a weekly cadence $T_{\mathrm{week}} \supset T_{\mathrm{day}}$, etc. Per [recurrent-practice](../objects/recurrent-practice.md), the composition of nested practices is a recurrent practice with the union of cadence sets.

The nesting structure means that at a weekly boundary $\tau_w \in T_{\mathrm{week}}$, the settle-cycle morphism for the weekly practice fires *on top of* the already-settled daily and session practices.
The weekly settle-cycle can read the settled state of all sessions and days in that week (all of which have already fired their own settle-cycle morphisms), making the weekly cycle's antecedent's aggregation naturally Markov (depends on the prior week's output, which is the settled state of all the week's sessions).

## Synchronization as shared cadence boundary

Multiple practices $R_1, \ldots, R_k$ are *synchronized* when they share a cycle-boundary ordinal: $\tau^* \in T_{R_1} \cap \cdots \cap T_{R_k}$.
At $\tau^*$, all practices fire their cycle-transition rules simultaneously; their settle-cycle morphisms run on the same increments.
Synchronized practices can therefore read each other's cycle-completion witnesses in their antecedents, enabling cross-practice coordination.

The substrate-algebraic content of "the sprint review and the backlog refinement are synchronized" is: the two practices share a cadence boundary, and the backlog refinement's cycle-start rule reads the sprint review's cycle-completion witness.
This is a [closure-driven coordination](closure-driven-coordination.md) pattern at the practice level — cadence synchronization is closure-rule coordination mediated by shared cycle-boundary witnesses.

## CALM and coordination-free synchronization

Shared cycle-boundary witnesses — the cells $\langle R, \texttt{cycle-boundary-at}, \tau_n\rangle = \mathbf{t}$ — are $\leq_k$-monotone once settled.
By the [predication-settling CALM corollary](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/settling-calm-corollary.md):

- Confirming "has practice $R$ crossed boundary $\tau_n$?" is coordination-free: any replica with the local boundary-witness cell can confirm it.
- Confirming "is $R$ still in the current cycle?"
  (boundary *not yet* crossed) requires coordination — it is the absence of a boundary-witness cell.

For *synchronized* practices $R_1, \ldots, R_k$ sharing boundary $\tau^*$: each practice's boundary-witness at $\tau^*$ is coordination-free to confirm individually.
The compound query "have *all* synchronized practices crossed $\tau^*$?" is the conjunction of $k$ coordination-free queries — itself coordination-free if all boundaries are positive.
This is the CALM-theoretic content of "synchronized practices can be confirmed as jointly past their boundary without central coordination": once all boundary-witnesses settle, the synchronization is locally verifiable.

The cross-practice antecedent ("backlog refinement reads sprint review's cycle-completion witness") is $\leq_k$-monotone: once the sprint review's completion-witness settles, the backlog refinement's closure rule antecedent is satisfied in any replica that has received the witness.
Cross-practice coordination is coordination-free for the positive-activation direction; only dispute resolution (was the sprint review's completion witness legitimate?) requires coordination.

## Temporal 2-category of cadence nesting

In the [temporal 2-category](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/temporal-2-category.md) $\mathbf{T}(\mathcal{C}_{\mathrm{op}}, \lambda)$, a cadence $T_R$ defines a sub-sequence of 1-cells — the cycle-transition morphisms $\Sigma_R^{(n)}: \tau_n \to \tau_{n+1}$ — whose composition is the practice's full execution 1-cell.

The multi-scale nesting structure — session $\subset$ daily $\subset$ weekly — is reflected in a *lax functor* from the nesting poset of cadence sets to the temporal 2-category's morphism category: each containment $T_{\mathrm{sess}} \subset T_{\mathrm{day}}$ gives a 1-cell inclusion, and the [temporal Beck-Chevalley condition](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/temporal-beck-chevalley.md) holds for the nesting iff the inner practice's settling at each inner boundary commutes with the outer practice's fiber-change at the shared boundary.

BC holds for standard nesting: session-boundaries commute with the daily fiber (the daily settle-cycle reads the session's already-settled state).
BC fails if the outer practice's settle-cycle reads cells that the inner practice is still in the process of settling at a shared boundary — a *nested boundary conflict*.
Substrate-algebraically detectable: the failed-BC 2-cell at the pseudo-pullback identifies which inner-practice cells are unsettled at the outer boundary.

## Where used

- [recurrent-practice](../objects/recurrent-practice.md) — the definition that cadence parameterizes.
- [operations-loop](../objects/operations-loop.md) — a worked instance with a six-phase per-cycle structure.
- [settle-cycle](../morphisms/settle-cycle.md) — the morphism advancing the practice by one cadence step.
- [regime-of-recurrent-practice](../theorems/regime-of-recurrent-practice.md) — the regime is bounded by the cadence's order type.
- [non-hohfeldian-governance-traditions](theories/predicated-governance/narratives/non-hohfeldian-governance-traditions.md) — ecological cadences as condition-driven cycle-transition rules.
