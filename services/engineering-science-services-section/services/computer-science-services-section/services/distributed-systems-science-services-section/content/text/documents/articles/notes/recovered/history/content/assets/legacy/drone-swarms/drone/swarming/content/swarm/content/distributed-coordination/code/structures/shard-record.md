---
type: definition
class: substrate-entity
realizes: [sharding, consistent-hashing]
depends-on:
  - sharding
  - consistent-hashing
  - deployment-record
  - federation-graph
  - parameter-base-category
  - predication-fibration
  - predicate-generator-pullback-closure
  - replica-cover
  - settling-associated-sheaf
see-also:
  - cluster-record
  - quorum-record
  - sharding-as-fibration-pullback-cover
  - scope-cover-via-grothendieck-site
  - join-reordering-via-beck-chevalley
---

# Shard record

A **shard record** is the substrate-entity formal definition of a [shard](teaching/explanations/sharding.md): a partition of substrate content owned by a particular substrate-instance.

## Structural fields

- **`id`** — kebab-case identifier (typically `shard-${id}` or `shard-${hash-range-start}`).
- **`description`** — one-line summary.
- **`sharding-function`** — reference to the substrate-recorded characteristic morphism $\chi : E \to I$ on the entity-set component of the substrate's [parameter-base category](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/parameter-base-category.md). Per [sharding-as-fibration-pullback-cover](../theorems/sharding-as-fibration-pullback-cover.md) clause (0), $\chi$ must be a $\mathbf{B}$-morphism — depends only on entity-content recorded in the parameter-base, never on runtime state outside it. State-dependent routing is forbidden as it breaks the fibration lift.
- **`hash-range`** — for hash-based / consistent-hashing sharding, the range of hash values this shard owns; the preimage $E_i = \chi^{-1}(i)$ realized as a hash-range subobject inclusion $\iota_i : E_i \hookrightarrow E$.
- **`owning-substrate`** — reference to the [deployment-record](../../../objects/deployment-record.md) of the substrate-instance that owns this shard. Per [sharding-as-fibration-pullback-cover](../theorems/sharding-as-fibration-pullback-cover.md), the owning-substrate assignment $S_i$ is part of the cover-data $(\chi, \{E_i\}, \{\iota_i\}, \{S_i\})$ recorded as substrate content.
- **`replica-substrates`** — references to substrate-instances holding read-replicas of this shard. Per the math grounding below, the per-shard replica list is the indexing of a [replica cover](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/replica-cover.md) $\{U_{i,j} \to E_i\}_j$ that composes with the partition cover.
- **`migration-state`** — `stable`, `migrating-to-${target-substrate}`, `migrating-from-${source-substrate}`. For shard reassignments. Per [sharding-as-fibration-pullback-cover](../theorems/sharding-as-fibration-pullback-cover.md) "What the theorem rules out," migration must be written as a recorded base-change in $\mathbf{B}$ (an updated stable $\chi$), not as runtime branching inside a fixed $\chi$.
- **`closure-kind`** — `shard`.

## Invariants

- **Single-owner.** Each shard has exactly one owning-substrate; replicas read but don't write.
- **Range-coherent.** For hash-based sharding, the hash-ranges across all shards form a partition of the hash space (no gaps, no overlaps) — equivalently, the family $\{E_i = \chi^{-1}(i) \hookrightarrow E\}_i$ is jointly surjective and pairwise disjoint, the cover-validity precondition of [sharding-as-fibration-pullback-cover](../theorems/sharding-as-fibration-pullback-cover.md) clause (1).
- **Pullback-stable.** Per the same theorem clause (0), $\chi$ must be a $\mathbf{B}$-morphism so the cover survives reindexing along any predicate-category morphism. State-dependent routing produces a runtime-dependent cover that does not pull back.
- **Substrate-recorded.** Per [self-representation](../../teaching/explanations/self-representation.md), sharding configuration is queryable.

## Math grounding

The shard record is the substrate-content surface of one fixed construction in the math parent: a covering family $\{E_i \xhookrightarrow{\iota_i} E\}_{i \in I}$ in the entity-set component of the [parameter-base category](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/parameter-base-category.md) $\mathbf{B}$, lifted through the [predication fibration](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md) $p : \mathcal{E} \twoheadrightarrow \mathcal{C}$ to a covering family in the substrate's scope-Grothendieck site. Per [sharding-as-fibration-pullback-cover](../theorems/sharding-as-fibration-pullback-cover.md), this means:

