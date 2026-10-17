---
type: theorem
class: engineering-claim
status: proved
depends-on:
  - sharding
  - consistent-hashing
  - shard-record
  - parameter-base-category
  - predication-fibration
  - predication-fiber-functor
  - predicate-generator-pullback-closure
  - scope-cover-via-grothendieck-site
  - replica-cover
  - replica-mayer-vietoris
  - bilattice-network-sheaf-consensus
  - join-reordering-via-beck-chevalley
  - cross-peer-stratum-projection-via-naturality
  - settlement-determinism
see-also:
  - cluster-as-replica-cover
  - distributed-lock-as-residuated-authority-gate
  - consistent-hashing-minimal-movement
  - scope-cover-via-grothendieck-site
---

# Sharding is a pullback-stable jointly-surjective family on the entity-set component of the parameter-base; the substrate's distribution discipline is the lift of that family through the predication fibration

**Claim.** A [sharding](teaching/explanations/sharding.md) configuration on the substrate, as recorded by a family of [shard-records](../objects/shard-record.md), is *not* a coordination primitive sui generis: it is the substrate-content surface of a covering family in the [parameter-base category](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/parameter-base-category.md) $\mathbf{B}$, lifted through the [predication fibration](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md) $p : \mathcal{E} \twoheadrightarrow \mathcal{C}$ to a covering family in the substrate's scope-Grothendieck site of [scope-cover-via-grothendieck-site](../../../theorems/scope-cover-via-grothendieck-site.md). Concretely, write the sharding configuration as the cover-data

$$\{E_i \xhookrightarrow{\iota_i} E\}_{i \in I}$$

with $E$ the entity-set component of the substrate's parameter-base, $E_i = \chi^{-1}(i)$ the preimage of shard-id $i$ under the *substrate-content* characteristic morphism $\chi : E \to I$, and $\iota_i$ the disjoint subobject inclusions. Then:

0. **Pullback-stability is a precondition.** The substrate's sharding cover is admissible only when $\chi$ is a $\mathbf{B}$-morphism — equivalently, when $\chi$ depends only on entity-content recorded in $\mathbf{B}$ and not on substrate state outside $\mathbf{B}$ (e.g., load, latency, current health). On the entity-set side this is the standard $\mathbf{Set}$-fact that preimages of disjoint sets along a $\mathbf{Set}$-morphism are again disjoint (and pullback-stable, since pullbacks in $\mathbf{Set}$ are intersections); on the predicate-category side, [predicate-generator-pullback-closure](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/predicate-generator-pullback-closure.md) supplies the analogous fact when the sharding is composed with a sub-support change in $\mathcal{C}$. Without pullback-stability of $\chi$, the lift through $p$ is not functorial in base-change and the platform's cover-respecting read theorems silently fail. State-dependent routing must be implemented as *re-sharding under an updated stable $\chi$*, not as runtime branching inside a fixed $\chi$.

1. **Cover lift through the fibration.** The cover $\{E_i \to E\}$ on the entity-set component lifts through $p$ to a cover $\{\sigma_i \to \sigma\}$ in the substrate's scope-Grothendieck site, with $\sigma_i$ the scope whose entity-set component is $E_i$ and other components inherited from $\sigma$. The lift is functorial along base-change in $\mathbf{B}$ by the cloven-fibration discipline of [predication-fibration](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md) (A2)–(A3). Per [scope-cover-via-grothendieck-site](../../../theorems/scope-cover-via-grothendieck-site.md), the lifted family is a Grothendieck cover.

