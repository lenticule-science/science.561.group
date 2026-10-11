---
type: definition
class: substrate-entity
realizes: [backup-discipline]
depends-on: [backup-discipline, snapshot, encryption, identity-record, hash-discipline]
see-also: [deployment-record, snapshot]
---

# Backup record

A **backup record** is the substrate-entity formal definition of one [backup](teaching/explanations/backup-discipline.md): a durable, off-site, encrypted copy of substrate state at a chosen ordinal, with metadata sufficient for recovery on a fresh deployment.

## Structural fields

- **`id`** — kebab-case identifier; canonical-form hash of the encrypted snapshot bytes.
- **`description`** — one-line summary (typically the substrate-instance + backup ordinal + retention class).
- **`source-substrate`** — reference to the substrate-instance the backup was taken from.
- **`captured-at`** — substrate ordinal at which the backup was captured.
- **`snapshot`** — reference to the [snapshot](snapshot.md) the backup includes.
- **`encryption-recipients`** — the [identity-records](identity-record.md) the snapshot is encrypted to. Per [backup-discipline](teaching/explanations/backup-discipline.md), these are typically dedicated backup-recipient identity-records distinct from the substrate's live keys.
- **`closure-rule-system-version`** — canonical-form hash of the [closure-rule system](closure-rule-system.md) version active at capture time. Required for replay; per [snapshot-replay-fidelity](../theorems/snapshot-replay-fidelity.md), the cited version's content must be retrievable for the backup to be replayable.
- **`storage-location`** — references to where the encrypted backup bytes are stored: an off-site object store, a separate cloud account, a physical-media archive. The substrate's backup discipline requires the location be at a distinct fault domain from the live substrate.
- **`retention-class`** — the retention category: `daily`, `weekly`, `monthly`, `yearly`, `permanent`. Determines when the backup is eligible for retirement.
- **`tested-at`** — substrate ordinal of the most recent successful restore-test. Untested backups are flagged as backup-on-faith.
- **`predecessor`** — optional reference to the prior backup in the same retention class. Enables backup chains.
- **`closure-kind`** — `backup`.

## Invariants

- **Encrypted to backup-recipient.** The snapshot must be encrypted under at least one identity-record marked as a backup-recipient (per [backup-discipline](teaching/explanations/backup-discipline.md)). Plaintext backups are inadmissible — they would expose substrate content to the storage location.
- **Off-site.** The `storage-location` must be at a fault domain distinct from the live substrate. The substrate's discipline rejects backups stored co-located with live state.
- **Closure-rule-system version retrievable.** The cited rule-system version must be either bundled into the backup (preferred) or retrievable from a substrate-recoverable source. A backup whose rule-system is unavailable is unreplayable.
- **Tested per policy.** Backups must be restore-tested per the substrate's testing policy (typical: one tested restore per retention period). Untested backups past their test-deadline are flagged.

## Operations

- *Capture.* Per [take-backup](../morphisms/take-backup.md), produce a snapshot, encrypt it under the backup-recipient identity-records, transport to the storage location, record the backup-record. Capture is a substrate operation producing a witness; the witness records the captured ordinal, the encryption recipients, the storage location, and the resulting backup-id.
- *Test.* Per [restore-from-backup](../morphisms/restore-from-backup.md) (in test mode), instantiate the backup on an isolated substrate, replay it, verify the canonical-form hash matches the substrate's recorded hash at the captured ordinal. The test is itself a substrate operation; success updates `tested-at`.
- *Restore.* Per [restore-from-backup](../morphisms/restore-from-backup.md) (in production mode), instantiate the backup on a deployment target, replay it, federate the resulting substrate into the federation graph as the recovered substrate-instance.
- *Retire.* Per the retention policy, retire backups past their retention period. Retirement is a substrate operation; the backup record is marked retired but its history remains in the audit chain.

## Position in the substrate

Backup records are the substrate's *durable historical record*. Without them, the substrate's recovery story depends on the live substrate's persistence layer, which is inadequate for true disaster recovery (the persistence layer fails when the live substrate fails). With them, the substrate has a structurally-distinct recovery path: a clean deployment-target plus a backup record plus the backup-recipient private key.

The pattern composes with [snapshot](snapshot.md) (which the backup includes), with [encryption](teaching/explanations/encryption.md) (which protects the backup), with [identity-record](identity-record.md) (which holds the encryption recipients), and with [deployment-record](deployment-record.md) (which records where backups can be restored).
