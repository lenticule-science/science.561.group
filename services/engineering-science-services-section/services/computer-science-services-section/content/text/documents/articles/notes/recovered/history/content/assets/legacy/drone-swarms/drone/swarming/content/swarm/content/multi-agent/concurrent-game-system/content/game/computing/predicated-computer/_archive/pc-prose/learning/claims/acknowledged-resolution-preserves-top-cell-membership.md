---
type: theorem
class: engineering-claim
status: proved
depends-on: [inconsistency-sheaf-record, repair-as-top-cell-resolution, paraconsistency-as-substrate-discipline, audit-content-via-inconsistency-sheaf-cohomology, settlement-determinism, witness]
math-depends-on: [repair-resolution-poset]
see-also: [query-inconsistency-cohomology, federation-trust-bilattice-graded, regime-classification-for-substrate]
---

# Acknowledged resolution preserves $\top$-cell membership

**Claim.** Let $w$ be a $\top$-cell witness in the [inconsistency-sheaf-record](../objects/inconsistency-sheaf-record.md) at coordinate $(s, p, o)$, with substrate-resolution state in the [repair-resolution poset](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/repair-resolution-poset.md) $W$ (with kind-labelled refinement $W^{\flat}$). If the substrate transitions $w$ to $\textsf{resolved}$ via the **acknowledgement shortcut arrow in $W^{\flat}$** (kind $\kappa = \textsf{acknowledge}$, no $\textsf{proposed}$ intermediate), then:

1. The underlying cell $(s, p, o)$ **remains** a member of `top-cells` in the inconsistency-sheaf record. Its valuation in the [predication fiber algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) is unchanged by the acknowledgement.
2. The cell continues to contribute to the substrate's $H^0$ count of live contradictions when audit queries set `include_resolved=False`, because it is a *member* contradiction; only the witness's resolution-status flag flips.
3. The cell does **not** acquire a coboundary contributor at its firing ordinal: the $H^1$-class associated with the witness is unchanged.
4. By contrast, an $\textsf{affirm}$ or $\textsf{retract}$ resolution (kind $\kappa \in \{\textsf{affirm}, \textsf{retract}\}$) appends a later cell whose σ/Δ closure clears the $\top$-valuation of $(s, p, o)$; the resolved cell is then no longer in `top-cells` at its post-resolution step ordinal, and the $H^1$-class at the firing ordinal acquires a coboundary contributor.

The substrate is therefore obliged to expose two distinct counts to audit clients: (a) un-resolved contradictions (state $\in \{\textsf{open}, \textsf{proposed}\}$) and (b) resolved-but-extant contradictions (state $= \textsf{resolved}$, kind $= \textsf{acknowledge}$). Acknowledged-resolved contradictions are operationally distinct from cleared-resolved contradictions in cohomological consequence and audit-retention semantics.

## Why this holds

**Part 1 — acknowledgement is a recorded recognition, not a closure operation.** Per [inconsistency-repair §3.3](../../../../../../../../operations/engineering/tools/predication-computer/pypredcomp/docs/dev/specs/kernel/inconsistency-repair.md), an acknowledgement transition is the appending of a substrate cell `(witness-id, acknowledged, ack-cell-id) = t`. This cell is itself a fact about the witness, not about $(s, p, o)$. The substrate's σ/Δ closure on the acknowledgement cell does not target $(s, p, o)$ and therefore cannot reduce its $\le_k$ valuation from $\top$ — by [settlement-determinism](settlement-determinism.md), valuations move only under closure, and no closure-rule fires on the acknowledgement.

**Part 2 — the inconsistency-sheaf-record's `top-cells` is determined by valuation, not by witness state.** Per [inconsistency-sheaf-record](../objects/inconsistency-sheaf-record.md) §"Invariants" (`$\top$-cell membership is the bilattice fact`), a cell is in `top-cells` iff its predication-valuation at quiescence equals $\top$. The witness's `repair_resolution.state` is a bookkeeping field on the witness; it is not consulted in computing `top-cells` membership. Hence Part 2: the cell's membership is unchanged by the acknowledgement.

**Part 3 — $H^1$-class membership is a property of the firing-ordinal pattern.** Per the [d-frame H¹-generator at NSC firing](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/d-frame-h1-generator-at-nsc-firing.md) construction, an $H^1$ generator $D_\mu$ at a non-Scott-continuous firing ordinal $\mu$ records the firing event itself — the structural moment when a $\top$-firing first introduced a contradicted cell. Acknowledgement does not retroactively change $\mu$; the firing happened. Hence the $H^1$-class is unchanged.

The contrast with $\textsf{affirm}/\textsf{retract}$ is the substantive content of [repair-as-top-cell-resolution](repair-as-top-cell-resolution.md): an affirming or retracting cell whose σ/Δ closure produces a non-$\top$ valuation at $(s, p, o)$ does change the cell's bilattice value. The cell exits `top-cells` at the post-resolution step ordinal, and its trajectory acquires a *coboundary* — a chain along which the $H^1$ class is realised as zero. Acknowledgement introduces no such coboundary because no clearing cell is appended.

