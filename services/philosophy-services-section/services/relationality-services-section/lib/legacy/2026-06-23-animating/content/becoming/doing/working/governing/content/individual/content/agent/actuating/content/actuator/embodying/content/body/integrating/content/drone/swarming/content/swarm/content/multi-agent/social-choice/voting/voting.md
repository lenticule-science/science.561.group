---
type: morphism
class: classical
status: active
depends-on:
  - ../objects/voting-rule.md
see-also:
  - teaching/explanations/social-choice.md
  - ../theorems/arrows-impossibility.md
  - ../theorems/gibbard-satterthwaite.md
references:
  - references/arrow1951.md
---

# Voting

**Voting** is the procedure by which a population of agents collectively select a decision through ballots processed by a [voting-rule](../objects/voting-rule.md).
Voting is the most familiar instance of preference aggregation and the core procedural mechanism studied by [social-choice](teaching/explanations/social-choice.md) theory.

## The procedure

A voting process consists of:

1. **Ballot definition.** What information voters provide (single choice, ranking, scores, approvals).
2. **Ballot collection.** Voters submit ballots.
3. **Aggregation.** The voting rule maps ballots to a decision.
4. **Outcome announcement.** Decision is communicated and implemented.

Variations exist on each step (open vs secret ballots, synchronous vs asynchronous voting, deliberation between rounds, etc.).

## What voting accomplishes

Voting:

- **Aggregates preferences** into collective decisions.
- **Distributes decision authority** across agents.
- **Provides legitimacy** — outcomes are tied to expressed preferences.
- **Encodes group conflict** — minority preferences are recorded even when not implemented.

These functions can conflict; different voting rules balance them differently.

## Strategic considerations

Per [gibbard-satterthwaite](../theorems/gibbard-satterthwaite.md), every non-dictatorial voting rule with three or more options is *manipulable*: some voters can do better by misreporting preferences.
Strategic voting follows.

Common strategies:

- **Lesser-evil voting.** Vote for second-favored feasible candidate to defeat least-favored.
- **Burying.** Rank a strong rival low to favor a weaker alternative.
- **Compromise.** Don't reveal full intensity of preferences.
- **Coalition formation.** Multiple voters coordinate ballots.

Real voting outcomes therefore reflect both true preferences and strategic considerations.

## In multi-agent AI

Voting morphisms appear when:

- **AI ensembles aggregate predictions** via majority voting or weighted scoring.
- **Multi-agent debate frameworks** use judge agents voting on argument outcomes.
- **RLHF aggregates preference data** via implicit voting rules over human comparisons.
- **AI deliberation systems** combine multiple AI perspectives via voting.

## Limits

- **Strategic distortion.** Manipulability complicates interpretation of voting outcomes.
- **Preference cycling.** Condorcet paradoxes mean some preference profiles have no collective ranking.
- **Information loss.** Most voting rules collapse rich preferences to a single decision.
- **Aggregation paradoxes.** Counterintuitive outcomes (Condorcet, Simpson, Ostrogorski paradoxes) arise even with well-designed rules.

## Status

Foundational.
Voting is the most-studied preference- aggregation procedure in social choice.
Application to AI multi-agent systems is active and increasingly important as AI systems aggregate preferences from many sources.
