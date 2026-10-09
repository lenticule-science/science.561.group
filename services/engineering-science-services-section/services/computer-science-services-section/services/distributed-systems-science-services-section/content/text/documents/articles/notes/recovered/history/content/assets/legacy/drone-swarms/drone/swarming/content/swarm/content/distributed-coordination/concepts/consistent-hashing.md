---
type: concept
class: distribution-discipline
depends-on:
  - sharding
  - hash-discipline
  - parameter-base-category
  - predication-fibration
  - replica-cover
  - replica-mayer-vietoris
see-also:
  - sharding
  - sharding-as-fibration-pullback-cover
  - consistent-hashing-minimal-movement
---

# Consistent hashing

A *sharding discipline that minimizes data movement when substrate-instances are added or removed*. Where naive hash-based sharding requires re-shuffling most of the data when $N$ changes, consistent hashing only re-shuffles $1/N$ of the data.

Structurally, consistent hashing is **a [sharding cover](sharding.md) on the entity-set component of $\mathbf{B}$ presented as a cyclic refinement order**: every membership change is a *base-change morphism* in the [parameter-base category](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/parameter-base-category.md) that touches at most two arcs adjacent to the change-point — exactly one arc for an instance addition (the arc containing the new anchor splits in two), exactly two arcs for an instance removal (the two arcs flanking the removed anchor merge into one) — leaving every other arc of the cover invariant on the nose. The minimality of data movement is the immediate set-theoretic consequence of this *local-in-the-cover* refinement property; a derived cohomological reading is given in [consistent-hashing-minimal-movement](../theorems/consistent-hashing-minimal-movement.md).

The construction:

1. Hash each substrate-instance to a position on a circular hash space (typically $[0, 2^{32})$). The positions $\{p_1, \ldots, p_N\}$ are the *cover-anchor data*.
2. Hash each piece of content to a position on the same space. The hash function $h : E \to [0, 2^{32})$ is the characteristic morphism's first factor.
3. Each piece of content is owned by the *next substrate-instance clockwise* from its hash position. The arcs $A_i := (p_{i-1}, p_i]$ (indices mod $N$ on the ring) form the entity-set cover $\{E_i = h^{-1}(A_i) \to E\}_{i=1}^N$.

The cover $\{E_i \to E\}$ is jointly surjective (every hash position lies in exactly one arc), pairwise disjoint (arcs are half-open and tile the ring), and pullback-stable (the arcs are determined by the anchor positions, which are themselves substrate-content). Per [sharding-as-fibration-pullback-cover](../theorems/sharding-as-fibration-pullback-cover.md), it lifts through the [predication fibration](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md) to a covering family in the substrate's scope-site.

When a new substrate-instance is added at hash position $h^*$ falling inside the current arc $A_k = (p_{k-1}, p_k]$:

- The old arc $A_k$ is replaced by two arcs $A_k' = (p_{k-1}, h^*]$ and $A_{N+1} = (h^*, p_k]$.
- All other arcs $A_i$ with $i \neq k$ are *unchanged*.
- Therefore the entity-set cover $\{E_i \to E\}$ is replaced by a cover that differs only on the index-$k$ position: $E_k$ is replaced by $E_k' \sqcup E_{N+1}$, and *every other $E_i$ is preserved on the nose*.

When a substrate-instance is removed at position $p_k$:

- The arcs $A_k$ and $A_{k+1}$ merge into one arc $A_{k+1}' = (p_{k-1}, p_{k+1}]$.
- All other arcs $A_i$ with $i \neq k, k+1$ are *unchanged*.

This **local-in-the-cover refinement property** — addition splits one arc, removal merges two adjacent arcs, all other arcs unchanged — is the structural content that distinguishes consistent hashing from `hash mod N`. Under `hash mod N`, every arc is determined by *all* of $N$, so changing $N$ changes every arc. Under consistent hashing, arcs are determined only by *adjacent* anchor positions, so changing one anchor changes only the (at most two) arcs adjacent to it.

## Refinements

- **Virtual nodes.** Each substrate-instance is hashed to multiple positions (typically 100–200 "virtual nodes"). This evens out the distribution (without virtual nodes, some substrates may own much more content than others by chance). Math content: each substrate-instance contributes a *family* of cover-anchor positions; the cover element owned by an instance is the *union* of the arcs immediately preceding each of its virtual-node positions. Per [predicate-generator-pullback-closure](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/predicate-generator-pullback-closure.md), unions of pullback-stable subobjects remain pullback-stable, so the virtual-node refinement remains a Grothendieck cover.
- **Replica selection.** For fault-tolerance, each piece of content is held by the next $K$ substrate-instances clockwise. Reads can come from any replica; writes go to all. Math content: the partition cover $\{E_i \to E\}$ is composed with a per-shard [replica cover](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/replica-cover.md) $\{U_{i,j} \to E_i\}_{j=1}^K$; the platform's [cluster-as-replica-cover](cluster-as-replica-cover.md) identification applies to each per-shard cover, so quorum and consensus theorems lift per-shard automatically.
- **Weighted hashing.** Larger substrate-instances are hashed to more positions, getting proportionally more content. Math content: the multiplicity in the cover-anchor family carries weight; the cover-arcs' aggregate measure on the ring is proportional to the weight.

## Why the substrate records the cover-data

Per [self-representation](../../teaching/explanations/self-representation.md), the consistent-hashing configuration — the anchor-position list, the hash function, the per-instance virtual-node count and weight — is substrate content. Per [witness](../../../objects/witness.md), shard-migration events are recorded as substrate content; an auditor can verify correct re-shuffling by replaying the cover-refinement sequence and checking that only the at-most-two-adjacent-arc changes appear in the witness chain.

A substrate that performs migration via *unsignaled* arc-shuffling (e.g., arc reassignment as a side effect of failure detection) loses the structural guarantee. Per [audit-content-via-inconsistency-sheaf-cohomology](../../../theorems/audit-content-via-inconsistency-sheaf-cohomology.md), the corresponding inconsistency-sheaf cohomology becomes non-trivial — the audit layer cannot certify that minimal movement was actually achieved, only that the substrate claims so.

## Composition with the platform

Per [scope-cover-via-grothendieck-site](../../../theorems/scope-cover-via-grothendieck-site.md), the cover $\{E_i \to E\}$ is a covering family in the substrate's scope-Grothendieck site. Per [federation-convergence](../../../theorems/federation-convergence.md), federation across the cover is the standard cross-substrate gluing. The two compose: each shard is one substrate-instance from the federation's perspective, and cross-shard queries are federated reads against the consistent-hashing cover.

Per [conformance-implies-substrate-properties](../../../theorems/conformance-implies-substrate-properties.md), conformance tests can verify the sharding's correctness properties (uniform distribution, local-in-the-cover refinement on membership change, cover-respecting reads).

Consistent hashing is the dominant sharding discipline for distributed key-value stores (Cassandra, DynamoDB, Riak, Memcached) and CDN content distribution.
