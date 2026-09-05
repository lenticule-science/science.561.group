---
title: Subgraph Rendering
description: Plan to add diagram generation to a datastore composition pipeline using YAML render-specs and Mermaid for visualizing entity relationships.
date-created: 2026-04-03
type: note
name: subgraph-rendering
keywords:
  - subgraph-rendering
  - composition-pipeline
  - render-spec
  - mermaid
  - visual-output
specialization: plan
application: publishing
architecture-note: Application sublocale, not OS infrastructure — see applications-as-sublocales analysis
serves-system: foah
department: engineering
cross-cuts: [command, science]
project: generative-harness
serves: reactive-consequences
depends-on: [subgraph-rendering-context]
---

The datastore holds entities with relations; any subset is a subgraph. This plan adds a visual output mode to the generative harness's composition pipeline — alongside the existing text outputs (CLAUDE.md tables, SOUL.md prose, compose-environment per-turn) — so that the same structured data that generates docs generates diagrams. A YAML render-spec (query + edge relations + node-label + style-by-attribute + diagram-type) feeds a pure renderSubgraph function that emits Mermaid; the same machinery handles plan DAGs, goal hierarchies, term concept maps, entity neighborhoods, cross-cutting views, domain maps, status dashboards, and settlement paths because the inputs are always entities, relations, visual mapping. Phases: (1) render-spec format + subgraph-query-function, (2) mermaid-emitter, (3) view-entity format + inline-diagram-injection + command-integration + hugo-publish-integration. Full render-spec example, list of meaningful renderings, and phase-step detail live in `analyses/subgraph-rendering-context.md`.

Open: none explicitly named — this plan is design-complete and awaiting implementation.
