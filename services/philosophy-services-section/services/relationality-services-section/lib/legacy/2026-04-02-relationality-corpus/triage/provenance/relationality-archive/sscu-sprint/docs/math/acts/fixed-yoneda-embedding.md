---

name: fixed-yoneda-embedding
act: YonedaEmbedding
slug: yoneda-embedding
top: FixedFunctor
bottom: EnrichmentHom
summary: Define the Yoneda embedding by letting the functor witness the enriched hom.
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

In the enriched setting the Yoneda embedding sends an object to its hom
presheaf.  We let the fixed functor witness the enriched hom:
`(FixedFunctor EnrichmentHom)` earns ***YonedaEmbedding***.

Each object is mapped to the lattice-valued hom-object of morphisms into it.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
