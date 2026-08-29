---
type: theorem
class: engineering-claim
status: proved
depends-on: [branched-substrate-state, settling-fiber-groupoid, mutually-locally-derivable, settling-morphism, settling-automorphism-1-truncation, predication-settling]
see-also: [replication-consistency-via-network-sheaf, repair-as-top-cell-resolution]
---

# Branched substrate state is the settling fiber groupoid on the substrate's base

**Claim.** For a substrate with parameter base $B = (\mathbf{L}, \mathcal{C}, E, \lambda)$, the substrate's [branched state](teaching/explanations/branched-substrate-state.md) is *exactly the [settling fiber groupoid](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-fiber-groupoid.md) $\mathrm{KP}^\simeq(B)$*: each branch is a 0-cell (a [predication settling](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling.md) over $B$), each `forked-from` / `merges` / `derives-from` relationship is a 1-cell (an invertible [settling-morphism](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/settling-morphism.md), or in the cherry-pick case a partial 1-cell that doesn't extend to an equivalence). Per [settling-automorphism 1-truncation](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/settling-automorphism-1-truncation.md), 2-cells are identities — the substrate's branch space has no non-trivial higher coherence. The connected components of the groupoid are the [mutually-locally-derivable](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/mutually-locally-derivable.md) equivalence classes, so two branches are *the same up to cosmetic difference* iff they are MLD-equivalent.

## Why this holds

Per [settling-fiber-groupoid](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-fiber-groupoid.md), the groupoid $\mathrm{KP}^\simeq(B)$ is structured as:

- **0-cells.** Predication settlings over $B$.
- **1-cells.** Invertible settling-morphisms — biequivalences in the 2-category of settlings over $B$ — possibly with non-zero ordinal shift $\delta$.
- **2-cells.** Identities, by [settling-automorphism 1-truncation](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/settling-automorphism-1-truncation.md).

The substrate's branched-state structure maps to this directly:

- A **branch** is a substrate-recorded 0-cell — a predication settling over $B$ — uniquely identified by a substrate identifier (substrate entity).
- A **`forked-from`** relationship between branches $a$ and $b$ at a fork-time commit is a substrate-recorded 1-cell from the common-prefix predication settling to both $a$ and $b$ (the fork structure is the cospan, its inverse is the trivial identity at the fork-time).
- A **`merges`** relationship is a colimit construction in the 2-category — joining two 0-cells along their channel-1-cells. The merge is a 0-cell with 1-cells from both inputs.
- A **`derives-from`** relationship may or may not be a 1-cell: a derivation that *is* invertible (the source can be recovered from the derivation) is a 1-cell; a destructive projection is not.

Per [mutually-locally-derivable](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/mutually-locally-derivable.md), two settlings $a$ and $b$ are MLD-equivalent iff each can be locally derived from the other — in groupoid terms, iff they are connected by a 1-cell (an invertible settling-morphism). The connected components of $\mathrm{KP}^\simeq(B)$ are therefore the MLD-classes:

$$\pi_0(\mathrm{KP}^\simeq(B)) \;=\; \mathrm{KP}(B) \,/\, \sim_{\mathrm{MLD}}.$$

This is exactly what the substrate's "are these the same branch up to cosmetic difference?" question is computing.

## Engineering consequence

- **Branch-equivalence is structurally MLD.** Two branches that look textually different but are MLD-equivalent are the *same component* of the groupoid — the substrate's "are they really different?" check reduces to MLD-classification, which per [mutually-locally-derivable](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/mutually-locally-derivable.md) is computable.
- **Fork is 0-cell creation with a 1-cell.** Forking creates a new 0-cell $b$ and a 1-cell from the source $a$'s state at fork-time. Initially $a$ and $b$ are in the same component (the trivial 1-cell makes them equivalent); subsequent edits may move them to distinct components.
- **Merge is colimit.** Merging two branches is the substrate-side of a 2-categorical colimit. Per [bilattice-network-sheaf-consensus](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md), conflicts (cells where the merge cannot find a consistent value) appear as $\top$-witnesses; per [repair-as-top-cell-resolution](repair-as-top-cell-resolution.md), the substrate resolves them via the repair catalog.
- **Cherry-pick is a partial 1-cell.** Cherry-picking a subset of predications from $a$ to $b$ is a non-invertible morphism — $b$ ends up in a different component than $a$ (typically a new component closer to neither original).
- **Branch hierarchy is a graph in the groupoid.** The substrate's `forked-from` relationships form a graph in $\mathrm{KP}^\simeq(B)$ whose vertices are 0-cells and whose edges are the 1-cells. The structure is directly queryable as substrate content.
- **No non-trivial branch-coherence.** Per [settling-automorphism 1-truncation](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/settling-automorphism-1-truncation.md), there are no non-trivial 2-cells — the substrate doesn't carry "different ways the same equivalence may be witnessed." This simplifies the substrate's branch-space implementation: it is structurally a 1-groupoid, no higher-cell tracking required.

## What the theorem rules out

- **Branches without 0-cell identity.** A "branch" that has no substrate-recorded settling — pure runtime state — is not a 0-cell of the groupoid. The substrate refuses such ephemeral branches; per [self-representation](teaching/explanations/self-representation.md), branches are substrate content.
- **Non-invertible "branch equivalence."** A claim that branches $a$ and $b$ are equivalent must be witnessed by an invertible settling-morphism. A one-way derivation does not establish equivalence; per [mutually-locally-derivable](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/mutually-locally-derivable.md), MLD requires both directions.
- **Higher coherence between branches.** The substrate does not record "different proofs that branches $a$ and $b$ are equivalent" — per the 1-truncation, all such proofs are the identity. Implementations that try to track higher coherence are doing extra work the substrate doesn't admit.

## What the theorem requires

- The substrate's value-domain admits the 2-category of [predication settlings](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling.md) over $B$.
- The substrate records each branch as a substrate entity with its full per-cell valuation.
- The substrate's branch operations (fork, merge, cherry-pick) compose per the groupoid's 1-cell composition.
- The MLD-classification is computable for the substrate's regime — true for strict / Scott-continuous regimes; aperiodic regimes require additional verification.

## Position

This theorem grounds the substrate's branched-state discipline in the settling fiber groupoid. Together with [replication-consistency-via-network-sheaf](replication-consistency-via-network-sheaf.md) (multi-replica state as multi-observer system) and [repair-as-top-cell-resolution](repair-as-top-cell-resolution.md) (merge-conflicts as $\top$-cells), it completes the substrate's structural picture of distributed-state-with-branching: branches live in a 1-groupoid, replicas live in a multi-observer system, conflicts live as $\top$-cells, and the substrate's coordinated computations operate on these structures uniformly.
