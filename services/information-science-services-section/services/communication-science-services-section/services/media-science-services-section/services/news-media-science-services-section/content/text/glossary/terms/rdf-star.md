---
name: "RDF-star"
aliases: ["RDF*", "RDF-star", "quoted triple"]
description: "RDF-star (RDF*) is a proposed extension to RDF, originated by Hartig at AMW 2017, that lets a triple itself appear as the subject or object of another triple — a quoted triple — as a syntactically direct alternative to reification for statement-level metadata, now under development at W3C as part of RDF 1.2 but still at Candidate Recommendation Snapshot rather than Recommendation status as of this term's creation date."
date-created: 2026-08-22
instance-of: w3c-standard
references:
  hartig2017:
    authors: ["Olaf Hartig"]
    title: "Foundations of RDF* and SPARQL*: An Alternative Approach to Statement-Level Metadata in RDF"
    publication: "Proceedings of the 11th Alberto Mendelzon International Workshop on Foundations of Data Management and the Web (AMW 2017), CEUR-WS Vol-1912"
    year: 2017
    url: "https://ceur-ws.org/Vol-1912/paper12.pdf"
  w3crdf12concepts:
    authors: ["W3C RDF & SPARQL Working Group"]
    title: "RDF 1.2 Concepts and Abstract Data Model"
    publication: "W3C Candidate Recommendation Snapshot"
    year: 2026
    url: "https://www.w3.org/TR/rdf12-concepts/"
  w3crdfstarcharter:
    authors: ["W3C"]
    title: "RDF & SPARQL Working Group Charter"
    publication: "W3C"
    year: 2025
    url: "https://www.w3.org/2025/04/rdf-star-wg-charter.html"
---

**RDF-star** (also written RDF\*) is a syntactic and semantic extension to RDF that allows a triple to be *quoted* — embedded whole as the subject or object of another triple — so that statements about statements no longer require the four-triple reification pattern or a separate [named graph](./named-graph.md).
[Hartig (AMW 2017)](https://ceur-ws.org/Vol-1912/paper12.pdf) originated the idea as a research proposal alongside a corresponding SPARQL-star query extension; the W3C subsequently took it up as the basis for RDF 1.2.

## Standards status

The working group responsible was originally chartered as the "RDF-star Working Group" and was renamed the "RDF & SPARQL Working Group" under its current charter (1 May 2025 – 30 April 2027), explicitly to correct the impression that quoted triples were the group's only scope ([charter](https://www.w3.org/2025/04/rdf-star-wg-charter.html)).
As of this term's creation date, [RDF 1.2 Concepts and Abstract Data Model](https://www.w3.org/TR/rdf12-concepts/) and RDF 1.2 Semantics are both **Candidate Recommendation Snapshot**, published 7 April 2026 — not yet W3C Recommendations.
Other documents in the same suite, such as RDF 1.2 Turtle, remain at Working Draft.
A vocabulary that adopts RDF-star syntax today is depending on a specification still in candidate status, not a finished standard.

## Relationship to named graphs and reification

RDF-star operates at the level of an individual statement (quoting one triple inside another), where a [named graph](./named-graph.md) operates at the level of a whole triple set (naming the set so metadata can attach to it collectively), and both operate at a coarser or finer grain than classic reification's four-triple decomposition of one statement.
The three mechanisms are not mutually exclusive — a claim vocabulary could, in principle, quote a triple *inside* a named graph — but which combination a given implementation should target is unresolved; see the [study of statement-level metadata engineering](../../documents/articles/notes/2026/08/22/2026-08-22-note-on-the-study-of-statement-level-metadata-engineering.md), §3 and §9, and its gaps section.

## See Also

- [named-graph](./named-graph.md) — the graph-level alternative mechanism
- [trusty-uri](./trusty-uri.md) — a content-addressing scheme independent of which statement-level mechanism is chosen
