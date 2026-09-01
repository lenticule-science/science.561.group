---
title: "MCP ecosystem for knowledge repositories"
date-created: 2026-03-08T00:00:00
authors:
  - claude
date-updated: 2026-03-08T00:00:00
type: text
keywords:
  - MCP
  - ClaudeCode
  - KnowledgeManagement
  - RDF
description: "Survey of MCP servers relevant to managing a semantic knowledge repository with markdown files, frontmatter, RDF, and proof assistants."
---

## Purpose

This text surveys the Model Context Protocol (MCP) server ecosystem
as of March 2026, focused on what's useful for managing a knowledge
repository like the emsemioverse: ~3000 markdown files with YAML
frontmatter, a predicate graph, skills, and formal proof
formalizations in Lean 4 and Agda.

## Configuration

MCP servers for Claude Code are configured in three scopes:

| Scope | Location | Shared? |
|-------|----------|---------|
| Project | `.mcp.json` (project root) | Yes, version-controlled |
| Local | `~/.claude.json` (per-project) | No, personal |
| User | `~/.claude.json` (global) | No, all projects |

Project-scoped config (`.mcp.json`) is the right choice for this
repository — it's version-controlled and shared across sessions.

CLI management: `claude mcp add|list|remove|get`.

## Existing servers by category

### RDF / Knowledge graph

- **mcp-rdf-explorer** — Python, conversational interface for
  RDF/Turtle knowledge graphs. `text_to_sparql`, full-text search,
  federated queries. Supports local Turtle files and remote SPARQL
  endpoints. Most relevant to the emsemioverse predicate graph.
  (github.com/emekaokoye/mcp-rdf-explorer)

- **mcp-jena** — Node.js bridge to Apache Jena Fuseki. SPARQL
  queries and updates. Requires a running Fuseki server — heavier
  than needed for our scale.

### Markdown / Frontmatter

- **markdown-frontmatter-mcp** — Extracts YAML frontmatter,
  returns structured results. Single tool (`query_recent_notes`).
  Designed for Obsidian vaults. Simplistic but directly relevant.
  (github.com/caffeinatedwes/markdown-frontmatter-mcp)

- **mcp-obsidian-tools** — Rich read-only toolkit:
  `obsidian_get_frontmatter`, `obsidian_list_tags`,
  `obsidian_query`. Works with any markdown directory.
  (github.com/dp-veritas/mcp-obsidian-tools)

- **markdown-editor-mcp-server** — 15 tools for structured
  markdown editing. Parses to JSON AST with semantic paths.
  Can update/add YAML frontmatter.
  (pypi.org/project/markdown-editor-mcp-server)

### Proof assistants

- **lean-lsp-mcp** (INSTALLED) — Bridges Lean 4 LSP with MCP over
  stdio. 304 GitHub stars, beta, MIT licensed. ~20 tools organized
  in three categories:
  - *File/LSP*: `lean_file_outline`, `lean_diagnostic_messages`,
    `lean_goal`, `lean_term_goal`, `lean_hover_info`,
    `lean_declaration_file`, `lean_completions`, `lean_run_code`,
    `lean_multi_attempt`, `lean_code_actions`, `lean_profile_proof`,
    `lean_verify`, `lean_get_widgets`
  - *Search*: `lean_local_search` (ripgrep), `lean_leansearch`
    (natural language), `lean_loogle` (type-based), `lean_leanfinder`
    (semantic), `lean_state_search` (proof state),
    `lean_hammer_premise`
  - *Project*: `lean_build`
  Install: `uvx lean-lsp-mcp` (41 packages). Requires elan + Lean 4
  toolchain. Supports `--repl` for ~5x speedup. Environment variables:
  `LEAN_PROJECT_PATH`, `LEAN_REPL`, `LEAN_LOG_LEVEL`.
  (github.com/oOo0oOo/lean-lsp-mcp)

- **LeanTool** — "Code interpreter" for Lean. Python library, CLI,
  OpenAI-compatible API, or MCP server. Lets LLMs talk directly to
  the Lean compiler. (github.com/GasStationManager/LeanTool)

- **lean-aristotle-mcp** — Wraps Harmonic's Aristotle automated
  theorem prover. Can fill `sorry` statements, verify lemmas,
  formalize natural language to Lean. Cloud-based, requires API key.
  (github.com/septract/lean-aristotle-mcp)

- **agda-mcp** (NOT YET INSTALLABLE) — Haskell-based MCP server for
  interactive Agda development. 24 interactive commands: proof search,
  case splitting, module exploration, goal listing, type checking.
  Persistent REPL session. HTTP transport on localhost:3000/mcp.
  **Blockers**: requires Nix with flakes for building (patches
  upstream `mcp-server` Haskell library); uses HTTP transport, not
  stdio; early-stage (22 commits, single author, BSD-3-Clause). Links
  against Agda's Haskell API (>= 2.8.0) directly. GHC 9.10 required
  (provided by Nix flake).
  (github.com/faezs/agda-mcp)

### Code / Filesystem search

- **Code-Index-MCP** — Local-first code indexer with hybrid search,
  48-language support, sub-100ms queries.

- **DeepContext MCP** — Symbol-aware semantic search via Tree-sitter
  AST parsing + vector search + BM25 + reranker.

## Recommendations for the emsemioverse

### Immediate (Phase 1)

Build a custom MCP server wrapping our existing Python scripts.
One server, ~7 tools. Already done (`scripts/mcp-server.py`).
Configure in `.mcp.json`.

### Short-term (Phase 2)

Add `rdflib`-based SPARQL queries to the MCP server. Build the
RDF graph from frontmatter at startup. This gives structured
graph queries over the predicate graph without needing an external
database.

### Medium-term (Phase 3)

**lean-lsp-mcp** is installed and configured in `.mcp.json`. It
points at the semiotic universe Lean formalization. Once `lake build`
succeeds, the agent gains ~20 tools for interactive proof development:
diagnostics, goal inspection, tactic search, theorem verification.

**agda-mcp** is blocked on Nix availability. When Nix is available,
installation is straightforward via `nix develop && cabal build`. The
server uses HTTP transport (not stdio), which requires a slightly
different configuration pattern.

### Long-term (Phase 4)

Evaluate whether mcp-rdf-explorer or a Fuseki-backed system would
be worth the infrastructure cost at our current scale (~3000 files).
Probably not until the graph is large enough that in-memory rdflib
becomes slow.

## Sources

- modelcontextprotocol.io — official MCP documentation
- github.com/modelcontextprotocol/servers — official server catalog
- github.com/jlowin/fastmcp — FastMCP v3.0 (Python SDK)
- github.com/emekaokoye/mcp-rdf-explorer
- github.com/dp-veritas/mcp-obsidian-tools
- github.com/caffeinatedwes/markdown-frontmatter-mcp
- pypi.org/project/markdown-editor-mcp-server
- github.com/oOo0oOo/lean-lsp-mcp
- github.com/GasStationManager/LeanTool
- github.com/septract/lean-aristotle-mcp
- github.com/faezs/agda-mcp
