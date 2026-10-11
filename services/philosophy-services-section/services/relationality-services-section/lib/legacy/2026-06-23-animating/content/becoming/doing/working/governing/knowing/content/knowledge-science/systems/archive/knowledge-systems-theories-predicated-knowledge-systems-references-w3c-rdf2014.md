---
type: reference
authors: ["W3C RDF Working Group"]
year: 2014
title: "RDF 1.1 Concepts and Abstract Syntax"
venue: "W3C Recommendation"
---

## Full citation

W3C RDF Working Group. *RDF 1.1 Concepts and Abstract Syntax.* W3C Recommendation, 2014.

## Status

Pending direct re-read; covered via the [knowledge-representation-survey](../texts/knowledge-representation-survey.md) and standard semantic-web secondary literature.

## Annotation

The W3C standard defining the abstract syntax and data model of RDF 1.1: an *RDF graph* is a set of *triples* (subject, predicate, object), where subjects are IRIs or blank nodes, predicates are IRIs, and objects are IRIs, blank nodes, or *literals* (strings with optional language tag or datatype). Multiple graphs may be grouped into an *RDF dataset* with named graphs and a default graph. Blank nodes provide existential quantification over individuals not given a global identifier.

For the predicated framing, RDF is the simplest non-degenerate substrate that already commits to *predication as the unit of storage*. It is the closest existing formalism to the framing's [predication-cell](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/predication-cell.md), with three structural restrictions: (i) the value-domain is implicitly $\mathbf{2}$ — a triple is either present or absent, with no separate evidence channel; (ii) named graphs partition the dataset but do not carry algebraic structure (no canonical operation for cross-graph federation other than set union); (iii) closure is governed externally (by RDFS, OWL, or SPARQL queries) rather than being an intrinsic part of the graph's structure.

The framing recovers RDF as a strict-regime, $\mathbf{2}$-valued, set-of-graphs substrate over the predication-fibration. Its expressivity gap against the predication-cell substrate is the gap between $\mathbf{2}$ and $\mathbf{2} \otimes \mathbf{2}$ (no source-tracking), between set-of-graphs and bilattice colimit ([federation-as-bilattice-colimit](../theorems/federation-as-bilattice-colimit.md)), and between externally-applied closure and intrinsic closure-rule-system. The [knowledge-representation-survey](../texts/knowledge-representation-survey.md) develops this comparison in detail.

## Where used

- [knowledge-representation-survey](../texts/knowledge-representation-survey.md)
- [predicated-knowledge-system](../objects/predicated-knowledge-system.md)
- [federation-as-bilattice-colimit](../theorems/federation-as-bilattice-colimit.md)
