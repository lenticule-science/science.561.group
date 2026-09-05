---
type: morphism
class: natural-transformation
symbol: "\\odot"
depends-on: [predication-fiber-algebra, knowledge-order, bilattice, stratified-predication-fiber, presheaf-indexed-fiber]
see-also: [bilattice-homomorphism, twist-product-fusion, settling-merge-semilattice, projection-merge-naturality]
---

# Knowledge-join merge

The **knowledge-join merge**, denoted $\odot$, is the binary operation on a [presheaf-indexed fiber](teaching/explanations/presheaf-indexed-fiber.md) that combines two atom-collections into a single atom-collection by:

1. **Atom union** at the underlying [stratified predication fiber](../objects/stratified-predication-fiber.md) $A^{\flat}_p$ — the merged atom set is the union of the two operands' atom sets, modulo de-duplication by *canonical atom identity*. Two atoms share canonical identity iff they agree on the full canonical-form tuple $(s, p, o, \mathrm{stratum}, \mathrm{peer}, \mathrm{session}, \mathrm{ord}, \mathrm{deps}, \mathrm{derived\text{-}via})$ — i.e. they are byte-identical canonical-form records (per [hash-injectivity-under-canonical-form](../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/hash-injectivity-under-canonical-form.md)).
2. **Per-canonical-identity knowledge-order join** on the value field. Atoms sharing canonical identity but carrying distinct values $v, v'$ — which can arise only from independently-derived value computations on the same full identity (e.g. two replicas of the same substrate computing the same atom under non-deterministic floating-point ordering, then reconciling) — are merged to a single atom whose value is $v \vee_k v'$ in the [knowledge order](teaching/explanations/knowledge-order.md) of the [bilattice](../objects/bilattice.md). Atoms that share only cell coordinate $(s, p, o)$ but differ on any context-tuple coordinate (stratum, peer, session, ord, deps, derived_via) are **distinct atoms** under $\odot$ — they are *both* retained as separate entries; no value-join fires.
3. **Per-coordinate atom retention** across strata, peers, sessions, and ordinals: atoms at the same cell coordinate $(s, p, o)$ but distinct context-tuple coordinates are *all* retained in the merge, per the [stratified predication fiber](../objects/stratified-predication-fiber.md)'s atoms-not-modified-in-place discipline. The merge does not collapse strata, peers, sessions, or ordinals — it accumulates by atom-set union and joins values only on full-canonical-identity equality.

As a morphism in the predication-categories ambient, $\odot$ is a *natural transformation* between presheaves: for the diagonal-then-merge composite $\Delta \colon \mathcal{F} \to \mathcal{F} \times \mathcal{F}$ followed by $\odot$, the naturality square commutes against every restriction morphism in the [presheaf-indexed fiber](teaching/explanations/presheaf-indexed-fiber.md)'s context category $\mathcal{C}_{\mathrm{sub}}$. This is the [projection-merge naturality theorem](../theorems/projection-merge-naturality.md).

## Algebraic properties

On a single fiber $A^{\flat}_p$, $\odot$ is a $\vee_k$-semilattice operation:

| Property | Statement | Source |
|---|---|---|
| Commutative | $H_1 \odot H_2 = H_2 \odot H_1$ | $\vee_k$ is commutative on the bilattice; atom union is commutative. |
| Associative | $(H_1 \odot H_2) \odot H_3 = H_1 \odot (H_2 \odot H_3)$ | $\vee_k$ is associative; atom union is associative. |
| Idempotent | $H \odot H = H$ | $\vee_k$ is idempotent; atom union with self is identity. |
| Identity | $H \odot \emptyset = H$ | $\emptyset$ is the empty atom collection. |

These four properties make $(A^{\flat}_p, \odot, \emptyset)$ a *bounded join-semilattice*. Combined with the substrate's content-addressed identity (per [hash-injectivity-under-canonical-form](../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/hash-injectivity-under-canonical-form.md)), $\odot$ is the join operation of a state-based CRDT — the substrate's [federation convergence](../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/federation-convergence.md) rests on this.

