---
type: concept
class: authorization-position
depends-on: [authorization, agent]
see-also: [power, duty, privilege]
title: Immunity
description: An immunity is the authorization position that protects an agent from being required to do something — a substrate-recorded shielding from duties that would otherwise attach by virtue of role, membership, or context.
---

# Immunity

An **immunity** is the authorization position that *protects* an [agent](agent.md) from being *required* to do something — a substrate-recorded shielding from duties that would otherwise attach by virtue of role, membership, or context.
Immunities are predications on the agent's [view](../../scope/view/view.md) (or on the [office](office.md)) declaring which obligations *cannot be imposed* on the agent.

The structural content of an immunity predication:

- **Targeted duty.** Which duty is shielded — typically a duty that the agent's [office](office.md) or [agent community](agent-community.md) would normally make applicable.
- **Scope reference.** The [scope](../../scope/scope.md) within which the immunity applies.
  An agent may be immune from duty $d$ in scope $\sigma_1$ but subject to it in $\sigma_2$.
- **Source.** Which substrate authority granted the immunity — a [governing soul](../../agent/governing-soul/governing-soul.md) provision, a governance decision, a federation-handshake commitment.
  Immunities are not merely declared; they are granted by traceable substrate operations.

An immunity is *protective*: when the substrate's closure rules check whether a duty applies to an action, they consult the agent's immunity predications first.
An immunity matching the duty causes the duty to be skipped for this agent; the action proceeds without the duty's enforcement.

The pattern is structurally distinct from [privilege](privilege.md):

- A privilege says "I can do this without owing the duty when *I* exercise the underlying power."
- An immunity says "I cannot be required to do this, regardless of whether I'm exercising any related power."

A privilege is opt-in (the agent chose to exercise the privileged power); an immunity is general protection (the agent need not act at all, and cannot be required to).

Immunities are non-trivially scoped: an agent immune from policy-disclosure duties in a research scope is typically *not* immune from those duties in an operations scope.
The scope-typing of immunities is part of why they are substrate predications rather than agent-attached flags: changing an agent's immunities is a substrate edit, recorded in the [event log](../../../objects/event-log.md), auditable through [provenance](../../teaching/explanations/provenance.md).

Immunities compose subtractively: the union of an agent's immunities removes the corresponding duties from the agent's effective obligation set.
Conflicts (a duty granted by one source, immunized by another) are resolved by the substrate's [governance](governance.md) discipline; typically the source with greater scope-precedence wins, but particular platforms may declare other resolution rules.
