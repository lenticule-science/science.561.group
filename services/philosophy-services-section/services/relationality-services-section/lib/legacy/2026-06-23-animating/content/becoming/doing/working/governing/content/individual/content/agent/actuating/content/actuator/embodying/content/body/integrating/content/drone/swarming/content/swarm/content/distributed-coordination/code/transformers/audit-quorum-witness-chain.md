---
type: morphism
class: coordination-operation
realizes: [quorum-consensus]
depends-on: [quorum-consensus, quorum-record, vote-as-section, cluster-as-replica-cover, signature, witness, husainov-acyclicity]
see-also: [propose-and-vote, audit-via-cech-cocycle-evaluation, consensus-achieves-bigraded-common-knowledge]
---

# Audit quorum witness chain

The substrate operation that *audits a recorded [quorum-record](../objects/quorum-record.md)* by re-evaluating its votes as a Čech cocycle on the cluster's [replica cover](cluster-as-replica-cover.md) and confirming or refuting that the recorded decision is the cocycle's lifted global section.

## Signature

`audit-quorum-witness-chain(quorum-record-id) → audit-witness`

Inputs:

- **`quorum-record-id`** — reference to a closed [quorum-record](../objects/quorum-record.md) whose decision is being audited.

Outputs:

- **`audit-witness`** — a substrate-recorded witness of the form `(quorum-record-id, audit-status, cocycle-evidence, signature)` where:
  - `audit-status ∈ {confirmed, refuted, malformed}`.
  - `cocycle-evidence` records the per-overlap cocycle calculation: the list of pairs $(m_i, m_j)$ checked, the section restrictions to $U_i \cap U_j$, and whether the agreement condition held.
  - `signature` is the auditor's signature on the result.

## Procedure

Per [vote-as-section](teaching/explanations/vote-as-section.md), each recorded vote $\sigma_i$ in the quorum-record is a section of the [settling-associated sheaf](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-associated-sheaf.md) over the voting member's clopen $U_i$. Per [cluster-as-replica-cover](teaching/explanations/cluster-as-replica-cover.md), the family $\{U_i\}_i$ is the cluster's replica cover.

The audit constructs the Čech 1-cochain

$$d^0(\sigma)_{ij} \;:=\; \sigma_j|_{U_i \cap U_j} \;-\; \sigma_i|_{U_i \cap U_j}$$

for every pair $(m_i, m_j)$ of members whose clopens overlap (per the cluster-record's recorded overlap data). The audit checks:

- **Cocycle condition.** Every $d^0(\sigma)_{ij} = 0$. If any pair disagrees on overlap, the audit returns `refuted` with the disagreeing pair as evidence.
- **Coboundary representation.** The cocycle $\{\sigma_i\}_i$ is a coboundary of a global section $s \in H^0(U, \mathcal{F}_U)$ — i.e., $s|_{U_i} = \sigma_i$ for every $i$. The recorded `decided-value` in the quorum-record should equal $s$. If it differs, the audit returns `refuted` with the discrepancy as evidence.
- **Signature integrity.** Every $\sigma_i$'s signature verifies against the recorded member's identity-key. If any signature fails, the audit returns `malformed` with the offending vote as evidence.

If all three checks pass, the audit returns `confirmed`.

## Why the procedure is correct

Per [audit-via-cech-cocycle-evaluation](../theorems/audit-via-cech-cocycle-evaluation.md), the procedure's correctness reduces to the [Husainov acyclicity](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/husainov-acyclicity.md) of the cluster's underlying poset: for finite Alexandrov posets satisfying the Dedekind–MacNeille cut condition (which all finite clusters do), Čech cohomology agrees with derived-functor cohomology on the nose, so the finite per-overlap calculation captures *all* obstructions to the global-section construction. There is no possibility of a higher-degree obstruction the per-pair check misses.

## Engineering consequence

- **Replayable consensus verification.** Per [snapshot-replay-fidelity](../../../theorems/snapshot-replay-fidelity.md), a consensus result can be re-audited from the quorum-record alone, without re-running the protocol or reaching the original cluster members. This is the foundation for substrate-level forensic audit of historical decisions.
- **Cheap audit cost.** The audit's cost is $O(N^2)$ pair-checks for an $N$-member cluster, with each check being a single section-restriction comparison. No re-running of the consensus protocol is needed; no quorum is required for the audit itself.
- **Witness chain extends.** The audit-witness is itself a substrate-recorded witness that extends the quorum's witness chain (per [witness-chain-as-proof-object](../../../theorems/witness-chain-as-proof-object.md)), making the audit-result first-class substrate content auditable in turn.

## Limits

- **Byzantine sections still type-check.** A signed-but-adversarial vote is a well-formed section; the audit confirms the cocycle agrees with itself but cannot detect that the cocycle is collectively false. Byzantine detection requires the larger-quorum discipline of [byzantine-cluster-as-finer-replica-cover](../theorems/byzantine-cluster-as-finer-replica-cover.md).
- **Audit assumes pinned membership.** The audit reads the cluster's membership as recorded at the quorum-record's `current-term`. Audits across membership-change boundaries require running multiple per-term audits and stitching them via the cluster-record's term sequence.
