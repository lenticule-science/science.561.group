---
type: concept
class: authorization-position
depends-on: [authorization, agent, power]
see-also: [privilege, immunity, governing-soul]
title: Duty
description: A duty is the authorization position that requires an agent to act in a particular way when exercising a power — a constraint declaring that certain accompanying actions, attributions, or notifications must occur for the power's exercise…
---

# Duty

A **duty** is the authorization position that *requires* an [agent](agent.md) to act in a particular way when exercising a [power](power.md) — a constraint declaring that certain accompanying actions, attributions, or notifications must occur for the power's exercise to be admissible.
Duties are predications on the agent's [view](../../scope/view/view.md) (or on the agent's [office](office.md)) declaring which obligations attach to which powers.

The structural content of a duty predication:

- **Triggering operation.** Which substrate operation incurs the duty when exercised.
  Typical triggers include an emit-content operation (with a duty to attribute sources) or a state-change operation (with a duty to notify affected scopes).
- **Required action.** What the agent must do — emit an attribution predication, log a decision-rationale predication, notify a particular [office](office.md), record a justification chain.
  The required action is itself a substrate operation, typically a particular [skill](skill.md) or pattern of insertions.
- **Enforcement condition.** When the required action must occur relative to the triggering operation — before, concurrent with, or following within a declared window.
  The substrate's closure rules consult the timing predication when checking duty fulfillment.

A duty unfulfilled is a substrate-level violation.
When an agent exercises a power without satisfying its attendant duty, the substrate's closure rules produce a duty-violation predication; the [governance](governance.md) machinery handles the resolution (escalation, rolled-back operation, recorded warning, mandated future fulfillment).

Duties compose additively: an agent's effective duties are the union of duties attached to each power the agent exercises, plus duties inherited from the [office](office.md) and [agent community](agent-community.md).
An exercised power that triggers multiple duties requires fulfillment of each; partial fulfillment is recorded but does not satisfy the obligation.

A duty is structurally distinct from a power: an agent may have power $p$ but no duty attached to it (the power is exercisable without obligation), or may have duty $d$ attached to power $p$ (the power's exercise must be accompanied by $d$'s required action), or may have a duty triggered by an external event the agent did not initiate (an entity in the agent's scope changed, and the agent is required to respond).
The substrate distinguishes the cases; the governance machinery enforces them.
