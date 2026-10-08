---
type: concept
class: authorization-position
depends-on: [authorization, agent]
see-also: [duty, privilege, immunity]
title: Power
description: A power is the authorization position that admits an agent to effect a change in the substrate — to invoke a skill, insert or modify a predication, dispatch work to others, edit substrate machinery.
---

# Power

A **power** is the authorization position that admits an [agent](agent.md) to *effect a change* in the substrate — to invoke a [skill](skill.md), insert or modify a predication, dispatch work to others, edit substrate machinery.
Powers are predications on the agent's [view](../../scope/view/view.md) (or on the agent's [office](office.md)) declaring which substrate operations the agent is admitted to perform.

The structural content of a power predication:

- **Operation reference.** Which substrate operation the power admits — a particular [skill](skill.md), a particular [closure rule](../../teaching/explanations/closure-rule.md), a particular pattern of insertions.
  Powers cite their operations by substrate reference, not by description.
- **Scope reference.** Within which [scope](../../scope/scope.md) the power applies.
  A power is scope-typed: an agent may have power $p$ in scope $\sigma_1$ and not in $\sigma_2$.
- **Trigger predicate.** Optionally, predications that further constrain when the power is exercisable — only during particular [modes](mode.md), only on entities of a particular kind, only when prerequisite predications are present.

A power is *positive*: it grants ability.
The corresponding *negative* is the absence of the power, which the substrate flags as inability to perform the cited operation.
An agent attempting an operation it lacks the power to perform produces a [witness](../../teaching/explanations/witness.md) recording the attempted operation and the missing power; the substrate's [governance](governance.md) handles the rejection.

Powers compose additively across sources: an agent's effective powers are the union of powers from the agent's individual identity, the agent's [office](office.md), the [agent community](agent-community.md) the agent belongs to, and any active runbook or session contexts.
Conflicts between sources — one source grants $p$, another revokes — surface as [repair](../../teaching/explanations/repair.md) opportunities; the substrate's resolution discipline determines the outcome.

The power is the *primary* Hohfeldian position: a duty without an underlying power is a request that cannot be fulfilled; a privilege without an underlying power is a permission to do something the agent cannot do anyway.
Powers determine the action surface; the other three positions (duty, privilege, immunity) modulate the agent's situation relative to the powers.
