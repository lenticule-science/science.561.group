---
name: dataview-query-language
keywords:
  - idea
  - query
  - gui
part-of: relational-computer
description: "Provides a query language and GUI for users to define table, list, or graph views over recognitions."
---

Provide a user‑facing query language (and GUI front‑end) that lets people define
table/list/graph views over recognitions, similar to Obsidian Dataview but
grounded in our RDF/topology stack.

## 1. Core recognitions

- `QueryDefinitionRecognition`
  - A stored query: name, parameters, selection criteria, projection fields,
    sort/grouping, and presentation hints (table/list/graph).
- `QueryResultRecognition`
  - A materialized result snapshot: which query, which parameters, which
    recognitions were included, and when it was computed.
- `QueryViewBindingRecognition`
  - Binding between a query and a particular GUI panel or static doc section.

## 2. Topology and measurement

- **Topology**
  - Queries reference recognitions via predicates on types, tags, relations,
    measurements, and provenance.
  - Query results link back to both the definition and the underlying
    recognitions to keep traceability intact.
- **Measurement**
  - Track query cost (time, result size), frequency of use, and staleness
    (how far results lag behind underlying recognitions).
  - Use these metrics to suggest caching, indexing, or query refactoring.

## 3. Runbooks and flows

- `run_register_query`
  - Validate and store a new `QueryDefinitionRecognition`.
- `run_execute_query`
  - Evaluate a query against the current graph, emit a `QueryResultRecognition`
    and optional measurement events.
- `run_refresh_bound_views`
  - For views bound to queries, refresh results on a schedule or when inputs
    change beyond thresholds.

## 4. Cross‑domain connections

- Core tooling for:
  - life dashboards (tasks, health, finance),
  - research and reading queues,
  - MUD state summaries,
  - governance and policy audits.
- Integrates naturally with GUI workbench ideas and the static docs generator:
  static tables/sections come from stored queries rather than hand‑written lists.

