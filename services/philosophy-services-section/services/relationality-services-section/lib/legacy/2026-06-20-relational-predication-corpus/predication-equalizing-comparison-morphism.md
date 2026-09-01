---
type: morphism
class: operator
symbol: "\\mathrm{eqcmp}_{\\mathfrak{C}}"
status: draft
depends-on: [comparison-morphism, predicatory-equalization, equalization-locus, comparison-witness-object]
see-also: [ps-equalizers-collapse]
---

# Equalizing comparison morphism

An **equalizing comparison morphism** is a [comparison morphism](comparison-morphism.md) whose standard is exact agreement on the selected context.

For operations $F,G : X \to Y$ or valuations $v,w : I \to \mathbf{L}^\bowtie$, it computes

$$\mathrm{Agr} = \{i \in I : v(i)=w(i)\}$$

and a divergence profile on $I \setminus \mathrm{Agr}$.

This is not the same as taking an equalizer inside $\mathbf{PS}$: [equalizers in the predication settling preorder collapse to identities](../theorems/ps-equalizers-collapse.md). The equalizing comparison morphism lives at the operational/witness level, where there is enough structure to return the agreement locus and the defect.
