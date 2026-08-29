---
type: morphism
class: deployment-operation
realizes: [backup-discipline]
depends-on: [backup-record, snapshot, decrypt-region, replay, identity-record]
see-also: [take-backup, deploy-to-target]
---

# Restore from backup

The substrate operation that reconstructs substrate state from a [backup record](../objects/backup-record.md) on a deployment-target: retrieve the encrypted bytes, decrypt under a recipient identity-record, replay the snapshot, optionally apply post-backup events.

## Signature

`restore-from-backup(backup-record, target-deployment, recipient-identity) → restored-substrate`

Inputs:

- **`backup-record`** — reference to the backup-record being restored.
- **`target-deployment`** — reference to the [deployment-record](../objects/deployment-record.md) where the restored substrate will run. May be a fresh deployment or an existing one being repopulated.
- **`recipient-identity`** — the identity-record whose private key is used to decrypt the backup. Must be in the backup's `encryption-recipients` list.

Outputs:

- **`restored-substrate`** — the deployment-record with substrate state restored to the backup's captured ordinal.

## Operational semantics

Restore-from-backup proceeds in six steps:

1. Retrieve the encrypted backup bytes from the backup-record's `storage-location`. Verify the canonical-form hash matches the backup-record's recorded hash.
2. Per [decrypt-region](decrypt-region.md), decrypt the bytes using the cited recipient-identity. Verify the decrypted plaintext's hash matches the backup's recorded snapshot hash.
3. Resolve the backup-record's cited closure-rule-system version. If the version is bundled into the backup, unpack it; if cited externally, retrieve it.
4. Per [replay](replay.md), replay the snapshot into the target-deployment's substrate. Per [snapshot-replay-fidelity](../theorems/snapshot-replay-fidelity.md), this reproduces the substrate's predication valuation at the captured ordinal byte-identically.
5. Apply any event-log entries between the backup ordinal and the desired restoration ordinal (typically the latest available). Per [settlement-determinism](../theorems/settlement-determinism.md), this advances the substrate to the desired state.
6. Update the target-deployment's federation-membership, instance-identity (if changing), and other deployment-state. Emit a restoration witness.

The restored substrate is byte-identical-on-content to the backed-up substrate at the captured ordinal, modulo any post-backup events explicitly applied. Per [encrypted-region-replay-equivalence](../theorems/encrypted-region-replay-equivalence.md), the encryption layer doesn't affect the determinism — restore over decrypted plaintext is equivalent to restore over original plaintext.

## Engineering invariants

- **Recipient access required.** The recipient-identity must be in the backup's `encryption-recipients` list, and the recipient's host must hold the corresponding private key. A restore-from-backup invocation without recipient access fails.
- **Rule-system version retrievable.** Per [snapshot-replay-fidelity](../theorems/snapshot-replay-fidelity.md), the cited rule-system version must be available. A backup whose rule-system is unrecoverable is unrestoreable.
- **Hash-verified throughout.** Each stage of restore (encrypted-bytes hash, decrypted-plaintext hash, snapshot canonical-form hash) is verified against recorded hashes. Mismatches surface as substrate events; restoration aborts.
- **Witness-emitted.** Restoration produces a witness recording the backup-id restored, the target-deployment, the recipient used, and the restored ordinal. The witness becomes part of the restored substrate's audit chain.

## Failure modes

- **Storage-location unreachable.** The off-site backup storage is offline or unreachable. Restore retries per policy; persistent failure means restore from this backup is unavailable (try a different backup, fix the storage).
- **Decryption failure.** Per [decrypt-region](decrypt-region.md), decryption may fail (wrong recipient, corrupted ciphertext). The substrate surfaces this; restore aborts.
- **Hash mismatch at any stage.** Indicates corrupted or tampered backup. The substrate surfaces this as a security event; restore aborts.
- **Rule-system version unavailable.** The cited rule-system cannot be retrieved. The substrate may attempt restore against the latest known rule-system version (with a warning that semantics may differ) or abort per policy.

## Position in the substrate

Restore-from-backup is the operator that *recovers* substrate state from off-site recoverable backups. Per [backup-discipline](teaching/explanations/backup-discipline.md), restore is the disaster-recovery primitive; per [encrypted-region-replay-equivalence](../theorems/encrypted-region-replay-equivalence.md), the encryption layer is transparent to the recovered substrate's behavior. The substrate's recovery path is structurally: instantiate a fresh [deployment-target](teaching/explanations/deployment-target.md), restore-from-backup, federate the recovered substrate-instance into the federation-graph.

Test mode (per [backup-discipline](teaching/explanations/backup-discipline.md)'s testing requirement) is restore-from-backup invoked on an isolated target-deployment, with the recovered substrate hash-compared against the substrate-instance's recorded canonical hash at the captured ordinal. Successful test → backup-record's `tested-at` is updated.

The pattern composes with [decrypt-region](decrypt-region.md), [replay](replay.md), [snapshot-replay-fidelity](../theorems/snapshot-replay-fidelity.md), [backup-record](../objects/backup-record.md), and [deployment-record](../objects/deployment-record.md).
