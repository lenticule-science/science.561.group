---
type: concept
class: pattern
depends-on: [witness, four-bilattice, paraconsistent-equality, bilattice-network-sheaf-consensus, predication-fiber-algebra]
see-also: [fuel-bound, two-store-coherence, repair-as-top-cell-resolution]
---

# Repair

The action of restoring a substrate invariant that an operator's input would otherwise violate, recorded as a [witness](witness.md)-chain entry rather than performed silently. In the substrate's hyperdoctrine setting, repair is not arbitrary fix-up logic — it is *the discipline for resolving cells that have settled at $\top$ in the [predication fiber algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md)*. A $\top$-cell is the substrate's structural representation of "told both" — two sources, both valid, asserting contradictory values; per [bilattice-network-sheaf-consensus](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md), $\top$-cells are exactly the $\mathrm{con}$-failure cells in the substrate's d-frame structure. Repair is the substrate's discipline for moving these cells back into $\mathrm{con}$.

Per [repair-as-top-cell-resolution](../theorems/repair-as-top-cell-resolution.md), every declared repair operation has the structural form: take a $\top$-cell, apply a substrate-recorded resolution rule, produce a non-$\top$ value with witness recording the resolution.

## Repairs are declared

Every repair an operator may perform has a canonical declaration in the substrate's specification — a name, a severity, a deterministic recipe, a witness format. An operator MAY perform a declared repair without halting; an operator MAY NOT invent a repair that the specification does not declare. Repairs falling outside the declared catalog are bugs and abort the execution.

The discipline protects the substrate from a class of "host-runtime accidentally fixed it" failures. In a system without declared repair, an implementation that happens to merge two conflicting sections by averaging or by preferring one of them produces output that an auditor with a different implementation cannot reproduce. With declared repair, every fixup that occurs is in the witness chain, in the catalog, and reproducible.

## Two structural kinds of repair

Both correspond to particular structural moves on the bilattice / d-frame.

- **Coherence repair.** When two sources of the same predication disagree, the cellwise $\vee_k$ produces a $\top$-witness at the disagreement cell. Per [bilattice-network-sheaf-consensus](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md), this is exactly a $\mathrm{con}$-failure in the joint d-frame. The repair is the substrate's declared procedure for resolving the disagreement — typically:
  - A *priority rule* (one source overrides the other) — producing the asserting source's value, recording the override in the witness.
  - A *join in the value-domain* — producing a value that subsumes both, when the value-domain admits such a join compatible with both assertions.
  - An *abort* if no resolution is admissible — surfacing the $\top$-cell to governance for explicit reconciliation.

  Per [paraconsistent-equality](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/paraconsistent-equality.md), the substrate's paraconsistent value-domain supports $\top$-cells without trivialization — a $\top$-cell does not poison neighboring cells. Repair operates locally on the $\top$-cell.

- **Stabilization repair.** When the substrate's closure machinery has not yet reached fixed-point on a particular predication, the repair is to continue applying it until convergence — bounded by [fuel](fuel-bound.md). Per [settlement-via-closure-2-monad](../theorems/settlement-via-closure-2-monad.md), the closure 2-monad's iteration is structurally guaranteed to converge in the regimes the substrate supports; per the [four-regime-dichotomy](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/four-regime-dichotomy.md), the convergence ordinal is determined by the substrate's regime classification. On non-convergence within the fuel bound, the operator returns the last stable hash and reports divergence in the witness.

## Why $\top$-as-signal, not $\top$-as-error

A naive view: a contradiction is an error condition that should crash or roll back. But the substrate's bilattice value-domain treats $\top$ as a *substrate state* — "we've been told both, and we're recording both." This is what makes contradictions recoverable: per [paraconsistent-equality](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/paraconsistent-equality.md), reasoning continues despite $\top$-cells without ex falso quodlibet (the substrate doesn't conclude "anything follows from contradiction"), and the substrate's repair discipline can reconcile $\top$-cells without first "unbreaking" the substrate.

Per [repair-as-top-cell-resolution](../theorems/repair-as-top-cell-resolution.md), every coherence repair is structurally a $\top \to \{\mathbf{t}, \mathbf{f}, \bot\}$ resolution on the bilattice — taking a contradicted cell and producing a chosen non-contradicted value. The choice is per the declared resolution recipe; the witness records which recipe was applied and why.

## Discipline protects substrate alignment

The repair-as-declared-and-witnessed discipline is what keeps the substrate's behavior aligned across implementations. Two predicated computers running the same specification must perform the same repairs in the same situations, with the same witnesses; absence of declared repair is treated as a specification gap, not a degree of freedom for the implementation to fill in.

Per [bilattice-network-sheaf-consensus](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md), the substrate's $\mathrm{con}$ relation is a structural property — two implementations that disagree on whether a cell is in $\mathrm{con}$ are running different network-sheaves, not the same one with different policies. The repair catalog is the substrate's structural agreement on what counts as $\mathrm{con}$-failure and how to resolve it.
