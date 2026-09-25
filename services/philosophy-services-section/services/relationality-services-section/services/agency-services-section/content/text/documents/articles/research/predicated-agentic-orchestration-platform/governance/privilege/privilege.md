---
type: concept
class: authorization-position
depends-on: [authorization, agent]
see-also: [power, duty, immunity]
title: Privilege
description: A privilege is the authorization position that permits an agent to do something without incurring a duty — a positive permission that exempts the agent from an obligation that would otherwise attach.
---

# Privilege

A **privilege** is the authorization position that *permits* an [agent](agent.md) to do something *without incurring a duty* — a positive permission that exempts the agent from an obligation that would otherwise attach.
Privileges are predications on the agent's [view](../../scope/view/view.md) (or on the [office](office.md)) declaring which actions the agent may perform without the duties that the actions would normally trigger.

The structural content of a privilege predication:

- **Action reference.** What the agent is permitted to do — typically an action that, exercised by another agent, would trigger duties.
- **Exempted duty.** Which duties the privilege exempts.
  A privilege is meaningful only with reference to a duty it relaxes; an action with no attendant duties does not need a privilege.
- **Scope reference.** The [scope](../../scope/scope.md) within which the privilege applies.
  Privileges are scope-typed.
- **Conditions.** Optionally, predications further constraining when the privilege applies — only during particular [modes](mode.md), only for particular targets, only when prerequisite predications are present.

A privilege is structurally distinct from a [power](power.md): a power is *the ability to do*, a privilege is *the absence of an obligation when doing*.
An agent may have power $p$ but no privilege attached to its exercise (in which case the duties attached to $p$ apply); the agent may have power $p$ with privilege exempting some duties (in which case those duties are inapplicable for this agent's exercise of the power).

A privilege is *positive but constrained*: it admits the privileged action without obligation, but it does not grant the action itself if the agent lacks the underlying [power](power.md).
Privileges cannot grant abilities; they can only relax obligations attached to abilities the agent already has.

Privileges compose additively but their effect is *removal*: each privilege predication removes a duty's applicability for the privileged action.
The substrate's closure rules consult both the duty's applicability conditions and any privileges exempting the duty; the governance discipline determines the outcome of conflicting predications.

The pattern lets the substrate express *role-specific exemptions* without restructuring the duty itself.
A duty to attribute sources is universally applicable; an editor's privilege of choosing interpretive focus is the substrate-level claim that this particular agent's interpretive choices are not subject to the source-attribution duty in the way other content is.
The duty stays universal; the privilege carves out the editor's exemption.
