---
type: theorem
class: proved
status: active
depends-on:
  - teaching/explanations/common-knowledge.md
see-also:
  - ../objects/belief-state.md
references:
  - references/aumann1976.md
---

# Aumann's agreement theorem

**Statement.** Two Bayesian agents with a common prior who have common knowledge of each other's posteriors about an event must have *equal* posteriors.
Bayesian agents *cannot agree to disagree* under common-knowledge conditions.

## Setup

- Agents A and B share a common prior $P$ over a state space $\Omega$.
- Each receives private information (a partition of $\Omega$).
- Each forms a posterior $P(E \mid \text{own info})$ about an event $E$.
- A and B both publicly announce their posteriors, which become common knowledge.

**Conclusion.** $P_A(E) = P_B(E)$.

## Proof sketch

Aumann's original argument (1976):

- Common knowledge of A's posterior implies B knows A's posterior.
- The common-knowledge structure means the posteriors must be measurable with respect to the *meet* of A's and B's information partitions.
- Bayesian updating with a common prior on the meet partition produces identical posteriors.

The argument is short — a few pages — but the implication is striking.

## Significance

The result was foundational for several reasons:

- **Disagreement requires non-common-knowledge.** Real disagreement implies either non-common priors or asymmetric information that hasn't been made common knowledge.
- **Conversation as posterior-revelation.** Sharing posteriors should converge them — not just average them — under Bayesian + common-knowledge conditions.
- **Foundational for epistemic game theory.** Many subsequent results (e.g., no-trade theorems, speculation impossibility) build on the agreement theorem.

## Why agents *do* disagree in practice

Persistent disagreement among real agents implies *some* condition fails:

- **Non-common priors.** Different priors on the state space.
- **Non-Bayesian updating.** Heuristics, biases, motivated reasoning.
- **Insufficient communication.** Posteriors not made common knowledge.
- **Ambiguous events.** What "$E$" means may differ.
- **Bounded rationality.** Real agents don't compute full Bayesian updates.
- **Strategic concealment.** Agents may not honestly reveal posteriors.

Aumann's theorem identifies disagreement as evidence that *one of these* holds.

## In multi-agent AI

Implications:

- **AI debate convergence.** Bayesian AI debaters with common priors should converge through posterior exchange.
- **Multi-agent consensus protocols.** Conditions approximating Aumann's setup tend to produce convergence; failures suggest specific assumption violations.
- **AI disagreement diagnosis.** When AI systems disagree, identifying which Aumann condition fails helps diagnose.
- **Calibration across agents.** Calibrated agents with shared prior should agree given common-knowledge evidence; persistent miscalibration is a problem.

## Generalizations

- **Geanakoplos & Polemarchakis (1982).** Show posterior exchange leads to convergence even without one-shot agreement; iterated exchange suffices.
- **Many-agent versions.** Generalize beyond two agents.
- **Approximate agreement.** $\epsilon$-common-knowledge yields $\epsilon$-agreement.
- **Disagreement-decomposition theorems.** Identify which assumption violations explain observed disagreement.

## Limits

- **Strong common-knowledge requirement.** Per [common-knowledge-impossibility](common-knowledge-impossibility.md), true common knowledge is hard to establish.
- **Common-prior assumption.** Often violated in practice; agents bring different priors.
- **Bayesian updating assumption.** Real agents (humans, LLMs) don't update Bayesianly in general.
- **Practical irrelevance.** The theorem characterizes conditions for agreement; real disagreement persists because conditions don't hold.

## Status

Foundational result of epistemic game theory.
Aumann received the Nobel Prize in Economics (2005) in part for this work.
Implications for multi-agent AI are significant but require situational application — classical AI agents may approximate the conditions; LLM-based agents typically don't.
