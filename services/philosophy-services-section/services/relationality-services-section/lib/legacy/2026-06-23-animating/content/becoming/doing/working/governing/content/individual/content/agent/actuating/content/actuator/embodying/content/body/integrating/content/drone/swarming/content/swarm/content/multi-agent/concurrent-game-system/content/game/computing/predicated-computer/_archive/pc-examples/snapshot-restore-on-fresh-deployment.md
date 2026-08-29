---
type: example
class: backup-walkthrough
depends-on: [backup-restore-fidelity, snapshot-replay-fidelity, encrypted-region-replay-equivalence, deployment-determinism]
instantiates: [backup-discipline, restore-from-backup, deploy-to-target]
---

# Snapshot restore on fresh deployment

A concrete walkthrough: substrate $S$ on deployment-target $T_{\mathrm{old}}$ is destroyed (cloud region outage); a fresh deployment $S'$ on $T_{\mathrm{new}}$ recovers byte-identically from a recent backup.

## Setup

- $S$ was running on $T_{\mathrm{old}}$ (AWS us-east-1).
- Daily backups via [take-backup](../morphisms/take-backup.md), encrypted under the backup-recipient identity-record `backup-key-2026`. The private component of `backup-key-2026` is held off-substrate at a separate cloud KMS in GCP.
- Latest backup: `b-2026-04-30-daily`, captured at substrate ordinal $\tau=15234$.
- $T_{\mathrm{old}}$ destroyed at substrate ordinal $\tau=15280$ (event log between $\tau=15234$ and $\tau=15280$ also lost).

## Recovery trace

**Step 1: Provision $T_{\mathrm{new}}$.** Per [deploy-to-target](../morphisms/deploy-to-target.md), instantiate the substrate's container-image on a fresh cloud-target (AWS us-west-2, since us-east-1 is offline). The new deployment-record `s-prod-recovery` has its own instance-identity `s-prod-recovery-2026`.

**Step 2: Retrieve backup.** Per [restore-from-backup](../morphisms/restore-from-backup.md), retrieve the encrypted bytes of `b-2026-04-30-daily` from the off-site backup storage. Verify the canonical-form hash matches the backup-record's recorded hash.

**Step 3: Decrypt.** Per [decrypt-region](../morphisms/decrypt-region.md), use the GCP-KMS-held `backup-key-2026` private key to decrypt the snapshot bytes. The decrypted plaintext's canonical-form hash matches the backup's recorded snapshot hash.

**Step 4: Replay snapshot.** Per [replay](../morphisms/replay.md), start from the snapshot per [snapshot-replay-fidelity](../theorems/snapshot-replay-fidelity.md). The reconstructed predication valuation is cellwise-equal to $S$'s state at $\tau=15234$.

**Step 5: Federate to recover post-backup events.** $S'$ joins the federation graph. Other federated peer substrates (e.g., $S_2$) had been receiving $S$'s witness exchanges through $\tau=15280$. Per [federation-convergence](../theorems/federation-convergence.md), $S_2$'s substrate state contains $S$'s witnesses up to $\tau=15280$. $S'$ pulls these from $S_2$ via federation.

**Step 6: Re-settle.** Per [settle](../morphisms/settle.md), $S'$ applies the closure operator. The post-replay-and-federation state at $S'$ matches $S$'s state at $\tau=15280$ — modulo the brief gap between $\tau=15280$ (when $S$ died) and the ordinal at which $S_2$ stopped receiving $S$'s witnesses.

## Verification

Per [backup-restore-fidelity](../theorems/backup-restore-fidelity.md), $S'$'s reconstructed state is byte-identical to $S$'s state at $\tau=15234$. Per [encrypted-region-replay-equivalence](../theorems/encrypted-region-replay-equivalence.md), the encryption layer didn't affect determinism. Per [deployment-determinism](../theorems/deployment-determinism.md), the cross-cloud move (us-east-1 → us-west-2) didn't affect substrate behavior — the same image on a compatible target produces the same substrate.

After Step 6, $S'$ continues operating from $\tau=15280$ (or wherever the federation bring-up reached) as if $S$ had never died. Subsequent federated peers see $S'$'s identity-record `s-prod-recovery-2026` as the new primary; they can verify $S'$'s witnesses and continue normal federation.

## What's notable

- **The backup-recipient private key was off-substrate.** Per [backup-discipline](teaching/explanations/backup-discipline.md), the GCP-KMS-held `backup-key-2026` private key was separate from $S$'s identity-key. Compromise of $S$ wouldn't have given an attacker access to backups.
- **Cross-cloud recovery worked.** Per [deployment-determinism](../theorems/deployment-determinism.md), substrate behavior is target-agnostic. The substrate didn't care that it moved from AWS to a different AWS region.
- **Federation bridged the post-backup gap.** No event log between $\tau=15234$ and $\tau=15280$ was directly recoverable on $S$, but the federation peers had received $S$'s witnesses; restoration combined backup + federation pull-up to reconstruct the full state.
- **Per [hash-injectivity-under-canonical-form](../theorems/hash-injectivity-under-canonical-form.md), the recovered state's hash is verifiable.** $S'$'s canonical-form hash at $\tau=15234$ equals $S$'s canonical-form hash at $\tau=15234$; auditors can confirm the recovery is byte-identical.
