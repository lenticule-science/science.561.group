---
type: theorem
class: engineering-claim
status: proved
depends-on: [witness, repair, attack-surface, inconsistency-sheaf, inconsistency-sheaf-record, query-inconsistency-cohomology, paraconsistent-settling-associated-sheaf, settling-cohomology, paraconsistent-equality, four-bilattice]
see-also: [inconsistency-sheaf-record, query-inconsistency-cohomology, encryption-as-visibility-restriction-via-invisible-automorphism, repair-as-top-cell-resolution, federation-trust-bilattice-graded]
---

# Audit content lives in the inconsistency sheaf's cohomology

**Claim.** For any substrate's audit-relevant content — contradictions, attack-surface exploitations, federation conflicts, repair invocations — the substrate's structural record is *the [inconsistency sheaf](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/inconsistency-sheaf.md) $\mathcal{F}_U^{(\top)}$* of the substrate's settling, separated from the truth-side content via the short exact sequence

$$0 \,\to\, \mathcal{F}_U^{(t)} \,\to\, \mathcal{F}_U^{(k)} \,\to\, \mathcal{F}_U^{(\top)} \,\to\, 0.$$

The substrate's audit operations — anomaly detection, attack-pattern identification, repair-history queries — are structurally cohomology computations on $\mathcal{F}_U^{(\top)}$. Per [paraconsistent-equality](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/paraconsistent-equality.md), the substrate carries $\top$-cells without trivialization, so the audit cohomology is well-defined regardless of how many contradictions accumulate.

## Why this holds

Per [inconsistency-sheaf](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/inconsistency-sheaf.md), the [paraconsistent settling-associated sheaf](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/paraconsistent-settling-associated-sheaf.md) decomposes into truth-side and inconsistency-side components:

$$\mathcal{F}_U^{(k)} \;\cong\; \mathcal{F}_U^{(t)} \,\oplus\, \mathcal{F}_U^{(\top)}$$

with $\mathcal{F}_U^{(\top)}(q, \tau, U) = \mathbb{Z}^{\Delta^{+, *, \top}_\tau(q) \cap U}$ — the free abelian group on newly-added $\top$-cells (cells that received contradictory predications) lying in the pairwise-Stone clopen $U$.

For substrate audit:

**Part 1: $\top$-cells are exactly contradiction events.** Per [bilattice-network-sheaf-consensus](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md), $\top$-cells are the substrate's structural representation of contradictory information from multiple sources. Per [federation-trust-bilattice-graded](federation-trust-bilattice-graded.md), federation conflicts produce $\top$-cells. Per [encryption-as-visibility-restriction-via-invisible-automorphism](encryption-as-visibility-restriction-via-invisible-automorphism.md), failed-decryption attempts can produce $\top$-cells when contradictory access claims are recorded. The inconsistency sheaf records all such events.

**Part 2: Audit queries are sheaf-cohomology computations.** Per [settling-cohomology](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-cohomology.md), the cohomology of $\mathcal{F}_U^{(\top)}$ provides:

- **$H^0(\mathcal{F}_U^{(\top)})$** — the count of $\top$-cells across the substrate's history. The substrate's "how many contradictions has this region accumulated" query is exactly $H^0$.
- **$H^1(\mathcal{F}_U^{(\top)})$** — gluing failures of contradictions across covers. The substrate's "are these contradictions related?" query is the $H^1$ obstruction class.
- **Long exact sequence terms** — the truth-knowledge cohomology long exact sequence (per [inconsistency-sheaf](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/inconsistency-sheaf.md)) gives the relationship between the contradictions and the underlying truth-side content.

**Part 3: Audit doesn't trivialize despite contradictions.** Per [paraconsistent-equality](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/paraconsistent-equality.md), the substrate's reasoning continues despite $\top$-cells (no ex falso quodlibet). The audit cohomology is therefore well-defined regardless of how many $\top$-cells accumulate; the substrate doesn't "break" under contradictions, it records them.

## Engineering consequence

