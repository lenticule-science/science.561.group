---
type: morphism
class: governance-operator
realizes: [authorization, governance]
depends-on: [authorization, governance, office-record]
see-also: [enroll, governance-decision]
title: Revoke
description: The operator that retracts an authorization predication — a power, privilege, or immunity — from an agent, office, or agent community.
---

# Revoke

The operator that retracts an [authorization](../authorization/authorization.md) predication — a [power](teaching/explanations/power.md), [privilege](teaching/explanations/privilege.md), or [immunity](teaching/explanations/immunity.md) — from an [agent](teaching/explanations/agent.md), [office](teaching/explanations/office.md), or [agent community](teaching/explanations/agent-community.md).
Revoke is the substrate's primitive for taking back authority granted earlier; it is structurally distinct from [enroll](../../office/enroll/enroll.md)'s reverse (membership retraction) but follows the same governance discipline.

## Signature

`revoke(authorization-predication, target, governance-decision-id?, effective-at?) → (revocation-record, witness)`

Inputs:

- **`authorization-predication`** — reference to the specific authorization predication being revoked: a power record, a privilege record, an immunity record, or a duty release.
- **`target`** — reference to the entity (agent, office, community) whose authorization is being revoked.
- **`governance-decision-id`** — optional reference to a [governance-decision](../governance-decision/governance-decision.md) witness.
  Required when the authorization's revocation policy demands governance approval.
- **`effective-at`** — optional cutoff: the substrate may immediately retract the authorization (default) or schedule the retraction for a future event-log position (allowing graceful transition).

Outputs:

- **`revocation-record`** — a substrate entity declaring the revocation: `target`, `authorization-predication`, `revoked-at`, `revoked-by`, `governance-decision`.
  The target's effective authorization on the next operation will reflect the revocation through substrate traversal.
- **`witness`** — records the revocation's details.

## Operational semantics

Revoke proceeds in five steps:

1. *Validate revocation authority.* Check whether the revoking entity is authorized to revoke this authorization.
  Per the authorization's revocation policy: the granting authority can typically revoke; in some cases (e.g., immunities granted by a higher governance level), revocation requires governance-decision at the corresponding level.
2. *Check active dependencies.* Identify any in-flight operations that depend on the authorization being revoked.
  Per the operation's discipline: in-flight operations may be allowed to complete (graceful) or aborted (immediate).
  The substrate's revocation policy declares which.
3. *Insert revocation predication.* The revocation entity is created; predications connect it to the target and the authorization.
  Per [self-representation](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md), revocation is substrate content, not runtime state.
4. *Recompute affected views.* All [view-record](../../scope/view/view-record/view-record.md) entities that depend on the revoked authorization are marked for recomputation.
  On the next view-recomputation, the target's available-operations and visible-entities will reflect the loss of authorization.
5. *Witness emit.* The revocation witness is appended to the [event log](../../../objects/event-log.md).

## Engineering invariants

- **Substrate-recorded.** Revocations are substrate events; an audit can replay the revocation history of any authorization on any target.
- **Authorization-through-traversal still works.** After revocation, the target's effective authorization is determined by the same substrate traversal as before — but the traversal now includes the revocation predication, which excludes the revoked authorization.
  The substrate's identity-by-relations discipline ensures consistency.
- **Reversible by re-grant.** A revoked authorization can be re-granted by the appropriate substrate operation (a new [enroll](../../office/enroll/enroll.md) for membership-rooted authorizations, a new authorization-grant for direct ones).
  The witness chain shows the full grant-revoke-grant history.

## Failure modes

- **Insufficient revocation authority.** The revoking entity is not authorized to revoke this authorization.
  The witness records the rejection; per [escalation](../escalation/escalation.md), the request may be escalated to governance.
- **Active dependencies block revocation.** Per the substrate's policy, in-flight operations depending on the authorization are too critical to interrupt; the revocation is queued for after they complete.
  The witness records the queued state.
- **Revoking a structurally-required authorization.** Some authorizations are structurally required (an office's leader must hold administrative powers; revoking them without simultaneously transferring to a successor would leave the office leaderless).
  The substrate's coherence rules may block such revocations or require atomic transfer.

## Position in the platform

Revoke is the substrate-level expression that authority can be taken back.
Without it, authorizations are permanent; with it, the platform supports promotion, demotion, transfer, retirement of agents, dissolution of offices, restructuring of the org chart.
The substrate's witness chain ensures every revocation is recorded; the audit shows authority's full lifecycle.
