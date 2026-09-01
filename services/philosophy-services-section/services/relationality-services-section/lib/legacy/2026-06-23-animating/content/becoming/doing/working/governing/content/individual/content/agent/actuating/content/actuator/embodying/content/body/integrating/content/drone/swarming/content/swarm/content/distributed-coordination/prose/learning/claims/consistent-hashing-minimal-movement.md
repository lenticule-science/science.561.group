---
type: theorem
class: engineering-claim
status: proved
depends-on:
  - consistent-hashing
  - sharding
  - shard-record
  - sharding-as-fibration-pullback-cover
  - replica-cover
  - replica-mayer-vietoris
  - predication-fiber-functor
see-also:
  - sharding-as-fibration-pullback-cover
  - cluster-as-replica-cover
---

# Consistent hashing moves only $1/N$ of content on substrate-instance addition or removal — a local-in-the-cover refinement fact, with a cohomological corollary

**Claim.** When a substrate-instance is added to or removed from a [consistent-hashing](teaching/explanations/consistent-hashing.md)-based [sharding](teaching/explanations/sharding.md) configuration with $N$ instances, the content that must move is *exactly* the content owned by the at-most-two cover arcs adjacent to the change-point — one arc on addition (split in two), two arcs on removal (merged into one). Under uniform-distribution discipline (cryptographic hash, virtual-node refinement), the expected fraction of content moved is approximately $1/N$.

