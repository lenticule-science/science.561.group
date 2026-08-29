---
  type: concept
  class: parameterized-discipline
  parameters: [resource-classes, citation-form, traversal-rule]
  realizes: [orientation-before-interpretation, non-linear-reading]
  see-also: [conformance-check, earned-addition]
  instantiated-by:
    - "theories/emsenn-visual-language/concepts/resource-graph.md"
    - "theories/emsenn-visual-language/concepts/citation-graph.md"
  also-touched-by:
    - "theories/five-six-one-design-bible/_index.md"
  status: emsenn-load-bearing; 561-implicit
  ---

  # Resource graph

  A visual language uses a *resource graph* when every value, geometry, and rule it states is a named resource, and every reference to a value cites the resource by name. The language is then the directed graph of citations between resources; the kit's discipline operates on the graph rather than on the artifacts.

  ## Pattern

  Each color, size, geometry, device, component, and rule is a separate file (or named entity in source). Each artifact and each kit resource cites other resources by name. Updating a resource means updating one file and walking the graph to inform citers; retiring a resource means archiving the file, never deleting it.

  ## Parameters

  - **`resource-classes`** — the kinds of resources the graph holds (tokens, devices, geometries, components, voices, prints, accesses, governances).
  - **`citation-form`** — how a resource is referenced (a relative path, a CSS variable name, a kebab-case identifier).
  - **`traversal-rule`** — the rule for walking the graph when a resource changes (typically: bump every citer's edition, archive the prior version).

  ## Conformance shape

  Verify that every value, geometry, or rule in the artifact resolves to a named resource in the kit; that no inline literal value (a hex color, a pixel value, an arbitrary geometry) appears outside a resource definition; and that every citation is recorded in both directions.

  ## Lineage

  The discipline derives from software practice (the dependency graph as the system's primary structural object) and from scholarly citation traditions (every claim cites its source). It supports [orientation before interpretation](../terms/orientation-before-interpretation.md) by making the kit's structure inspectable as a graph, and [non-linear reading](../terms/non-linear-reading.md) by guaranteeing that any path through the graph reaches every cited resource.

  ## Instances in the corpus

  - The [emsenn resource-graph](theories/emsenn-visual-language/concepts/resource-graph.md) and [citation-graph](theories/emsenn-visual-language/concepts/citation-graph.md) jointly instantiate resource-graph with `resource-classes = {tokens, devices, type system, geometries, density modes, mark, components, voice, print, access, governance}`, `citation-form = relative path + CSS variable`, `traversal-rule = bump and archive`.
  - The 561 bible operates on a resource graph implicitly via the FARS object/morphism/concept registers, but does not promote the graph itself to a load-bearing concept.
  