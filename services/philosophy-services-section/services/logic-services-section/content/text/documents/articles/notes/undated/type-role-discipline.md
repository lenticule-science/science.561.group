---
title: Type role discipline
description: A visual language uses type role discipline when each text run in any artifact plays one role from a small closed set, and the role determines the family, weight, and size — not the designer's mood at the moment.
---
---
  type: concept
  class: parameterized-discipline
  parameters: [families, roles, family-role-binding, weight-rule]
  realizes: [felt-weight, non-linear-reading]
  see-also: [closed-palette, register-set, rhythm-unit-system]
  instantiated-by:
    - "theories/five-six-one-design-bible/concepts/type-as-mass.md"
    - "theories/five-six-one-design-bible/concepts/type-scale.md"
    - "theories/emsenn-visual-language/objects/type-stack.md"
  ---

  # Type role discipline

  A visual language uses *type role discipline* when each text run in any artifact plays one role from a small closed set, and the role determines the family, weight, and size — not the designer's mood at the moment.

  ## Pattern

  The kit names a small set of roles (e.g. display, body, label, mono, or display, body, slogan, meta), assigns each role to one type family, and gives the role a fixed size and weight. The artifact composer's job is to identify each text run's role and apply the assignment; choices about font, weight, and size are not theirs to make.

  ## Parameters

  - **`families`** — the type families the kit ships. Typically two to four.
  - **`roles`** — the enumerated roles. Typically three to five.
  - **`family-role-binding`** — the table mapping each role to a family, weight, and size.
  - **`weight-rule`** — the rule for when weights vary inside a role. Strict kits forbid weight variation inside a single line; permissive kits allow one heavier weight to mark hierarchy.

  ## Conformance shape

  For each text run in the artifact, identify its role and verify the run's family, weight, and size match the role's binding. A run with an unassignable role, or a run whose binding is wrong, is a defect.

  ## Lineage

  The discipline derives from Bauhaus pedagogy (type as mass, weight as structural marker) and from the modernist working manuals (Ruder, Bringhurst) that codified role-based type systems. It is what makes [non-linear reading](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/information/information-architecture/visual-engineering/terms/non-linear-reading.md) possible: a reader who recognizes a label-role text run can skip body to find labels, and the kit guarantees the visual signature of "label" is consistent across the artifact.

  It supports [felt weight](../../../../../../../../../engineering-science-services-section/services/design-engineering-science-services-section/services/visual-engineering-services-section/content/text/glossary/terms/felt-weight.md) by making weight a structural signal rather than a decorative one.

  ## Instances in the corpus

  - The [561 type-as-mass](../../../../../../../../../../../561-group-services-section/services/561-group-content-design-services-section/content/text/glossary/terms/type-as-mass.md) and [type-scale](../../../../../../../../../../../561-group-services-section/services/561-group-content-design-services-section/content/text/glossary/terms/type-scale.md) jointly instantiate type-role-discipline with `families = {Space Grotesk, Roboto Slab, JetBrains Mono}`, `roles = {display, body, slogan, meta}`, and a strict weight rule.
  - The [emsenn type-stack](../../../../../../../../../../../561-group-services-section/services/561-group-content-design-services-section/content/text/documents/articles/specifications/elements/type-stack.md) instantiates type-role-discipline with `families = {Plex Sans, Plex Serif, Plex Mono}`, `roles = {display, body, label, mono}`, and a permissive weight rule (two weights per artifact maximum).
  