---

name: cell
  - "cell"
  - "cells"
date-created: 2025-12-26
introduces: term
tags: []
---

A cell in the [GFRTU](../generative-fibered-recognition-trace-universe.md) is a local universe produced by restricting the [trace site](./trace-site.md) to a subcategory. If T' ⊆ T is a full subcategory of the trace site, the cell over T' is the restriction of the [sheaf universe](./sheaf-universe.md) to T': the category of sheaves on T' with the induced [Grothendieck topology](./grothendieck-topology.md).

Cells provide a notion of locality at the level of universes, not just at the level of elements or [fragments](../../semiotic-universe/terms/fragment.md). A cell contains only the [traces](./trace.md), [recognition fibers](./recognition-fiber.md), and sheaf data indexed by the subcategory T'. Different cells may overlap (when their subcategories share traces) and can be compared by inclusion.

The relationship between cells and the full GFRTU mirrors the relationship between fragments and the full [semiotic universe](../../semiotic-universe/terms/semiotic-structure.md). Fragments are local regions of the [Heyting algebra](../../../../teaching/explanations/heyting-algebra/index.md) H; cells are local regions of the sheaf universe R. Both support scoped reasoning — working within a cell means reasoning about a restricted portion of the trace site without requiring the full universe.
