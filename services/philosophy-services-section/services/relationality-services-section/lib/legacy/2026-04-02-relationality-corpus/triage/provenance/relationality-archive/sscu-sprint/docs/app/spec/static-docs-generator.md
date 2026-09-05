---
name: static-docs-generator
layer: spec
keywords:
  - documentation
  - static-site
part-of: relational-computer
description: "Generates static documentation sites from the relational graph as projections of underlying math."
---

Use the universal relational computer itself to generate a static documentation
site: pages are projections of the underlying math (acts/theorems/specs/
architecture) as realised in the internal graph, not hand‑wired markdown.

## 1. Core recognitions

- `DocViewRecognition`
  - A particular view of part of the graph (e.g. “specifications index”,
    “architecture map”, “prospective spec catalog”), with filters and layout hints.
- `DocPageRecognition`
  - A concrete page to render: title, slug, sections, source nodes, and
    cross‑links. Always traces back to the underlying math or ideas.
- `DocAssetRecognition`
  - Generated assets (graphs, tables, diagrams) tied to the internal graph
    (subsystem diagrams, topology views, coverage tables).
- `DocBuildRunbookRecognition`
  - Runbooks that define “how to build the site”: which views to generate,
    which templates to apply, and where to write files.

These recognitions live over the same graph as everything else; the site is
just a readable projection.

## 2. Topology and measurement

- **Topology**
  - Primary graph: `acts → theorems → specs → architecture` as earned in the
    math texts, reflected into the runtime trace/knowledge graph rather than
    a separate `graph.json` file.
  - Documentation graph: `DocViewRecognition` nodes attached to slices of this
    internal graph (e.g., “all specs used by runtime architecture texts”).
  - Cross‑domain edges: pages that connect architecture ↔ runtime code
    (`app/*`), and math ↔ prospective specs under `docs/app/spec/`.
- **Measurement**
  - Build metrics: number of pages, build time, failures per view, coverage
    (how many internal nodes appear in at least one page).
  - Drift metrics: nodes added/removed/rewired in the internal graph since
    last build that are not yet reflected in any `DocPageRecognition`.

## 3. Runbooks and flows

- `run_docs_full_build`
  - Input: current internal graph snapshot (e.g. a TracePoint slice),
    templates, and existing doc recognitions.
  - Steps: compute views, generate `DocPageRecognition` set,
    render static files, emit build + coverage measurements.
- `run_docs_incremental_build`
  - Input: diff of the internal graph or docs changed since last snapshot.
  - Steps: recompute only affected views/pages, update assets, write minimal
    changes to the static tree.
- `run_docs_coverage_audit`
  - Input: snapshot of the internal graph, current `DocPageRecognition` set.
  - Output: a report recognition listing nodes with no documentation, or specs
    with no architecture mapping, etc.

All runbooks are future candidates for implementation via the existing
runbook/rewriter stack.

## 4. Cross‑domain connections

- Connects tightly to:
  - **Math content** (`docs/math/`) as the source of truth for content.
  - **Runtime/API** (`app/main.py`, `app/mcp_server.py`) for surfacing links
    to live endpoints (OpenAPI, MCP tools).
  - **Prospective specs** (specs with `status: someday`/`later`) to show
    how potential application slices relate back
    to specs and architecture.
- Provides a path for:
  - Future CI runbooks to enforce “no undocumented nodes/specs/architecture”.
  - External static hosting (GitHub Pages, etc.) that stays in sync with the
    relational computer via snapshots and build recognitions.