2. **Cross-shard reads are sheaf-condition reads.** A read at the unsharded scope $\sigma$ reduces to a coordinated read across the cover $\{\sigma_i \to \sigma\}$ via the sheaf condition. The reconstruction is the identity case of [bilattice-network-sheaf-consensus](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md) — under disjoint sharding, $\sigma_i \cap \sigma_j$ is empty for $i \neq j$, and the cellwise $\bigvee_k$-merge degenerates to disjoint union. When $\mathcal{F}$ satisfies the full hypothesis of [replica-mayer-vietoris](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/replica-mayer-vietoris.md) — i.e., is a [KZ-coherent sheaf](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/kz-coherent-sheaf.md) on the bitopological settling site, valued in the abelian-style codomain that theorem requires (which the predication-fibration case satisfies per [predication-fiber-algebra](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) and [settling-associated-sheaf-well-defined](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/settling-associated-sheaf-well-defined.md)), the iterated 2-cover application of replica-Mayer-Vietoris collapses across the N-ary partition (each pairwise overlap is empty so each long exact sequence collapses to a biproduct), giving $H^n(\sigma, \mathcal{F}) \cong \bigoplus_i H^n(\sigma_i, \mathcal{F})$ by induction on $N$. For the read itself, only the sheaf-condition equalizer is needed — no cohomology — and that case is immediate from disjoint-union covers and standard sheaf theory. The substrate's sharding-aware query layer is the cover-respecting read implementation; no cross-shard coordination is needed for per-shard-local queries.

3. **Cross-shard joins reduce to Beck–Chevalley.** A query joining cells from $E_i$ and $E_j$ requires the reindexing functor along the join-key projection morphism $f : E_i \times E_j \to E$. Per [join-reordering-via-beck-chevalley](../../../theorems/join-reordering-via-beck-chevalley.md), the join is structurally a pullback in $\mathcal{C}$ and the planner can re-order the joins to push the cross-shard pullback toward the side with the smaller fiber. The substrate's planner does not need a "cross-shard join" primitive; it has a Beck–Chevalley square and a sharding cover.

4. **Cross-shard transactions are Mayer–Vietoris gluings (degenerate to two-phase commit on disjoint covers).** A transaction touching $E_i$ and $E_j$ is a request for a global section of the transaction-sheaf over $\sigma_i \cup \sigma_j$. Under disjoint sharding the overlap $\sigma_i \cap \sigma_j$ is empty and per [replica-mayer-vietoris](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/replica-mayer-vietoris.md) the gluing condition is trivially satisfied — but the substrate must still ensure that *both* per-shard sub-transactions commit atomically, which is the engineering content of two-phase commit. Per [quorum-consensus-safety](quorum-consensus-safety.md), the atomic-commit decision is itself a quorum decision on a meta-cluster spanning the participating shards; the safety of the cross-shard transaction is one application of [distributed-lock-as-residuated-authority-gate](distributed-lock-as-residuated-authority-gate.md) to the commit-token.

5. **Per-shard replica covers compose with the partition cover.** A sharded-and-replicated substrate has, per shard $i$, a [replica cover](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/replica-cover.md) $\{U_{i,j} \to E_i\}_j$, and at the top a partition cover $\{E_i \to E\}_i$. Per the standard composition of Grothendieck covers (covers are closed under composition in the site), the doubly-indexed family $\{U_{i,j} \to E\}_{i,j}$ is itself a cover. The platform's per-shard quorum theorems ([cluster-as-replica-cover](teaching/explanations/cluster-as-replica-cover.md), [quorum-consensus-safety](quorum-consensus-safety.md), [distributed-lock-as-residuated-authority-gate](distributed-lock-as-residuated-authority-gate.md)) lift to the doubly-indexed cover automatically.

The substrate's sharding module is therefore an instance of two existing structural facts in composition — Grothendieck-covering on $\mathbf{B}$ and fibration lift to scopes — not a fresh primitive. The four engineering invariants — single-shard locality, cross-shard read soundness, cross-shard join correctness, and atomic cross-shard commit — are each one corpus-level theorem away.

## Setup

Fix a substrate parameter-base $B = (\mathbf{L}, \mathcal{C}, E, \lambda) \in \mathbf{B}$ per [parameter-base-category](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/parameter-base-category.md). Fix a finite shard-index set $I = \{1, \ldots, N\}$ and a $\mathbf{B}$-morphism $\chi : E \to I$ on the entity-set component (with $I$ taken with the trivial preorder, so $\chi$ is automatically order-preserving). Define $E_i := \chi^{-1}(i) \hookrightarrow E$ and $\iota_i : E_i \hookrightarrow E$ the inclusion.

