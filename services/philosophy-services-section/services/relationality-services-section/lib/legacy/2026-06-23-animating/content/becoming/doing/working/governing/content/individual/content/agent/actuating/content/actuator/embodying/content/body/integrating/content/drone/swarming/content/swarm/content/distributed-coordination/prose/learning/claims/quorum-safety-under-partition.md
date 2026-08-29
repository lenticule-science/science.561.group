---
type: theorem
class: engineering-claim
status: proved
depends-on: [quorum-consensus, quorum-record, propose-quorum-value, federation-convergence, replica-cover, replica-mayer-vietoris, cohomological-calm, bilattice-network-sheaf-consensus]
see-also: [leader-election]
---

# Quorum consensus is safe under network partition

**Claim.** For a [quorum-consensus](teaching/explanations/quorum-consensus.md) protocol with threshold $N/2+1$ over $N$ participants: at most one value can be agreed in any consensus round, even under network partition.

Per [propose-quorum-value](../morphisms/propose-quorum-value.md), if the network is partitioned, at most one partition contains $\geq N/2+1$ participants. Therefore at most one value can achieve quorum; the other partition(s) cannot reach consensus and must wait until partition heals.

## Why this holds

The argument follows from the pigeonhole principle.

**Part 1: Two disjoint quorums are impossible with $N/2+1$ threshold.** Suppose two values $v_1$ and $v_2$ both achieve quorum in the same round. Each requires $N/2+1$ participants. But two sets of size $N/2+1$ in a population of $N$ must share at least $2 \cdot (N/2+1) - N = 2$ participants. By the protocol's no-double-vote rule (per [signature-binds-witness-to-identity](../../../theorems/signature-binds-witness-to-identity.md), each signed vote is non-repudiable), no participant can vote for two conflicting values in the same round. Contradiction.

**Part 2: Network partition restricts quorum to at most one side.** A partition splits participants into disjoint subsets. By the pigeonhole principle, at most one subset has $\geq N/2+1$ participants. Only that subset can achieve quorum.

**Part 3: Minority partition is safe to wait.** A subset with $< N/2+1$ participants cannot reach quorum and cannot agree on any value. The substrate's discipline is to not commit until quorum is achieved; minority partitions remain in `pending` state until partition heals.

**Part 4: Cohomological framing.** A network partition splits the participant set into a [replica cover](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/replica-cover.md) $\{P_1, P_2\}$ of disjoint pairwise-Stone clopens. Per [cohomological CALM](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/cohomological-calm.md), the substrate's settling-associated sheaf is coordination-free iff every Mayer–Vietoris connecting homomorphism vanishes. Under partition, $P_1 \cap P_2 = \emptyset$, so the connecting homomorphism is trivially zero on the empty intersection — but the gluing diagram is then degenerate: there is no "agreement on overlap" to constrain global decisions. The substrate's discipline of *requiring* a quorum threshold is what re-supplies the agreement constraint: only one $P_i$ can carry a section that re-glues with future post-heal sections to the federated whole. The minority partition's `pending` state is the engineering name for "no candidate global section is available from this side." Per [bilattice network-sheaf consensus](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md), once partition heals, the merge $\vee_k$ on the rejoined network sheaf is the unique consensus value, and per [federation-convergence](../../../theorems/federation-convergence.md) the substrates converge.

## Engineering consequence

- **Safety under partition.** No two values can be agreed simultaneously, ruling out split-brain. Per [federation-convergence](../../../theorems/federation-convergence.md) at the meta-level, once partition heals, all participants converge on the agreed value.
- **Liveness sacrificed under partition.** A partition with no majority side cannot make progress; per the FLP impossibility result, this is inherent to consensus protocols.
- **Trade-off explicit.** The substrate's choice of quorum threshold trades safety vs. liveness: $N/2+1$ tolerates $\lfloor (N-1)/2 \rfloor$ failures. Higher thresholds (Byzantine $2N/3+1$) tolerate fewer.

## What the theorem rules out

- A protocol that admits two values agreed in the same round breaks safety; per [signature-binds-witness-to-identity](../../../theorems/signature-binds-witness-to-identity.md), participant signatures prevent double-voting.
- A "majority of online participants" rule (e.g., quorum = N/2+1 of *currently-reachable* participants) breaks safety under partition: each partition could elect its own majority. Quorum must be relative to the *full* participant set.

## What the theorem requires

- The participant set $N$ is fixed (or membership changes go through their own consensus round).
- Per [signature-binds-witness-to-identity](../../../theorems/signature-binds-witness-to-identity.md), votes are non-repudiable.
- The protocol's no-double-vote rule is enforced at the substrate level.
