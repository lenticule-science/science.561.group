---
type: concept
class: distribution-discipline
depends-on:
  - predication-graph-store
  - federation-bridge
  - hash-discipline
  - parameter-base-category
  - predication-fibration
  - predicate-generator-pullback-closure
  - scope-cover-via-grothendieck-site
  - replica-cover
  - join-reordering-via-beck-chevalley
see-also:
  - consistent-hashing
  - sharding-as-fibration-pullback-cover
  - cluster-as-replica-cover
---

# Sharding

A *substrate-recorded partitioning of substrate content across multiple substrate-instances*. Where federation lets multiple substrates share state, sharding lets each substrate own a *disjoint slice* of state — useful when the total state exceeds what one substrate can hold or when load distribution is needed.

Structurally, sharding is **a jointly-surjective family of pullback-stable subobjects of the entity-set component of the [parameter-base category](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/parameter-base-category.md) $\mathbf{B}$**, lifted through the [predication fibration](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md) to a covering family in the substrate's [scope-Grothendieck site](../../../theorems/scope-cover-via-grothendieck-site.md). The bridge theorem [sharding-as-fibration-pullback-cover](../theorems/sharding-as-fibration-pullback-cover.md) names the identification explicitly.

A shard has the structure:

- **Shard-id** — substrate identifier; equivalently, the index $i$ of the cover element $E_i \hookrightarrow E$ on the entity-set component of the substrate's parameter-base.
- **Sharding function** — a function from cell content (or some key derivable from it) to shard-id. Math content: a *characteristic morphism* $\chi : E \to I$ from the entity set to the shard-index discrete set, in the $\mathbf{Set}$ component of $\mathbf{B}$. The shard subobjects are then $E_i = \chi^{-1}(i)$, automatically jointly surjective and pairwise disjoint. Pullback-stability of these subobjects is the standard $\mathbf{Set}$-fact that preimages commute with pullbacks (intersection of preimages = preimage of intersection); [predicate-generator-pullback-closure](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/predicate-generator-pullback-closure.md) is the *additional* requirement on the predicate-category side, used when the sharding is composed with a sub-support change in $\mathcal{C}$.
- **Owning substrate** — which substrate-instance holds this shard's content. Math content: the assignment $i \mapsto S_i$ from cover index to substrate-instance, recorded as substrate content per [self-representation](../../teaching/explanations/self-representation.md).
- **Replica substrates** — for fault-tolerance, additional substrate-instances holding read-replicas. Math content: per shard $i$, a [replica cover](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/replica-cover.md) $\{U_{i,j} \to E_i\}_j$ on $E_i$'s pairwise-Stone dual; the shard-record carries the cover-data.
- **Migration policy** — what happens when shards need to move (e.g., when adding a new substrate-instance). Math content: a base-change morphism in $\mathbf{B}$ on the entity-set component, lifted through the predication fibration to a reindexing functor on each fiber per the [predication-fiber-functor](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/predication-fiber-functor.md). The migration is *cohomologically witnessed* by which Čech cocycles in [replica-mayer-vietoris](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/replica-mayer-vietoris.md) change and which are preserved.

Sharding decisions:

- **Hash-based.** `shard = hash(entity-id) mod N`. The characteristic morphism $\chi$ factors through a hash function and a mod-$N$ map. Even distribution by the hash uniformity discipline; the cover refines coarsely under base-change — adding instance $N+1$ replaces nearly every $E_i$ with a different subset, so the Mayer–Vietoris cocycle data changes globally. This is why `mod N` requires near-total reshuffling.
- **Range-based.** `shard = bucket(entity-id, ranges)`. The characteristic morphism $\chi$ factors through an order on the entity-set and a partition of that order. Cover refinement is local — only adjacent ranges change when a boundary moves — but the cover does not respect the hash-discipline's uniform distribution.
- **Consistent-hashing.** Hash both content and substrate-instances onto a ring; each substrate owns the range from its position to the next. Per [consistent-hashing](consistent-hashing.md), this is the *cover-refinement-minimal* sharding: adding or removing an instance changes only the cover element adjacent to the new/removed position, leaving the rest invariant. The minimality is a Mayer–Vietoris fact, made precise in [consistent-hashing-minimal-movement](../theorems/consistent-hashing-minimal-movement.md).
- **Manual / config-based.** The characteristic morphism $\chi$ is recorded as an explicit substrate-content table per [self-representation](../../teaching/explanations/self-representation.md) rather than computed.