## Action on stratified atoms

Because [stratified predication fiber](../objects/stratified-predication-fiber.md) emits new atoms rather than modifying existing ones, $\odot$ on stratified atoms is precisely *atom-set union with per-canonical-identity $\vee_k$ on the value field*. Concretely, for two stratified fibers $H_1, H_2$:

- A coordinate $(s, p, o)$ may carry multiple atoms in each operand at distinct context-tuple coordinates (stratum, peer, session, ord); the merge retains all of them as distinct atoms.
- Two atoms agreeing on the *full* canonical-identity tuple but differing in value are joined: the merge contains a single atom at that identity with value $v_1 \vee_k v_2$. (In practice this is rare and arises only from independent re-derivation of the same identity under value-level non-determinism — typically a federation-reconciliation event, never a normal closure-rule firing.)
- Two atoms agreeing on $(s, p, o)$ but differing on any context-tuple coordinate — including different stratum, different peer, different session, different ord, different `deps`, or different `derived_via` — are *distinct* atoms; both are retained verbatim and no value-join fires between them.
- Witness chains $\mathrm{deps}$ on retained atoms are preserved verbatim from their originating fiber. Where the rare full-identity-equal case fires, the new atom's $\mathrm{deps}$ is the union of the operands' deps, recording both derivations of the same canonical atom.

This stratum-respecting merge is what makes the substrate's federation receive a knowledge-monotone operation: the merge cannot demote, modify, or erase atoms; it can only add atoms or raise per-cell values in $\le_k$. The [settling monotonicity](teaching/explanations/settling-monotonicity.md) condition is satisfied at each $\odot$-step.

## Naturality with respect to projection

For a restriction morphism $f \colon c' \to c$ in the [presheaf-indexed fiber](teaching/explanations/presheaf-indexed-fiber.md)'s context category $\mathcal{C}_{\mathrm{sub}}$, $\mathcal{F}(f) \colon \mathcal{F}(c) \to \mathcal{F}(c')$ is the atom-set restriction to atoms admitted by the narrower context. The naturality of $\odot$ asserts:

$$
\mathcal{F}(f)(H_1 \odot H_2) \;=\; \mathcal{F}(f)(H_1) \odot \mathcal{F}(f)(H_2).
$$

The right-to-left direction is immediate: every atom on the right also appears on the left (atoms admitted by the narrower context are a subset of atoms admitted by either operand alone). The left-to-right direction requires that $\mathcal{F}(f)$ is determined by per-atom *admission predicates* on the operand atoms — equivalently, that the narrower context's admission criterion is a function of each atom alone, not of the surrounding atom set. The substrate's context coordinates (stratum, peer, session, ord) all satisfy this — each coordinate's admission predicate consults a single field on the atom record. Hence the naturality square commutes; this is the content of [projection-merge naturality](../theorems/projection-merge-naturality.md).

## Position

The knowledge-join merge is the primary mutation morphism of the substrate. Three downstream structural facts rest on it:

- **CRDT convergence** via the bounded join-semilattice structure — peers exchanging fibers and merging by $\odot$ converge to the same fiber regardless of message order.
- **Projection-merge naturality** via the per-atom admission criterion — per-context reads commute with merges, making content-addressed projection caches structurally coherent.
- **Stratified federation receive** via stratum-respecting atom retention — peers at distinct stratum-trust levels (per [federation-trust-bilattice-graded](../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/federation-trust-bilattice-graded.md)) merge their fibers without losing or conflating closure-degrees.

Engineering-side, $\odot$ surfaces in the substrate as the `merge_peer_fiber` operation in the network layer and the cumulative-history collation in the projection-materialisation operation. Both are wire-form realisations of the math morphism; both inherit its naturality.