The bound is **structural, not probabilistic**. The probabilistic statement ("approximately $1/N$") is a corollary of the structural statement ("at most two arcs change") composed with the uniform-distribution discipline of [hash-discipline](../../teaching/explanations/hash-discipline.md). A further cohomological reading — that Čech cocycles supported away from the change-arcs are preserved verbatim — follows when the settling-associated sheaf takes values in a category with finite biproducts (clause (3) below; this is the predication-fibration's case per [predication-fiber-algebra](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md)).

Per the contrast with naive `hash mod N` sharding, where adding or removing one instance requires re-shuffling roughly $(N-1)/N$ of all content, consistent hashing is dramatically more efficient. The contrast itself is structural: under `hash mod N` *every* arc is determined by *all* of $N$, so changing $N$ changes every arc; under consistent hashing, arcs are determined only by adjacent anchor positions.

## Setup

Fix a consistent-hashing configuration with $N$ substrate-instances at hash positions $p_1 < p_2 < \cdots < p_N$ on the ring $[0, M)$ (indices mod $N$). The arcs $A_i := (p_{i-1}, p_i]$ form a partition of the ring; the entity cover is $\{E_i = h^{-1}(A_i) \to E\}_{i=1}^N$. Per [sharding-as-fibration-pullback-cover](sharding-as-fibration-pullback-cover.md), this cover lifts through the [predication fibration](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md) to a Grothendieck-covering family $\{\sigma_i \to \sigma\}$ on the substrate's scope.

Let $\mathcal{F}$ be the [settling-associated sheaf](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-associated-sheaf.md) on the substrate's scope-site, restricted to $\sigma$. The substrate-content owned by shard $i$ is $\mathcal{F}(\sigma_i)$ — the local section of the lock/data sheaf over the cover element $E_i$.

## Statement

**Theorem (local-in-the-cover refinement minimality).** *Clauses (1) and (2) are the load-bearing structural results, proved at the level of the entity-set partition. Clause (3) is a corollary about sheaf sections, requiring the explicit hypothesis stated. Clause (4) is a probabilistic corollary requiring the hash-discipline hypotheses.*

1. **Addition.** Adding a substrate-instance at position $h^* \in A_k$ replaces the entity-cover $\{E_i \to E\}_{i=1}^N$ by a refinement $\{E_i' \to E\}_{i=1}^{N+1}$ in which:
   - For every $i \neq k$: $E_i' = E_i$ as a subobject of $E$ in $\mathbf{Set}$ — *no entity moves*.
   - For $i = k$: $E_k$ is split into $E_k' = h^{-1}((p_{k-1}, h^*])$ and $E_{N+1}' = h^{-1}((h^*, p_k])$, with $E_k = E_k' \sqcup E_{N+1}'$ as a disjoint union of subsets — the entities of one shard are partitioned between two.

   The total moved entity-count is $|E_{N+1}'|$ — strictly less than $|E_k|$, and zero outside $E_k$.

2. **Removal.** Removing the substrate-instance at position $p_k$ replaces the cover by a coarsening in which:
   - For every $i \notin \{k, k+1\}$: $E_i' = E_i$ — *no entity moves*.
   - For $i = k+1$ (after re-indexing): $E_{k+1}' = E_k \sqcup E_{k+1}$ — the entities of the removed shard join their successor's shard.

   The total moved entity-count is $|E_k|$.

3. **Sheaf-section invariance away from the change-arcs (corollary, requires the full replica-Mayer-Vietoris hypothesis).** Suppose the settling-associated sheaf $\mathcal{F}$ satisfies the full hypothesis of [replica-mayer-vietoris](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/replica-mayer-vietoris.md) — i.e., $\mathcal{F}$ is a [KZ-coherent sheaf](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/kz-coherent-sheaf.md) on the bitopological settling site, taking values in an abelian-style category with the short-exact-sequence / derived-functor machinery the cited theorem uses (and in particular with finite biproducts). This holds in the predication-fibration's case: the fiber algebras $A_q = \mathbf{L}^{\bowtie E \times E}$ per [predication-fiber-algebra](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) carry the requisite additive structure, and the settling-associated sheaf is KZ-coherent per [settling-associated-sheaf-well-defined](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/settling-associated-sheaf-well-defined.md). Then under the cover refinement of clauses (1)–(2):
   - For every shard $i$ outside the change-set ($\{k\}$ for addition, $\{k, k+1\}$ for removal): the section $\mathcal{F}(\sigma_i') = \mathcal{F}(\sigma_i)$ — *the section is preserved on the nose*.
   - On the change-arc(s): under addition, $\mathcal{F}(\sigma_k) \cong \mathcal{F}(\sigma_k') \oplus \mathcal{F}(\sigma_{N+1}')$ (biproduct decomposition along $E_k = E_k' \sqcup E_{N+1}'$, by sheaf-functoriality on disjoint-union covers); under removal, dually.
   - In particular, every Čech 0-cocycle (= section) whose support is contained in the union of unchanged arcs is preserved verbatim.

   *Reduction to iterated 2-covers.* The N-ary partition cover $\{E_i \to E\}$ refines through the partial nerve into iterated 2-element covers $\{E_i \to E\} \to \{(E_1 \sqcup \cdots \sqcup E_{i-1} \sqcup E_i) \to (E_1 \sqcup \cdots \sqcup E_{N})\}$ at each step, each of which is the disjoint case of [replica-mayer-vietoris](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/replica-mayer-vietoris.md) with empty pairwise overlap. The full Mayer–Vietoris long exact sequence collapses (because $H^n(\emptyset, \mathcal{F}) = 0$), reducing each step to the biproduct decomposition above. This reduction does not require an N-ary generalization of [replica-mayer-vietoris](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/replica-mayer-vietoris.md); it uses the existing 2-cover statement on the trivial-overlap case iteratively.

4. **Probabilistic corollary.** Under [hash-discipline](../../teaching/explanations/hash-discipline.md) (uniform hash) and uniform anchor distribution (true with virtual-node refinement), the expected measure of $A_k$ is $M/N$, so the expected fraction of content moved is approximately $1/N$.

## Proof

**(1) and (2) — set-theoretic.** The arcs $A_i$ partition the ring and each $A_i$ is determined solely by its two endpoint anchor-positions $p_{i-1}, p_i$. Inserting a new anchor $h^* \in (p_{k-1}, p_k]$ leaves every $p_j$ with $j \notin \{k-1, k\}$ unchanged, hence every arc $A_j$ with $j \neq k$ unchanged as a set. The split $A_k = A_k' \sqcup A_{N+1}'$ is set-theoretic. Removal of $p_k$ is symmetric: the merged arc $A_{k+1}' = A_k \cup A_{k+1}$ replaces the two arcs adjacent to the removed anchor; all other arcs are unchanged. The corresponding $E_i := h^{-1}(A_i)$ inherit the partition by preimage of disjoint sets, in $\mathbf{Set}$. $\square$

**(3) — sheaf-section invariance.** The unchanged-arc cover elements $E_i$ are the *same* subobjects of $E$ pre- and post-refinement (as sets), so the corresponding scope $\sigma_i$ in the substrate's scope-site is the same scope, and $\mathcal{F}(\sigma_i)$ is by definition the same section. The change-arc decomposition is the disjoint-union sheaf condition on a 2-cover with empty overlap: per [replica-mayer-vietoris](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/replica-mayer-vietoris.md) applied with $U = U_1 \cup U_2$ and $U_1 \cap U_2 = \emptyset$, the long exact sequence collapses (since $H^n(\emptyset, \mathcal{F}) = 0$) to the biproduct isomorphism $H^n(U, \mathcal{F}) \cong H^n(U_1, \mathcal{F}) \oplus H^n(U_2, \mathcal{F})$ — which requires the codomain to admit finite biproducts, which holds for $\mathcal{F}$ in the predication-fibration case as cited. The sheaf-functoriality direction is [sheaf-functoriality-on-bitopological-site](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/sheaf-functoriality-on-bitopological-site.md). For the N-ary partition cover, the iterated reduction described in clause (3) gives the result without requiring an N-ary generalization of replica-Mayer-Vietoris. $\square$

**(4) — probabilistic.** Under uniform hash distribution, $\mathbb{E}[|h^{-1}(A_i)|] = |E| \cdot |A_i|/M$. With uniform anchor distribution, $\mathbb{E}[|A_k|] = M/N$. Hence $\mathbb{E}[\text{moved}] \leq \mathbb{E}[|h^{-1}(A_k)|] = |E|/N$. Virtual-node refinement reduces the variance of $|A_k|$ around its mean $M/N$. $\square$

## Engineering consequence

- **Cheap scale-out is structural, not probabilistic.** Adding a substrate-instance to a federation requires only single-arc data movement, not full re-shuffle. The bound holds *per migration event* (with the precise content being the new shard's arc), not just on average.
- **Cheap scale-in is structural.** Removing a substrate-instance moves only its content to the next-clockwise instance.
- **Section invariance underwrites uninterrupted reads on unaffected shards.** Per clause (3), shards outside the change-set are *section-untouched* — their settling-associated sheaf sections are preserved on the nose, so substrate clients reading from those shards observe no transition. The migration discipline does not require quiescing reads on unaffected shards.
- **Failure-tolerant.** Per [sharding](teaching/explanations/sharding.md) and the per-shard [replica cover](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/replica-cover.md), an instance failure only requires re-promoting replicas, not re-shuffling. The replica-cover Mayer–Vietoris is the per-shard story; the consistent-hashing cover-refinement Mayer–Vietoris is the cross-shard story; the two compose.

## What the theorem requires

- The hash function distributes content uniformly (true for cryptographic hashes per [hash-discipline](../../teaching/explanations/hash-discipline.md)) — *for the probabilistic corollary only*. Clauses (1)–(3) hold without uniformity.
- Substrate-instance positions are sampled uniformly on the hash ring (true with virtual-node refinement) — *for the probabilistic corollary only*.
- The substrate's sharding cover is recorded as substrate content per [sharding-as-fibration-pullback-cover](sharding-as-fibration-pullback-cover.md) — required for the cover-refinement morphism to be a substrate-content morphism rather than implicit runtime behavior; otherwise the audit layer cannot certify that the migration was the cover refinement claimed.
- Migration events are written through the closure-rule engine per [witness-as-cell](../../../theorems/witness-as-cell.md), so that the refinement morphism is itself a substrate-content artifact.

## What the theorem rules out

- **Migration disciplines that re-hash content not in the change-arcs.** A consistent-hashing implementation that re-shuffles every shard on each membership change is not consistent hashing; per clause (1), the structural minimality is automatic when the cover refinement is implemented faithfully.
- **State-dependent shard-routing during migration.** A substrate that consults *current load* during a migration to decide where unaffected content goes violates the pullback-stability discipline of [sharding](teaching/explanations/sharding.md); the migration is then not a cover-refinement morphism in $\mathbf{B}$, and clause (3)'s cohomological invariance does not hold.
- **Migration that is invisible to the witness chain.** Per the audit-substrate discipline, the cover-refinement morphism must appear as substrate content; an invisibly-mutated shard table breaks [audit-content-via-inconsistency-sheaf-cohomology](../../../theorems/audit-content-via-inconsistency-sheaf-cohomology.md)'s ability to certify minimal movement.

## Position

This theorem is the cohomological face of the consistent-hashing discipline. The probabilistic statement that practitioners cite ("only $1/N$ of data moves") is a corollary of the deeper structural statement that *cover-refinement is local in the cover*. The structural statement composes with the platform's other Mayer–Vietoris-grounded theorems ([replica-mayer-vietoris](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/replica-mayer-vietoris.md), [crdt-convergence-via-mayer-vietoris](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/crdt-convergence-via-mayer-vietoris.md), [coordination-cohomologically-bounded-by-h1](coordination-cohomologically-bounded-by-h1.md)) to give a uniform cohomological account of the platform's distribution and coordination disciplines.
