---
name: "JSON-LD Context"
aliases: ["@context", "json-ld contexts"]
description: "A JSON-LD context is the document, referenced from an @context key, that maps a JSON-LD document's short property names to full IRIs and datatypes, standardized as part of JSON-LD 1.1 (W3C Recommendation, 16 July 2020), whose stability in practice depends entirely on the vocabulary owner's own versioning discipline — schema.org's own documentation states plainly that its context document's history is not archived, the negative example a claim vocabulary's context must be designed against."
date-created: 2026-08-22
instance-of: w3c-standard
references:
  jsonld11:
    authors: ["W3C JSON-LD Working Group"]
    title: "JSON-LD 1.1: A JSON-based Serialization for Linked Data"
    publication: "W3C Recommendation"
    year: 2020
    url: "https://www.w3.org/TR/json-ld11/"
  schemaorghowwework:
    authors: ["schema.org"]
    title: "How We Work"
    publication: "schema.org documentation"
    year: 2026
    url: "https://schema.org/docs/howwework.html"
---

A **JSON-LD context** is the document a JSON-LD file's `@context` key points to (inline, by reference, or both), and it is the mechanism that gives plain JSON keys a precise linked-data meaning: it maps each short property name to a full IRI, optionally fixes its expected datatype or container form, and can version or namespace an entire vocabulary in one place.
[JSON-LD 1.1](https://www.w3.org/TR/json-ld11/) standardized this mechanism as a W3C Recommendation on 16 July 2020, alongside companion API and Framing specifications.

## The mechanism is mature; vocabulary version discipline is not automatic

The context mechanism itself is stable and has been a finished Recommendation for years.
What is not automatically solved by adopting JSON-LD is *versioning the vocabulary a context exposes*.
schema.org — the largest deployed consumer of this mechanism — documents its own practice plainly: general users are encouraged to reference the unversioned `https://schema.org/` context, and, per schema.org's own documentation, "the history of the context document is not archived," meaning there is no way to retrieve exactly what that context resolved to as of any past date, only dated release notes for the underlying vocabulary ([schema.org, "How We Work"](https://schema.org/docs/howwework.html)).

## Relevance to claim-state vocabulary engineering

A claim vocabulary needs its own `@context` to be re-resolvable to its exact past state for as long as any correction audit trail refers to a claim published under it — a requirement schema.org's own context does not meet.
This is a direct design constraint, not merely a nice-to-have: the context document itself needs the same versioning discipline (archived snapshots, a stable per-version URL, an explicit changelog) that the vocabulary's `owl:versionInfo` and SHACL shapes would separately need.
See the [study of statement-level metadata engineering](../../documents/articles/notes/2026/08/22/2026-08-22-note-on-the-study-of-statement-level-metadata-engineering.md), §6 and §8, and its gaps section.

## See Also

- [named-graph](./named-graph.md) — the RDF-level structure a JSON-LD document's `@context` gives meaning to
- [trusty-uri](./trusty-uri.md) — a complementary content-addressing scheme for the data itself, independent of context versioning
