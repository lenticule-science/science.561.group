---
type: question
status: partial
explores: [operations-settling, regime-of-task, four-regime-dichotomy, regime-decomposition]
see-also: [non-scott-continuous-firing-ordinal, regime-mld-invariance, settling-moduli-prestack]
title: Is regime classification a property of the closure operator alone, or of the closure operator plus the increment sequence?
description: The math's four-regime dichotomy classifies a settling by its closure ordinal $\kappa$ — the smallest ordinal at which the orbit becomes a fixed point.
---

# Is regime classification a property of the closure operator alone, or of the closure operator plus the increment sequence?

The math's [four-regime dichotomy](../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/references/four-regime-dichotomy.md) classifies a settling by its closure ordinal $\kappa$ — the smallest ordinal at which the orbit becomes a fixed point. The dichotomy's equivalences refer to properties of the closure operator (Scott-continuity, lax-idempotence) and properties of the base (cardinalities, cofinality), not directly to the increment sequence.

But a settling depends on both the closure operator and the increment sequence: $v_{\tau+1} = \mathrm{cl}(v_\tau \vee_k u_\tau)$. Two operations runs on the same closure-rule system but different event logs could behave differently.

## Resolution: operator-regime vs. realized regime

The key distinction is between two levels of regime classification:

**Operator-regime** $\rho(\mathrm{cl})$: a property of the closure operator $\mathrm{cl} = \mathrm{cl}^{\mathcal{S}_{\mathrm{op}}}$ alone, defined as the *supremum closure ordinal over all possible increment sequences* on the given base:

$$\rho(\mathrm{cl}) \;=\; \sup_{(u_\tau)} \kappa(v^{\mathrm{op}}, u)$$

This is the worst-case classification: it measures how complex the settling can be under adversarially chosen increments. It is a structural property of the closure-rule system, computable from $\mathcal{S}$ without running any specific event log.

**Realized regime** $\rho(v^{\mathrm{op}}, u)$: a property of the specific settling $(v^{\mathrm{op}}, u_\tau)$, defined as the actual closure ordinal $\kappa$ of the orbit $v_0, v_1, v_2, \ldots$ under the given increment sequence $u = (u_\tau)$.

The operator-regime is an upper bound on all realized regimes: $\rho(v^{\mathrm{op}}, u) \leq \rho(\mathrm{cl})$ for any $u$.

## The four-regime dichotomy as an operator-regime theorem

The [four-regime dichotomy](../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/references/four-regime-dichotomy.md) classifies closure operators by operator-regime:

- **Strict-class** $\rho(\mathrm{cl}) < \omega$: for *any* finitely-supported increment sequence, settling reaches a fixed point after finitely many steps. The step-bound depends on base size and rule depth, not on the specific event log.
- **Scott-continuous-class** $\rho(\mathrm{cl}) = \omega$: for *any* increment sequence, settling reaches a fixed point by the $\omega$-th step.
- **Transfinite-bounded-class** $\omega < \rho(\mathrm{cl}) < \omega_1$: some increment sequences cause settling to require more than $\omega$ steps but always terminate before $\omega_1$.
- **Aperiodic-class** $\rho(\mathrm{cl}) \geq \omega_1$: some increment sequences cause settling to require at least $\omega_1$-many steps.

The four-regime dichotomy is a partition of closure operators, not a claim about any specific settling.

## Realized regime refinement

A settling's actual regime may be strictly lower than its operator's class:

**Example 1 (aperiodic-class operator, strict settling).** $\mathcal{S}_{\mathrm{op}}$ contains limit-aggregating rules. These place the operator in the aperiodic class. But if the event log $u$ never fires the cells those rules aggregate over, the limit-aggregating rules never contribute to any settling step. The actual orbit is determined only by non-aggregating rules (possibly strict or Scott-continuous). Realized regime: strict or Scott-continuous despite aperiodic operator-regime.

**Example 2 (Scott-continuous operator, strict settling).** All rules have finite antecedents (Scott-continuous-class operator). If the event log $u$ is finitely supported (finitely many increments total, then silence), the settling reaches a fixed point in finitely many steps. Realized regime: strict.

The general principle: $\rho(v^{\mathrm{op}}, u) = \min(\rho(\mathrm{cl}),\; \kappa_u)$ where $\kappa_u$ is the closure ordinal required given the increment sequence's specific interaction with the rule system.

## Moduli-theoretic framing

The [regime decomposition theorem](../../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/regime-decomposition.md) gives the operator-regime perspective its moduli-level content: the coarse settling moduli $|\mathrm{KP}^{\mathrm{vis}}(B)|$ decomposes as a disjoint union

