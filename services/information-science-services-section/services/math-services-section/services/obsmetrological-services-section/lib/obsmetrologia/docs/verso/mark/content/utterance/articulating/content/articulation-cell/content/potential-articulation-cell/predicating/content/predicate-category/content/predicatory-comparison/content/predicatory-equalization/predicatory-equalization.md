---
type: concept
class: universal-property
depends-on: [predicatory-comparison, predication-settling-category]
see-also: [equalization-locus, ps-equalizers-collapse, quantale-enriched-sheaf]
---

# Predicatory equalization

**Predicatory equalization** is the operation of isolating where two predication-categorical operations agree.

The formal categorical baseline is the equalizer of parallel arrows $f,g : A \to B$ from [@maclane1971]: an arrow $e : E \to A$ such that $f e = g e$, universal among arrows into $A$ with that property.

Inside the preorder category $\mathbf{PS}$ this is mostly uninformative.
Since there is at most one morphism between any two settlings, every parallel pair is already equal, and the equalizer of such a pair is the identity on its domain.
The useful PredCat operation is therefore not "take the equalizer in $\mathbf{PS}$" but "compute the equalization locus" of two operational endomaps:

$$\mathrm{Eq}(F,G) := \{v : F(v) = G(v)\}.$$

For calculators, this is the native form of exact agreement: given two closure rules, two reindexings, two projections, or two comparison frameworks, compute the locus where their outputs coincide and the defect where they do not.