## Operations across shards

Per [federation-convergence](../../../theorems/federation-convergence.md), cross-shard operations may federate (each shard is its own substrate-instance from the federation's perspective); operations within a shard happen locally. The math identification makes the cost of cross-shard operations precise:

- **Single-shard operation.** Stays within one fiber $\mathcal{E}_{E_i}$ of the predication fibration. No reindexing needed; cost is the cost of the operation in that fiber.
- **Cross-shard read.** A read at the unsharded scope reduces to a coordinated read across the cover $\{E_i \to E\}$ per [scope-cover-via-grothendieck-site](../../../theorems/scope-cover-via-grothendieck-site.md). The substrate's sharding-aware query layer is the cover-respecting read implementation.
- **Cross-shard join.** A query joining cells from $E_i$ and $E_j$ requires the reindexing functor along the join-key projection. Per [join-reordering-via-beck-chevalley](../../../theorems/join-reordering-via-beck-chevalley.md), the join is structurally a pullback in $\mathcal{C}$; the substrate's planner uses Beck–Chevalley to push joins toward the side with the smaller fiber.
- **Cross-shard transaction.** Genuine cross-shard atomic commit is a sheaf-gluing problem: the transaction's effects on $E_i$ and $E_j$ must agree on the (typically empty in disjoint sharding) overlap, and the global section is constructed by the [bilattice network-sheaf consensus](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md) merge — which under disjoint sharding degenerates to ordinary two-phase commit. (The full Mayer–Vietoris machinery is invoked only when shards genuinely overlap, e.g., during a migration window; under steady-state disjoint sharding the gluing condition is vacuous.) The substrate's discipline is to design the sharding function so most operations are single-shard.

## What the math grounding rules out

- **Sharding functions that are not pullback-stable.** A characteristic $\chi$ that depends on substrate state outside the entity in question (e.g., "shard by *current* load on each instance") is not a morphism in $\mathbf{B}$'s entity-set component; the cover does not pull back along base-change, so [predicate-generator-pullback-closure](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/predicate-generator-pullback-closure.md) does not apply, and the platform's cover-respecting read theorems silently fail. Load-aware sharding must be implemented as *re-sharding under an updated stable $\chi$*, not as state-dependent routing inside a fixed $\chi$.
- **Sharding functions that are not jointly surjective.** A $\chi$ whose image misses some shard-index leaves cells unreachable; whose image overlaps two shards admits two-holder ambiguities not resolvable by the Mayer–Vietoris argument of [distributed-lock-as-residuated-authority-gate](../theorems/distributed-lock-as-residuated-authority-gate.md). The substrate refuses both.
- **Sharding without recorded cover-data.** A substrate that knows "which shard holds which entity" only by computation, never by substrate content, cannot present the cover to the audit layer per [audit-content-via-inconsistency-sheaf-cohomology](../../../theorems/audit-content-via-inconsistency-sheaf-cohomology.md). The cover must be substrate content, not implicit runtime behavior.

## Position

Sharding is the substrate's discipline for *partitioning* the parameter-base; replication is the substrate's discipline for *covering* the same base region with multiple sections. The two compose: a sharded-and-replicated substrate has, per shard, a [replica cover](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/replica-cover.md), and at the top level a partition cover. Per [sharding-as-fibration-pullback-cover](../theorems/sharding-as-fibration-pullback-cover.md), both layers are sites in the same Grothendieck-topological framework, so the platform's cohomological theorems apply uniformly to either layer.
