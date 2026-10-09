---
type: concept
class: structure
depends-on: [agent, view, scope]
see-also: [governance, office]
title: Authorization
description: The platform's pattern for what an agent can do — the structural positions on the agent's view entity that determine which substrate operations the agent is admitted to invoke.
---

# Authorization

The platform's pattern for *what an agent can do* — the structural positions on the agent's [view](../../scope/view/view.md) entity that determine which substrate operations the agent is admitted to invoke.
Authorization is recorded as predications: which capabilities the agent has, which it lacks, which obligations it carries, which protections it enjoys.

The pattern follows the four Hohfeldian positions (powers, duties, privileges, immunities) as a set of predicate kinds on the boundary entity:

- **Power.** The agent can effect a change — invoke a [skill](skill.md), modify a predication, dispatch work to others.
  Powers are predications on the agent's view declaring which substrate operations the agent is admitted to invoke.
- **Duty.** The agent must act in a particular way — attribute sources, log decisions, escalate certain matters.
  Duties are predications declaring required actions, and the substrate enforces them through closure rules that fire on the agent's invocations.
- **Privilege.** The agent is permitted to do something without obligation — browse public domains, choose interpretive focus, defer non-urgent work.
  Privileges are predications declaring what the agent may do without violating any duty.
- **Immunity.** The agent is protected from being required to do something — exempted from certain obligations, shielded from certain mutations of its content.
  Immunities are predications declaring what cannot be required of the agent.

Three engineering properties:

- **Authorization composes from multiple sources.** An agent's authorization at any moment is the composition of its [office](office.md)'s default authorization (the role-given baseline) with the agent's individual authorization (personal additions, removals, overrides).
  The composition is the substrate's join in its value-domain; conflicts between sources surface as repair opportunities.
- **Authorization is live.** When an authorization predication changes — a power granted, a duty added, an immunity revoked — the agent's [view](../../scope/view/view.md) reflects the change immediately on the next operation.
  There is no cached permission table that lags the substrate; the authorization is queried from the substrate at the moment of operation.
- **Authorization decisions are auditable.** Every operation an agent invokes carries a [witness](../../teaching/explanations/witness.md) entry citing which authorization predications admitted it.
  An auditor can replay the decision and verify the operation was admissible at the time; an unauthorized invocation is detected at the operation step, not after the fact.

The pattern is what makes the platform's authorization *substrate-recorded* rather than externally enforced.
A traditional access-control system stores permissions in a separate table that an external check consults; the platform records authorization as predications, and the operations themselves are the checks (an unauthorized operation is one whose authorization predications do not match the operation's required-authorization predications).
The substrate sees its own access discipline as data.
