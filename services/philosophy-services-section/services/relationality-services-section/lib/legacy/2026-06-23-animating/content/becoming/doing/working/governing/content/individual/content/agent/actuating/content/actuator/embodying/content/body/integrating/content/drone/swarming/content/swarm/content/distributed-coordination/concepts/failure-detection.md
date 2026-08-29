---
type: concept
class: distributed-discipline
depends-on: [cluster-membership, witness, latency-budget]
realizes: [four-bilattice, modal-possibility-operator, modal-necessity-operator, bilattice-accessibility-relation, inconsistency-sheaf]
see-also: [leader-election, failure-detection-as-bilattice-modal-suspicion]
---

# Failure detection

The *substrate-recorded discipline for determining whether a cluster member is alive or has failed*. Failure detection is essential for [leader-election](leader-election.md) (failed leaders trigger re-election), [distributed-lock](distributed-lock.md) (failed holders' leases expire), and [cluster-membership](cluster-membership.md) (failed members are removed).

The fundamental challenge: in an asynchronous network, you cannot distinguish "slow" from "failed" with certainty. Failure detection is therefore *suspicion-based*: a member is *suspected* of failure based on observed behavior, with bounded probability of false positives.

Per [failure-detection-as-bilattice-modal-suspicion](../theorems/failure-detection-as-bilattice-modal-suspicion.md), this discipline is the substrate-content realization of one fixed math-parent construction: the [modal-possibility operator](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/modal-possibility-operator.md) $\Diamond_R$ acting on the negative-evidence component of the cluster's heartbeat-indexed [predication-fiber-algebra](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md), with $R$ given by recent-heartbeat-arrival between observation-window worlds. The four substrate-recorded suspicion levels below are exactly the four values of [$\mathbf{FOUR}$](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/four-bilattice.md), the four Chandra–Toueg detector classes are bilattice-homomorphism projections of the cluster's [inconsistency sheaf](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/inconsistency-sheaf.md), phi-accrual is the [Lawvere-quantale-graded](../../../theorems/cost-composition-via-lawvere-quantale.md) reading of the same $\Diamond_R$, and split-brain failure detection is detected by the substrate's general $\mathcal F_U^{(\top)}$-cohomology audit without a special code path.

Common failure detection patterns:

- **Heartbeat-based.** Each member periodically sends a "still alive" message. Members who don't hear from a peer for too long suspect failure.
- **Phi-accrual.** Compute a continuously-updated suspicion score based on heartbeat arrival timing; act when the score crosses a threshold.
- **Gossip-based.** Members exchange information about who they've heard from; suspicions propagate through the gossip layer.
- **External monitor.** A separate monitoring service observes members and reports failures.
- **Timeout-and-retry.** Specific operations have timeouts (per [latency-budget](../../teaching/explanations/latency-budget.md)); persistent timeouts to a member raise suspicion.

A failure-detection record has:

- **Member being observed** — reference to the cluster member.
- **Heartbeat history** — recent heartbeat timestamps (informational; per [clock](../../teaching/explanations/clock.md), wall-clock).
- **Current suspicion level** — `confirmed-alive`, `recently-heard-from`, `suspected`, `confirmed-failed`.
- **Suspicion threshold** — substrate-policy threshold for transitioning to `suspected`.
- **Detector quality metrics** — false-positive rate, detection latency.

Per [witness](../../../objects/witness.md), suspicion transitions and confirmed-failure events produce witnesses. Per [federation-convergence](../../../theorems/federation-convergence.md), failure-detection records federate as substrate content.

The substrate's failure-detection discipline interacts with [cluster-membership](cluster-membership.md): confirmed failures may trigger membership-change protocols to remove the failed member; suspicion of the leader triggers [leader-election](leader-election.md) re-election.

Failure detection is fundamentally about trade-offs:

- **Quick detection** (low timeout) → higher false-positive rate.
- **Slow detection** (high timeout) → recovery takes longer when failures actually occur.

The substrate's policy declares the trade-off based on the deployment's tolerance.
