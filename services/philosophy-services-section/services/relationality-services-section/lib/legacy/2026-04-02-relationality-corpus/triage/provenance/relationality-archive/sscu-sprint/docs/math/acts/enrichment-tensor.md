---

name: enrichment-tensor
act: EnrichmentTensor
top: FixedInvariantMeet
bottom: FixedMorphism
summary: Use the meet operation together with structure-preserving maps to define the enriched tensor.
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

The tensor for enrichment comes from the meet–join lattice scaled through the
morphisms.  We construct this by letting the lattice meet observe the morphisms:
`(FixedInvariantMeet FixedMorphism)` earns
***EnrichmentTensor***.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
