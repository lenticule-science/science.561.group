---
type: theorem
class: classical
status: proved
depends-on:
  - teaching/explanations/mechanism-design.md
see-also:
  - gibbard-satterthwaite.md
references:
  - references/shoham-leyton-brown2009.md
---

# Revelation principle

## Statement

For any equilibrium (Nash, Bayesian Nash, dominant- strategy) of any mechanism, there exists an *incentive-compatible direct-revelation mechanism* — one in which agents simply report their types truthfully — that implements the same outcome.

In other words: studying *direct-revelation truth-telling mechanisms* loses nothing relative to studying arbitrary mechanisms.

## Variants

- **Dominant-strategy revelation principle.** If a mechanism implements outcome $f$ in dominant strategies, then there exists a direct mechanism implementing $f$ in which truth-telling is dominant strategy.
- **Bayesian revelation principle.** Same for Bayesian Nash equilibrium.

## Proof sketch

Given any mechanism $M$ with equilibrium strategies $\sigma_i$ implementing outcome function $f$, construct a direct mechanism $M'$ that:

1. Asks each agent for their type.
2. Computes what they *would* have submitted to $M$ as $\sigma_i(t_i)$.
3. Runs $M$ with those simulated submissions.

Truth-telling is an equilibrium of $M'$ because lying about type $t_i$ amounts to playing $\sigma_i(t_i')$ in $M$, and $\sigma_i(t_i)$ is the equilibrium response in $M$ to the true type.

## What it implies

- **Mechanism-design search space is reduced.** Instead of searching all mechanisms (huge), search only truth-telling direct-revelation mechanisms (smaller and more tractable).
- **Truthful mechanisms are sufficient.** Any outcome achievable indirectly is achievable truthfully.
- **Mechanism design becomes "type space → outcome" function design.** With incentive-compatibility constraints.

The principle is the methodological foundation of modern mechanism design.

## Limits

- **Computability.** The constructed direct mechanism may require simulating equilibrium strategies; if these are hard to compute, the principle is theoretical rather than practical.
- **Equilibrium selection.** When multiple equilibria exist, the principle applies to a specific equilibrium; different equilibria require different direct mechanisms.
- **Robustness.** Direct mechanisms may be more sensitive to off-equilibrium behavior than indirect mechanisms; the equivalence is only at equilibrium.
- **Information revelation costs.** Real agents may resist full type revelation for privacy reasons even when incentive-compatible.

## In multi-agent AI

The principle simplifies analysis when:

- **Designing AI mechanisms.** Allocation, scheduling, preference aggregation can be analyzed as truth-revealing direct mechanisms.
- **Analyzing emergent AI mechanisms.** Any equilibrium of an AI multi-agent interaction can be analyzed via a truth-telling reformulation.
- **AI alignment via mechanism design.** Designing AI systems to elicit honest reporting becomes a structured problem in incentive-compatible direct mechanism design.

## Significance

The revelation principle is the *methodological pivot* of mechanism-design theory.
Without it, mechanism design would face an infinite-dimensional design space; with it, the design space is the (finite-dimensional) space of incentive-compatible allocation rules.

## Status

Proved in multiple forms (Gibbard 1973, Myerson 1979).
Foundational.
Standard in graduate mechanism-design texts.