- **Anomaly detection is cohomology computation.** A "is this attack pattern present?" query is a structural query on $\mathcal{F}_U^{(\top)}$ — does the inconsistency sheaf have a particular signature in its cohomology? Per the theorem, this query is well-defined and computable.
- **Attack-surface exploitation has cohomological signature.** Per [attack-surface](teaching/explanations/attack-surface.md), adversarial inputs that succeed in producing inconsistencies appear as $\top$-cells. Per the theorem, the substrate can audit the inconsistency-sheaf cohomology to detect attack patterns: repeated $\top$-cells from a particular source, $H^1$ classes connecting distant contradictions, etc.
- **Federation-conflict audit is structurally distinct from truth-side audit.** Per [bilattice-network-sheaf-consensus](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md), federation conflicts produce con-failure cells (i.e., $\top$-cells); per the theorem, these are structurally separate from the truth-side cohomology — auditing federation conflicts is auditing $\mathcal{F}_U^{(\top)}$, not $\mathcal{F}_U^{(t)}$.
- **Repair-invocation history is queryable cohomologically.** Per [repair-as-top-cell-resolution](repair-as-top-cell-resolution.md), every repair operates on a $\top$-cell. Per the theorem, the repair history is the trace of $\top$-cell resolutions in the inconsistency sheaf — queryable per the substrate's audit discipline.
- **Audit retention can be cohomology-class-aware.** A retention policy that preserves all $H^1$-class representatives but summarizes $H^0$-only entries reduces storage while preserving structural audit-content. Per the theorem, this policy is structurally well-defined.

## What the theorem rules out

- **Audit without paraconsistent equality.** A substrate that crashes on contradiction (treating $\top$ as ex falso) cannot accumulate the inconsistency sheaf — the audit content is destroyed at the first contradiction. Per [paraconsistent-equality](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/paraconsistent-equality.md), the substrate's discipline forbids this.
- **Audit content stored separately from substrate.** A substrate that stores audit data in an external system (a separate audit DB, a SIEM platform) without substrate-content reflection is not implementing this theorem — the cohomology cannot be computed if the data isn't substrate content.
- **Audit aggregation that ignores cohomology classes.** A summary that counts $\top$-cells without preserving the cohomological structure (which classes are connected via $H^1$) loses structural audit content. Per the theorem, the cohomology is the substrate's audit-truth.
- **Audit trivialization on encrypted regions.** Per [encryption-as-visibility-restriction-via-invisible-automorphism](encryption-as-visibility-restriction-via-invisible-automorphism.md), encrypted content is in the invisible part for non-recipients. Audit on encrypted regions requires recipient-substrate access (decryption); per the theorem, non-recipient substrates can only audit the wrapper-level $\top$-cells (failed-decryption attempts, signature failures), not the encrypted-content's inconsistencies.

## What the theorem requires

- The substrate's value-domain admits the bilattice $\top$ value (per [four-bilattice](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/four-bilattice.md) or richer bilattices).
- The substrate's reasoning is paraconsistent (per [paraconsistent-equality](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/paraconsistent-equality.md)).
- The settling-associated sheaf decomposes into truth-side and inconsistency-side components (per [paraconsistent-settling-associated-sheaf](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/paraconsistent-settling-associated-sheaf.md)).
- Audit operations are recorded as substrate content (per [witness](teaching/explanations/witness.md), [self-representation](teaching/explanations/self-representation.md)).
- The substrate hosts the inconsistency sheaf as a substrate-resident object per [inconsistency-sheaf-record](../objects/inconsistency-sheaf-record.md) (or computes it on demand from the [event log](../objects/event-log.md) per the equivalent contract).
- Audit operations invoke the substrate's [query-inconsistency-cohomology](../morphisms/query-inconsistency-cohomology.md) primitive for cohomology evaluation.

## Position

Together with [encryption-as-visibility-restriction-via-invisible-automorphism](encryption-as-visibility-restriction-via-invisible-automorphism.md) and [repair-as-top-cell-resolution](repair-as-top-cell-resolution.md), this theorem grounds the substrate's audit-and-security discipline in the predication-categories' inconsistency-sheaf framework. Audit content, encryption-visibility, and repair-resolution all operate on the substrate's $\top$-cells; the structural framework is the inconsistency sheaf and its cohomology. The substrate's claim to *meaningful audit despite distributed contradictions* is a cohomological theorem about its paraconsistent value-domain.

The substrate-level realizations of the math object are [inconsistency-sheaf-record](../objects/inconsistency-sheaf-record.md) (the inconsistency sheaf as substrate content) and [query-inconsistency-cohomology](../morphisms/query-inconsistency-cohomology.md) (the audit-cohomology primitive that operates on the record). Together, these promote the structural claim ("audit content lives in the cohomology of $\mathcal{F}_U^{(\top)}$") to a concrete engineering interface ("audit operations call `query-inconsistency-cohomology` on the substrate's inconsistency-sheaf record").
