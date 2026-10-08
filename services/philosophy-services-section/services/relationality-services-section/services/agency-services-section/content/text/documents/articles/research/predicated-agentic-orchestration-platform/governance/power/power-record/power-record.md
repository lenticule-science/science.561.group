---
type: definition
class: substrate-entity
realizes: [power]
depends-on: [power, agent, scope]
see-also: [duty-record, privilege-record, immunity-record]
title: Power record
description: "A power record is the substrate-entity formal definition of a power: the predication-graph entity declaring an authorization-position that admits its holder to effect a specific change in the substrate."
---

# Power record

A **power record** is the substrate-entity formal definition of a [power](teaching/explanations/power.md): the predication-graph entity declaring an authorization-position that admits its holder to effect a specific change in the substrate.
Per [authorization](../../authorization/authorization.md) and [agential self-generation](../../../agent/agential-self-generation/agential-self-generation.md), every power the platform recognizes must exist as a record.

## Structural fields

- **`id`** — kebab-case identifier.
- **`description`** — one-line summary of what the power admits.
- **`admits-operation`** — reference to the substrate operation (skill, closure rule, primitive operator, or pattern of insertions) the power admits.
- **`scope`** — reference to the [scope](../../../scope/scope.md) within which the power applies.
- **`trigger-conditions`** — optional predications further constraining when the power is exercisable: only during certain modes, only on entities of a particular kind, only when prerequisite predications are present.
- **`grantable-by`** — references to office records or governance-decision authorities that may grant this power.
  Powers without declared grantors are pre-existing (typically root-authority powers granted at substrate initialization).
- **`revokable-by`** — references to office records or governance-decision authorities that may revoke this power.
  Often but not always identical to `grantable-by`.
- **`attached-duties`** — references to [duty-records](../../../office/duty/duty-record/duty-record.md) that automatically attach when the power is exercised.
- **`closure-kind`** — `power`.

## Invariants

- **Operation-resolvable.** The cited `admits-operation` resolves to a substrate-resident operation.
  Powers admitting non-existent operations are violations.
- **Scope-coherent.** The power's scope is a substrate scope; cross-scope or undeclared scopes are violations.
- **Grantor-declared.** The cited grantable-by entities exist.
  A power with no grantor is admissible only as a substrate-root power.
- **Substrate-resident.** Per self-representation, the power record itself is queryable.
  Out-of-band powers are not admissible.

## Operations

- *Grant.* Per [enroll](../../../office/enroll/enroll.md) (when granting via office membership) or via direct authorization (when granting to a specific agent), the power is granted by inserting an authorization predication on the target.
  The grant produces a witness.
- *Exercise.* When an agent invokes an operation requiring the power, the substrate's authorization machinery checks the agent's predications for the power.
  The check is substrate-traversal; the result is a Boolean (admitted or rejected).
- *Revoke.* Per [revoke](../../revoke/revoke.md), the power is retracted.
  Per the power's `revokable-by`, only authorized entities may revoke.

## Position in the platform

Power records are the substrate-recorded *vocabulary of admission*: every operation an agent performs corresponds to a power the agent must hold.
Without power records, authorization is implicit (encoded in code-level checks); with them, authorization is substrate-recorded, queryable, auditable, and editable through the same operators as content.

Particular platform realizations may carry power records like:

- **`edit-published-content`** — admits modification of published-content entities.
- **`approve-merge`** — admits merge-approval for proposed-changes entities.
- **`open-scope`** — admits creating new scopes within a containing scope.
- **`enroll-into-office`** — admits adding agents to an office.
- **`escalate-to-governance`** — admits escalating decisions to higher governance.

Each power record has its own admits-operation, scope, and trigger-conditions; the substrate's authorization is the union of granted powers minus revocations.