Per the [predication-fiber-functor](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/predication-fiber-functor.md) $F : \mathcal{C}^{\mathrm{op}} \to \mathbf{DBiLat}(\mathbf{L})$, the inclusions $\iota_i$ act on fibers by reindexing $\iota_i^* : A_E \to A_{E_i}$ — restriction of the cell-set $\mathbf{L}^{\bowtie E \times E}$ to its sub-cell-set $\mathbf{L}^{\bowtie E_i \times E_i}$ (in disjoint sharding; under non-disjoint sharding the off-diagonal cells $E_i \times E_j$ for $i \neq j$ are reindexed to the relevant cross-shard fiber).

Per [self-representation](../../teaching/explanations/self-representation.md), the cover-data $(\chi, \{E_i\}, \{\iota_i\}, \{S_i\})$ — including the per-shard owning substrate-instance assignment $S_i$ — is recorded as substrate content in the cluster of [shard-records](../objects/shard-record.md).

## Statement

**Theorem (sharding as fibration-pullback cover).** *With $B, \chi, \{E_i\}, \{\iota_i\}, \{S_i\}$ as above, and $\chi$ a $\mathbf{B}$-morphism (Setup precondition):*

1. **Cover validity.** *The family $\{E_i \xrightarrow{\iota_i} E\}_{i \in I}$ is a covering family in $\mathbf{B}$'s entity-set component (jointly surjective by $\chi$ being well-defined; pairwise pullback-stable by [predicate-generator-pullback-closure](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/predicate-generator-pullback-closure.md) applied to the subobject inclusions).*

2. **Fibration lift.** *The reindexing functors $\iota_i^* : \mathcal{E}_E \to \mathcal{E}_{E_i}$ assemble into a cover $\{\sigma_i \to \sigma\}$ in the substrate's scope-Grothendieck site per [scope-cover-via-grothendieck-site](../../../theorems/scope-cover-via-grothendieck-site.md). The lift is functorial along base-change in $\mathbf{B}$ by [predication-fibration](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md) (A2)–(A3).*

3. **Sheaf-condition read.** *For any [settling-associated sheaf](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-associated-sheaf.md) $\mathcal{F}$ on the substrate's scope, $\mathcal{F}(\sigma) \cong \mathrm{eq}\bigl( \prod_i \mathcal{F}(\sigma_i) \rightrightarrows \prod_{i,j} \mathcal{F}(\sigma_i \cap \sigma_j) \bigr)$ — the sheaf condition. Under disjoint sharding the equalizer reduces to $\prod_i \mathcal{F}(\sigma_i)$, so a substrate-level read at $\sigma$ is the disjoint product of per-shard reads.*

4. **Cross-shard join correctness.** *A query joining $E_i$ and $E_j$ along key projection $f$ has its result determined by the Beck–Chevalley square in $\mathcal{C}$ on the pullback $E_i \times_E E_j$; per [join-reordering-via-beck-chevalley](../../../theorems/join-reordering-via-beck-chevalley.md), the planner can re-order joins along any base-admissible re-ordering without changing the result.*

5. **Cross-shard projection naturality.** *Per [cross-peer-stratum-projection-via-naturality](../../../theorems/cross-peer-stratum-projection-via-naturality.md), per-shard projections commute with the merge $\odot$: $\pi_c(\bigoplus_i H_i) = \bigoplus_i \pi_c(H_i)$. The substrate's sharded-projection layer inherits the naturality identity for free.*

## Proof

Each clause is a one-step reduction.

**(1) Cover validity.** Joint surjectivity: $\bigcup_i E_i = \bigcup_i \chi^{-1}(i) = \chi^{-1}(I) = E$ since $\chi$ is total. Pairwise pullback-stability: for any $\mathbf{B}$-morphism $g : E' \to E$, the pullbacks $E' \times_E E_i$ exist in $\mathbf{B}$'s entity-set component (which is $\mathbf{Set}$, where pullbacks of subobjects are intersections of preimages), and the family $\{E' \times_E E_i \to E'\}_i$ is again jointly surjective with characteristic morphism $\chi \circ g$. By [predicate-generator-pullback-closure](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/predicate-generator-pullback-closure.md), the resulting subobjects remain in the four-generator closure of $\mathcal{C}$, so the cover survives reindexing along any predicate-category morphism. $\square$

