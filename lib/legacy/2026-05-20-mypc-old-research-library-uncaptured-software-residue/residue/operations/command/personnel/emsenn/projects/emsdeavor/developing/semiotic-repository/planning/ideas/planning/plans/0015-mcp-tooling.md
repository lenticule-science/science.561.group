---
title: "MCP tooling for the ASR"
date-created: 2026-03-08T00:00:00
authors:
  - claude
status: active
priority: critical
depends-on: []
goal: "003"
milestone: "progressive-automation"
---

## Summary

Build MCP (Model Context Protocol) servers that expose repository
operations as native tools for Claude Code. This moves work from
inference-based (expensive, per-session, dies with context) to
tool-based (cheap, persistent, structured I/O). This is policy 001
(progressive automation) applied to the agent's own tooling.

## Motivation

Currently, the agent does all repository operations through Bash
calls to Python scripts or through direct file reads. This means:

1. **No structured I/O** — scripts return text, which the agent
   must parse. MCP tools return typed JSON.
2. **No persistence** — each session rediscovers the repo state.
   An MCP server can maintain an index in memory.
3. **No composition** — Bash scripts can't call each other cleanly.
   MCP tools compose through the agent's tool-calling protocol.
4. **Under-utilizing the platform** — Claude Code's MCP integration
   is a first-class feature. We have `runtime: mcp` in our skill
   spec but zero MCP servers configured.

The tech stack plan at
`technology/disciplines/artificial-intelligence/topics/agents/agential-semioverse-tech-stack.md`
already specifies MCP as a first-class transport. The rdf-cms system
in `triage/library/rdf-cms/` includes an MCP server. But nothing is
wired up.

## Phase 1: Wrap existing scripts as MCP tools

Build an MCP server (Python, using the `mcp` package) that exposes
the scripts we already have:

### Tools to expose

1. **find_in_repo** — wraps `scripts/find-in-repo.py`
   - Input: `{query: string, discipline?: string, type?: string}`
   - Output: `{matches: [{path, title, match_type, context}]}`

2. **index_triage** — wraps `scripts/index-triage.py`
   - Input: `{}`
   - Output: `{stats: {...}, entries_count: number}`

3. **query_triage_index** — queries the cached index
   - Input: `{filter: {enrichment?, discipline?, type?, status?}}`
   - Output: `{entries: [...], count: number}`

4. **enrich_triage** — wraps `scripts/enrich-triage.py`
   - Input: `{path_filter?: string, batch?: number, dry_run?: bool}`
   - Output: `{files_changed: number, changes: [...]}`

5. **validate_frontmatter** — check a file against semiotic markdown
   - Input: `{path: string}`
   - Output: `{valid: bool, errors: [...], warnings: [...]}`

6. **list_plans** — query all plans with status
   - Input: `{status?: string, priority?: string}`
   - Output: `{plans: [{number, title, status, priority}]}`

7. **list_skills** — query all skills with triggers
   - Input: `{kind?: string}`
   - Output: `{skills: [{id, triggers, runtime, path}]}`

### Configuration

Project-scoped config in `.mcp.json` (version-controlled):

```json
{
  "mcpServers": {
    "asr": {
      "command": "python3",
      "args": ["scripts/mcp-server.py"]
    }
  }
}
```

## Phase 2: Content graph server (rdflib + SPARQL)

Add `rdflib`-based SPARQL to the MCP server. Build RDF graph from
frontmatter at startup.

**Existing resources:**
- `mcp-rdf-explorer` (github.com/emekaokoye/mcp-rdf-explorer) —
  conversational RDF/SPARQL MCP. Could use as reference or fork.
- `triage/library/rdf-cms/` — emsenn's own RDF/MCP system (heavy,
  needs PostgreSQL). Use rdflib-only subset for our scale.

**Tools to add:**
1. **sparql_query** — run SPARQL against the content graph
2. **find_related** — traverse predicate graph N hops
3. **list_predicates** — all predicate types in use
4. **validate_graph** — broken links, orphans, cycles

## Phase 3: Lean/Agda MCP servers

Install existing MCP servers for proof assistants:

**Lean 4 — lean-lsp-mcp (INSTALLED):**
- github.com/oOo0oOo/lean-lsp-mcp — 304 stars, beta, MIT licensed
- Bridges Lean 4 LSP with MCP over stdio
- ~20 tools: diagnostics, goal states, hover docs, completions,
  code actions, proof profiling, theorem verification
- Search: LeanSearch, Loogle, Lean Finder, Lean Hammer, local search
- Install: `uvx lean-lsp-mcp` (auto-installs 41 Python packages)
- Requires: elan + Lean 4 toolchain + `lake build` on the project
- Optional: `ripgrep` for local search, `--repl` for 5x speedup

**Lean 4 — LeanTool (not installed):**
- github.com/GasStationManager/LeanTool — "code interpreter" for
  Lean. Alternative to lean-lsp-mcp if LSP overhead is unwanted.

**Agda — agda-mcp (NOT YET INSTALLABLE):**
- github.com/faezs/agda-mcp — Haskell-based, 24 interactive commands
- Requires Nix with flakes (not available in current environment)
- Uses HTTP transport (localhost:3000/mcp), not stdio
- Early-stage: 22 commits, single author, patches upstream library
- Blocker: Nix not installed; apt-based Agda install also failed
  (DNS resolution issue in sandboxed environment)
- Revisit when Nix is available or when the project matures

**Current configuration in `.mcp.json`:**

```json
{
  "mcpServers": {
    "asr": { "command": "python3", "args": ["scripts/mcp-server.py"] },
    "lean": {
      "command": "uvx",
      "args": [
        "lean-lsp-mcp",
        "--lean-project-path",
        "content/mathematics/objects/universes/semiotic-universe/formalization/lean"
      ]
    }
  }
}
```

