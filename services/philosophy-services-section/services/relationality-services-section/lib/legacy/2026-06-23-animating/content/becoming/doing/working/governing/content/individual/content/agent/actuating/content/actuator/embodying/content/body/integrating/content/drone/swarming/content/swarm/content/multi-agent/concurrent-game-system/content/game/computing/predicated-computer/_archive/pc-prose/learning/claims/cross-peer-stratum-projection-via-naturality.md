---
type: theorem
class: engineering-claim
status: proved
depends-on: [federation-convergence, cache-coherence-via-functorial-projection, hash-injectivity-under-canonical-form, stratified-cell-atom, federation-trust-bilattice-graded]
math-depends-on: [projection-merge-naturality, cumulative-stratum-projection-naturality, knowledge-join, presheaf-indexed-fiber]
see-also: [cross-peer-trajectory-ordering-is-content-addressed, witness-lifecycle-trajectory-is-regime-conditional-federation-content]
---

# Cross-peer stratum projection via naturality

**Claim.** Let $L$ be a substrate node with local fiber-history $H_L$ for some entity, and let $P$ be a federation peer shipping its own fiber-history $H_P$ for the same entity. For any context coordinate $c \in \mathcal{C}_{\mathrm{sub}}$ — most commonly $c = (\mathrm{stratum} = s, \star, \star, \infty)$ for $s \in \{0, 1, 2\}$ — the substrate's federation-receive operation has the structural property:

$$
\pi_c(H_L \odot H_P) \;=\; \pi_c(H_L) \;\odot\; \pi_c(H_P),
$$

where $\odot$ is the [knowledge-join merge](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/knowledge-join.md) (substrate name: `merge_peer_fiber`) and $\pi_c$ is the per-context restriction (substrate name: `project_stratum`, `project_stratum_at_or_below`, `project_by_peer`, `project_by_session`, etc.). The substrate's `PCC_PROJECTION_DIVERGED` startup-and-receive invariant is exactly this identity.

Three engineering consequences:

1. **Federation-receive does not require global re-projection.** When peer $P$ ships its per-stratum projection $\pi_c(H_P)$ rather than its full history $H_P$, the local node computes $\pi_c(H_L) \odot \pi_c(H_P)$ to obtain the correct $\pi_c(H_L \odot H_P)$. No round-trip to fetch $H_P$'s full history is required for the per-context read to be correct.
2. **Per-stratum projection caches are coherent under federation.** When peer $P$ ships fiber atoms and local node $L$ has a materialised $\$ROOT/fibers/<entity>/by-stratum/<s>.json$ cache, the post-merge cache is exactly $\pi_{= s}(H_L) \odot \pi_{= s}(H_P)$. The cache rebuild from history matches the cache obtained by direct merge — same bytes, same hash.
3. **`PCC_PROJECTION_DIVERGED` is a structural invariant, not a coincidence.** A divergence between the merged-then-projected and projected-then-merged paths is mechanically attributable to one of three faults: (a) non-canonical atom identity (an atom's context-coordinate fields differ between the two paths), (b) a non-stratum-respecting merge (the merge modifies stratum on an atom), or (c) a non-presheaf admission criterion (the projection's admission consults surrounding atoms rather than per-atom fields).

## Why this holds

Per [projection-merge-naturality](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/projection-merge-naturality.md), the math morphism $\odot$ is a natural transformation against every restriction morphism in $\mathcal{C}_{\mathrm{sub}}$. Per [cumulative-stratum-projection-naturality](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/cumulative-stratum-projection-naturality.md), the cumulative-stratum projection is one such restriction. The substrate's federation-receive operation is a wire-form realisation of $\odot$ on the [stratified cell atom](teaching/explanations/stratified-cell-atom.md) presheaf; its per-context projections are wire-form realisations of $\pi_c$. The structural identity transports through the wire-form.

Two engineering checks must hold for this transport to be sound:

- **Atom identity is canonical.** The substrate's atom identity per [stratified-cell-atom](teaching/explanations/stratified-cell-atom.md) includes `(s, p, o, stratum, peer, session, step_ord, derived_from)` — the full context tuple. Per [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md), atoms with the same canonical-form bytes have the same hash, and the substrate's de-duplication key in $\odot$ is canonical-form atom identity. Two co-positioned atoms from local and peer histories are merged iff their full context tuples coincide.
- **Merge does not modify stratum.** The substrate's `merge_peer_fiber` operation is set-union over canonical-form atom identity with per-canonical-identity $\vee_k$ on values; it does not touch the `stratum` field of any atom. Stratum-respecting receive policy per [federation-trust-bilattice-graded](federation-trust-bilattice-graded.md) and the [stratified-cell-atom](teaching/explanations/stratified-cell-atom.md) federation-handshake content handles trust *before* admission, by demoting peer atoms to `"asserted"` at receive time when the peer lacks `derivation-trust`. The demotion produces a *fresh* atom at the receiver's stratum, which then participates in $\odot$ as a stratum-$0$ atom. This is consistent with the math: the demoted atom is a different atom (different `peer` and `derived_via` fields), so $\odot$ treats it as a distinct entry.

Combining: the substrate's federation-receive is exactly the math morphism $\odot$ on the canonical context category, and its per-context projections are exactly $\pi_c$. The naturality square commutes by [projection-merge-naturality](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/projection-merge-naturality.md).

