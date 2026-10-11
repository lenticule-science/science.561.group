---
type: theorem
class: engineering-claim
status: proved
depends-on: [scope, parameter-base-category, predicate-category, predication-fibration, bitopological-settling-site, predicate-generator-pullback-closure]
see-also: [replication-consistency-via-network-sheaf, predicate-pushdown-via-frobenius]
---

# Substrate scopes form a Grothendieck site

**Claim.** The substrate's collection of [scope](teaching/explanations/scope.md)s carries a Grothendieck topology $J$ on the [parameter-base category](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/parameter-base-category.md) $\mathcal{C}$: a family of sub-scope morphisms $\{f_i : \sigma_i \to \sigma\}$ is a *covering family* exactly when their joint image-pullbacks reconstruct the predication state at $\sigma$. The substrate's scope-cover discipline is exactly the sheaf condition on $(\mathcal{C}, J)$, and a substrate-level read at $\sigma$ is structurally reducible to coordinated reads at any cover.

## Why this holds

Per [parameter-base-category](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/parameter-base-category.md), the substrate's parameter-base $\mathcal{C}$ is a category of admissible scopes with morphisms recording inclusion / projection. Per [predication-fibration](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md), the assignment $\sigma \mapsto A_\sigma$ is a fibration: substitution $f^* : A_{\sigma'} \to A_\sigma$ is functorial along $\mathcal{C}$-morphisms.

Per [predicate-generator-pullback-closure](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/predicate-generator-pullback-closure.md), the predicate-category generators are closed under pullback: pullbacks of generator morphisms by other generator morphisms remain in the generator class. This is the structural condition that makes the Grothendieck-topology axioms admissible:

- **Identity.** $\{1_\sigma : \sigma \to \sigma\}$ is trivially a cover.
- **Stability under pullback.** If $\{f_i : \sigma_i \to \sigma\}$ is a cover and $g : \sigma' \to \sigma$ any morphism, then $\{g^*f_i : \sigma' \times_\sigma \sigma_i \to \sigma'\}$ is a cover. This requires the pullbacks $\sigma' \times_\sigma \sigma_i$ to exist in $\mathcal{C}$; per [predicate-generator-pullback-closure](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/predicate-generator-pullback-closure.md), they do.
- **Transitivity.** If $\{f_i : \sigma_i \to \sigma\}$ is a cover and each $\{g_{ij} : \sigma_{ij} \to \sigma_i\}$ is a cover of $\sigma_i$, then $\{f_i \circ g_{ij}\}$ is a cover of $\sigma$. The composite is a $\mathcal{C}$-morphism per the parameter-base category's composition.

The covering criterion — that joint pullbacks reconstruct the predication state at $\sigma$ — is the substrate-side of the bitopological-settling-site cover discipline (per [bitopological-settling-site](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bitopological-settling-site.md)): a cover is a family whose joint preimages saturate the cell-set at the covered scope.

## Engineering consequence

- **Sheaf-condition reads.** A substrate-level read at $\sigma$ may be implemented as coordinated reads at any cover $\{\sigma_i\}$: reconstruct the $\sigma$-state by gluing $\sigma_i$-states along their overlap-pullbacks. This is the substrate's structural mechanism for distributed reads, sharded queries, and federation projections.
- **Cover-respecting writes.** A write at $\sigma$ projects to writes at each $\sigma_i$ via the substitution functors $f_i^*$. Per the sheaf condition, the $\sigma_i$-writes glue back to the $\sigma$-write iff they agree on overlaps.
- **Cover-aware compaction.** Per [compaction-via-cosettling-equivalence-class](compaction-via-cosettling-equivalence-class.md), compaction at $\sigma$ may be performed cover-by-cover: compact each $\sigma_i$ independently, then glue the compacted representatives via the cover.
- **Grothendieck-site federation.** Federation across substrates is structurally a morphism of sites $(\mathcal{C}_1, J_1) \to (\mathcal{C}_2, J_2)$. Per the standard sheaf-theoretic framework, federation respects covers: a federated read against $\sigma$ on substrate-1 corresponds to a coordinated cover on substrate-2.

## What the theorem rules out

- **Scopes without covers.** A scope that admits no covers (other than the trivial $\{1_\sigma\}$ cover) is not a useful site element — it cannot be decomposed into sub-scopes for distributed reads or sharded queries. Per the parameter-base-category framing, every non-trivial scope admits at least one non-trivial cover.
- **Non-stable covers.** A scope-cover discipline that doesn't pull back along arbitrary $\mathcal{C}$-morphisms is not a Grothendieck topology — it cannot support cover-respecting reads. The substrate refuses such disciplines.
- **Cover-incoherent reads.** A read at $\sigma$ via cover $\{\sigma_i\}$ that produces a different result than a direct read at $\sigma$ violates the sheaf condition. Per [witness](teaching/explanations/witness.md), the discrepancy is auditable; per [repair](teaching/explanations/repair.md), it requires resolution.

## What the theorem requires

- The parameter-base category $\mathcal{C}$ admits the pullbacks needed for cover-stability (per [predicate-generator-pullback-closure](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/predicate-generator-pullback-closure.md)).
- The substrate's scope-cover discipline is *recorded* as substrate content: which families count as covers is itself a substrate predication, not implicit runtime behavior.
- The substrate's reads against scopes respect the covering criterion: a cover-based read produces the same result as a direct read.

## Position

Together with [replication-consistency-via-network-sheaf](replication-consistency-via-network-sheaf.md), this theorem grounds the substrate's scope and replica disciplines in the Grothendieck-site / sheaf-theoretic foundation already established in [bitopological-settling-site](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bitopological-settling-site.md). Scope-decomposition for distributed substrate operations, replication-consensus for multi-replica coordination, and federation for cross-substrate gluing are all structurally the same phenomenon: sheaf-condition gluing on a Grothendieck site whose objects are admissible substrate regions.
