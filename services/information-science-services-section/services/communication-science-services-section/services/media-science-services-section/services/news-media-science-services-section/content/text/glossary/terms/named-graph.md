---
name: "Named Graph"
aliases: [named-graphs, quad-store]
description: "A named graph is an RDF graph paired with its own identifying URI so that provenance, trust, and signature statements can be made about the whole set of triples at once, the mechanism Carroll, Bizer, Hayes and Stickler introduced at WWW 2005 to replace triple-by-triple reification and the model RDF 1.1 datasets and SPARQL's GRAPH clause both formalize."
date-created: 2026-08-22
instance-of: systems-pattern
references:
  carroll2005:
    authors: ["Jeremy J. Carroll", "Christian Bizer", "Pat Hayes", "Patrick Stickler"]
    title: "Named Graphs, Provenance and Trust"
    publication: "Proceedings of the 14th International Conference on World Wide Web (WWW 2005)"
    year: 2005
    url: "https://dl.acm.org/doi/10.1145/1060745.1060835"
  carroll2005b:
    authors: ["Jeremy J. Carroll", "Christian Bizer", "Pat Hayes", "Patrick Stickler"]
    title: "Named graphs"
    publication: "Web Semantics: Science, Services and Agents on the World Wide Web 3(4)"
    year: 2005
    url: "https://doi.org/10.1016/j.websem.2005.09.001"
---

A **named graph** is a set of RDF triples paired with its own URI, so that the graph as a whole — not each triple individually — becomes a resource that other statements can describe.
[Carroll, Bizer, Hayes & Stickler (WWW 2005)](https://dl.acm.org/doi/10.1145/1060745.1060835) introduced the abstract syntax and formal semantics for this, motivated directly by the weaknesses of triple-level RDF reification: reification requires four extra triples per statement described and gives SPARQL no efficient way to query provenance, while a named graph lets a publisher sign, date, and attribute an entire batch of assertions with a single set of metadata statements pointed at the graph's name.

## Relationship to reification and RDF datasets

Where classic reification decomposes one triple into a described `rdf:Statement` node, a named graph goes the other direction: it groups many triples under one addressable identity and describes that identity.
This became the model RDF 1.1 adopted for the *RDF dataset* — a default graph plus zero or more named graphs — and the model SPARQL's `GRAPH` keyword queries directly.
For provenance and trust use, the practical payoff is that "who asserted this, and when" is stated once per graph rather than once per triple.

## Use in statement-level metadata engineering

A named graph is the natural unit at which to attach claim-level provenance: one graph per claim-version, addressed by its own name, with a second graph describing that name's provenance and a third describing its publication metadata — the fixed three-graph anatomy nanopublications generalize this pattern into.
See the [study of statement-level metadata engineering](../../documents/articles/notes/2026/08/22/2026-08-22-note-on-the-study-of-statement-level-metadata-engineering.md) for how this maps onto the claim infrastructure's first research bet.

## See Also

- [rdf-star](./rdf-star.md) — the term-level alternative to reification, contrasted with the graph-level approach here
- [trusty-uri](./trusty-uri.md) — a content-addressing scheme often used to name a graph
- [json-ld-context](./json-ld-context.md) — the mechanism by which a named graph's terms are given meaning in JSON-LD serializations
