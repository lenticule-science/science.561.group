---
type: definition
class: substrate-entity
realizes: [office]
depends-on: [office, agent, governance, scope]
see-also: [agent-community, governing-soul]
title: Office record
description: "An office record is the substrate-entity formal definition of an office: the predication-graph entity declaring a governance role — what scope it presides over, who reports to it, what work-types it accepts, what powers and duties it…"
---

# Office record

An **office record** is the substrate-entity formal definition of an [office](teaching/explanations/office.md): the predication-graph entity declaring a governance role — what scope it presides over, who reports to it, what work-types it accepts, what powers and duties it inherits and confers, what skills it can invoke.

## Structural fields

- **`id`** — kebab-case identifier.
- **`description`** — one-line summary of the office's role.
- **`presides-over`** — references to the [scopes](../../scope/scope.md) the office is responsible for.
- **`reports-to`** — references to other office records the office reports to (typically zero or one for hierarchical governance, possibly many for matrix governance).
  [Escalation](../../governance/escalation/escalation.md) follows these edges upward.
- **`reporting`** — references to office records that report to this office.
  Dispatch-by-delegation typically follows these edges downward.
- **`work-types-accepted`** — references to predicate entities declaring which work-types the office handles.
- **`powers`** — references to [power](teaching/explanations/power.md) entities the office grants its members.
  Members of the office inherit these powers (subject to [inheritance](../../../../../../../../../../../../../engineering-science-services-section/services/computer-science-services-section/content/text/glossary/terms/inheritance.md) discipline).
- **`duties`** — references to [duty](teaching/explanations/duty.md) entities the office's members carry.
- **`privileges`** — references to [privilege](teaching/explanations/privilege.md) entities the office's members carry.
- **`immunities`** — references to [immunity](teaching/explanations/immunity.md) entities the office's members carry.
- **`skills`** — references to [skill records](skill-record.md) the office can invoke.
- **`runbooks`** — references to [runbook records](runbook-record.md) the office can execute.
- **`closure-kind`** — typically `office`, distinguishing office records from other agent-bearing entities.
- **`members`** — references to agent entities declared as members of the office.
  Per [identity by relations](../../teaching/explanations/identity-by-relations.md), an agent *is* a member by carrying the inverse `member-of` predication; the `members` list is a maintained denormalization for query convenience.

## Invariants

- **Reports-to is acyclic** within a scope.
  The substrate's validation rejects reports-to predications that would create cycles.
- **Powers, duties, privileges, immunities are coherent.** Privileges target duties the office's powers might trigger; immunities target duties applicable in the office's scopes.
  The substrate's validation flags incoherent combinations.
- **Skills and runbooks are scope-admissible.** Cited skills and runbooks have scope predications including the office's scope.
- **Members are agents.** Each cited member is an entity carrying the [agent](teaching/explanations/agent.md)-defining predications.

## Operations

- *Add member.* Inserting an agent's `member-of` predication referencing this office record places the agent in the office.
  The agent inherits the office's powers, duties, privileges, immunities; the inheritance is computable through substrate traversal.
- *Promote / transfer.* Moving an agent from one office to another retracts the old `member-of` predication and inserts a new one.
  The [event log](../../../objects/event-log.md) records both; the agent's effective authorization changes on the next operation.
- *Restructure.* Reorganizing the office graph is editing reports-to / reporting predications.
  The substrate sees the new structure on the next traversal.

## Position in the platform

Office records are the platform's *org chart*: they declare the governance structure as substrate content.
There is no out-of-band organizational diagram; the org chart IS the office records' graph.
Reorganizations are substrate operations, recorded and replayable.

The office-as-record pattern is what makes the platform's organizational structure auditable in the same terms as content.
Asking "who reports to whom in this scope?" is a substrate traversal; asking "when did this reporting line change?" is an event-log query; asking "what powers does this agent have?" is a derived computation through office membership and the office's powers predications.
