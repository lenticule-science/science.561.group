---
title: Earned addition
description: A visual language uses earned addition when a new resource — a color, a geometry, a template, a device — enters the kit only after a stated threshold of independent uses has demanded it.
---
---
  type: concept
  class: parameterized-discipline
  parameters: [addable-resources, threshold, promotion-procedure]
  realizes: [memetic-repeatability]
  see-also: [closed-palette, closed-geometry-set, template-as-floor]
  instantiated-by:
    - "theories/five-six-one-design-bible/concepts/template-as-floor.md"
    - "theories/emsenn-visual-language/concepts/earned-addition.md"
  ---

  # Earned addition

  A visual language uses *earned addition* when a new resource — a color, a geometry, a template, a device — enters the kit only after a stated threshold of independent uses has demanded it. The kit grows by amendment, never by accumulation.

  ## Pattern

  The kit identifies which classes of resource are subject to earned addition (typically templates and geometries; sometimes also colors and devices). For each class, the kit names a numeric threshold of independent uses and a promotion procedure that records the use cases, deliberates, and admits the resource by amendment.

  ## Parameters

  - **`addable-resources`** — the resource classes subject to the discipline.
  - **`threshold`** — the number of independent uses required. Typical values: 3.
  - **`promotion-procedure`** — the kit's procedure for admitting a resource: who proposes, who reviews, where the amendment is recorded.

  ## Conformance shape

  For each new resource proposed for the kit, verify the proposal records at least `threshold` independent uses with citation, and that the proposal goes through `promotion-procedure` before the resource is added to the kit. A resource added without earning its place is a defect.

  ## Lineage

  Earned addition derives from open-source software governance (a feature lands when use cases warrant it), from publishing traditions (a magazine adds a section when the editorial calendar demands it), and from typographic working manuals (a font enters a foundry's catalog only when it has been proven). The discipline supports [memetic repeatability](../../../../../../../engineering-science-services-section/services/design-engineering-science-services-section/services/visual-engineering-services-section/content/text/glossary/terms/memetic-repeatability.md) by guaranteeing that every resource in the kit reflects accumulated practice, not speculation.

  ## Instances in the corpus

  - The [561 template-as-floor](../../documents/articles/notes/undated/template-as-floor.md) instantiates earned-addition with `addable-resources = {templates}`, `threshold = 3`, `promotion-procedure = "council approves a third use, then a § 08.N entry is written"`.
  - The [emsenn earned-addition](earned-addition.md) instantiates earned-addition with `addable-resources = {colors, devices, geometries, templates}`, `threshold = 3`, `promotion-procedure = "three independent uses cited in the proposal; amendment to the resource graph; archive of prior versions"`.
  