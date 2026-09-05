---
  type: concept
  class: parameterized-discipline
  parameters: [templates, fork-procedure, promotion-threshold]
  realizes: [memetic-repeatability]
  see-also: [earned-addition, closed-geometry-set]
  instantiated-by:
    - "theories/five-six-one-design-bible/concepts/template-as-floor.md"
    - "theories/emsenn-visual-language/objects/letter-template.md"
    - "theories/emsenn-visual-language/objects/spec-doc-template.md"
  ---

  # Template as floor

  A visual language uses *template-as-floor* when its templates are stated as the floor — the minimum, accumulated answer to "what does this artifact format look like in this kit?" — rather than the ceiling. An artifact may follow the template, fork it, or write a new one, and the kit's discipline is what governs which.

  ## Pattern

  The kit ships a small set of templates per artifact format. Each template is a structure (geometry, type assignments, default content slots), not a finished piece. A composer is required to consider the template before composing from scratch, but is also empowered to fork it or write a new one if the artifact warrants. New templates earn their place by [earned-addition](earned-addition.md): typically three independent uses must have demanded the new form before it enters the kit.

  ## Parameters

  - **`templates`** — the enumerated templates the kit currently ships.
  - **`fork-procedure`** — the procedure by which a composer modifies a template for one artifact without proposing a new template.
  - **`promotion-threshold`** — typically 3, after which a fork can be promoted to a kit-level template.

  ## Conformance shape

  For each artifact, verify that either (a) it follows a template that exists in `templates`, (b) it forks a template using `fork-procedure`, or (c) it composes from scratch with documented justification. Verify that no informal template — one that the kit has used multiple times but never recorded — has entered service without the promotion procedure.

  ## Lineage

  The discipline derives from publishing and software practice both: a template is the kit's accumulated answer to a recurring problem, and the kit grows when the templates demonstrably do not cover the case at hand. It supports [memetic repeatability](../terms/memetic-repeatability.md) by guaranteeing that a template that has earned a kit-level entry is, by that fact, a form the work has demonstrated is reproducible.

  ## Instances in the corpus

  - The [561 template-as-floor](theories/five-six-one-design-bible/concepts/template-as-floor.md) instantiates this with five templates (slogan poster, assembly call, numeral banner, field-instruction pamphlet, web template) and the council-approval fork procedure.
  - The emsenn [letter-template](theories/emsenn-visual-language/objects/letter-template.md), [spec-doc-template](theories/emsenn-visual-language/objects/spec-doc-template.md), and [library-page-template](theories/emsenn-visual-language/objects/library-page-template.md) instantiate this with three templates and a resource-graph amendment fork procedure.
  