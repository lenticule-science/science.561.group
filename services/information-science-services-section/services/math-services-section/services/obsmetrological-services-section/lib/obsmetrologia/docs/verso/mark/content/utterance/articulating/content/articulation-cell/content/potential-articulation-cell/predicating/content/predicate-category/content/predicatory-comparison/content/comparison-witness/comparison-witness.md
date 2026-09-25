---
type: concept
class: witness
depends-on: [predicatory-comparison, evidence, predication-valuation, four-bilattice]
see-also: [comparison-witness-object, commutation-defect, evidence-residual, four-symmetric-evidence-difference]
---

# Comparison witness

A **comparison witness** is the structured mathematical result of a comparison.

The witness is not a Boolean answer.
It records the standard used, the inputs compared, the agreement locus, the divergence profile, and residual evidence when a directed residual exists.

## Minimum witness fields

A comparison witness should contain:

- **Context:** the comparison context and selected cells.
- **Standard:** the comparison standard.
- **Agreement:** cells or subobjects where the inputs coincide under the standard.
- **Divergence:** bilattice-valued difference or defect where they do not.
- **Residual:** directed missing-evidence profile when inputs are comparable in $\leq_k$.

Different standards require different witnesses.
Exact comparison can be witnessed by an agreement locus plus a defect profile.
Directed comparison can be witnessed by a residual.
Confluence comparison can require a joining diagram.
