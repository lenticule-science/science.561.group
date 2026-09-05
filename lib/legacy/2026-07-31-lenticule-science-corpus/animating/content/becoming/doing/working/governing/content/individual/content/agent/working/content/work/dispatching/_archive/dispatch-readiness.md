---
type: concept
class: semantic-anchor
status: draft
depends-on: [capability-matching, dispatch, normative-operational-layering, work-regime]
---

# Dispatch readiness

The substrate-algebraic condition under which an agent–task pair $(A, T)$ is *ready for dispatch*: the task's required-capability and required-authority sections are both matched by the agent's provided-capability and held-authority sections at every relevant index.
Dispatch readiness is the value $\delta(A, T) \in \mathbf{FOUR}$ computed by the [dispatch morphism](../morphisms/dispatch.md).

## Two-layer readiness

Dispatch readiness combines two orthogonal dimensions per [capability-matching](capability-matching.md) and [normative-operational-layering](normative-operational-layering.md):

$$\delta(A, T) \;=\; \delta^C(A, T) \;\wedge_t\; \delta^N(A, T)$$

- $\delta^C(A, T)$ — the *capability component*: does the agent have the skills the task requires?
- $\delta^N(A, T)$ — the *authority component*: does the agent hold the normative authorizations the task requires?

Both components must be $\mathbf{t}$ for dispatch readiness to be $\mathbf{t}$.
A $\mathbf{t}$ capability component with a $\bot$ authority component yields $\bot$ overall — the agent has the skill but lacks confirmed authorization.

## Four-state reading

Dispatch readiness inherits its bilattice character from operational evidence:

- $\delta(A, T) = \mathbf{t}$ — *ready*: every required capability is provided and every required authority is held.
- $\delta(A, T) = \mathbf{f}$ — *blocked*: at least one required capability is provably not provided, or at least one required authority is provably not held.
- $\delta(A, T) = \bot$ — *under-determined*: capability provision or authority status has not been settled; readiness cannot be asserted yet.
  The dispatch decision must wait for additional evidence or be made *defeasibly* with explicit acknowledgment.
- $\delta(A, T) = \top$ — *contradicted*: the substrate carries both a positive and negative witness on some required capability cell or authority cell; the dispatch decision is held until [adjudication](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/adjudication.md) repairs the cell.

This distinguishes dispatch in predicated-work from a Boolean *eligibility check*: the four-state reading lets the working community distinguish *not-yet-known-eligible* from *known-ineligible*, and to treat *contradicted* as a repair-condition rather than collapse it to either side.

## Preconditions for dispatch

Before dispatch fires, two preconditions must hold:

1. **Post-closure capability section.** The agent's provided-capability section $\sigma_A$ must be settled to post-closure values — no $\bot$ on any required capability index.
  This is enforced by the [dispatch-readiness-regime-is-strict theorem](../theorems/dispatch-readiness-regime-is-strict.md): once the capability section is post-closure over a finite index, the readiness computation terminates in finitely many steps.

2. **Post-closure authority section.** The agent's normative authority cells $\sigma_A^N$ must be settled — the relevant incumbency, delegation, or power-jural-relation cells must have settled to $\mathbf{t}$ or $\mathbf{f}$ on the dimensions the task requires.
  Authority cells settle via the N→O rule type from [normative-operational-layering](normative-operational-layering.md): an installation or delegation increment drives the agent's authority cells to post-closure.

A dispatch morphism that fires before the authority section is post-closure produces a $\bot$-valued readiness or a $\top$-valued readiness, not a $\mathbf{t}$ or $\mathbf{f}$ verdict.
The substrate does not permit dispatching on uncertain authority.

## Dispatch readiness and the O→N rule

Per [normative-operational-layering](normative-operational-layering.md), a task-assignment (O event) produces a duty cell $\langle R_{\mathrm{duty}}, \texttt{potential-holder}, A\rangle = \mathbf{t}$ (N event) — an O→N rule.
This O→N rule has an antecedent that includes $\delta(A, T) = \mathbf{t}$: the duty is *generated* only when the agent is dispatch-ready.
An attempted assignment of a non-ready agent does not trigger the duty-generating rule; instead, the closure system produces a failure-witness recording the capability or authority gap.

