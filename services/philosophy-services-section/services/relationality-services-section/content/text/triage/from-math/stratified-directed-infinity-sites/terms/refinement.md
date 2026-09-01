---
name: "Refinement"
aliases:
  - "refinement"
  - "refinements"
date-created: 2025-12-26
tags: []
---

A refinement is a [morphism](../../../../../../../../../information-science-services-section/services/math-services-section/services/categorical-services-section/services/ordinary-categories-services-section/content/text/glossary/terms/morphism.md) from a coarser to a finer [stratum](./stratum.md) — a map that extracts more detailed or more local information. In a [stratified](./stratification.md) structure, refinement maps go in a preferred direction (coarser → finer), and this directedness is part of the [directed](./directed.md) structure of the site.

Refinement maps compose: if t → t' refines t to t', and t' → t'' refines t' to t'', then t → t'' refines t to t'' directly. The composition of refinements is associative, making the refinements part of the categorical structure. The [covering families](./covering-family.md) of the site are built from refinement maps and their compositions.

In the [GFRTU](../../../../documents/articles/notes/generative-fibered-recognition-trace-universe.md), [morphisms](../../../../../../../../../information-science-services-section/services/math-services-section/services/categorical-services-section/services/ordinary-categories-services-section/content/text/glossary/terms/morphism.md) in the [trace site](../../universes/generative-fibered-recognition-trace-universe/terms/trace-site.md) are refinement maps: a [morphism](../../../../../../../../../information-science-services-section/services/math-services-section/services/categorical-services-section/services/ordinary-categories-services-section/content/text/glossary/terms/morphism.md) t → t' means t' is a more detailed record than t. Restriction of [recognition fibers](../../../../../../services/quasicrystalline-hypertensor-topos-services-section/content/text/glossary/terms/recognition-fiber.md) runs in the opposite direction (from finer to coarser), extracting the coarser data that is compatible with the refinement.
