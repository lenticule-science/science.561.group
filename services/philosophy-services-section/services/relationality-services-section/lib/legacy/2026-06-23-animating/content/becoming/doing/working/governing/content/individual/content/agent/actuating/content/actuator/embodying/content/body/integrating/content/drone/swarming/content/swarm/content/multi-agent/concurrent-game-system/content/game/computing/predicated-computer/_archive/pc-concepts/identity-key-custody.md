---
type: concept
class: substrate-spec
depends-on: [identity-key, signature, signature-binds-witness-to-identity, encryption, encryption-as-visibility-restriction-via-invisible-automorphism, hash-discipline]
see-also: [bootstrap, deployment-target, attack-surface]
---

# Identity-key custody

The substrate's *spec for where identity keys live, how they're generated, when they rotate, and how they recover from compromise*. In the substrate's hyperdoctrine setting, identity-key custody is not just operational hygiene — it is *the substrate-side discipline that maintains the structural enforceability of the [bilattice accessibility relation](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bilattice-accessibility-relation.md)*. Per [signature-binds-witness-to-identity](../theorems/signature-binds-witness-to-identity.md), a signature binds substrate content to an identity-key holder; the binding is structurally meaningful only when the private key is genuinely held by the named identity. Custody discipline is what makes that "genuinely held" assumption hold.

## Why this concept exists

`identity-key.md` describes what an identity-key is — an Ed25519 keypair whose public part is substrate content. `signature.md` and `signature-binds-witness-to-identity.md` describe what signing accomplishes. But neither specifies *where the private key lives, how it's generated, what mechanisms host it in production, what happens at compromise.* Without custody discipline, the substrate's signature attribution is structurally meaningless — anyone with filesystem access could forge.

This concept fills the gap with a substrate-level spec that constrains custody mechanisms without picking one (custody choice is a deployment parameter; the *discipline* is substrate-level).

## Custody requirements

The substrate requires identity-key custody to satisfy four properties:

- **Off-substrate.** The private key is *not* in the substrate's [predication-graph store](../objects/predication-graph-store.md), [event log](../objects/event-log.md), or any region the substrate routinely reads. Per [signature-binds-witness-to-identity](../theorems/signature-binds-witness-to-identity.md), the private key's privacy is what makes signatures non-forgeable; storing it as substrate content would defeat the structural attribution.
- **Single-holder.** Each identity-record names exactly one holder. Two entities sharing a private key collapse the substrate's per-entity attribution. Per [identity-key](identity-key.md), the substrate's discipline forbids key-sharing — implementations must use distinct keys per identity.
- **Recoverable.** A custody mechanism that loses the private key without recovery permanently strands all content signed by that identity. The discipline requires: either backup-recovery (encrypted backup of the private key, recoverable by a separate key), or successor-recovery (a recorded mechanism for transitioning to a new key while preserving past attributions).
- **Revocation-aware.** When custody is compromised (key leaked, host stolen, custody-mechanism subverted), the substrate must be able to *revoke* the identity-record and prevent further signatures from verifying as that identity. Per [federation-trust-bilattice-graded](../theorems/federation-trust-bilattice-graded.md), revocation moves the peer's accessibility from $\mathbf{t}$ to $\mathbf{f}$ — but only if the substrate's revocation discipline propagates promptly.

## Custody mechanisms

The substrate doesn't commit to a particular custody mechanism. Common choices, in approximate order of strength:

- **In-process keystore.** Private key in process memory, never persisted. Strong against disk leak; weak against process inspection (debugger, memory dump). Acceptable for ephemeral substrates (test environments, short-lived workers).
- **Encrypted file on disk.** Private key encrypted under a passphrase or wrapping key. Standard for development substrates (`.substrate/identity.key.enc`). Compromise of disk + passphrase compromises the key.
- **OS keychain / secret-service.** macOS Keychain, Linux GNOME Keyring / KWallet, Windows Credential Manager. Stronger than encrypted file (typically tied to user login session); compromise still possible at user-account level.
- **Cloud KMS.** AWS KMS, GCP Cloud KMS, Azure Key Vault. Private key never leaves the KMS; substrate calls the KMS to sign. Strong against host compromise; introduces a cloud-vendor trust dependency.
- **Hardware security module (HSM).** Dedicated hardware device, key never leaves device. Strongest against extraction; physical-access vulnerabilities possible.
- **Multi-party computation (MPC).** Key shares distributed across multiple parties; signing requires threshold cooperation. Strongest against single-party compromise.

A substrate's choice depends on its threat model (per [attack-surface](attack-surface.md)) and operational constraints. The substrate-level commitment is to *some* mechanism satisfying the four custody requirements above.

