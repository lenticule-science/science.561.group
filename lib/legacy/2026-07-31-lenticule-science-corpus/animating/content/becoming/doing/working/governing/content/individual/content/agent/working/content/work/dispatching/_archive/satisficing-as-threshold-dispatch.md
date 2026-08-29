---
type: theorem
status: conjecture
depends-on: [dispatch, capability-fiber-bundle, dispatch-readiness, quantale-enriched-dispatch-for-work]
proves: []
---

# Satisficing as threshold dispatch

March and Simon's *satisficing* — the organizational behavior of stopping search when an option crosses an aspiration level rather than continuing until the optimum is found — corresponds in the substrate to a threshold-dispatch rule: dispatch fires on the first agent whose capability match meets or exceeds a governance-pattern-determined threshold $\theta$, not the agent with the maximum match score.

## Setup

Let $Q$ be a quantale over which capabilities are valued (see [quantale-enriched-dispatch](questions/quantale-enriched-dispatch-for-work.md)).
Let $\theta \in Q$ be a satisficing threshold.
Define satisficing-dispatch readiness:

$$\delta^\theta_{\mathrm{sat}}(A, T) = \mathbf{t} \iff \delta^Q(A, T) \geq_Q \theta$$

where $\delta^Q(A, T) = \bigotimes_{c \in \mathrm{caps}} (r_T(c) \Rightarrow_Q \sigma_A(c))$ is the quantale-enriched capability match from the open question.

The standard four-bilattice dispatch is the degenerate case: $Q = \mathbf{FOUR}$, $\theta = \mathbf{t}$.

## Claim

Under satisficing-dispatch, the regime-classification and monotonicity properties of standard dispatch are preserved:

1. **Threshold monotonicity**: For $\theta \leq_Q \theta'$, every agent dispatchable under $\theta'$ is dispatchable under $\theta$.
  Raising the threshold shrinks the eligible set; lowering it expands it.

2. **Monotonicity in evidence**: As witness increments drive $\delta^Q(A, T)$ upward in $Q$'s order, the satisficing-dispatch readiness cell $\langle A, \texttt{satisficing-dispatch-ready}, T\rangle$ is monotone: once it reaches $\mathbf{t}$, it stays at $\mathbf{t}$.
  This extends [dispatch-monotonicity](dispatch-monotonicity.md) to the satisficing setting.

3. **Regime preservation**: The [dispatch-readiness-regime-is-strict](dispatch-readiness-regime-is-strict.md) theorem's proof depends on the closure-rule structure of dispatch readiness, not on the threshold value.
  Satisficing-dispatch readiness is strict-regime for any fixed $\theta$.

## The threshold is governance-pattern-dependent

The satisficing threshold $\theta$ is not a substrate-given constant.
It is a parameter of the polity's normative system — a cell $\langle \texttt{dispatch-threshold}, p, \theta\rangle = \mathbf{t}$ in $\mathcal{S}_{\mathrm{charter}}$.

Different governance patterns define "adequate dispatch" differently:

**Hohfeldian-pattern**: threshold is a formal competence criterion — the agent must hold a recognized credential or office. $\theta$ is Boolean (FOUR-bilattice): the agent either has the required jural standing or does not.

**Consensus-pattern**: threshold is community-alignment on the agent's suitability.
Satisficing is not an individual match-score condition but a settlement condition: dispatch fires when the polity's consensus-closure settles the agent-assignment cell.
The "threshold" is the consensus closure rule itself.

**Restorative-accountability pattern**: threshold includes the agent's relational standing with those affected by the work.
An agent with high technical capability but damaged community relations may fall below $\theta$ in a restorative-pattern polity even if they exceed it in a Hohfeldian-pattern one.

The substrate-algebraic content: $\theta$ is not a universal Q-value but a governance-pattern-relative function.
March and Simon's aspiration level is set by the organization's normative structure, not by individual preference alone.
This connects to the non-Western governance traditions: what counts as "good enough" dispatch is a collective normative determination, not a property of the task-agent match in isolation.

## Connection to bounded rationality

March and Simon motivate satisficing by bounded rationality: agents cannot compute the global optimum, so they stop at good-enough.
The substrate-algebraic complement: optimal dispatch (maximizing $\delta^Q$ over all agents) requires a global computation — a join over all capability fibers — which may not be coordination-free per the CALM corollary.
Satisficing dispatch stops at the first agent above $\theta$, which requires only local checks (is this agent's match above threshold?) and no cross-agent join.
Satisficing is therefore the CALM-compatible dispatch discipline: it can be answered at any replica without global coordination.