- **`sharding-function` ↔ a $\mathbf{B}$-morphism $\chi$.** The substrate's sharding function is exactly the characteristic morphism of the partition cover. Pullback-stability of $\chi$ — i.e., $\chi$ being a $\mathbf{B}$-morphism — is what makes the cover lift functorially through $p$ (per [predicate-generator-pullback-closure](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/predicate-generator-pullback-closure.md)) and what guarantees the platform's cover-respecting read theorems hold. Implementations that route by load, latency, or current health are computing a different $\chi$ at every request and have no fixed cover; they cannot inherit the per-shard locality, cross-shard read-soundness, cross-shard join-correctness, or atomic cross-shard commit guarantees of the theorem.

- **`hash-range` ↔ the subobject inclusion $\iota_i : E_i \hookrightarrow E$.** The recorded hash-range is the substrate-content witness that $E_i = \chi^{-1}(i)$ as a subobject of $E$. Per [predicate-generator-pullback-closure](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/predicate-generator-pullback-closure.md), this subobject is in the four-generator closure of $\mathcal{C}$, so the cover survives reindexing along any predicate-category morphism — i.e., per-shard reads and the partition itself remain well-defined under any base-change the substrate performs.

- **`replica-substrates` ↔ a per-shard replica cover.** The per-shard replica list induces a [replica cover](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/replica-cover.md) $\{U_{i,j} \to E_i\}_j$ on the shard. Per [sharding-as-fibration-pullback-cover](../theorems/sharding-as-fibration-pullback-cover.md) clause (5), this composes with the partition cover $\{E_i \to E\}_i$ to yield the doubly-indexed cover $\{U_{i,j} \to E\}_{i,j}$ — a Grothendieck cover by site composition. The platform's per-shard quorum, locking, and consensus theorems lift to the doubly-indexed cover automatically; cross-shard transactions are *one* application of [distributed-lock-as-residuated-authority-gate](../theorems/distributed-lock-as-residuated-authority-gate.md) to the commit-token across the meta-cluster of participating shards, not a separate primitive.

- **Cross-shard reads are sheaf-condition reads on the [settling-associated sheaf](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-associated-sheaf.md).** Per [sharding-as-fibration-pullback-cover](../theorems/sharding-as-fibration-pullback-cover.md) clause (3), a substrate-level read at the unsharded scope reduces to the disjoint product of per-shard reads. The substrate does not need a separate "cross-shard read" code path; the sheaf-condition equalizer for the settling-associated sheaf produces the read for free.

- **Cross-shard joins are Beck–Chevalley re-orderings.** Per [join-reordering-via-beck-chevalley](../../../theorems/join-reordering-via-beck-chevalley.md) and [sharding-as-fibration-pullback-cover](../theorems/sharding-as-fibration-pullback-cover.md) clause (4), a join across shards is structurally a pullback in $\mathcal{C}$; the planner can re-order joins along any base-admissible re-ordering without changing the result. The substrate does not ship a "cross-shard join" primitive; it has a Beck–Chevalley square and the recorded sharding cover.

- **`migration-state` ↔ a base-change in $\mathbf{B}$.** A shard reassignment is the substrate-content witness of an updated stable $\chi$. Per [sharding-as-fibration-pullback-cover](../theorems/sharding-as-fibration-pullback-cover.md) "What the theorem rules out," migration written as runtime branching inside a fixed $\chi$ silently breaks the cover-respecting read theorems; migration written as a recorded base-change preserves them and admits a cohomological audit per [consistent-hashing-minimal-movement](../theorems/consistent-hashing-minimal-movement.md).

## Position in the platform

Shard records are the substrate's *partition-placement registry*. Per [federation-convergence](../../../theorems/federation-convergence.md), shards are substrate-instances from the federation's perspective; cross-shard operations route through the federation graph. Per the math grounding, sharding is not a separate substrate primitive but the substrate-content surface of cover-data on the parameter-base, lifted through the predication fibration; a substrate that already implements the fibration and the substrate-content cover-data discipline gets sharding for free.
