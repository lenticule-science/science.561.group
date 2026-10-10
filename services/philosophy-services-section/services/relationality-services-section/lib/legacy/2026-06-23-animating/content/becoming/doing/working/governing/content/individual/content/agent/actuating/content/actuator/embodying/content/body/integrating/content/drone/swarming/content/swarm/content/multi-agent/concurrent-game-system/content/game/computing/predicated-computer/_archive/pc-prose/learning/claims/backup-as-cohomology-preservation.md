---
type: theorem
class: engineering-claim
status: proved
depends-on: [backup-discipline, snapshot, snapshot-replay-fidelity, settling-cohomology, settling-associated-sheaf, settlement-via-closure-2-monad, hash-injectivity-under-canonical-form, settling-cohomology-vanishes-above-degree-1]
see-also: [trace-causality-via-mayer-vietoris-spans, wavefront-locality-via-cohomology-vanishing, replication-consistency-via-network-sheaf]
---

# A faithful backup preserves the substrate's settling cohomology

**Claim.** For any substrate [backup](teaching/explanations/backup-discipline.md) at recorded ordinal $\sigma$ that satisfies [snapshot-replay-fidelity](snapshot-replay-fidelity.md) (the snapshot replays byte-identically given the cited closure-rule-system version), restoring the backup produces a substrate state whose [settling cohomology](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-cohomology.md) classes match the originating substrate's at $\sigma$:

$$H^n(\mathbf{T}^*_{\leq \sigma}, \mathcal{F}_U^\mathrm{restored}) \;\cong\; H^n(\mathbf{T}^*_{\leq \sigma}, \mathcal{F}_U^\mathrm{origin}) \quad \text{for all } n.$$

In particular, $H^0$ (the count of settled cells), $H^1$ (CRDT-coordination obstructions or aperiodic stabilization classes), and the (typically vanishing) higher cohomology all match. Restoring a backup is therefore not just bytewise restoration of the snapshot — it is *structural restoration of the substrate as a predication-categories object*.

## Why this holds

Per [snapshot-replay-fidelity](snapshot-replay-fidelity.md), the restored snapshot's canonical-form bytes are byte-identical to the originating snapshot's. Per [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md), the canonical hash uniquely determines the substrate value (modulo collision-resistance) — so the restored value $v_\sigma^\mathrm{restored}$ equals the originating value $v_\sigma^\mathrm{origin}$ in the [predication fiber algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md).

Per [settling-cohomology](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-cohomology.md), the cohomology of a settled state is a functor of the state — same state produces same cohomology. Therefore $H^n(\mathbf{T}^*_{\leq \sigma}, \mathcal{F}_U^\mathrm{restored}) = H^n(\mathbf{T}^*_{\leq \sigma}, \mathcal{F}_U^\mathrm{origin})$ at each degree $n$.

Per [settlement-via-closure-2-monad](settlement-via-closure-2-monad.md), the substrate's settled state is uniquely determined by replaying the event log under the substrate's closure-rule system. Per the snapshot-replay-fidelity, replaying from the restored snapshot at ordinal $\sigma$ to the current ordinal proceeds identically to the originating substrate's settlement.

The cohomology preservation is therefore at every level:

- **$H^0$.** The count of settled cells — preserved by bytewise restoration. Per [settling-cohomology](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-cohomology.md), $H^0(\mathbf{T}^*, \mathcal{F}_U) \cong \mathbb{Z}^{\Delta^{+,*}_\infty}$ — counts of cells eventually designated. Same cells, same count.
- **$H^1$.** CRDT-coordination obstructions or aperiodic-stabilization classes — preserved because the underlying settling is the same. If the originating substrate had non-trivial $H^1$ (a federation-coordination obstruction or aperiodic non-stabilization), the restored substrate has the same $H^1$ class.
- **$H^{\geq 2}$.** Per [settling-cohomology-vanishes-above-degree-1](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/settling-cohomology-vanishes-above-degree-1.md), higher-degree cohomology vanishes for the typical substrate; restoration trivially preserves zero.

