---
type: concept
class: pattern
depends-on: [scope, replication, settling-fiber-groupoid, mutually-locally-derivable, predication-settling]
see-also: [application-sublocale, sync, branched-state-as-settling-fiber-groupoid]
---

# Branched substrate state

The pattern by which a substrate carries *multiple parallel-but-divergent perspectives* on its content, with structural relationships between them recorded as substrate predications. In the substrate's hyperdoctrine setting, branched substrate state is *the substrate-side instance of the [settling fiber groupoid](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-fiber-groupoid.md) $\mathrm{KP}^\simeq(B)$*: each branch is a 0-cell (a [predication settling](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling.md) over a common base $B$), structural relationships between branches are 1-cells (invertible settling-morphisms), and per [settling-automorphism 1-truncation](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/settling-automorphism-1-truncation.md), 2-cells are identities — the substrate's branch space is effectively a 1-groupoid.

Branched substrate state is structurally distinct from [replication](replication.md) (multiple instances of the same intended state — in the groupoid, replicas live within the same connected component, tied by trivial-shift biequivalences) and from [scope](scope.md) hierarchy (nested but non-divergent regions — different objects of $\mathcal{C}$, not different settlings over the same $B$): branches are *intentionally divergent* settlings on the same base where no single branch is privileged as truth, occupying distinct connected components of the settling fiber groupoid in cases of MLD-inequivalent divergence.

## Hyperdoctrinal structure

Per [settling-fiber-groupoid](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-fiber-groupoid.md):

- **0-cells = branches.** Each branch is a predication settling over the substrate's parameter base $B = (\mathbf{L}, \mathcal{C}, E, \lambda)$. Two branches with the same fiber-algebra valuations are the same 0-cell; two with different valuations are distinct 0-cells.
- **1-cells = structural relationships.** A 1-cell from branch $a$ to branch $b$ is an invertible [settling-morphism](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/settling-morphism.md) $a \to b$ — a biequivalence in the 2-category of settlings. The substrate's `forked-from`, `merges`, and `derives-from` relationships are particular shapes of 1-cells.
- **2-cells = identities.** Per [settling-automorphism 1-truncation](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/settling-automorphism-1-truncation.md), the 2-cells of $\mathrm{KP}^\simeq(B)$ are all identities — the substrate's branch space has no non-trivial higher coherence.
- **Connected components = MLD-classes.** Per [mutually-locally-derivable](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/mutually-locally-derivable.md), the components of $\mathrm{KP}^\simeq(B)$ are exactly the MLD-equivalence classes: two branches are in the same component iff they are mutually-locally-derivable. Branches in different components represent *genuinely* divergent substrate states; branches in the same component represent equivalent perspectives differing only in cosmetic structure.

Per [branched-state-as-settling-fiber-groupoid](../theorems/branched-state-as-settling-fiber-groupoid.md), the substrate's branch operations correspond exactly to groupoid operations: fork is creating a new 0-cell with a 1-cell to its source; merge is computing a colimit of 0-cells along their 1-cells; cherry-pick is a partial 1-cell that doesn't extend to a full equivalence.

## Structural commitments

A branched substrate maintains:

