---
type: theorem
class: classical
status: proved
depends-on:
  - teaching/explanations/social-choice.md
  - ../objects/voting-rule.md
see-also:
  - arrows-impossibility.md
  - revelation-principle.md
references: []
---

# Gibbard-Satterthwaite theorem

## Statement

Every voting rule selecting from three or more alternatives that is:

- **Surjective** (every alternative is sometimes a winner) and
- **Non-dictatorial** (no single agent determines the outcome)

is **manipulable**: some voter has some preference profile under which they obtain a strictly preferred outcome by misreporting their preferences.

Equivalently: there is no non-dictatorial voting rule with three or more alternatives in which truthful reporting is a *dominant strategy* for every voter.

## Independent proofs

Proved independently by Allan Gibbard (1973) and Mark Satterthwaite (1975).
Gibbard's version is more general (applying to choice rules over outcomes); Satterthwaite's is specifically for voting.

## Proof structure

The proof builds on Arrow's framework.
Construct from any manipulable rule a derived social welfare function that violates Arrow's axioms unless the rule is dictatorial.
Contrapositively: every non-dictatorial rule must be manipulable.

## What it implies

- **Strategic voting is structural.** Voters in any reasonable system can sometimes profit by lying about preferences.
- **Preference revelation is hard.** Voting outcomes reflect strategic considerations alongside true preferences.
- **Mechanism design via voting is constrained.** If the designer wants truthful reporting, they cannot use a non-dictatorial voting rule directly.

## Escape routes

The theorem applies under specific assumptions; relaxing them admits truthful mechanisms:

- **Restricted preference domains.** Single-peaked preferences admit truthful rules (median voter).
- **Money transfers.** With monetary side payments and quasi-linear utilities, VCG mechanisms achieve truthfulness — but voting alone (no money) cannot.
- **Randomized rules.** Randomization can achieve truthfulness in restricted senses (Gibbard 1977 characterization of strategy-proof random rules).
- **Approximate truthfulness.** Mechanisms can be truthful "most of the time" or "for most preferences."

## In multi-agent AI

The theorem constrains:

- **AI preference aggregation.** Aggregating AI agents' outputs via voting cannot guarantee truthful reporting.
- **Multi-stakeholder alignment.** Aggregating diverse human preferences faces strategic-misreporting pressure.
- **AI debate frameworks.** When AI judges vote on argument outcomes, strategic misreporting is possible in principle.
- **RLHF and preference learning.** Implicit voting in preference data collection faces manipulation vulnerabilities.

## Significance

Gibbard-Satterthwaite is the second great impossibility of social choice (after Arrow).
Together with Arrow, it establishes that voting is structurally limited: non-dictatorial voting is *necessarily* manipulable.
Any practical voting system either admits dictatorship (no) or admits strategic voting (yes, ineliminably).

## Status

Proved (Gibbard 1973, Satterthwaite 1975).
Multiple extensions (random voting, weak preferences, quasi-truthful mechanisms) refine the boundaries.
Foundational result of mechanism-design theory.
