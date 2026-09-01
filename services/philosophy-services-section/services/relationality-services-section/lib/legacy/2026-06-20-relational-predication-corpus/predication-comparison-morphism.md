---
type: morphism
class: operator
symbol: "\\mathrm{cmp}_{\\mathfrak{C}}"
status: draft
depends-on: [predicatory-comparison, comparison-context, comparison-witness-object, predication-valuation]
see-also: [equalizing-comparison-morphism, confluence-comparison-morphism, difference-comparison-morphism]
---

# Comparison morphism

For a [comparison context](../objects/comparison-context.md) $\mathfrak{C}$, the **comparison morphism** is an operation

$$\mathrm{cmp}_{\mathfrak{C}} : X_1 \times X_2 \longrightarrow \mathsf{W}_{\mathfrak{C}}$$

from the selected input objects to their [comparison witness object](../objects/comparison-witness-object.md).

The morphism is indexed by $\mathfrak{C}$ because comparison is typed by its domain, restriction, and standard. Changing the selected cells, temporal interval, or comparison standard changes the morphism.

Existing comparison operations are special cases:

- exact comparison uses an equalization locus and a defect;
- directional comparison uses an evidence residual;
- confluence comparison uses a confluence join and a reachability certificate;
- commutation comparison uses a commutation defect.