**Remaining for Phase 3:**
- Build Lean project (`lake build`) so lean-lsp-mcp can start LSP
- Test lean-lsp-mcp tools in a live session
- Revisit agda-mcp when Nix is available

## Phase 3.5: Local model delegation

Added `delegate_task` (Tool 8) to the MCP server. Bridges Claude Code
to Ollama's HTTP API for mechanical tasks (classification, frontmatter
generation, format conversion, tag suggestion). Uses `urllib` only — no
extra dependencies.

- Ollama installed natively (not Docker) with `qwen2.5:7b` and
  `gemma3:12b` available
- OpenClaw (Docker-based orchestrator) was evaluated but skipped —
  direct Ollama integration is simpler and avoids Docker dependency
- Tested: classification (2 tokens, 4s), frontmatter generation
  (67 tokens, 50s cold / faster warm)
- Configurable via `OLLAMA_URL` and `OLLAMA_MODEL` env vars

This is the first heterogeneous agent capability — tasks can now be
routed to local models instead of consuming Claude API credits.

## Phase 4: Full information engine

Wire up the pipeline described in the tech stack plan:
- intake → measurement → towers/flow → sheaf state → domain views
- Each stage is an MCP tool
- The full pipeline is composable

## Steps (Phase 1) — DONE

1. ~~Research the `mcp` Python package~~ — installed mcp 1.26.0
2. ~~Write `scripts/mcp-server.py` with tools 1-7~~ — done
3. ~~Configure in `.mcp.json`~~ — done
4. Test each tool in a live session
5. Update skills that currently use Bash to use MCP tools instead

## Done when

- [x] Phase 1 MCP server written with 7 tools
- [x] `.mcp.json` configured
- [ ] MCP server tested in live session
- [ ] At least one skill updated to use MCP tool
- [ ] Agent can query the triage index as a native tool
- [ ] Phase 2 SPARQL tools added
- [x] Phase 3 lean-lsp-mcp installed and configured
- [ ] Phase 3 agda-mcp (blocked: needs Nix)
- [x] Phase 3.5 delegate_task tool added (Ollama bridge)
- [ ] Phase 3 lean-lsp-mcp tested in live session

## Dependencies

- Existing scripts: find-in-repo.py, index-triage.py, enrich-triage.py
- Python `mcp` package
- Claude Code MCP integration

## Log

**2026-03-08** — Created. emsenn identified that we're being
under-ambitious about MCP tooling. The repo's own tech stack plan
already specifies MCP as first-class. The agent has scripts that
should be tools. Policy 001 demands we encode these as persistent,
composable tools rather than ephemeral Bash calls.

**2026-03-08** — Phase 1 implemented. MCP server written with 7
tools (find_in_repo, query_triage_index, rebuild_triage_index,
enrich_triage, list_plans, list_skills, validate_frontmatter).
Configured in `.mcp.json`. Research completed — found existing
lean-lsp-mcp, agda-mcp, and mcp-rdf-explorer servers. Research
text at `technology/texts/mcp-ecosystem-for-knowledge-repositories.md`.
Corrected config from `.claude/settings.json` to `.mcp.json`
(project-scoped, version-controlled).

**2026-03-07** — Phase 3.5: Added `delegate_task` (Tool 8) to MCP
server. Ollama installed natively with qwen2.5:7b and gemma3:12b.
OpenClaw evaluated but skipped in favor of direct Ollama HTTP bridge
(simpler, no Docker dependency). Disk-full event (953GB C: drive at
100%) caused Docker corruption; freed ~98GB by clearing npm cache.
Docker restored but unnecessary for this approach.

**2026-03-08** — Phase 3 partially implemented. Installed elan (Lean
version manager) and Lean 4 v4.29.0-rc4. Installed uv/uvx. Verified
lean-lsp-mcp runs via `uvx lean-lsp-mcp` (41 packages, stdio
transport, ~20 tools). Added lean server to `.mcp.json` pointing at
the semiotic universe Lean project. agda-mcp blocked: requires Nix
with flakes (not available), uses HTTP transport (not stdio), and is
early-stage (22 commits, single author). Agda itself also failed to
install via apt (DNS resolution issue in sandboxed environment).
Updated research text with detailed installation findings.

**2026-03-07** — Ecosystem survey completed. Assessed 10 frameworks
(Claude Agent SDK, PydanticAI, CrewAI, AutoGen/MSAF, LangGraph,
OpenHands, Swarm, Mastra, smolagents, Claude Code) and 3 protocols
(MCP, A2A, ANP). Key finding: no framework provides the library/engine
boundary, region-restricted agents, or skill-as-operator formalism.
The engine must be custom-built. Recommended stack: MCP SDK + FastAPI
for the engine, PydanticAI if model-agnostic agents are needed, A2A
for inter-agent communication. Research text at
`technology/disciplines/artificial-intelligence/topics/agents/texts/agent-orchestration-ecosystem-2026.md`.

**2026-03-08** — SKILL.md files created for all 10 MCP tools. Updated
`find-in-repo` and `list-skills` from `runtime: script`/`inference` to
`runtime: mcp`. Created 7 new skills: `query-triage-index`,
`rebuild-triage-index`, `list-plans`, `validate-frontmatter`,
`delegate-task`, `mine-triage-relevance`, `infer-triage-frontmatter`.
Added MCP tools section to `.claude/skills/registry.md`. Also fixed
`mine-triage-relevance.py`: increased timeout from 30s to 120s, added
retry with backoff, added quality-based slop penalty. Tested across
authored (specifications/) and slop (collapse dynamics/) directories —
penalty correctly suppresses slop content.
