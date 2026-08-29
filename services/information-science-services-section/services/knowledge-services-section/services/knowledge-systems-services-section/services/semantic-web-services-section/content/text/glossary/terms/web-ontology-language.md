---
title: Web Ontology Language
description: The W3C's formal-logic ontology language for expressing classes, properties, and reasoning-supporting axioms over RDF data, first a Recommendation in 2004 and substantially revised as OWL 2 in 2009 (second edition 2012), whose reasoning-heavy ambitions were the part of the original semantic-web vision that later retrospectives (Bernstein/Hendler/Noy 2016; Hitzler 2021) say did not survive contact with web scale.
date-created: 2026-08-22
aliases:
  - OWL
  - Web Ontology Language
  - OWL 2
defines:
  - OWL
  - OWL 2
  - ontology reasoning
instance-of: w3c-standard
---

The Web Ontology Language (OWL) is the W3C's formal ontology language built on top of [RDF](./resource-description-framework.md): where [RDF Schema](./resource-description-framework.md) supplies basic classes and subclass hierarchies, OWL adds description-logic axioms — equivalence, disjointness, cardinality restrictions, property characteristics such as transitivity and symmetry — rich enough to support automated logical inference over a dataset, not merely graph pattern matching.
This reasoning capability was central to the original 2001 vision of software agents drawing new conclusions from published data, discussed at [the semantic-web study note](../../documents/articles/notes/2026/08/22/2026-08-22-note-on-the-study-of-the-semantic-web.md#1-the-vision).

## Recommendation history

OWL became a W3C Recommendation on 10 February 2004, the same day as the 2004 RDF documents.
**OWL 2**, a revision adding new constructs (property chains, qualified cardinality restrictions, richer datatypes) while remaining backward-compatible with OWL 1 ontologies, became a W3C Recommendation on 27 October 2009, with a Second Edition on 11 December 2012 that corrected errata without changing the underlying language.

## Reasoning ambition versus deployment reality

OWL's description-logic reasoning is computationally expensive at web scale, and later retrospectives on the field are candid about the gap this opened between ambition and practice.
Bernstein, Hendler & Noy's "A New Look at the Semantic Web" (*CACM*, 2016) concedes that full formal-logic semantics proved unworkable at web scale and that "some semantics" — partial, best-effort formal meaning — is the realistic target.
Hitzler's "A Review of the Semantic Web Field" (*CACM*, 2021) similarly frames the Semantic Web as an ongoing research field rather than a completed artifact.
In practice, the mass-deployment structured-data layer that actually reached the wider web — schema.org markup serialized as [JSON-LD](./json-ld.md), see [knowledge-graph](./knowledge-graph.md) — carries far less formal ontological commitment than OWL supports, trading reasoning power for deployability.

## Sources

- OWL Web Ontology Language Reference, W3C Recommendation, 10 February 2004. https://www.w3.org/TR/owl-ref/
- OWL 2 Web Ontology Language Document Overview, W3C Recommendation, 27 October 2009; Second Edition, 11 December 2012. https://www.w3.org/TR/owl2-overview/
- Bernstein, A., Hendler, J., & Noy, N. (2016).
  "A New Look at the Semantic Web."
  *Communications of the ACM*, 59(9), 35-37. https://cacm.acm.org/magazines/2016/9/206254-a-new-look-at-the-semantic-web/fulltext
- Hitzler, P. (2021).
  "A Review of the Semantic Web Field."
  *Communications of the ACM*, 64(2), 76-83. https://dl.acm.org/doi/10.1145/3397512
