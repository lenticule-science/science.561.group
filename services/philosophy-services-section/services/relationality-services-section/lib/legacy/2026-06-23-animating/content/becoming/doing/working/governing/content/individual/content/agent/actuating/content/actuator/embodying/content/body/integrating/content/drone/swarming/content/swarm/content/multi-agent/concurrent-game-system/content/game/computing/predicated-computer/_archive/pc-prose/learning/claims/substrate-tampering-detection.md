---
type: theorem
class: engineering-claim
status: proved
depends-on: [witness, hash-injectivity-under-canonical-form, signature-binds-witness-to-identity, settlement-determinism, event-log, inconsistency-sheaf, four-bilattice]
see-also: [threat-model, conformance-implies-substrate-properties, query-inconsistency-cohomology, inconsistency-sheaf-record]
---

# Substrate tampering is detectable through the audit chain

**Claim.** Tampering with substrate content — modifying a witness, forging a signed message, altering an event-log entry, replaying a snapshot at a different ordinal — is *detectable* by an auditor with access to the substrate's [event log](../objects/event-log.md), the [closure-rule system](../objects/closure-rule-system.md) versions, and the relevant [identity records](../objects/identity-record.md). The substrate's structural commitments (canonical-form hashing, signature-binding, deterministic settlement) compose to make tampering produce verifiable inconsistencies that the audit can surface.

The substrate cannot *prevent* tampering at the storage layer (an attacker with write-access to substrate storage can alter bytes), but every tamper produces structural inconsistencies the audit can detect.

## Why this holds

The argument combines three substrate disciplines.

**Part 1: Witness hash chains are tamper-evident.** Per [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md), each witness's canonical-form hash is determined by its content. Modifying a witness's bytes changes its hash; subsequent witnesses cite the prior hash, so the change cascades — every witness from the modified one forward has a different hash than the cited prior-hash chain expects. The audit detects the chain-discontinuity.

**Part 2: Signatures are unforgeable.** Per [signature-binds-witness-to-identity](signature-binds-witness-to-identity.md), forging a signature that verifies against a known identity-record is computationally infeasible without the corresponding private key. An attacker who modifies a signed witness's content and re-signs with a different key produces a signature that fails verification against the original signer's identity-record; the audit detects the mismatch.

**Part 3: Replay is byte-identical.** Per [settlement-determinism](settlement-determinism.md), replaying the event log under the cited closure-rule system reproduces the substrate's state byte-identically. An attacker who alters substrate storage to claim "the substrate is now in state $X$" can be detected by replaying from a known-good starting point and comparing the recomputed state's hash against the claimed state's hash.

Combining: chain-of-witnesses (Part 1), signature-binding (Part 2), and replay-equivalence (Part 3) jointly mean that tampering with any substrate-recorded artifact produces detectable structural failures across the substrate's audit surface.

**Part 4: Tampering surfaces as inconsistency-sheaf content.** The structural failures of Parts 1–3 are not merely *detectable* in isolation — they have a single mathematical home. Each tamper produces, on replay, at least one cell at which the substrate's witness-derived valuation and the recomputed valuation disagree. Disagreement at a cell raises that cell's [four-bilattice](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/four-bilattice.md) value to $\top$ — the substrate is told both that the cell holds (by the tampered witness) and that it does not (by the recomputed replay). The locus of $\top$-cells is exactly the support of the [inconsistency sheaf](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/inconsistency-sheaf.md) $\mathcal F_U^{(\top)}$ on the audit interval $U$. The substrate's [query-inconsistency-cohomology](../morphisms/query-inconsistency-cohomology.md) morphism is the engineering operator that surfaces this support; an audit run that emits a non-zero $\mathcal F_U^{(\top)}$ is exactly an audit run that has detected tampering.

This gives the auditor a structural ranking of tamper events. Local corruption (a single tampered byte) produces an isolated $\top$-cell — the inconsistency sheaf's support is a singleton, and $H^0(\mathcal F_U^{(\top)}) = \mathbb Z$. Coordinated forgery (a tampering campaign that re-signs witnesses and edits multiple cells in coherent ways to fake a different past) produces a non-trivial cohomology class in $H^1(\mathcal F_U^{(\top)})$ — the campaign's signature is the obstruction to gluing local explanations into a globally consistent alternative history. The auditor's response can scale to the cohomology rank rather than the raw cell count.

## Engineering consequence

The substrate's audit chain is *verifiable*. Several engineering uses follow:

- **Insider-detection.** A substrate operator with storage write-access can attempt to alter witnesses, but the alterations are detectable on audit. The substrate's discipline is to run periodic audits (per [conformance](teaching/explanations/conformance.md) test suites) that would surface such alterations.
- **Federation peer authentication.** A federation peer that sends tampered messages is detected at [receive-message](../morphisms/receive-message.md); per [signature-binds-witness-to-identity](signature-binds-witness-to-identity.md), the bad signature surfaces immediately.
- **Backup integrity.** Per [backup-restore-fidelity](backup-restore-fidelity.md), restored substrate state is byte-identical to backed-up state. A tampered backup produces a restored substrate whose hash differs from the substrate's recorded canonical hash at the backup ordinal.
- **Audit-chain forking detection.** When two parties claim authoritative copies of the substrate's audit chain that disagree, the disagreement point indicates either a federation-divergence (resolvable per federation-convergence) or tampering (detectable per the chain's hash structure).

## What the theorem does NOT claim

- The theorem does *not* claim the substrate is *unattackable*. An attacker with sufficient access (root on the deployment host, control of the off-site backup storage, theft of identity-key private components) can perform attacks that detection only surfaces *after the fact*.
- The theorem does *not* claim tampering can be prevented at the storage layer. Substrate storage is bytes-on-disk; an attacker with disk write-access can corrupt bytes. The theorem says corruption is *detectable*.
- The theorem does *not* extend to side-channel attacks (timing analysis, power analysis on the host). Side-channels operate at a layer the substrate's hash-and-signature discipline doesn't cover.

## What the theorem requires

- The substrate's [hash-discipline](teaching/explanations/hash-discipline.md) is collision-resistant.
- The substrate's [signature](teaching/explanations/signature.md) scheme is existentially unforgeable.
- Identity-record private keys are held off-substrate at host-environment-controlled custody (per [identity-key](teaching/explanations/identity-key.md)).
- The audit is run periodically and audit results are themselves substrate content.
- A trusted starting-point is available for replay verification (a known-good snapshot or a known-good event-log prefix).