This means dispatch readiness is not merely a pre-check external to the substrate but a *rule-antecedent* in the closure system.
The normative consequence (duty) is substrate-algebraically dependent on the operational condition (readiness).
The O→N rule is what gives dispatch readiness its normative weight: a successfully dispatched agent does not merely receive a task notification — they incur a duty.

## Regime of dispatch readiness computation

Per [dispatch-readiness-regime-is-strict](../theorems/dispatch-readiness-regime-is-strict.md), the readiness computation for the capability component is a strict-regime settling (closure ordinal at most $|C|$) when $C$ is finite.
The authority component is similarly strict-regime when the authority index $\mathcal{X}$ is finite — the authority-matching residuations are a finite closure-rule system over a finite entity set.

The combined readiness $\delta = \delta^C \wedge_t \delta^N$ inherits the strict-regime bound: its closure ordinal is at most $|C| + |\mathcal{X}|$.
Dispatch decisions are always computable in bounded steps, irrespective of the surrounding operations settling's regime.

## Truth-knowledge LES for dispatch contradiction diagnostics

When $\delta(A, T) = \top$ — the dispatch-readiness value is contradicted — the inconsistency is recorded in the [truth-knowledge long exact sequence](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/truth-knowledge-cohomology-long-exact-sequence.md) applied to the dispatch sheaf $\mathcal{F}_\delta$ over the agent–task capability cells.

**Contradicted capability cell** ($\sigma_A(c) = \top$ for some required $c$): The inconsistency sheaf $\mathcal{F}^{(\top)}_\delta$ is non-zero at the capability dimension $c$.
The connecting morphism $\partial: H^0(\mathcal{F}^{(\top)}_\delta) \to H^1_t(\mathcal{F}^{(t)}_\delta)$ is non-zero, producing a non-trivial $H^1_t$ class recording the contradiction.
The rank of $H^0(\mathcal{F}^{(\top)}_\delta)$ counts the number of contradicted capability or authority dimensions.
The LES gives the contradiction a cohomological address: each contradicted dimension contributes one $H^0$-class, and $[\partial]$ maps it to a degree-1 obstruction in the dispatching system.

This makes dispatch contradictions substrate-auditable: the LES identifies exactly which capability or authority cells are contradicted and how many.
The adjudication process (resolving the contradiction) corresponds to reducing $H^0(\mathcal{F}^{(\top)}_\delta) \to 0$: once all contradicted cells are resolved, the inconsistency sheaf vanishes, the LES collapses to $H^n_t \cong H^n_k$, and the dispatch readiness value is clean ($\mathbf{t}$, $\mathbf{f}$, or $\bot$, but not $\top$).

**Healthy dispatch** ($\delta(A,T) \in \{\mathbf{t}, \mathbf{f}, \bot\}$): $\mathcal{F}^{(\top)}_\delta = 0$, LES collapses.
No contradictions; the dispatch readiness value is uncontested even if not yet settled.

## Where used

- [dispatch](../morphisms/dispatch.md) — the morphism whose value is dispatch readiness.
- [capability-matching](capability-matching.md) — the two-layer ($\delta^C$, $\delta^N$) decomposition.
- [dispatch-monotonicity](../theorems/dispatch-monotonicity.md) — additional capability and authority witnesses cannot decrease readiness in $\leq_k$.
- [dispatch-readiness-regime-is-strict](../theorems/dispatch-readiness-regime-is-strict.md) — the strict-regime bound on the readiness computation.
- [normative-operational-layering](normative-operational-layering.md) — the O→N rule that makes dispatch the antecedent of the duty-generating closure rule.
- [examples/dispatch-of-a-pr-review](../examples/dispatch-of-a-pr-review.md) — a worked instance.
