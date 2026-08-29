---
type: definition
class: structure
symbol: "\\mathsf{W}_{\\mathfrak{C}}"
depends-on: [comparison-context, comparison-witness, predication-valuation, four-bilattice]
see-also: [commutation-defect, evidence-residual, four-symmetric-evidence-difference]
---

# Comparison witness object

Given a [comparison context](comparison-context.md) $\mathfrak{C}$ and two restricted valuations $v|_{\mathfrak{C}}$ and $w|_{\mathfrak{C}}$, a **comparison witness object** is a tuple

$$\mathsf{W}_{\mathfrak{C}}(v,w) =
(\mathfrak{C},\ \mathrm{Agr},\ \mathrm{Div},\ \mathrm{Res},\ \mathrm{Cert}).$$

The components are:

- $\mathrm{Agr} \subseteq I$: cells where the standard judges $v$ and $w$ to agree;
- $\mathrm{Div} : I \to \mathbf{L}^\bowtie$: a cellwise divergence or defect profile;
- $\mathrm{Res}$: directed residual data when the standard is directional, such as $v \leq_k w$;
- $\mathrm{Cert}$: optional certificate data, such as a joining diagram for confluence.

On $\mathbf{FOUR}$ with exact comparison, $\mathrm{Div}$ can be the [FOUR symmetric evidence difference](../morphisms/four-symmetric-evidence-difference.md). For directional $\leq_k$ comparison, $\mathrm{Res}$ can be the [evidence residual](../morphisms/evidence-residual.md) when defined.

The witness object is the structured codomain of a comparison morphism. A Boolean pass/fail answer is a projection of this object, not its replacement.