## The conformance check at boot and at receive

The dev spec's `PCC_PROJECTION_DIVERGED` invariant fires in two places:

- At boot, the substrate compares its persisted by-stratum projection files against a fresh recompute from history; bytes must match.
- On federation receive, the substrate computes both `local_projection ⊙ peer_projection` and `project(local_history ⊙ peer_history, s)`; bytes must match.

Both checks are *the same naturality identity* — the boot check is the special case where peer projection is empty (identity merge) and history merge is the local history alone. A substrate that fails either check is structurally non-conformant in one of the three ways listed above.

## Cross-context composition

The naturality holds against every restriction morphism in $\mathcal{C}_{\mathrm{sub}}$, so it composes across contexts. Three useful composite forms:

- **By-peer-then-by-stratum**: $\pi_{\mathrm{stratum}=s} \circ \pi_{\mathrm{peer}=P_0}$ on the merged history equals the merge of by-peer-then-by-stratum projections of each operand. The substrate's `by-peer/peer:<peer-id>/by-stratum/<s>.json` projection (when implemented per the dev spec's v0.2 task t02-114) inherits the cross-peer naturality automatically.
- **By-session-then-by-stratum**: similarly. A session boundary's per-stratum projection is the cumulative session-restricted reading.
- **By-ord-then-by-stratum** (time-travel reads): $\pi_{\mathrm{ord} \le \tau_0} \circ \pi_{\mathrm{stratum}=s}$ gives the historical at-or-before-ord projection at stratum $s$. The naturality means the historical projection commutes with merge — useful for replay-attestation per [recovery-via-event-log-replay-determinism](recovery-via-event-log-replay-determinism.md).

## What this rules out

- **Federation-receive that re-derives during merge.** A substrate whose `merge_peer_fiber` runs σ- or Δ-passes during merge is composing $\odot$ with derivation; the composite is *not* a presheaf morphism — derivation depends on surrounding atoms. The substrate's discipline keeps merge and derivation separate; if a fresh saturation is desired, the substrate runs σ-pass *after* merge as a distinct operation that emits stratum-$1$ atoms with the merged-fiber's atoms as premises.
- **Projection caches updated by partial diffs.** A substrate that updates its `by-stratum/<s>.json` cache by applying received atoms incrementally — without recomputing from the projection of the merged history — relies on naturality for correctness. Per the theorem, this is sound *if and only if* the increment respects the merge and projection morphisms; substrates that take shortcuts (e.g., appending peer atoms to the cache without checking stratum admission) silently break naturality and produce caches that diverge from the recompute.
- **Peer atoms with non-canonical context tuples.** A peer that ships atoms with a renamed `peer` field (e.g. its own local-shorthand id rather than its substrate identity) admits atoms whose admission predicates evaluate inconsistently. The substrate's federation-handshake must canonicalise context coordinates before admission; per [stratified-cell-atom](teaching/explanations/stratified-cell-atom.md) federation-handshake-content, the receiver's substrate identity is the canonical `peer` for receiver-side atoms, and the sender's substrate identity is the canonical `peer` for sender-side atoms.
- **Projections whose admission depends on the surrounding fiber.** A "highest-only" projection — "show the highest-stratum atom at each cell coordinate" — depends on co-coordinate atoms and is *not* a presheaf restriction. The substrate's discipline exposes such reads as a *post-projection* operation on the result of a presheaf-natural projection, not as a context coordinate.

## What this requires

- The substrate honours the canonical atom identity per [stratified-cell-atom](teaching/explanations/stratified-cell-atom.md), including all context-coordinate fields.
- The merge operation `merge_peer_fiber` is the [knowledge-join](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/knowledge-join.md) — atom-union with per-canonical-identity $\vee_k$ on values.
- Per-context projections are implemented as per-atom-admission filters on context-coordinate fields, not as derivation operations.
- Hash injectivity holds per [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md), giving canonical-form atom identity its operational force.
- Stratum-trust handling per [federation-trust-bilattice-graded](federation-trust-bilattice-graded.md) is performed before admission, not during merge.

## Position

This theorem is the engineering surface that lifts the math projection–merge naturality square to the substrate's federation discipline. It backs three dev-spec commitments that previously rested on appeal-to-naturality without an explicit theorem:

- The dev spec's `PCC_PROJECTION_DIVERGED` invariant — at boot and at federation receive — is exactly this identity.
- The dev spec's "federation merges commute with stratum reads" claim (per [projection-naturality](../../../../../../../../operations/engineering/tools/predication-computer/pypredcomp/docs/dev/specs/kernel/projection-naturality.md) §2) is the engineering surface of the naturality square.
- The dev spec's "per-peer / per-session projections are first-class" claim is the cross-context composition of the naturality square.

Together with [cache-coherence-via-functorial-projection](cache-coherence-via-functorial-projection.md), this theorem completes the substrate's projection-discipline trilogy: caches are content-addressed and structurally coherent, projections are presheaf morphisms, and the merge of histories commutes with every projection. The substrate's projection layer is therefore *structurally* federation-compatible, not by enforcement; a conformant implementation cannot observe `PCC_PROJECTION_DIVERGED` against a conformant peer.
