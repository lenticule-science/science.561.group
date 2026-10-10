---
type: morphism
class: deployment-operation
realizes: [backup-discipline]
depends-on: [backup-record, snapshot, encrypt-region, take-snapshot, identity-record]
see-also: [restore-from-backup, deploy-to-target]
---

# Take backup

The substrate operation that produces a [backup record](../objects/backup-record.md) of substrate state at a chosen ordinal: capture a snapshot, encrypt under backup-recipient identity-records, transport to off-site storage, record the result.

## Signature

`take-backup(substrate-instance, retention-class, backup-recipients) → backup-record`

Inputs:

- **`substrate-instance`** — reference to the [deployment-record](../objects/deployment-record.md) being backed up.
- **`retention-class`** — the backup's retention category (`daily`, `weekly`, `monthly`, `yearly`, `permanent`).
- **`backup-recipients`** — identity-records under which the backup will be encrypted. Per [backup-discipline](teaching/explanations/backup-discipline.md), distinct from the substrate-instance's own identity.

Outputs:

- **`backup-record`** — the [backup-record](../objects/backup-record.md) created, with the encrypted snapshot bytes referenced by `storage-location`.

## Operational semantics

Take-backup proceeds in five steps:

1. Per [take-snapshot](take-snapshot.md), capture a snapshot of the substrate's current state. Records the snapshot's `output-hash`.
2. Bundle the snapshot with the substrate's active [closure-rule system](../objects/closure-rule-system.md) version. Per [snapshot-replay-fidelity](../theorems/snapshot-replay-fidelity.md), the rule-system version is required for replay.
3. Per [encrypt-region](encrypt-region.md), encrypt the bundle under the cited backup-recipients. Records the encrypted bytes' canonical-form hash.
4. Transport the encrypted bundle to the deployment-target's configured off-site storage location. The transport is itself a witnessed operation; failures are surfaced.
5. Assemble the backup-record citing the snapshot, the encrypted-bundle hash, the storage-location, the retention-class, and the substrate-instance. Append to the substrate's audit chain.

Per [settlement-determinism](../theorems/settlement-determinism.md), take-backup's output is a deterministic function of the substrate state and the backup-recipients (modulo encryption-scheme randomness, which doesn't affect the underlying snapshot's content). Per [snapshot-replay-fidelity](../theorems/snapshot-replay-fidelity.md), the snapshot inside the backup is replayable to the same predication valuation that the substrate held at capture time.

## Engineering invariants

- **Atomic per snapshot.** Take-backup's snapshot is taken at a single substrate ordinal, not spread across a settling. Concurrent substrate operations during take-backup are admissible; the backup captures the state at the snapshot-ordinal regardless.
- **Off-site transport required.** The transport step is not optional. A take-backup that does not reach off-site storage produces no backup-record (or a backup-record marked failed).
- **Encryption required.** Per [backup-discipline](teaching/explanations/backup-discipline.md), the snapshot is encrypted before transport. No plaintext backup ever leaves the substrate.
- **Witness-emitted.** The backup operation produces a witness recording the operation's inputs (snapshot ordinal, recipients, storage location), the outputs (backup-record id), and the storage-transport's success or failure.

## Failure modes

- **Snapshot capture failure.** Per [take-snapshot](take-snapshot.md), the snapshot may fail (substrate non-quiescent, scope incomplete). The backup operation surfaces the snapshot failure.
- **Encryption failure.** Per [encrypt-region](encrypt-region.md), encryption may fail (recipient identity-record missing, scheme unsupported). The backup operation surfaces the encryption failure.
- **Storage transport failure.** The off-site storage location may be unreachable, full, or rejecting writes. The substrate retries per its policy; persistent failure produces no backup-record.
- **Recipient validity expired.** A backup-recipient identity-record whose validity has expired produces a recipient-expired refusal at encryption time. The substrate's response is to admit a current backup-recipient identity-record and retry.

## Position in the substrate

Take-backup is the operator that *produces* off-site recoverable state. Per [backup-discipline](teaching/explanations/backup-discipline.md), backups are the substrate's disaster-recovery primitive; without take-backup, the substrate's recovery story depends only on live persistence (inadequate for true disasters). With it, the substrate has a structurally-distinct recovery path through restore-from-backup.

The pattern composes with [take-snapshot](take-snapshot.md) (which captures the snapshot inside the backup), with [encrypt-region](encrypt-region.md) (which protects it), with [identity-record](../objects/identity-record.md) (the backup-recipient), with [backup-record](../objects/backup-record.md) (the resulting record), and with [restore-from-backup](restore-from-backup.md) (the inverse operation).