$$|\mathrm{KP}^{\mathrm{vis}}(B)| \;=\; |\mathrm{KP}^{\mathrm{vis}}(B)|_{\mathrm{strict}} \,\sqcup\, |\mathrm{KP}^{\mathrm{vis}}(B)|_{\mathrm{SC}} \,\sqcup\, |\mathrm{KP}^{\mathrm{vis}}(B)|_{\mathrm{TB}} \,\sqcup\, |\mathrm{KP}^{\mathrm{vis}}(B)|_{\mathrm{aper}}$$

where each stratum contains MLD-classes with the given operator-regime. By [regime MLD-invariance](../../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/regime-mld-invariance.md), the operator-regime is constant across each MLD-class (component of the settling fiber groupoid). The decomposition is set-theoretic, not topological: by [regime stratification non-semicontinuity](../../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/regime-stratification-non-semicontinuity.md), the strata are not locally closed under any topology on the moduli, which means there is no continuous path (in the deformation sense) from one regime-stratum to another — regime changes require a discontinuous jump in the settling path. Regime can only shift *upward* along formal deformations (strict → SC → TB → aperiodic), never downward.

The realized regime of a specific operational run is a *per-orbit* refinement within each stratum: two settlings in the same MLD-class (same operator-regime) can differ in their realized regime depending on which increment sequences arrive.

## Implications for predicated-work

The operations settling $v^{\mathrm{op}}$ of a working community has $\mathcal{S}_{\mathrm{op}}$ partitioned into rule classes (per [operations-settling](../../../../../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/glossary/terms/operations-settling.md)): charter rules (Scott-continuous), capability-propagation rules (strict), dispatch-eligibility rules (strict), lifecycle rules (strict), and the function's aim-settling rules (aperiodic-class, via [function-as-aperiodic-settling](../../../../theorems/function-as-aperiodic-settling.md)).

**Operator-regime of $\mathcal{S}_{\mathrm{op}}$**: aperiodic, because the function's aim-settling rules place the combined system there.

**Realized regime of a specific operational run** depends on which rules actually fire:
- Bounded operational period (finite tasks, agents, predicates; no aim-settling activity): only strict and Scott-continuous rules fire; realized regime is strict.
- Ongoing run with aim-settling occasionally active: realized regime may lift to Scott-continuous, transfinite-bounded, or aperiodic depending on the aggregation structure of the aim-rules that fire.

**Practical consequence for regime-of-task theorem.** The [regime-of-task theorem](../../../../../../services/predicated-work-services-section/content/glossary/concepts/regime-of-task.md) classifies the *operator-regime* of a task's local closure-rule subsystem $\mathcal{S}_T$ — the worst-case regime over all possible event logs for that task. The actual realized regime of a specific task execution is bounded above by this operator-regime and bounded below by the strict regime (some rule-firings are always needed). "Task $T$ is in the Scott-continuous regime" means: for every possible event log, $T$'s goal cells converge by the $\omega$-th stage. Not that any specific execution takes $\omega$ steps.

## The increment-sequence complexity measure

A finer classification uses the interaction between the operator and the specific increment sequence. Define:

$$\kappa_{\mathrm{interact}}(\mathrm{cl}, u) \;:=\; \kappa(v^{\mathrm{op}}_0, u, \mathrm{cl})$$

— the actual closure ordinal of the orbit under $(u_\tau)$ and $\mathrm{cl}$. This is a joint property. The operator-regime is $\sup_u \kappa_{\mathrm{interact}}(\mathrm{cl}, u)$; the realized regime is $\kappa_{\mathrm{interact}}(\mathrm{cl}, u^{\mathrm{actual}})$ for the specific event log $u^{\mathrm{actual}}$ that the working community produces.

Two increment sequences that agree on which closure rules fire — $\omega$-equivalent increment sequences — produce orbits with the same closure ordinal. The equivalence classes under $\omega$-equivalence partition possible executions into realized regime classes. The four-regime dichotomy coarsens this partition to the operator alone by taking the supremum; the predicated-work theory uses both:
- **Operator-regime**: for structural claims about what a task or practice *can* require (worst case).
- **Realized regime**: for claims about what a *specific* operational run *does* require (given observed events).

The [regime-of-recurrent-practice theorem](../../../../../../services/predicated-work-services-section/content/glossary/concepts/regime-of-recurrent-practice.md) is an operator-regime theorem. The operations-settling's strict-regime claim for bounded periods is a realized regime claim. Both are correct and neither contradicts the other.
