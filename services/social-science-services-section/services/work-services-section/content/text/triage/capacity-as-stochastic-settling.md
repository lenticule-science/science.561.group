---
type: question
status: open
explores: [operations-base, capability-fiber-bundle, operations-settling, task-cell-system]
---

# Does stochastic settling provide the substrate for agent capacity?

The open question [capacity-as-substrate-property](capacity-as-substrate-property.md) asks whether agent capacity — the maximum throughput and concurrent load an agent can sustain — can be read directly from the operations settling rather than tracked as an external parameter. This question asks specifically whether the [stochastic settling](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/stochastic-settling.md) object provides the right substrate.

## What the work vocabulary requires

The [capacity term](../../../terms/capacity.md) gives two dimensions:

- **Throughput capacity**: tasks completed per settling cycle.
- **Concurrent capacity**: tasks in the active state simultaneously.

Little's Law relates them: $L = \lambda W$ (average in-system count equals throughput rate times average cycle time). At high utilization, queue lengths grow nonlinearly; slack (uncommitted capacity) is required for variance absorption.

## What stochastic settling would provide

A **stochastic settling on an agent's capability fiber** models the agent's work behavior as a Markov chain over work states:

- States $S$ = $\{\texttt{idle}, \texttt{active}_{T_1}, \ldots, \texttt{active}_{T_k}, \texttt{blocked}, \texttt{recovering}\}$ — the agent's operational states.
- Transition kernel $P(s, s')$ = probability of moving from state $s$ to state $s'$ in one settling step.
- Settling = the stationary distribution $\pi$ over states.

At stationarity:
- **Throughput capacity** = $\pi(\texttt{active} \to \texttt{completed})$ per step — the stationary probability of a task-completion transition.
- **Concurrent capacity** = $\sum_{T_i} \pi(\texttt{active}_{T_i})$ — the expected fraction of settling steps in an active work state.
- **Little's Law** becomes: $\mathbb{E}[\text{tasks in system}] = \text{throughput rate} \times \mathbb{E}[\text{cycle time}]$ — a consequence of the stationary distribution.

## Sub-questions

### (a) Is the agent's capability fiber a Markov-chain stochastic settling?

The [capability-fiber-bundle](../objects/capability-fiber-bundle.md) is currently a bilattice-valued section over the entity space. Does extending the value category from the four-bilattice to the probability semiring (the stochastic settling's value category) give a well-typed object? Specifically: is a stochastic section $\sigma^{\mathrm{stoch}}_A : \text{capabilities} \to [0, 1]$ — interpreted as the probability that the agent currently has capacity to exercise the capability — a well-formed capability section?

### (b) Does dispatch readiness extend to the stochastic case?

[Dispatch-readiness](teaching/explanations/dispatch-readiness.md) currently uses the four-bilattice: an agent is dispatch-ready ($\mathbf{t}$) or not ($\mathbf{f}$ or $\bot$). In the stochastic extension, dispatch readiness would be a probability — "the agent can handle one more task with probability 0.7." Does the [dispatch-monotonicity theorem](../theorems/dispatch-monotonicity.md) extend? The key question: does "more capability witnesses" still imply "higher (in truth order) dispatch readiness" when readiness is a probability?

### (c) Little's Law as a stochastic-settling theorem

Can Little's Law be derived as a theorem of the stochastic-settling framework on the operations settling? The stationary distribution $\pi$ contains all the quantities Little's Law relates; the question is whether the relationship is a structural consequence of the settling's closure operator or requires additional assumptions (independence of task durations, PASTA property).

### (d) Slack as settling-bound headroom

The work vocabulary's requirement for slack (uncommitted capacity to absorb variability) maps onto the settling framework as: the agent's settling bound $\lambda_d$ should exceed the expected task completion time by a safety margin determined by the variance of the task-duration distribution. Can the stochastic settling provide this margin analytically — as a consequence of the stationary distribution's variance, not as an exogenous parameter?

## Connection to quantale-enriched dispatch

The [quantale-enriched-dispatch-for-work question](quantale-enriched-dispatch-for-work.md) asks whether dispatch can use richer value domains (cost, latency, confidence). The stochastic capacity question is a specialization: the value domain is the probability semiring, and the richer match-strength is "probability of successful task completion given current agent load." These are the same extension applied to different aspects (dispatch-matching vs. capacity-estimation).
