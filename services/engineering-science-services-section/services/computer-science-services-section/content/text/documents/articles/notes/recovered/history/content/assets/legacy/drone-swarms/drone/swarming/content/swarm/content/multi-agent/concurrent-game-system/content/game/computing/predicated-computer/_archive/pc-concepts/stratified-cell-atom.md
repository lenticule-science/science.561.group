---
type: concept
class: substrate-content
depends-on: [closure-rule, closure-rule-record, fiber, witness, sigma-delta-pass-decomposition, hash-discipline]
see-also: [closure-kind, repair-resolution-state-as-substrate-content, settlement-determinism, federation-trust-bilattice-graded]
---

# Stratified cell atom

A **stratified cell atom** is the substrate-side wire-form of an atom in a [stratified predication fiber](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/stratified-predication-fiber.md): a cell record carrying, in addition to its $(s, p, o, v)$ payload and substrate metadata, a **stratum tag** $\in \{\textsf{"asserted"}, \textsf{"saturated"}, \textsf{"settled"}\}$ together with a **witness chain** (`derived_from`, `derived_via`) for atoms at strata above $\textsf{"asserted"}$.

The stratum tag is a property of the *atom*, not of the fiber it participates in or the projection a reader sees. Two atoms at the same coordinate $(s, p, o)$ but at different strata are distinct cell records, distinct substrate content, and distinct entries in the event log. A reader sees a stratum-tagged value via a stratum-indexed projection per [sigma-delta-pass-decomposition](sigma-delta-pass-decomposition.md); a reader without an explicit stratum receives the substrate's default-projection commitment (settled) per [default-projection-is-global-section-of-fixed-fiber](../theorems/default-projection-is-global-section-of-fixed-fiber.md) when stated.

## Wire-form schema

A stratified cell atom carries four substrate-canonical fields beyond the underlying $(s, p, o, v)$ payload:

| Field | Type | Required when | Meaning |
|---|---|---|---|
| `stratum` | string ∈ `{"asserted", "saturated", "settled"}` | always (v0.1+) | The closure-degree at which the atom was emitted: stratum $0$, $1$, or $2$ in the math. |
| `derived_from` | array of cell-ids | `stratum != "asserted"` | The strictly-lower-stratum (or strictly-earlier-σ-layer) atoms whose values justified this atom's emission. The substrate's wire-form encoding of $\mathrm{deps}$ on the [stratified predication fiber](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/stratified-predication-fiber.md). |
| `derived_via` | string | `stratum != "asserted"` | The closure operator that produced the atom: a [closure-rule](../objects/closure-rule.md) `id` (stratum $1$) or an algebraic operator marker (stratum $2$, e.g. `"⊙-stabilize"`, `"⇒-stabilize"`). |
| `step_ord` | integer | always | The trajectory ordinal at which the atom was emitted within the originating `respond` invocation; required for the per-artifact hash-chain verification per [repair-log-hash-chain-as-per-artifact-merkle-projection](../theorems/repair-log-hash-chain-as-per-artifact-merkle-projection.md). |

The four fields together let a verifier reconstruct the per-atom witness chain, the closure operator that emitted the atom, and the position of the emission in the global lex-canonical trajectory — without re-running settlement.

## Lifecycle

A stratified cell atom is created by exactly one of three substrate operations:

1. **Phase 2 admission.** An external sender's payload is decomposed into asserted atoms; each atom is emitted with `stratum = "asserted"`, empty `derived_from`, and no `derived_via`. The `step_ord` is the Phase 2 admission ordinal.
2. **σ-pass firing.** A closure-rule firing produces stratum-$1$ atoms. Each emitted atom carries `stratum = "saturated"`, a `derived_from` listing the firing's premise atoms, and `derived_via` set to the firing rule's `id`. The `step_ord` is the trajectory ordinal of the firing in the [lex-canonical trajectory](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/canonical-firing-trajectory-via-lex-order.md).
3. **Δ-pass stabilization.** A per-cell bilattice-stabilization step produces stratum-$2$ atoms. Each emitted atom carries `stratum = "settled"`, a `derived_from` listing the cell's stratum-$0$ and stratum-$1$ atoms whose values were composed in the per-cell $T_a$-orbit, and `derived_via` set to the algebraic-operator marker `"⊙-stabilize"`, `"⇒-stabilize"`, or `"T_a-orbit"` per the substrate's per-cell convention.

A cell atom is *never modified in place* once emitted. A subsequent change at the same coordinate $(s, p, o)$ — at any stratum — is a *new* cell atom with a new `step_ord`, written to the event log as a new event. This is the wire-form expression of the [stratified-predication-fiber](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/stratified-predication-fiber.md)'s atoms-not-modified-in-place discipline; without it, per-artifact contiguity per [per-artifact-trajectory-projection-is-contiguous](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/per-artifact-trajectory-projection-is-contiguous.md) fails and the substrate's hash-chain audit becomes unverifiable.

