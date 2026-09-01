---
type: definition
class: substrate-entity
realizes: [index]
depends-on: [index, predication-graph-store, hash-discipline]
see-also: [query-record]
---

# Index record

A **index record** is the substrate-entity formal definition of an [index](teaching/explanations/index.md): the predication-graph entity declaring an index's key, kind, coverage, and build state.

## Structural fields

- **`id`** — kebab-case identifier.
- **`description`** — one-line summary.
- **`index-kind`** — `b-tree`, `hash`, `inverted`, `geospatial-rtree`, `vector-hnsw`, `composite`.
- **`key-extractor`** — reference to the function or predication-pattern that produces the index key from a predication.
- **`covered-predications`** — references to the predications the index covers (typically a predicate or a scope of predications).
- **`build-state`** — `building`, `built`, `stale-rebuilding`, `retired`.
- **`build-version`** — canonical-form hash of the index at its current state.
- **`source-version`** — canonical-form hash of the underlying predications the index was built from.
- **`closure-kind`** — `index`.

## Invariants

- **Source-derivable.** Per [self-representation](../teaching/explanations/self-representation.md), the index can be rebuilt from its source predications.
- **Conservative.** Per [index](teaching/explanations/index.md), the index does not invent entries; entries reflect the underlying data (modulo lag during rebuild).
- **Source-version-tracked.** When the underlying predications change, the index's `build-version` no longer matches its source-version; the index is `stale-rebuilding` or needs rebuild.

## Position in the substrate

Index records are the substrate's *fast-lookup registry*. Per [query-language](teaching/explanations/query-language.md), indexes are what make queries efficient at scale.