**(2) Fibration lift.** Per [predication-fibration](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md) (A2), each $\iota_i : E_i \hookrightarrow E$ — a subject-projection generator on the entity-set component — induces a reindexing functor $\iota_i^* : \mathcal{E}_E \to \mathcal{E}_{E_i}$. By (A3), each $\iota_i^*$ is a bilattice-residuated homomorphism. By the cleavage discipline, the system of $\iota_i^*$ is functorial in base-change. Per [scope-cover-via-grothendieck-site](../../../theorems/scope-cover-via-grothendieck-site.md), a family of cleavage-coherent reindexing functors arising from a covering family in $\mathbf{B}$ is a covering family in the substrate's scope-site. $\square$

**(3) Sheaf-condition read.** The settling-associated sheaf is a sheaf on the bitopological settling site per [settling-associated-sheaf-well-defined](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/settling-associated-sheaf-well-defined.md), hence satisfies the sheaf equalizer condition for every cover. Under disjoint sharding, $E_i \cap E_j = \emptyset$ for $i \neq j$, so $\sigma_i \cap \sigma_j$ is the bottom scope and $\mathcal{F}(\sigma_i \cap \sigma_j)$ is terminal; the equalizer collapses to the product. $\square$

**(4) Cross-shard join correctness.** The join-result fiber is $\exists_f^k(E_i \times E_j \to E)$ in the predication hyperdoctrine; per [predicate-generator-pullback-closure](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/predicate-generator-pullback-closure.md), the pullback $E_i \times_E E_j$ exists in $\mathcal{C}$, and per [join-reordering-via-beck-chevalley](../../../theorems/join-reordering-via-beck-chevalley.md) the Beck–Chevalley square on the pullback commutes; the planner's re-ordering preserves the result. $\square$

**(5) Cross-shard projection naturality.** Each shard $i$ contributes a fiber-history $H_i$ over its scope $\sigma_i$. The merge $\bigoplus_i H_i$ is the disjoint-union direct sum (since shards are disjoint, no overlap merge is needed). Per [cross-peer-stratum-projection-via-naturality](../../../theorems/cross-peer-stratum-projection-via-naturality.md), $\pi_c$ is a presheaf morphism that commutes with $\odot$; on disjoint coproducts, presheaf morphisms commute with the coproduct. $\square$

## Engineering consequence

- **Sharding has no separate primitive in the substrate.** A substrate that already implements the predication fibration $p$ (per [predication-fibration](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md) and [scope-cover-via-grothendieck-site](../../../theorems/scope-cover-via-grothendieck-site.md)) and the substrate-content cover-data discipline (per [self-representation](../../teaching/explanations/self-representation.md)) gets sharding *for free*. There is no `shard-router` subsystem to ship; there is one cleavage of the fibration, one cover-respecting read implementation, and one substrate-content table $(\chi, \{S_i\})$, parameterized by the chosen sharding function.
- **The pullback-stability discipline is the substrate's policy choice.** Per clause (0)/(1), $\chi$ must be a $\mathbf{B}$-morphism; this is the engineering content of "shard by stable entity-content, not by runtime state." Substrates that route by load, latency, or current health are computing a different $\chi$ at every request — they have no fixed cover, hence no Mayer–Vietoris invariance, hence no minimal-movement guarantee under change ([consistent-hashing-minimal-movement](consistent-hashing-minimal-movement.md) clause (3) silently fails). Such substrates must implement load balancing as *re-sharding* (a recorded base-change in $\mathbf{B}$), not as runtime branching.
- **Cross-shard primitives compose with per-shard primitives by site composition.** Per clause (5) of the main claim, the doubly-indexed cover $\{U_{i,j} \to E\}_{i,j}$ from per-shard replica covers composing with the partition cover is itself a Grothendieck cover. The platform's per-shard quorum, locking, and consensus theorems lift to the doubly-indexed cover without re-derivation. Cross-shard transactions are *one* application of [distributed-lock-as-residuated-authority-gate](distributed-lock-as-residuated-authority-gate.md) to the commit-token across the meta-cluster of participating shards.
- **Sharded reads are projections-then-merges or merges-then-projections, interchangeably.** Per clause (5), the projection naturality lifts from cross-peer to cross-shard. The substrate's per-shard projection caches are coherent with cross-shard merges; the dev-spec-level `PCC_PROJECTION_DIVERGED` invariant of [cross-peer-stratum-projection-via-naturality](../../../theorems/cross-peer-stratum-projection-via-naturality.md) extends to per-shard projections without modification.

