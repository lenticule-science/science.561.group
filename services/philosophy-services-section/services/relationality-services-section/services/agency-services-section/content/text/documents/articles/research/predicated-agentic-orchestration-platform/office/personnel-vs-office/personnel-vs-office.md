---
type: concept
class: distinction
depends-on: [office, agent, authorization]
see-also: [governance, dispatch]
title: Personnel vs office
description: "The platform's distinction between the office (a governance role: a position with declared authority, scope, and capabilities) and the personnel (the individual agent currently holding the office)."
---

# Personnel vs office

The platform's distinction between *the office* (a governance role: a position with declared authority, scope, and capabilities) and *the personnel* (the individual agent currently holding the office).
The distinction is engineering content because the two carry different predications, change at different cadences, and compose additively in the platform's [view](../../scope/view/view.md) and [dispatch](dispatch.md) machinery.

## What an office carries

Per [office](office.md), an office is an agent entity whose distinguishing predications declare its governance role: scope of authority, predicates it has authority over, work-types it accepts, reporting relationships, default capabilities, default [authorization](../../governance/authorization/authorization.md) positions (powers, duties, privileges, immunities).
The office's predications are *role-stable*: they describe what the office *is*, not who currently holds it.

## What personnel carries

A personnel record is an [agent](agent.md) entity whose distinguishing predications declare an *individual* agent: identity, history, individually-conferred privileges, individual capabilities developed through use, individual constraints (personal mode preferences, personal authorization restrictions).
Per [skill-position](../../skill/skill-position/skill-position.md), personnel-specific skills (those acquired by an individual through their work history) attach here rather than to the office.

Personnel are admitted to the platform through enrollment (per [enroll](../enroll/enroll.md)); they are removed through revocation (per [revoke](../../governance/revoke/revoke.md)).
Adding new personnel is a substrate edit; removing personnel does not affect the office they previously held — the office is its own entity with its own predications.

## Composition: the holding relationship

A personnel record holds an office through a *holds* predication: `holds(personnel, office)`.
The relationship may have:

- **Effective dates.** When the personnel began holding the office, when (if ever) they ceased holding it.
- **Scope qualifiers.** A personnel may hold an office in a particular scope or sub-scope distinct from the office's full scope.
- **Inheritance directives.** Whether the personnel's individual capabilities augment, override, or replace the office's defaults.

The composition through `holds` is what makes the platform's [view](../../scope/view/view.md) machinery work: an actor's view is composed from the office's defaults plus the personnel's individual additions.
Per [boundary-as-fiber](../../scope/boundary-as-fiber/boundary-as-fiber.md), this is the additive composition pattern that adjacent multi-agent systems converge on (guild defaults plus character-specific abilities, etc.).

## Why the distinction is engineering content

Without the distinction, the platform conflates role with individual:

- **Reorganization is impossible.** Replacing one personnel with another requires editing every authorization, capability, and historical predication that referenced "the agent" rather than "the office."
  With the distinction, the role's predications stay; the personnel record changes, the `holds` relationship updates.
- **Audit drifts.** A historical witness records "agent X did Y."
  Was that authority because of office or because of personnel?
  The substrate cannot tell without the distinction.
  With the distinction, the witness records both: "personnel X holding office O did Y," and the audit decomposes the authority chain.
- **Authority changes are entangled with personnel changes.** Granting a new privilege to "everyone in office O" requires editing every personnel record currently holding O without the distinction.
  With the distinction, the privilege is added to the office; all current and future holders inherit it through the `holds` composition.

## Engineering consequences

- **Reorganization is a substrate operation.** Reassigning personnel between offices is editing `holds` predications.
  Per [governance-decision](../../governance/governance-decision/governance-decision.md), the reassignment may require governance approval but is otherwise an ordinary substrate edit.
- **Authorization changes apply at the right granularity.** A scope-wide policy change is an edit to the office (or the scope's [authorization](../../governance/authorization/authorization.md) profile); an individual exception is an edit to the personnel record.
- **Federation tracks both.** Per [federation](federation.md), an actor's authorization across federated substrates includes both their office's reach and their personnel's individual privileges.
  The federation discipline composes both correctly because they are distinct substrate entities.
- **Self-representation includes the org chart.** Per [agential-self-generation](../../agent/agential-self-generation/agential-self-generation.md), the platform's own org chart (offices, reporting relationships, current personnel) is substrate content.
  Editing the org chart is editing predications; the platform sees its own structure as data.

## Position in the platform

Personnel-vs-office is the platform's *role-vs-individual discipline*.
It is the structural realization of "an organization is a graph of positions, and people occupy positions, and the two are different things."
Without the distinction, the platform's authority and audit machinery accumulates entanglements that surface only at reorganization time.

The pattern composes with [office](office.md) (defaults), with [agent](agent.md) (the personnel-as-individual-agent), with [authorization](../../governance/authorization/authorization.md) (the four Hohfeldian positions compose additively across office and personnel), with [view](../../scope/view/view.md) (the actor's view composes both), and with [governance](governance.md) (governance decisions affect office or personnel separately, as the decision specifies).
