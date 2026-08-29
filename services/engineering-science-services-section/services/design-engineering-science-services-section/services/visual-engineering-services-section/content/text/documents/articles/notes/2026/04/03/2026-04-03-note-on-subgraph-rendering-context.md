---
title: Subgraph Rendering via Render Specs
description: Describes a diagram rendering system that uses render specs to convert datastore subgraphs to visual outputs deterministically via queries and mappings.
date-created: 2026-04-03
type: note
name: subgraph-rendering-context
keywords:
  - render-specs
  - subgraph-rendering
  - diagram-generation
  - entity-relations
  - visual-mapping
specialization: analysis
serves: subgraph-rendering
---

## The capability

The datastore holds entities with relations. Any subset of those entities and relations is a subgraph. Subgraph rendering selects a subgraph (via query), maps it to a visual syntax (via render spec), and emits a diagram. Mermaid is the first output format but the rendering is parameterized — the same subgraph could become a flowchart, class diagram, state diagram, or eventually SVG/DOT/D3.

This is the visual output mode of the generative harness's composition pipeline. Text outputs already exist:
- `generate-root-agentic-files.js` → text tables (CLAUDE.md)
- `generate-soul.js` → prose (SOUL.md)
- `compose-environment.js` → per-turn context

Diagram output follows the same pattern: structured data → deterministic rendering → visual artifact.

## How it works

A **render spec** describes what to show:

```yaml
query: { type: "task", part-of: "agentic-orchestration" }
edges: ["ordering"]
node-label: "title"
node-style:
  completed: "fill:#9f9"
  open: "fill:#ff9"
  deferred: "fill:#ccc"
diagram-type: "graph TD"
```

The renderer:
1. Runs the query against the datastore → gets entity set
2. Follows the edge relations between those entities → gets edge set
3. Maps entity attributes to Mermaid node definitions (label, style class)
4. Maps edge relations to Mermaid edges
5. Emits valid Mermaid syntax

The render spec can be inline (a marker in a file like `<!-- render:plan-dag -->` with the spec in the file's frontmatter) or standalone (a view entity — a `.md` file whose purpose is to describe a diagram).

## What renders meaningfully

The same machinery handles every case because the inputs are always: entities, relations, visual mapping.

- **Plan DAGs** — entities are tasks (query by `part-of`), edges are `ordering` pairs, style by `status`
- **Project decomposition** — entities are plans/objectives (query by `serves`/`part-of`), edges are `serves`/`part-of`, tree layout
- **Goal hierarchy** — entities are goals/projects/objectives, edges are `serves`, top-down tree
- **Term concept maps** — entities are terms in a domain (query by `in-domain`), edges are `made-of`/`uses`/`governed-by`/`distinguished-from`
- **Entity neighborhoods** — entities are everything connected to X by any relation within N hops
- **Cross-cutting views** — entities filtered by `cross-cuts`, grouped by department
- **Domain maps** — entities are `_index.md` files, edges are subdomain containment
- **Status dashboards** — entities are open tasks/plans, grouped by project, colored by status
- **Settlement paths** — entities along a lifecycle (observation → instinct → skill → hook)

## Phases

### Phase 1: Render spec and query
1. **define-render-spec-format** — Formalize the YAML structure for describing a diagram: query, edge relations, node labels, style mappings, diagram type. This is the "view" vocabulary.
2. **subgraph-query-function** — Pure function in `graph.js`: takes a render spec's query + edge list, returns `{ nodes: [...], edges: [...] }` with resolved attributes. Builds on the existing `datastore.query()` and `datastore.where()`.

### Phase 2: Mermaid output
3. **mermaid-emitter** — Pure function: takes `{ nodes, edges, spec }`, returns a Mermaid code block string. Handles `graph TD`, `graph LR`, `classDiagram`, `stateDiagram` based on `diagram-type`. Style mappings become `classDef` statements.

### Phase 3: Integration
4. **view-entity-format** — Define the frontmatter for a "view" file — a `.md` file whose content IS a rendered diagram. The frontmatter carries the render spec; the body is regenerated. These are entities in the datastore like anything else.
5. **inline-diagram-injection** — Script that finds `<!-- render:view-id -->` markers in any `.md` file and replaces the following code block with the current rendering. Runs at install time or on demand.
6. **command-integration** — Existing commands (`/plan-status`, `/projects`, `/tracking-status`, `/critical-path`) emit Mermaid alongside their text output. No new commands needed — just a rendering call added to existing composition.
7. **hugo-publish-integration** — Hugo shortcode or render hook that processes Mermaid blocks for the web. Diagrams in library texts and operations records render on the published site.

## What this is NOT

This is not a hand-maintained diagram system. Nobody writes Mermaid. The system writes Mermaid from the same structured data that drives everything else. If the diagram is wrong, the data is wrong — fix the data, the diagram updates.