**Part 4 — the substrate is paraconsistent, so audit content survives.** Per [paraconsistency-as-substrate-discipline](paraconsistency-as-substrate-discipline.md), the substrate continues to reason over the `top-cells` set without trivialisation; the acknowledged-resolved cells contribute to audit content even after their witness is marked $\textsf{resolved}$. This is the engineering reading of "$\textsf{acknowledge}$ records that the contradiction is recognised."

## Engineering consequence

- **The audit-cohomology query must expose two resolution channels.** A `query_inconsistency_cohomology(include_resolved=False)` call excludes both $\textsf{affirm}/\textsf{retract}$-resolved and $\textsf{acknowledge}$-resolved witnesses; an `include_resolved=True` call includes both. There is also a third channel: `include_resolved="acknowledge_only"`, returning the witnesses whose contradictions are recognised-but-extant. This is the audit surface a substrate operator consults to track contradictions known and accepted by the organisation but not yet cleared by closure.
- **`top-cells` count diverges from `unresolved-witness` count.** A substrate with $n$ acknowledged-resolved witnesses has $|\text{top-cells}| = (\text{unresolved}) + n + (\text{cleared-and-still-listed-pre-compaction})$; the divergence is structural, not a bug. Audit dashboards that conflate the two counts under-report acknowledged contradictions.
- **Federation handshake must communicate kind alongside state.** A peer receiving a witness with `repair_resolution.state = "resolved"` cannot infer whether the underlying cell is still $\top$ without the kind field. The kind label is therefore federation-content even when the state alone might be considered sufficient for endpoint convergence.
- **Compaction discipline differs across kinds.** Per [compaction-via-cosettling-equivalence-class](compaction-via-cosettling-equivalence-class.md), the substrate may compact event sequences that are equivalent under cosettling. Cleared-resolved witnesses become candidates for compaction once their resolution closure is durable; acknowledged-resolved witnesses do not, because the underlying cell remains $\top$ and the contradiction is still substrate content. The compaction policy must consult `kind`.

## What the theorem rules out

- **An audit client treating $\textsf{resolved}$ as equivalent to "no longer a contradiction".** Per Parts 1–3, $\textsf{resolved}$ with $\kappa = \textsf{acknowledge}$ leaves the contradiction extant. The audit client must consult `kind` to interpret the resolution.
- **A substrate that auto-promotes acknowledgement to clearance.** A substrate that, on observing an acknowledgement cell, also synthesises a clearing cell (asserting $f$ at $(s, p, o)$) has conflated two distinct dispositions. The math separates them; the substrate should too. If the operator wants the contradiction cleared, the operator emits a $\textsf{retract}$ candidate.
- **A federation peer that strips `kind` on transmission.** A peer that ships only `state` and elides `kind` causes the receiver to mis-classify acknowledged-resolved as cleared-resolved, producing divergent audit counts post-merge.
- **A retention policy that archives acknowledged-resolved witnesses on the same schedule as cleared-resolved.** Acknowledged contradictions remain extant; their witnesses are the substrate's record of recognition. Retention must keep them queryable as long as the underlying cell is still in `top-cells`.

## What the theorem requires

- The substrate uses the [repair-resolution poset](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/repair-resolution-poset.md) $W$ as the resolution-state carrier and records the kind label on each transition arrow (i.e., honours the $W^{\flat}$ refinement).
- The [inconsistency-sheaf-record](../objects/inconsistency-sheaf-record.md) computes `top-cells` membership from the bilattice valuation, not from the resolution state.
- The substrate is paraconsistent per [paraconsistency-as-substrate-discipline](paraconsistency-as-substrate-discipline.md).
- The substrate's σ/Δ closure does not fire on acknowledgement cells (acknowledgement cells live in a meta-predicate space addressing witnesses, not in the cell-coordinate space of the contradicted predications).

## Position

This theorem clarifies the substrate's repair-tracking semantics for clients that treat $\textsf{resolved}$ as a single category. It is the engineering-side reading of the [repair-resolution poset](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/repair-resolution-poset.md)'s kind-labelled refinement $W^{\flat}$ — specifically, that the kind of arrow into $\textsf{resolved}$ is what carries the cohomologically-relevant content. Together with [audit-content-via-inconsistency-sheaf-cohomology](audit-content-via-inconsistency-sheaf-cohomology.md) (audit content is sheaf cohomology) and [repair-as-top-cell-resolution](repair-as-top-cell-resolution.md) (repair operates on $\top$-cells), it completes the substrate's repair-tracking discipline by distinguishing the two dispositions a resolution can occupy: contradiction-cleared and contradiction-recognised.
