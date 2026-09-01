---
type: morphism
class: substrate-operator
realizes: [self-representation]
depends-on: [insertion, witness]
see-also: [retraction, revoke]
---

# Retire

The operator that marks a substrate entity as *no longer active* without removing it from the substrate. Retiring is the substrate's discipline for removing entities from active operation while preserving them for audit. Retired entities remain queryable, citable in past witnesses, and replayable from the [event log](../objects/event-log.md), but they are not visited by current operations.

## Signature

`retire(entity, reason, governance-decision-id?) → (retirement-record, witness)`

Inputs:

- **`entity`** — reference to the substrate entity being retired. May be any kind of substrate entity: a [closure-rule record](../objects/closure-rule-record.md), a [skill record](theories/agential-orchestration-platform/objects/skill-record.md), an [office record](theories/agential-orchestration-platform/objects/office-record.md), a memory record, a channel record, etc.
- **`reason`** — predications declaring why the entity is being retired: replaced by a successor (with reference), no longer needed, governance-mandated retirement, security violation, vocabulary update.
- **`governance-decision-id`** — optional reference to a [governance-decision](theories/agential-orchestration-platform/morphisms/governance-decision.md) witness. Required when the entity's retirement requires governance approval.

Outputs:

- **`retirement-record`** — a substrate predication declaring the entity retired: `retired-at`, `retired-by`, `reason`, `successor` (if applicable). The retirement record is itself a substrate entity.
- **`witness`** — the retirement witness in the event log.

## Operational semantics

Retire proceeds in five steps:

1. *Validate retirement authority.* Check the retiring entity's authorization. Per the entity's `retirable-by` predication (or the entity's class default), only specified authorities may retire it.
2. *Check active dependencies.* Identify operations that depend on the entity being active. The substrate's policy determines: complete in-flight operations gracefully, abort them immediately, or queue the retirement for after they complete.
3. *Identify successor.* If the retirement cites a successor entity (a replacement closure rule, an updated skill version), validate the successor exists and is structurally compatible.
4. *Insert retirement predication.* The entity's `retired` predication is set to `true`, with `retired-at`, `retired-by`, `reason`, and `successor` cited. Per [self-representation](teaching/explanations/self-representation.md), retirement is substrate content.
5. *Witness emit.* The retirement witness goes to the event log; subsequent operations that look up the entity see the retirement.

## Engineering invariants

- **Append-only.** The entity is not deleted from the substrate; its bytes remain in the [content-addressed store](../objects/content-addressed-store.md). Past witnesses citing the entity remain valid; replays from the event log can reproduce them.
- **Active-operation gates.** Operations that look up an entity check its `retired` predication; retired entities are excluded from new operations. The check is part of the operation's normal traversal.
- **Successor citation reversible.** If the retirement is in error, a subsequent unretirement operation can clear the `retired` predication. The witness chain shows the retirement-unretirement history.
- **Successor-traceable.** When a successor is cited, references to the retired entity should typically be redirected to the successor for new operations; the retirement witness records the successor for the substrate's redirect logic.

## Failure modes

- **Insufficient retirement authority.** The retiring entity is not authorized to retire this kind of entity. The witness records the rejection.
- **Active dependencies block.** Per substrate policy, in-flight operations must complete first. The retirement is queued; the witness records the queuing.
- **Successor incompatible.** The cited successor does not satisfy the structural compatibility check (e.g., a replacement closure rule has a different premise pattern, breaking entities that depended on the original). The retirement aborts; the substrate's [governance](theories/agential-orchestration-platform/concepts/governance.md) is invoked.

## Position in the substrate

Retire is the substrate's *deactivate-but-preserve* primitive. It is the answer to "we no longer want this rule to fire / this skill to be invoked / this office to receive work" without breaking the substrate's append-only and replayable disciplines. Retire pairs with [retraction](retraction.md) (which lowers a predication's value) and [revoke](theories/agential-orchestration-platform/morphisms/revoke.md) (which removes an authorization predication); each is appropriate to a different kind of state change.
