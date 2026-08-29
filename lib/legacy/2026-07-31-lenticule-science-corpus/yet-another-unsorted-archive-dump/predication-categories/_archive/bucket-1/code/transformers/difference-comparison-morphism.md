---
type: morphism
class: operator
symbol: "\\mathrm{diffcmp}_{\\mathfrak{C}}"
status: draft
depends-on: [comparison-morphism, predicatory-differentiation, evidence-residual, four-symmetric-evidence-difference]
see-also: [commutation-defect]
---

# Difference comparison morphism

A **difference comparison morphism** compares two valuations or settlings by producing the evidence that separates them under the selected standard.

When the standard is directional and $v \leq_k w$, the morphism returns the [evidence residual](evidence-residual.md):

$$\partial_k(v,w).$$

When the inputs are not comparable and the value domain is $\mathbf{FOUR}$, the morphism returns the [FOUR symmetric evidence difference](four-symmetric-evidence-difference.md):

$$\delta^{\oplus}_k(v,w).$$

For a general bilattice, the existence of a canonical total difference comparison depends on additional structure on the underlying lattice.