## What the theorem rules out

- **Sharding without a substrate-content $\chi$.** A substrate that knows "which shard holds which entity" only by computation, never by substrate content, cannot present the cover to the audit layer; the cover-refinement morphism for migration cannot be witnessed; clause (5)'s naturality cannot be checked.
- **Sharding by state-dependent $\chi$.** Per clause (0), $\chi$ must be a $\mathbf{B}$-morphism. State-dependent routing produces a runtime-dependent cover that does not pull back; the fibration lift is not functorial, and the platform's cover-respecting read theorems silently fail. Such substrates may *appear* correct under steady state and produce inconsistent reads under churn.
- **Sharding without joint surjectivity.** Per clause (1), $\chi$ must be total. A partial $\chi$ leaves cells unreachable; a multi-valued "$\chi$" admits two-holder ambiguities not resolvable by Mayer–Vietoris (and inherits the same prohibition as the lock's two-holder case in [distributed-lock-as-residuated-authority-gate](distributed-lock-as-residuated-authority-gate.md) clause (3)).
- **"Sharding" disciplines whose cover changes silently.** Per the cohomological-invariance clause of [consistent-hashing-minimal-movement](consistent-hashing-minimal-movement.md), the cover-refinement morphism must be substrate-content-witnessed. A substrate that mutates the shard table without writing the migration through the closure-rule engine breaks both this theorem's clause (1) (the cover is no longer a recorded $\mathbf{B}$-morphism) and the audit substrate's ability to certify migration correctness.

## What the theorem requires

- The substrate implements the predication fibration $p : \mathcal{E} \twoheadrightarrow \mathcal{C}$ per [predication-fibration](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md) (A1)–(A3).
- The substrate implements the scope-Grothendieck site per [scope-cover-via-grothendieck-site](../../../theorems/scope-cover-via-grothendieck-site.md).
- The shard characteristic $\chi : E \to I$ is a $\mathbf{B}$-morphism — depends only on entity-content recorded in the parameter-base.
- The cover-data $(\chi, \{E_i\}, \{S_i\})$ is recorded as substrate content per [self-representation](../../teaching/explanations/self-representation.md).
- Migration events are written through the closure-rule engine per [witness-as-cell](../../../theorems/witness-as-cell.md), so cover-refinement morphisms are substrate-content artifacts.

## Position

This theorem is the bridge between the engineering concept *sharding* and the math apparatus *fibration + Grothendieck-cover + Mayer–Vietoris*. It plays the same role for sharding that [cluster-as-replica-cover](teaching/explanations/cluster-as-replica-cover.md) plays for clustering and that [distributed-lock-as-residuated-authority-gate](distributed-lock-as-residuated-authority-gate.md) plays for distributed locks: it names the structural identification once, so downstream theorems can cite a single anchor rather than re-deriving it.

The downstream theorems that benefit:

- [consistent-hashing-minimal-movement](consistent-hashing-minimal-movement.md) reads as a Mayer–Vietoris cover-refinement fact on the cover this theorem identifies.
- [quorum-consensus-safety](quorum-consensus-safety.md) on cross-shard meta-clusters reads as the doubly-indexed-cover lift of the per-shard case.
- [federation-convergence](../../../theorems/federation-convergence.md) on a sharded substrate reads as cover-respecting federation per clause (5).

The unifying narrative is [cohomology-as-coordination-substrate](teaching/explanations/cohomology-as-coordination-substrate.md), which already covers the per-shard replica-cover layer; this theorem extends the coverage to the cross-shard partition-cover layer in the same site.