## Stratum-as-cell-content vs. stratum-as-fiber-property

Two structurally different framings of stratification exist in the corpus, and conflating them produces specifications whose correctness arguments cite the wrong invariant. The substrate's commitment is to **stratum-as-cell-content**:

- **Stratum-as-cell-content.** The stratum tag is a per-atom field on the cell record. Two atoms at the same coordinate may carry different stratum tags; both are persisted; both contribute to the substrate's audit content. The fiber as a whole is the disjoint union of the three sub-presheaves indexed by stratum.
- **Stratum-as-fiber-property.** The stratum tag is a property of a *fiber snapshot* — a collection of atoms — not of individual atoms. A snapshot at stratum $\textsf{"settled"}$ contains *only* atoms whose stratum is settled; the snapshot itself carries the stratum tag, and the per-atom tag is implicit.

The dev spec commits to the former: per [stratified-facts](../../../../../../../../operations/engineering/tools/predication-computer/pypredcomp/docs/dev/specs/kernel/stratified-facts.md) §1, "the stratum is a property of the cell atom, not of the fiber snapshot. A cell atom carries one stratum; a fiber snapshot inherits its stratum from the presheaf projection that produced it." This is the substrate's wire-form commitment.

The fiber-snapshot framing remains useful for *projection discipline*: a snapshot's stratum tag is the materialisation of `project_stratum(fiber, s)`, where the projection is a function on the underlying atom-tagged fiber. The two framings compose: the per-atom tag is the primary source of truth; the per-snapshot tag is a derived label correctly attached to projections.

## Replay attestability

A verifier replaying a `respond` invocation against the same asserted premises MUST produce, for each emitted stratum-$> 0$ atom, the same `derived_from` set and the same `derived_via` value. A divergence in `derived_from` is `PCC_WITNESS_DIVERGED` per the dev spec's error catalogue. The math foundation is the lex-canonical trajectory's uniqueness per [canonical-firing-trajectory-via-lex-order](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/canonical-firing-trajectory-via-lex-order.md): the trajectory is the unique sequence of firings under the lex key, and each firing emits exactly one well-defined witness chain.

A substrate that emits atoms with non-deterministic `derived_from` — e.g., recording premise atoms in worker-thread arrival order rather than canonical lex order — is non-conformant, even if the *set* of premise atoms is correct. The substrate's commitment is byte-identity on `derived_from`, not just set-identity.

## Federation-handshake content

When a peer ships cell atoms across a federation boundary, the stratum tag and witness chain are part of the wire-form payload. Per the stratified-facts §5 peer-stratum policy, a peer may contribute `"asserted"` atoms freely; `"saturated"` and `"settled"` atoms from a peer are absorbed only if the peer's authority fiber explicitly grants `derivation-trust`. A peer that ships stratum-$> 0$ atoms without `derivation-trust` has its atoms demoted to `"asserted"` at receive time — the receiving substrate runs its own σ-pass, deriving fresh stratum-$1$ atoms with `derived_from` chains rooted in the demoted atoms.

The federation-receive demotion is *not* the same as a stratum violation: the original peer's stratum-tagged atom is recorded at receive as a *fresh* asserted atom whose substrate identity is the receiver's, with provenance metadata on `derived_via` recording the source peer. The peer's original stratum-$1$ derivation is not preserved unless `derivation-trust` is in force; the receiving substrate's σ-pass produces a new (potentially different) saturated derivation against the receiver's local rule system.

## Position

The stratified cell atom is the substrate's commitment to "every fact carries its closure-degree on its sleeve." It is the wire-form lift of the math-side [stratified predication fiber](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/stratified-predication-fiber.md), and the structural carrier of three downstream substrate disciplines:

- **Retraction correctness** per [dependent-invalidity-via-saturated-retraction](../theorems/dependent-invalidity-via-saturated-retraction.md): the witness chain on each saturated atom is what the σ-pass walks to compute dependent invalidity in linear time.
- **Repair-log hash-chain verification** per [repair-log-hash-chain-as-per-artifact-merkle-projection](../theorems/repair-log-hash-chain-as-per-artifact-merkle-projection.md): the `step_ord` and per-coordinate atom identity is what makes the per-artifact projection contiguous.
- **Federation-receive policy** per [federation-trust-bilattice-graded](../theorems/federation-trust-bilattice-graded.md): the stratum tag is what the receiving substrate consults when deciding whether to absorb a peer's atom directly or run its own σ-pass against it.

Without the stratification commitment at the cell-atom level — i.e., if all atoms were stored as identical EAVT entries indistinguishable by closure-degree — none of the three disciplines is wire-form-verifiable. The substrate would still *settle* correctly (the math says so), but it would not be *auditable*, *retractable*, or *federable* under the dev spec's commitments.