- **Branch identity.** Each branch is a substrate entity with a stable identifier — corresponding to a 0-cell of $\mathrm{KP}^\simeq(B)$. The substrate's predications can cite "this claim on branch $a$ vs. that claim on branch $b$" as distinct, simultaneously-recorded 0-cells.
- **Branch geometry.** Predications between branches record their 1-cell structure: `forked-from` (branch $b$ originated from branch $a$ at a known commit — a 1-cell with shift $\delta = 0$ at fork-time), `merges` (branch $c$ brings together $a$ and $b$ — colimit of $a$ and $b$ along channel-1-cells), `derives-from` (branch $d$ is a projection of $b$ matching a particular query — a non-invertible morphism that doesn't yield a 1-cell, so $d$ may live in a different component than $b$).
- **No privileged branch.** No branch is canonical "truth"; the substrate may carry many 0-cells simultaneously, and a query against the substrate must specify the branch context. A query without branch context is either ambiguous (rejected) or evaluates against a default branch declared in the substrate's policy.
- **Branch-local provenance.** Predications belong to the branch where they were declared. The same predication-coordinate (subject, predicate, object) may carry different values on different branches; both are admissible substrate content with their own [provenance](provenance.md). In the groupoid framing, each 0-cell carries its own per-cell valuation — branches at distinct valuations are distinct 0-cells.

## Operations as groupoid moves

A branched substrate supports operations specific to the groupoid structure:

- **Fork.** Create a new 0-cell $b$ from an existing 0-cell $a$ at a chosen commit. The new 0-cell initially has the same valuation as $a$ at that commit; subsequent edits diverge by adding cells, splitting $b$ into a different MLD-class from $a$ (or keeping it MLD-equivalent if the divergence is cosmetic).
- **Merge.** Bring two 0-cells' content together via a colimit of $a$ and $b$ along the channel-1-cells between them. Conflicting predications surface per the substrate's [coherence-glue](../morphisms/coherence-glue.md) discipline; per [bilattice-network-sheaf-consensus](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md), conflicts produce $\top$-witnesses that the merge surfaces for resolution.
- **Cherry-pick.** Apply selected predications from one branch to another without bringing along the rest of the source branch's state — a partial 1-cell that doesn't extend to a full equivalence.
- **Branch-local query.** A [query](theories/agential-orchestration-platform/concepts/query.md) evaluated against a specific 0-cell returns only that 0-cell's predications.
- **Cross-branch comparison.** A specialized query that returns predications differing between two 0-cells — exposes the structural difference between the 0-cells in the groupoid.

## Engineering properties

- **Determinism per branch.** Each 0-cell's content is deterministic given its declared edits and the substrate's operator specifications. Per [determinism](determinism.md), re-derivation of a 0-cell from the same edits produces the same canonical content (same MLD-class, same per-cell valuation).
- **Append-only commit history.** Edits to a 0-cell are recorded as commits; commits are immutable; 0-cell evolution is the append-only sequence of commits. The substrate's [event-log](../objects/event-log.md) discipline applies per-branch.
- **Branch-scope coherence.** Closure rules and shapes within a branch operate as if the branch were a [scope](scope.md): predications outside the branch's vocabulary are not visible from within. Branch-aware queries respect this.
- **Cross-branch federation.** Two 0-cells can federate similarly to two replicas: exchange predications, apply [coherence-glue](../morphisms/coherence-glue.md), produce a merged or reconciled 0-cell. Federation across 0-cells is operationally similar to [sync](../morphisms/sync.md) across replicas.
- **MLD-classification answers "are these the same branch?"** Per [mutually-locally-derivable](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/mutually-locally-derivable.md), two 0-cells are the *same branch up to cosmetic difference* iff they are MLD-equivalent — i.e., in the same connected component of $\mathrm{KP}^\simeq(B)$. The substrate can compute the MLD-classification to detect "branches that differ only in renaming" without false-divergence.

## Position in the substrate

Branched substrate state is the substrate-level pattern that lets a predicated computer support: divergent drafts of the same content; experimental modifications without committing; multiple authors editing in parallel with later reconciliation; projections (per [application-sublocale](../objects/application-sublocale.md)) materialized as branches; branch-scoped publication where each branch's content is exported separately.

The pattern composes with replication and federation: a substrate may carry branches across replicas (replicated branch state), or branches across federated peers (each peer maintains its own branches with cross-peer relationships). Per [branched-state-as-settling-fiber-groupoid](../theorems/branched-state-as-settling-fiber-groupoid.md), the composition is structurally the *direct product* of groupoids — the cross-replica branch state is a 0-cell of $\mathrm{KP}^\simeq(B_1) \times \mathrm{KP}^\simeq(B_2)$, with 1-cells the pairs of per-replica 1-cells.
