---
type: theorem
class: engineering-claim
status: proved
depends-on: [backup-record, take-backup, restore-from-backup, snapshot-replay-fidelity, encrypted-region-replay-equivalence, settlement-determinism, hash-injectivity-under-canonical-form]
see-also: [deployment-determinism]
---

# Backup-restore preserves substrate state byte-identically

**Claim.** Let $B$ be a [backup record](../objects/backup-record.md) produced by [take-backup](../morphisms/take-backup.md) of substrate-instance $S$ at ordinal $\tau$. Let $S'$ be a substrate-instance obtained by [restore-from-backup](../morphisms/restore-from-backup.md) of $B$ at ordinal $\tau$ (no post-backup events applied) onto a fresh deployment-target. Then:

1. **Predication-valuation fidelity.** $S'$'s [predication valuation](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-valuation.md) at $\tau$ equals $S$'s predication valuation at $\tau$ cellwise in every fiber.
2. **Canonical-form-hash fidelity.** The canonical-form hash of $S'$'s substrate state equals the canonical-form hash of $S$'s state at $\tau$.
3. **Replay-equivalence.** Subsequent operations on $S'$ produce the same successor settlings as the corresponding operations on $S$ would (per [settlement-determinism](settlement-determinism.md)).

The fidelity is the substrate's structural guarantee that a backup is *recoverable to byte-identical state* — the basis of the substrate's disaster-recovery story.

## Why this holds

The argument is a chain of three already-proved theorems. Each step preserves substrate state byte-identically; the composition does too.

**Part 1: Take-backup preserves the snapshot's plaintext.** Per [take-backup](../morphisms/take-backup.md), the operation captures a snapshot of the substrate at $\tau$, encrypts it under backup-recipients, and stores the encrypted bytes. The snapshot's plaintext (before encryption) is the canonical-form serialization of the substrate's state at $\tau$, with the snapshot's `output-hash` equal to $S$'s state hash at $\tau$. The encryption step is the inverse of decryption (per [encrypted-region-replay-equivalence](encrypted-region-replay-equivalence.md) Part 1), so the plaintext is recoverable from the encrypted bytes by a recipient.

**Part 2: Restore-from-backup recovers the snapshot's plaintext.** Per [restore-from-backup](../morphisms/restore-from-backup.md), the operation retrieves the encrypted bytes, decrypts them using a valid recipient identity-record, and unpacks the snapshot. By [encrypted-region-replay-equivalence](encrypted-region-replay-equivalence.md), the decrypted plaintext is byte-identical to what take-backup encrypted. The recovered snapshot's `output-hash` equals $S$'s state hash at $\tau$.

**Part 3: Snapshot replay reconstructs the predication valuation byte-identically.** Per [snapshot-replay-fidelity](snapshot-replay-fidelity.md), replaying the recovered snapshot on $S'$'s deployment-target reconstructs the predication valuation $v_\tau$ of $S$'s state at $\tau$, cellwise-equal in every fiber, with byte-identical canonical-form hash. The replay is unconditional on the deployment-target — the same snapshot replays to the same valuation on any compatible target.

**Part 4: Subsequent settling is determined.** Per [settlement-determinism](settlement-determinism.md), once $S'$'s state equals $S$'s state at $\tau$, any subsequent operation (admission of a new event, application of a closure rule, take of a new snapshot) produces the same successor state on $S'$ as it would on $S$. The two substrate-instances are now operationally equivalent from $\tau$ forward.

## Engineering consequence

Backup-restore is what makes the substrate *survivable*. Several engineering uses follow:

- **Disaster recovery.** When a substrate's deployment-target fails permanently (cloud region outage, hardware destruction, security breach requiring teardown), recovery on a fresh target via restore-from-backup produces a byte-identical substrate. Continuing operations from the recovery is byte-identical to continuing from the original (modulo wall-clock time, which is informational only).
- **Substrate migration.** Moving a substrate from one deployment-target to another (cloud-to-cloud, on-prem-to-cloud) is structurally take-backup + deploy-to-target + restore-from-backup. Per the fidelity claim, the migrated substrate is byte-identical to the original.
- **Audit reconstruction.** An auditor can reconstruct the substrate's historical state at any backed-up ordinal by restoring the backup to an isolated deployment-target. The reconstruction is byte-identical to what the substrate held at the time, enabling forensic analysis of substrate state at any point in the backup history.
- **Reproducible debugging.** A bug discovered in production can be reproduced on a separate deployment by restoring the production backup to the debug deployment. Per the fidelity claim, the debug deployment exhibits the same substrate behavior the production one did.

## What the theorem rules out

- A backup-restore process that loses any snapshot content (compression artifacts, encoding drift) violates Part 3 — the replay no longer reconstructs the original valuation. The substrate's discipline is to use lossless canonical-form serialization throughout.
- A restoration onto an incompatible deployment-target (different image format, different persistence model) cannot guarantee the fidelity. Per [deployment-target](teaching/explanations/deployment-target.md), the target must be compatible with the backed-up substrate's image and persistence requirements.
- A restoration without the cited closure-rule-system version produces a substrate whose subsequent operations may differ from the original's. Per [snapshot-replay-fidelity](snapshot-replay-fidelity.md), the rule-system version is part of the replay-context; without it, replay-fidelity is broken.

## What the theorem requires

- The backup-record's snapshot is canonical-form-serialized per [snapshot](../objects/snapshot.md).
- The encryption scheme provides cryptographic correctness per [encrypted-region-replay-equivalence](encrypted-region-replay-equivalence.md).
- The restore deployment-target is compatible with the backup's substrate's container-image format and persistence requirements.
- The cited closure-rule-system version is retrievable (bundled in the backup or independently archived).
- A valid recipient identity-record (with private-key access) is available at the restore-target.
- The substrate's [hash-discipline](teaching/explanations/hash-discipline.md) is hash-injective per [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md).
