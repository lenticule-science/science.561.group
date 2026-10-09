---
name: cell-id
description: The content-addressed identifier of a cell-record. A function id from cell-records to a discrete identifier set, computed from the record's canonical encoding alone — two records with the same canonical encoding receive the same id; two records that differ in any field receive different ids (up to collision probability of the underlying hash family).
identifying: cell-record
computing-via: identifying-a-cell
depending-only-on: canonical-encoding
title: cell-id
---

A **cell-id** is the value of the content-addressing function $\mathrm{id} : \mathrm{CellRecord} \to I$ where $I$ is a discrete set of identifiers. The function depends only on the record's content; identity of identifiers pulls back to equality of records under canonical serialization.

Concretely, the identifier set $I$ is a set of byte strings of fixed length and the function is realized as a cryptographic hash composed with a canonical-JSON serializer:

$$\mathrm{id}(r) \;=\; \mathrm{H}\bigl(\mathrm{canonicalize}(r)\bigr).$$

The canonical-JSON discipline pins the serialization invariants — object keys sorted lexicographically at every level, no whitespace, strict JSON (no NaN, no Infinity, no trailing commas, no comments), UTF-8 byte encoding. The hash family $\mathrm{H}$ supplies collision resistance: under the cryptographic assumption on $\mathrm{H}$, equal identifiers force equal records with probability $1 - \varepsilon$ for negligible $\varepsilon$.

## Categorical content

The function $\mathrm{id}$ is a monomorphism on cell-records modulo canonical equivalence. Two records that canonicalize to the same bytes are identified by $\mathrm{id}$; this defines an equivalence relation $\sim_c$ on cell-records, and $\mathrm{id}$ factors injectively through $\mathrm{CellRecord}/\sim_c \hookrightarrow I$. Any later morphism that consumes a cell-record can be replaced by an identifier-keyed lookup, decoupling value-flow from record-flow at the system level.

## Use in provenance

A cell-id appears in the `derived-from` field of another cell-record to record that the closure-rule producing the second record consumed the first. This makes the closure-rule dependency graph a directed acyclic graph on cell-record-equivalence-classes, queryable by walking `derived-from` edges.
