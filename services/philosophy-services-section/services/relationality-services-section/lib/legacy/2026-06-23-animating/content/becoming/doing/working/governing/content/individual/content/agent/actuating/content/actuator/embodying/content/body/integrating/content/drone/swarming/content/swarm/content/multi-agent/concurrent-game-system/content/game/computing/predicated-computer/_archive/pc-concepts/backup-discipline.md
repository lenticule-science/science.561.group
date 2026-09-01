---
type: concept
class: persistence-discipline
depends-on: [snapshot, event-log, hash-discipline, encryption, settling-cohomology, closure-2-monad-lax-idempotence, settlement-via-closure-2-monad]
see-also: [container-image, deployment-target, backup-as-cohomology-preservation]
---

# Backup discipline

The substrate's commitment to *off-site, recoverable copies* of substrate state, distinct from in-substrate replication and from federation. In the substrate's hyperdoctrine setting, a backup is not just bytes-on-tape — it is *a sheaf section over the substrate's [bitopological settling site](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bitopological-settling-site.md) at a recorded ordinal*, with the cohomology of the settled state preserved across the backup-restore round trip. Per [backup-as-cohomology-preservation](../theorems/backup-as-cohomology-preservation.md), a backup that satisfies the [snapshot-replay-fidelity](snapshot-replay-fidelity.md) property is structurally a sheaf-section that preserves the substrate's cohomology classes — restoring it produces a substrate whose $H^0$ (settled cells) and $H^1$ (CRDT obstructions, if any) match the originating substrate's.

Where [replication](replication.md) maintains live copies for fault tolerance and federation-convergence, backup maintains *historical* copies for disaster recovery: the ability to reconstruct the substrate's state at a chosen prior ordinal even when the live substrate is destroyed.

## Hyperdoctrinal structure

Per [settlement-via-closure-2-monad](../theorems/settlement-via-closure-2-monad.md), the substrate's settled state at any time is the closure-fixed-point of replaying the event log up to that point. Per [settling-cohomology](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-cohomology.md), each settled state has a well-defined cohomology — $H^0$ counts the cells in the converged state, $H^1$ records CRDT-coordination or aperiodic-stabilization obstructions.

A backup at recorded ordinal $\sigma$ is structurally:

- **A snapshot of the settled state at $\sigma$** — the canonical-form serialization of $v_\sigma \in A_p$.
- **The event-log entries from $\sigma$ to the live substrate's current ordinal** — for restore-then-catch-up scenarios.
- **The cited closure-rule-system version** — needed to replay the events back to $v_\sigma$ if the snapshot is corrupted.
- **The recorded canonical hash of $v_\sigma$** — for restore-time integrity verification.

Per [backup-as-cohomology-preservation](../theorems/backup-as-cohomology-preservation.md), restoring the backup produces a substrate state with the same cohomology classes as the originating substrate at $\sigma$ — bytewise restoration preserves all structural properties, not just the raw cells.

A backup is structurally a [snapshot](../objects/snapshot.md) (a canonical-form-serialized point-in-time view of substrate state) plus enough event-log entries to reconstruct intermediate states between snapshot-points. Per [snapshot-replay-fidelity](../theorems/snapshot-replay-fidelity.md), a backup's snapshot is replayable with byte-identical fidelity given the cited [closure-rule system](../objects/closure-rule-system.md) version. Per [scott-continuity-as-checkpointability](../theorems/scott-continuity-as-checkpointability.md), the regime determines whether the backup needs to ship trajectory or just endpoint.

## Backup discipline commits to four properties

- **Off-site.** Backups are stored at a distinct fault domain from the live substrate. A backup co-located with the live substrate is a *replica*, not a backup; the failure mode that destroys the live substrate destroys the replica too.
- **Encrypted-at-rest.** Per [encryption](encryption.md), backup contents are encrypted under recipient identity-records that are *not* the live substrate's keys (a separate backup-recipient identity). This protects the backup from compromise of the live substrate's keys; an attacker who steals the live substrate's keys cannot decrypt the backups.
- **Tested.** Per [conformance](conformance.md), a backup is verified by replaying it (in an isolation environment) and checking the reconstructed state matches the substrate's recorded canonical hashes. Per [backup-as-cohomology-preservation](../theorems/backup-as-cohomology-preservation.md), the test is structurally a cohomology comparison: the restored state's $H^0$ and $H^1$ must match the originating substrate's. An untested backup is a backup-on-faith.
- **Versioned.** Backup discipline retains multiple historical backups, not just the latest. The backup retention policy (daily for 7 days, weekly for 4 weeks, monthly for 1 year, etc.) is itself substrate content, queryable and adjustable. Per [scope-cover-via-grothendieck-site](../theorems/scope-cover-via-grothendieck-site.md), historical backups form a *cover* of the substrate's history-as-site; restoring at any past ordinal is reading a section over that cover.

## Backup-recipient identity is critical

The backup-recipient identity-record is critical: per [encrypted-region-replay-equivalence](../theorems/encrypted-region-replay-equivalence.md), backups can be replayed only by substrates whose identity-records include the backup-recipient. The substrate's discipline is to:

- Generate the backup-recipient key-pair at substrate-bootstrap (per [bootstrap](bootstrap.md)).
- Hold the backup-recipient *private key* off-substrate, in a secure separate location (a hardware token, a physical envelope, a separate cloud-managed key store).
- Encrypt every backup under the backup-recipient public key.
- Verify backup decryptability periodically without involving live substrate keys.

## Position

The backup discipline composes with [container-image](container-image.md) and [deployment-target](deployment-target.md): a substrate's complete backup is the union of its content backups, its closure-rule-system version-history, and its container-image (the deployment artifact's reproducible build). Recovery on a fresh deployment-target consists of: deploying the container-image, restoring the backup contents, replaying any post-backup event-log entries.

Per [backup-as-cohomology-preservation](../theorems/backup-as-cohomology-preservation.md), the backup's structural correctness is exactly the cohomology preservation across the restore round-trip. A substrate's backup discipline that respects this property has the structural guarantee that a restored substrate is *the same* (in the predication-categories' sense) as the originating substrate at the backup ordinal — not approximately the same, not lossy, but cohomologically equivalent.
