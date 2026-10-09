---
type: morphism
class: classical
status: active
depends-on:
  - ../objects/message.md
  - ../objects/protocol.md
see-also:
  - teaching/explanations/mechanism-design.md
references: []
---

# Negotiation

**Negotiation** is the iterative exchange of proposals between two or more agents seeking a mutually acceptable agreement — an allocation, contract, division of labor, or joint plan that all parties prefer to no agreement.

## The setting

A negotiation involves:

- **Two or more agents** with private preferences over outcomes.
- **A space of feasible agreements** (possible deals, allocations, contracts).
- **A disagreement outcome** that obtains if no agreement is reached.
- **A protocol** specifying who proposes when, what responses are allowed, when negotiation ends.

Each agent prefers some agreements to disagreement; the negotiation seeks the *bargaining set* — agreements that all agents weakly prefer to disagreement.

## Standard protocols

- **Alternating-offers** (Rubinstein 1982).
  Agents alternate proposing splits; each may accept or counter-propose; under standard assumptions has unique subgame-perfect equilibrium.
- **Take-it-or-leave-it.** One agent proposes; the other accepts or refuses (with disagreement outcome).
  Vulnerable to commitment.
- **Concession-based.** Both agents start with extreme positions; iteratively concede toward middle.
- **Argumentation-based.** Agents exchange justifications, not just proposals; supports persuasion and preference revision.
- **Multi-issue.** Multiple variables under negotiation; agents trade across issues.

## Solution concepts

When negotiation succeeds, what counts as the "right" outcome?
Several normative concepts:

- **Nash bargaining solution.** Maximizes product of utility gains over disagreement; satisfies symmetry, Pareto optimality, scale invariance, IIA.
- **Kalai-Smorodinsky.** Alternative axioms; closer to monotonic improvement.
- **Egalitarian solution.** Equal utility gains across agents.
- **Utilitarian solution.** Maximizes total welfare.

These often disagree; choosing among them is a normative decision built into the negotiation protocol.

## In multi-agent AI systems

Negotiation appears when:

- **AI agents allocate scarce resources** (compute, bandwidth, attention) across competing demands.
- **AI agents represent different stakeholders** in cooperative tasks; negotiation reconciles their goals.
- **Multi-agent contract formation** — AI services negotiating service-level agreements.
- **LLM-agent debate** — implicit negotiation as agents argue toward consensus.

## Limits

- **Bounded rationality.** Real negotiators (human or AI) may not play equilibrium strategies; behavioral deviations affect outcomes.
- **Information asymmetry.** Private valuations create bargaining frictions; full revelation may be impossible.
- **Time pressure.** Negotiations under time constraints yield different outcomes than unbounded negotiations.
- **Multi-issue complexity.** Combinatorial bundles introduce computational and strategic complexity.
- **Strategic deception.** Agents may misrepresent preferences for advantage.

## Status

Mature theoretical area with extensive literature on formal protocols and solution concepts.
Application to AI multi-agent systems is active; LLM agent negotiation behavior is an emerging empirical research area.