## Generation discipline

At [bootstrap](bootstrap.md), a fresh substrate generates its identity keypair:

1. Generate Ed25519 keypair via OS-cryptographic-RNG (e.g., `getrandom(2)` on Linux, `BCryptGenRandom` on Windows).
2. Store the private key in the chosen custody mechanism.
3. Record the public key as substrate content (in the substrate's [identity-record](../objects/identity-record.md)).
4. Sign a self-bootstrap attestation cell to verify the keypair is functional.
5. Per [hash-injectivity-under-canonical-form](../theorems/hash-injectivity-under-canonical-form.md), the public key's canonical hash is the substrate's stable identifier.

Generation is one-time per identity. Per [single-holder](#custody-requirements), a substrate that re-runs generation overwrites its identity — typically a coordination disaster. Implementations should refuse re-generation when an existing identity-record is present, requiring explicit override.

## Rotation discipline

Long-running substrates may rotate their identity keys for security hygiene. Rotation:

1. Generate a new keypair.
2. Record the new public key as a *successor* of the old (a substrate predication: `succeeds-key`).
3. Sign the rotation transition with both keys (cross-signing) to prove continuity.
4. Migrate custody of the new private key into the chosen mechanism.
5. Begin signing new witnesses with the new key.
6. Eventually retire the old key (depending on policy, after a grace period during which both keys are accepted).

Per [signature-binds-witness-to-identity](../theorems/signature-binds-witness-to-identity.md), witnesses signed by the old key remain attributable to the same identity (the predecessor relation makes the chain explicit). Per [federation-trust-bilattice-graded](../theorems/federation-trust-bilattice-graded.md), federation peers learn of the new key via the rotation transition's predication.

## Compromise discipline

When custody is compromised:

1. *Detection.* Per [audit-content-via-inconsistency-sheaf-cohomology](../theorems/audit-content-via-inconsistency-sheaf-cohomology.md), unexplained signatures appearing in the audit chain are a $\top$-cell signal.
2. *Revocation.* Admit a revocation predication on the identity-record. The substrate's discipline is to mark the identity-record as compromised at a specific ordinal.
3. *Federation propagation.* Per [federation-trust-bilattice-graded](../theorems/federation-trust-bilattice-graded.md), the revocation propagates to federation peers; their accessibility cells for this identity move to $\mathbf{f}$.
4. *Forensic analysis.* Per [witness-chain-as-proof-object](../theorems/witness-chain-as-proof-object.md), the audit chain identifies which witnesses were signed before vs after the compromise. Per the substrate's revocation policy, post-compromise witnesses are admissibility-suspect.
5. *Successor key.* Generate a new identity-record with a fresh key (the rotation discipline above, with the rotation transition explicitly noting the compromise).

## What the discipline rules out

- **Long-lived test keys reused in production.** A test key's custody is typically weak (in-repo, in-CI-secrets); reusing it in production inherits the weak custody. The substrate's discipline is per-environment keys.
- **Custody mechanisms whose access path is in the substrate.** A custody mechanism that requires substrate operations to retrieve the key (e.g., reading an encrypted file via a substrate-recorded passphrase) is partially substrate-resident; per [signature-binds-witness-to-identity](../theorems/signature-binds-witness-to-identity.md), this weakens the attribution. Custody must be substrate-external.
- **Silent key rotation.** Rotating without recording the rotation transition breaks the substrate's audit continuity. The substrate's discipline is to record rotations as explicit predications.
- **Recovery via shared knowledge.** A "recovery" mechanism that reconstructs the private key from a passphrase known to multiple people is shared-holder by another name; per the single-holder requirement, the substrate's discipline forbids this.

## Position

Identity-key custody is the substrate's *external-trust-anchor discipline*. Per [signature-binds-witness-to-identity](../theorems/signature-binds-witness-to-identity.md), the substrate's signature attribution is structurally meaningful when custody is sound; per [federation-trust-bilattice-graded](../theorems/federation-trust-bilattice-graded.md), the federation's bilattice-graded trust depends on each peer's custody discipline. Custody is the substrate's commitment to *external infrastructure* — the substrate cannot protect its own identity beyond what the custody mechanism allows.

The discipline composes with [bootstrap](bootstrap.md) (initial keypair generation), with [encryption](encryption.md) (encrypted-at-rest custody mechanisms), with [attack-surface](attack-surface.md) (custody endpoints are a substrate attack surface), and with [federation-trust-bilattice-graded](../theorems/federation-trust-bilattice-graded.md) (custody compromise propagates as trust-grade reduction).
