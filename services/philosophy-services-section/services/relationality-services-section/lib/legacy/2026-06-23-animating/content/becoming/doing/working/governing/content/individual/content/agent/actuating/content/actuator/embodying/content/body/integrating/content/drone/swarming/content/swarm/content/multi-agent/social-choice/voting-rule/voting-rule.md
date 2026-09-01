---
type: object
class: classical
status: active
depends-on:
  - teaching/explanations/social-choice.md
see-also:
  - ../morphisms/voting.md
  - ../theorems/arrows-impossibility.md
  - ../theorems/gibbard-satterthwaite.md
references:
  - references/arrow1951.md
---

# Voting rule

A **voting rule** is a function mapping individual preference orderings (or ballots) to a collective decision: a single chosen alternative, a collective ranking, or a winning subset.
The voting rule is the mathematical object social choice theory analyzes.

## Standard voting rules

- **Plurality.** Each voter picks one alternative; the alternative with most votes wins.
  Simplest; widely used; vulnerable to vote-splitting.
- **Borda count.** Each voter ranks alternatives; alternative-$k$-from-bottom gets $k-1$ points; highest total wins.
  Considers full preferences.
- **Condorcet methods.** Pick the alternative that beats every other alternative pairwise.
  Often no Condorcet winner exists (Condorcet paradox).
- **Approval voting.** Each voter approves a subset of alternatives; alternative with most approvals wins.
- **Single transferable vote (STV).** Iterative elimination with vote transfer; used for proportional multi-winner elections.
- **Range voting.** Voters score each alternative; highest total score wins.
  Cardinal rather than ordinal.
- **Majority judgment.** Voters grade alternatives; alternative with highest median grade wins.

Each rule satisfies different desiderata; none satisfies all the desiderata one might want ([arrows-impossibility](../theorems/arrows-impossibility.md)).

## Properties

A voting rule may satisfy or fail:

- **Pareto efficiency.** If everyone prefers A to B, collective ranks A above B.
- **Monotonicity.** Improving a winning alternative's position doesn't make it lose.
- **Independence of irrelevant alternatives (IIA).** Group ranking of A vs B depends only on individual A vs B rankings.
- **Non-dictatorship.** No single voter determines the outcome.
- **Strategy-proofness.** Truthful reporting is a best response.
- **Anonymity.** Voter identities don't matter.
- **Neutrality.** Alternative labels don't matter.

## In multi-agent AI

Voting rules appear when:

- **Aggregating outputs from multiple AI agents.** Ensemble methods, jury-style decision systems.
- **RLHF and preference learning.** Aggregating human preferences uses implicit voting rules; choice of rule affects what's learned.
- **AI debate frameworks.** Judge agents implement voting rules over arguer outputs.
- **Multi-stakeholder AI.** When AI must serve multiple users with conflicting preferences, voting rules guide aggregation.

## Choice of rule

Choosing a voting rule is a substantive normative decision:

- **Plurality** is simple but loses information.
- **Borda** uses full preferences but is vulnerable to cloning.
- **Condorcet** is theoretically appealing when a winner exists but often doesn't.
- **Approval** is simple and avoids vote-splitting.
- **Range/score** captures intensity but loses ordinal comparability.

There is no objectively best rule; the choice reflects which axioms one prioritizes.

## Status

Foundational and well-studied.
Extensions to AI multi- agent systems are active.
The classical impossibility results bound what can be achieved; the ongoing question is which axioms to sacrifice for which application.
