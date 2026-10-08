---
type: morphism
class: governance-operator
realizes: [office, agent-community]
depends-on: [office-record, agent, governance, modal-necessity-operator, predication-fiber-algebra]
see-also: [governance-decision, revoke, governance-as-modal-restriction]
title: Enroll
description: The operator that adds an agent to an office — declaring the agent's membership in the office and granting the agent the office's powers, duties, privileges, and immunities for the office's scope.
---

# Enroll

The operator that adds an [agent](teaching/explanations/agent.md) to an [office](teaching/explanations/office.md) — declaring the agent's membership in the office and granting the agent the office's powers, duties, privileges, and immunities for the office's [scope](../../scope/scope.md).
Per [governance-as-modal-restriction](../../governance/governance-as-modal-restriction/governance-as-modal-restriction.md), enrollment extends the modal accessibility relation $R$ on the office graph to include the new agent at the office's authority world.

## Signature

`enroll(agent, office, governance-decision-id?) → (membership-record, witness) | (rejection, witness)`

Inputs:

- **`agent`** — reference to the agent being enrolled.
- **`office`** — reference to the [office-record](../objects/office-record.md) the agent is being enrolled into.
- **`governance-decision-id`** — optional reference to a [governance-decision](../../governance/governance-decision/governance-decision.md) witness that admitted this enrollment.
  Required when the office's enrollment policy demands governance approval; absent for offices with self-service enrollment.

Outputs:

- **`membership-record`** — a substrate entity declaring the agent's membership: `agent`, `office`, `enrolled-at`, `enrolled-by`.
  The agent now inherits the office's powers, duties, privileges, immunities through substrate traversal — equivalently, the agent's modally-restricted capability fiber $\Box_R u_a$ now includes the office's accessibility positions.
- **`rejection`** — enrollment declined: the agent fails the office's [shape](../../scope/shape/shape-record/shape-record.md) constraints, the agent already has incompatible membership, the cited governance decision does not authorize this enrollment.
- **`witness`** — records the enrollment.

## Operational semantics

Enroll proceeds in five steps:

1. *Validate office accepts agent.* The office's `members` shape (or its enrollment-shape predication) is checked: does the agent satisfy the office's membership requirements?
  Failure aborts.
2. *Validate authorization.* If the office requires governance-decision approval for enrollment, verify the cited decision-id resolves to a [governance-decision](../../governance/governance-decision/governance-decision.md) witness whose admitted action was this enrollment.
3. *Check incompatibilities.* The agent's existing memberships are read; the substrate's incompatibility rules (a paid-employee office may forbid simultaneous membership in a competitor office, etc.) are checked.
  Conflicts abort.
4. *Insert membership predication.* The membership entity is created; predications connect the agent to the office (via `member-of`) and the office to the agent (via `members`).
5. *Witness emit.* The enrollment witness is appended to the [event log](../../../objects/event-log.md).
  The agent's effective authorization on the next operation will reflect the new membership through substrate traversal — the next $\Box_R$ computation includes the new accessibility edge.

## Engineering invariants

- **Authorization through traversal.** The agent's enrollment grants powers/duties/privileges/immunities through traversal of the office's predications.
  There is no copy-of-office-authorization on the agent; the office's predications are the source of truth.
- **Witness-recorded.** Both successful and rejected enrollments produce witnesses.
- **Reversible.** Enrollment can be reversed by [revoke](../../governance/revoke/revoke.md); the agent's `member-of` predication is retracted (per the substrate's [retraction](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/retraction.md) discipline, this is sublocale-bounded retraction at the office's authority sublocale, not unrestricted deletion).
  The witness chain shows the enrollment-revocation history.

## Failure modes

- **Shape failure.** The agent does not carry predications the office's enrollment shape requires.
- **Authorization absent.** The office requires governance-decision approval; no decision-id was cited or the cited decision does not authorize this enrollment.
- **Incompatibility.** The agent has existing memberships incompatible with this office.
  The witness records the conflicting memberships; the resolution is governance-level.

## Position in the platform

Enroll is the operator by which the platform's organizational structure grows: agents become members of offices, the org chart expands, the platform's authority surface enlarges.
Per [agential self-generation](../../agent/agential-self-generation/agential-self-generation.md), enrollment is itself substrate content; the platform's organizational evolution is recorded in the same store as everything else, and per [governance-as-modal-restriction](../../governance/governance-as-modal-restriction/governance-as-modal-restriction.md), the modal accessibility relation that authorization computations consult is updated structurally.
