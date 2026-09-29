---
type: concept
class: classical
status: active
depends-on: []
see-also:
  - mechanism-design.md
  - ../objects/voting-rule.md
  - ../theorems/arrows-impossibility.md
  - ../theorems/gibbard-satterthwaite.md
references:
  - references/arrow1951.md
---

# Social choice

**Social choice theory** is the study of aggregating individual preferences into collective decisions: when agents in a group have differing preferences, what rule determines the group's choice, and what properties can such rules satisfy?

## The core problem

Each of $n$ agents has a *preference ordering* over alternatives.
The group must select a single alternative (or a collective ranking).
The aggregation function is the *voting rule* (or *social welfare function*).
Which rules are good?

"Good" splits into multiple desiderata:

- **Pareto efficiency.** If everyone prefers A to B, the group does too.
- **Non-dictatorship.** No single agent's preferences override everyone else's.
- **Independence of irrelevant alternatives (IIA).** The group ranking of A vs B depends only on individual rankings of A vs B, not other alternatives.
- **Transitivity.** Group rankings are transitive (if A beats B and B beats C, A beats C).
- **Universal domain.** Any combination of preferences is admissible input.

## Arrow's impossibility

Arrow's 1951 result: [arrows-impossibility](../theorems/arrows-impossibility.md) shows that for three or more alternatives, *no* voting rule satisfies all of: universal domain, non-dictatorship, Pareto efficiency, IIA, transitivity.
Some desideratum must be sacrificed.

Different voting rules sacrifice different desiderata:

- **Majority rule** can violate transitivity (Condorcet cycles).
- **Borda count** violates IIA.
- **Plurality** violates Pareto in pathological cases.
- **Dictatorship** trivially satisfies IIA and Pareto but violates non-dictatorship.

There is no perfect voting system.

## Gibbard-Satterthwaite

A second impossibility ([gibbard-satterthwaite](../theorems/gibbard-satterthwaite.md)): every non-dictatorial voting rule with three or more options is *manipulable* — some agent can do better by misreporting preferences than by reporting truthfully.
This precludes simultaneous strategy-proofness and non-dictatorship.

## What survives

Practical voting rules accept some failure mode and optimize others:

- **Approval voting** — vote for any subset; tradeoffs vs ranking-based methods.
- **Condorcet methods** — pick the alternative that beats all others pairwise (when one exists).
- **Range voting** — assign cardinal scores; loses some axioms but provides others.
- **Quadratic voting** — buy votes at quadratic cost; enables preference intensity expression.
- **Single transferable vote (STV)** — for proportional multi-winner elections.

Each is a defensible response to the impossibility results, with explicit tradeoffs.

## In multi-agent AI

Social choice theory applies when:

- **Multiple AI agents express preferences** that must be aggregated (planning, allocation, recommendation).
- **AI systems aggregate human preferences** (RLHF, preference learning, recommender systems).
- **AI ensembles vote on outputs** (debate, jury-style evaluation, ensemble methods).
- **Multi-stakeholder AI alignment** — when an AI must serve multiple users with different preferences, social choice constraints apply.

The applicability of classical social choice to neural preference aggregation is incomplete; preferences from LLMs may not satisfy ordinality, transitivity, or domain-completeness assumptions.

## Status

Foundational area of mathematical social science with active extension to AI alignment and multi-agent systems.
The impossibility results are well-established; the practical challenge is choosing which axioms to sacrifice.
