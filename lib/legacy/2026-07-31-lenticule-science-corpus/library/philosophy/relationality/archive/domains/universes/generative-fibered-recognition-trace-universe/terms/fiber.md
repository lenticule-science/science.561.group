---
title: "Fiber"
aliases:
  - "fiber"
  - "fibers"
date-created: 2025-12-26
type: term
tags: []
defines:
  - "Fiber"
  - "fibers"
---

A fiber in the [GFRTU](../generative-fibered-recognition-trace-universe.md) is the local recognition structure attached to a [trace](./trace.md) — the semantic data available at a single point of the [trace site](./trace-site.md). Formally, a fiber over trace t is the [recognition fiber](./recognition-fiber.md) H_t: a finite [Heyting algebra](../../semiotic-universe/terms/complete-heyting-algebra.md) equipped with a [stabilizer](./stabilizer.md) σ_t and a [drift](./drift.md) operator Δ_t.

The term "fiber" comes from the language of fibrations: the total structure is a fibered category over the trace site, and the fiber at each trace is the "slice" of the total structure above that point. Restriction maps connect fibers at different traces: if t → t' is a refinement, there is a restriction map H_t' → H_t that extracts the coarser data from the finer record.

The [fixed fiber](./fixed-fiber.md) H_t* = {a ∈ H_t : σ_t(a) = a = Δ_t(a)} is the subset of a fiber that is active under both stabilizer and drift — the recognitions that neither decay nor shift. The fixed fibers assemble into a subsheaf H* of the [sheaf universe](./sheaf-universe.md), representing the dynamically coherent portion of the recognition data.