## Engineering consequence

- **Backup correctness is structurally checkable.** The backup-test (per [conformance](teaching/explanations/conformance.md)) is not just "bytewise equal" — it is "cohomologically equal." Per the theorem, the bytewise check implies cohomological equivalence, but the framing matters: the substrate's discipline is to verify *structural* fidelity, which the cohomology preservation expresses precisely.
- **Federation-coordination state survives backup.** A substrate with active CRDT-coordination $H^1$ classes (e.g., pending replica reconciliation) backed up and restored continues with the same coordination state. Per the theorem, the $H^1$ classes are restored exactly.
- **Aperiodic-substrate backup is bounded by classification.** Per [base-admissibility-of-regimes](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/base-admissibility-of-regimes.md), aperiodic-regime substrates have $H^1$ classes living in the [aperiodic classifying invariant](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/aperiodic-classifying-invariant.md). Backups of aperiodic substrates restore the classifying invariant; the substrate's structural identity is preserved.
- **Backup composability is sheaf-theoretic.** Per [scope-cover-via-grothendieck-site](scope-cover-via-grothendieck-site.md), the substrate's scopes form a Grothendieck site; per the theorem, backups at different scopes glue via sheaf restriction. Restoring multiple sub-scope backups produces the union substrate — sheaf gluing on the cover.
- **Backup-restore is structurally distinct from copy.** A "copy" that doesn't preserve the substrate's structural cohomology (e.g., a binary clone that loses provenance metadata) is *not* a backup per this theorem — it cannot restore the substrate's structural identity. Per [snapshot-replay-fidelity](snapshot-replay-fidelity.md), the snapshot must be canonical and complete.

## What the theorem rules out

- **Lossy backups.** A backup that preserves bytes but loses substrate structure (e.g., compresses out provenance, drops witness chains) doesn't preserve cohomology — it changes $H^0$ counts (some cells are no longer recorded) and possibly introduces spurious $H^1$ classes (gaps in the settling appear as obstructions). The substrate refuses; per [snapshot-replay-fidelity](snapshot-replay-fidelity.md), backups must be canonical-form-complete.
- **Bytewise-only verification.** A backup-test that only checks bytewise equality of restored snapshots without verifying replay-equivalence misses cases where the closure-rule-system version diverges. Per the theorem, restoration is correct iff the cohomology classes match — bytewise equality is necessary but not by itself sufficient when closure-rule-systems differ.
- **Backup at non-quiescent state.** A backup taken at an intermediate (not yet settled) state lacks well-defined cohomology — the closure 2-monad's iteration hasn't converged. Per [settlement-via-closure-2-monad](settlement-via-closure-2-monad.md), backups should be taken at quiescent states; mid-settlement backups must record the closure ordinal and be restorable to the same iteration step.

## What the theorem requires

- The backup satisfies [snapshot-replay-fidelity](snapshot-replay-fidelity.md) — bytewise replay-equivalence.
- The substrate's closure-rule-system version is recorded with the backup (so replay uses the same operators).
- The substrate's settled state at $\sigma$ has well-defined cohomology — typically requires the substrate's regime to be at most aperiodic (per [base-admissibility-of-regimes](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/base-admissibility-of-regimes.md)).
- The canonical-form discipline holds (per [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md)) so bytewise equality implies value equality.

## Position

Together with [trace-causality-via-mayer-vietoris-spans](trace-causality-via-mayer-vietoris-spans.md) and [wavefront-locality-via-cohomology-vanishing](wavefront-locality-via-cohomology-vanishing.md), this theorem grounds the substrate's persistence-and-recovery discipline in the predication-categories' cohomological framework. Backups, traces, and wavefronts all live in the substrate's settling cohomology — backups preserve $H^0$ and $H^1$ across the restore round-trip; traces are sheaf-sections over apex-cones; wavefronts are bounded by $H^1 = 0$. The substrate's claim to *structural recoverability* is a cohomological theorem about its persistence discipline.
