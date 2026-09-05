---
date: 2026-03-12
type: plan
topic: pragmatic plan — get the graph encoded and CRUDable over MCP, philosophy set aside
---

# Plan: Graph CRUD over MCP

## What we actually have

- FastMCP server running in Docker, accessible at `http://localhost:5000/mcp`
- Three working tools: `read_object`, `write_object`, `list_region`
- ~5428 markdown files with YAML frontmatter across 31 domains
- Claude Code connected via `.mcp.json`
- Emsemiote persona defined but broken (NPU timeout on phi-4-mini — needs
  switch to `qwen2.5-7b-instruct-vitis-npu:2` in emsemiote.md and
  docker-compose.yml)

## What "the graph" is, concretely

Every markdown file is a node. Its IRI is its path relative to library root.
Its edges are:
- frontmatter values that are path handles (point to other files) → typed edges
- wikilinks in the body → untyped or weakly typed edges
- directory containment → `inDirectory` edge (implicit, from path)

The graph is already there. It just isn't extracted or queryable.

## The four things needed

### 1. Fix Emsemiote (unblocked, 10 minutes)

Change two values:
- `library/agents/persona/emsemiote/emsemiote.md`: `model: qwen2.5-7b-instruct-vitis-npu:2`
- `docker-compose.yml`: `OLLAMA_BASE_URL: http://host.docker.internal:64415/v1`

Rebuild Docker. Verify `/v1/models` returns qwen2.5-7b.

### 2. Graph extraction method (engine/methods/build_graph.py)

Walk the library. For each `.md` file:
- Parse frontmatter with python-frontmatter
- Emit `(file_iri, predicate_key, value)` triples
  - string values → literals
  - values that look like paths and resolve to real files → IRI objects (edges)
  - list values → one triple per item
- Load into an rdflib ConjunctiveGraph, one named graph per source file
- Cache by mtime; rebuild only changed files

No URI mapping yet — use `s561:{key}` as predicate IRIs for now. URI
correspondence (schema.org etc.) can be added later when `thing.md` is
written and the engine can walk `key-correspondence`.

Output: in-memory graph, or serialized to `library/.cache/graph.ttl`.

### 3. Query tool (engine/tools/query_graph.py)

MCP tool: `query_graph(sparql: str) -> list[dict]`

Loads (or reuses cached) graph, runs SPARQL SELECT, returns rows as list of
dicts. This immediately enables:
- "find all files where s561:defines = 'term'"
- "find all files in a given directory"
- "find all files that link to X"
- "what predicates does file X have?"

Also add: `get_neighbors(path: str) -> dict` — returns all outgoing edges
from a node as {predicate: [objects]}, useful for Emsemiote navigation.

### 4. Write `thing.md` and `description.md`

The two files from the self-describing predicates plan. These are the first
nodes in the graph that define the graph's own structure. Once written, the
engine has a walkable path from any predicate key to its semantics.

These files are also the proof that the system works: run `query_graph` to
find `s561:defines = "thing"`, read the result, confirm it returns
`thing.md` with all its key-correspondence data.

## Build order

1. Fix Emsemiote (so we have a working agent to test with)
2. `build_graph.py` method
3. `query_graph` MCP tool + `get_neighbors` MCP tool
4. Write `thing.md` and `description.md`
5. Test: ask Emsemiote "what does the library say about thing" — it should
   call `query_graph`, find `thing.md`, call `read_object`, return a real answer

## What this deliberately excludes

- SHACL validation (deferred — requires solving the `required:` predicate)
- Kind resolution / merge-models (deferred — graph must exist first)
- `check_satisfaction` / closure operators (deferred — M3)
- Full URI mapping via key-correspondence (deferred — added after thing.md exists)
- Multi-agent capability filtering (deferred — M4)

## Definition of done

Emsemiote, running locally on qwen2.5-7b via Foundry NPU, can answer
"what does the library say about X" by calling `query_graph` and
`read_object` rather than generating from model weights. The graph is
real, navigable, and correct.
