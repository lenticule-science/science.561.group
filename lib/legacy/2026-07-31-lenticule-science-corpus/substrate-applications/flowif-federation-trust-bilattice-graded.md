---
type: theorem
class: engineering-claim
status: proved
depends-on: [federation-graph, trust-boundary, bilattice-accessibility-relation, predication-fiber-algebra, four-bilattice, modal-necessity-operator]
see-also: [trust-boundary-modal-validity, governance-decision-modal-decidability, federation-convergence]
---

# Federation trust is bilattice-graded, not Boolean

**Claim.** The substrate's [federation-graph](../theories/agential-orchestration-platform/concepts/federation-graph.md) records peer-to-peer trust as a [bilattice accessibility relation](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bilattice-accessibility-relation.md) $R: W \times W \to \mathbf{L}^\bowtie$, valued in the [predication fiber algebra](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) over $\mathbf{L}^\bowtie$ (or, in the simplest case, over the [four-bilattice](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/four-bilattice.md) $\mathbf{FOUR}$). The four bilattice values express *real* federation states:

- $\mathbf{t}$ — *peer admitted*: handshake-verified, identity-record present, no revocation
- $\mathbf{f}$ — *peer rejected*: explicitly revoked or deny-listed by an authoritative governance decision
- $\bot$ — *peer unknown*: never seen; no admission decision recorded
- $\top$ — *peer contested*: two operators recorded conflicting admission decisions; governance has not yet reconciled

A Boolean federation cannot represent $\bot$ or $\top$ as distinct from $\mathbf{f}$ or $\mathbf{t}$ respectively, and therefore cannot accurately reflect federation states that arise during peer onboarding, dispute, or split-brain governance.

## Why this holds

Per [governance-as-modal-restriction](../theories/agential-orchestration-platform/theorems/governance-as-modal-restriction.md), authority is bilattice-valued; federation trust is the restriction of governance to peer-to-peer accessibility. The argument:

**Part 1: Federation states are not two-valued in practice.** Consider a peer $P$ on which two governing operators have made contradictory decisions: $O_1$ admitted $P$, $O_2$ revoked $P$, and the governance graph has not yet reconciled. The accessibility cell $R(\text{this}, P)$ is structurally $\top$ — *told both*. A Boolean federation must collapse this to $\mathbf{t}$ (favoring admission, exposing the substrate to a revoked peer) or $\mathbf{f}$ (favoring revocation, denying a still-admitted peer); both are wrong relative to the substrate's actual recorded state.

**Part 2: $\bot$ is not the same as $\mathbf{f}$.** A peer never seen is not the same as a peer denied. Per [closed-world-assumption-rejected](../theorems/closed-world-assumption-rejected.md) (if existing) or per the substrate's general $\bot$-discipline, treating "no record" as "denied" loses the substrate's distinction between *active* and *absent* governance.

**Part 3: The bilattice operators give the right composite trust.** When two paths through the federation graph yield trust values $v_1, v_2 \in \mathbf{L}^\bowtie$, the substrate's composite trust on the (source, target) pair is the [knowledge-meet](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md) $v_1 \wedge_k v_2$ — the safest information that both paths agree on. This operation is well-defined on the bilattice; it has no Boolean analogue that respects $\bot$ vs $\top$.

**Part 4: Modal restriction along $R$ is well-defined exactly because $R$ is bilattice-valued.** Per [modal-necessity-operator](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/modal-necessity-operator.md), $\Box_R$ requires $R$ valued in $\mathbf{L}^\bowtie$ for the strong-implication composition to behave correctly. A Boolean $R$ would require collapsing the modal calculus and would lose the [modal non-normality](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/modal-non-normality.md) feature that distinguishes substrate trust from classical Kripke trust.

## Engineering consequence

- **Onboarding has structural representation.** A peer in mid-handshake has accessibility transitioning $\bot \to \mathbf{t}$; the substrate distinguishes "handshake started, not complete" from "fully admitted."
- **Disputes do not crash federation.** A $\top$ accessibility cell is a contradiction the substrate carries forward. Per [repair](../concepts/repair.md), governance can resolve the dispute; meanwhile, $\Box_R$ on $\top$-cells produces $\top$-witnessed restrictions that callers can audit.
- **Composite trust along multi-hop federation paths.** Per [federation-convergence](federation-convergence.md), paths through the federation graph compose; the composite uses bilattice operations, not Boolean ones.
- **CRDT-style reconciliation.** Per [crdt-convergence](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/crdt-convergence.md), the bilattice's join operations make federation trust state CRDT-compatible — peers can independently update their views and converge under the closure-merge.

## What the theorem rules out

- **Boolean federation graphs.** A federation that admits only $\mathbf{t}$ / $\mathbf{f}$ admission states cannot represent the real federation lifecycle ($\bot$ for unknown, $\top$ for contested). The substrate refuses to interpret a Boolean graph as a faithful federation.
- **Closed-world default for unknown peers.** Treating a $\bot$ accessibility as $\mathbf{f}$ (deny by default) is a *policy choice* the substrate may surface, but it is not a structural property — the substrate's underlying state is $\bot$, and the policy collapses it at decision-time, not at storage-time.
- **Trust state without governance reconciliation.** A federation that lets $\top$-cells persist indefinitely without escalation to governance is not implementing the substrate's repair discipline. Per [repair](../concepts/repair.md), $\top$-cells are signals that demand governance attention.

## What the theorem requires

- The federation graph is recorded as a [bilattice accessibility relation](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bilattice-accessibility-relation.md), not a Boolean adjacency.
- Each accessibility cell carries an [identity-key](../objects/identity-key.md)-bound provenance witness, so admission decisions are auditable.
- Federation operators agree on the bilattice structure (typically $\mathbf{FOUR}$ or a residuated-lattice extension); peers disagreeing on the value-domain cannot reconcile.

## Position

Together with [trust-boundary-modal-validity](trust-boundary-modal-validity.md) and [governance-decision-modal-decidability](governance-decision-modal-decidability.md), this theorem grounds the substrate's federation in the predication-categories' modal apparatus. The federation is not a Boolean adjacency graph augmented with policies; it is a bilattice-valued Kripke frame on which the substrate runs $\Box_R$ to compute admission, authorization, and authority.
