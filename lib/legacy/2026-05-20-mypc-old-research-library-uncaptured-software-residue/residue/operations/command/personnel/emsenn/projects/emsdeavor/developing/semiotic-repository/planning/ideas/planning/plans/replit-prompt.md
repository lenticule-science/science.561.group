# Replit Agent Prompt: Content Operations API

## What you are building

A **FastAPI web application** that serves as the deterministic operations
layer for a large markdown knowledge repository (~3,000 pages). The
application replaces expensive cloud LLM inference with **pipelines of
Python scripts and local LLM calls** (via Ollama, OpenAI-compatible API).

The repository lives at the root of this project. The `content/`
directory is a git submodule containing all the markdown files. The
`scripts/` directory contains Python scripts that already do most of the
individual operations — your job is to compose them into a web
application with a REST API and a simple dashboard.

## Why this matters

Currently, an expensive cloud AI agent (Claude) does all content
operations: classifying files, finding gaps, validating frontmatter,
enriching metadata, scoring quality, deciding what to work on next. Each
of these operations costs thousands of tokens of inference. Most of them
can be done **deterministically by scripts** or **cheaply by local 3-7B
parameter models** running on the user's machine via Ollama.

The application you build will:
1. Replace ~80% of per-session cloud inference with deterministic
   script calls and local model inference
2. Provide a dashboard showing content health at a glance
3. Expose pipeline endpoints that chain multiple operations
4. Make the repository's state queryable without reading thousands of
   files

## Architecture

```
FastAPI Application
├── /api/v1/               — REST API endpoints
│   ├── /content/           — Content queries (search, stats, gaps)
│   ├── /validate/          — Validation endpoints (frontmatter, manifests)
│   ├── /triage/            — Triage pipeline (enrich, classify, promote)
│   ├── /graph/             — Predicate graph queries (triplets, satisfaction)
│   ├── /fragments/         — Fragment computation (closures, deltas)
│   ├── /plans/             — Plan management (list, status, board view)
│   ├── /pipelines/         — Composed multi-step operations
│   └── /llm/               — Local model delegation
├── /dashboard              — Simple HTML dashboard (Jinja2 templates)
├── core/                   — Business logic (wraps existing scripts)
│   ├── frontmatter.py      — YAML frontmatter parser (reuse from repo)
│   ├── graph.py            — Predicate graph builder and querier
│   ├── fragments.py        — Fragment calculus implementation
│   ├── validation.py       — Content and manifest validation
│   ├── triage.py           — Triage operations (enrich, classify, index)
│   ├── local_llm.py        — Local model client (adapt from repo)
│   └── pipelines.py        — Multi-step pipeline composition
└── templates/              — Jinja2 HTML templates for dashboard
```

## Existing code to study and reuse

**IMPORTANT**: This repository contains extensive prior work. Study these
files before writing any new code — reuse their logic, patterns, and
data structures.

### Current production scripts (in `scripts/`)

These are the scripts your application wraps. Read each one:

1. **`scripts/local_llm.py`** (~354 lines) — Unified client for local
   LLM backends (Ollama + Foundry Local). Supports backend discovery,
   model suggestion by task type (classification, generation,
   extraction, reasoning, long-context), and OpenAI-compatible
   `/v1/chat/completions` calls. **Adapt this directly** — it handles
   all local model communication.

2. **`scripts/mcp-server.py`** (~566 lines) — The existing MCP server
   that exposes repository tools to Claude Code. Has implementations of:
   `find_in_repo`, `query_triage_index`, `rebuild_triage_index`,
   `enrich_triage`, `list_plans`, `list_skills`, `validate_frontmatter`,
   `delegate_task`, `infer_triage_frontmatter`, `mine_triage_relevance`,
   `llm_status`. **Your REST API replaces/supersedes this** — expose
   the same operations as HTTP endpoints.

3. **`scripts/infer-triage-frontmatter.py`** (~678 lines) — Local LLM
   enrichment pipeline. Key patterns to reuse:
   - Model trust ordering (MODEL_TRUST_ORDER) — skip re-enrichment by
     weaker models
   - Provenance stamping (triage-enriched-by field)
   - Large-file summarization before enrichment (SUMMARY_THRESHOLD)
   - Body-preservation verification (never modify body content)
   - YAML key validation (remove keys with whitespace)

4. **`scripts/enrich-triage.py`** (~308 lines) — Mechanical (no-LLM)
   frontmatter enrichment. Derives title from headings, date-created
   from git history, fixes deprecated field names. This is the
   deterministic first pass before LLM inference.

5. **`scripts/index-triage.py`** — Builds the triage index
   (`.triage-index.json`), tracking enrichment state per file.

6. **`scripts/mine-triage-relevance.py`** — Pre-classifies triage
   files by relevance to a focus topic using local LLM scoring (0-3).

### Analysis scripts (in `content/.../scripts/`)

These implement the semantic analysis layer:

7. **`content/technology/specifications/agential-semioverse-repository/scripts/predicate-graph.py`**
   (~1153 lines) — Builds the repository's predicate graph from
   frontmatter. Key operations:
   - Graph building: extracts (subject, predicate, object) triplets
     from all pages
   - Triplet queries: page interaction surface, incoming references
   - Transitive relation following
   - **Axiom satisfaction checking**: evaluates each page against its
     type's axiom registry (e.g., a `theorem` MUST have `proven-by`)
   - Repository-wide satisfaction report (currently 91.3% satisfaction,
     37 errors, 308 warnings)

8. **`content/.../scripts/fragment.py`** (~588 lines) — Fragment
   calculus. Fragment F = <A, K, Π> where:
   - A (assumptions) = requires + extends (dependencies)
   - K (claims) = defines + teaches (contributions)
   - Π (provenance) = cites + authors (support)
   - Closure computation: transitive dependency resolution
   - Delta computation: gaps between fragments
   - Directory summaries: statistics for content areas

9. **`content/.../scripts/validate-content.py`** (~624 lines) —
   Domain-specific validation. Checks frontmatter against rules for
   mathematics (theorems need proofs), philosophy (claims need
   arguments), sociology, games, education. Reports MUST/SHOULD
   violations.

10. **`content/.../scripts/validate-manifest.py`** (~444 lines) —
    Validates SKILL.md files against the signal-dispatch specification.
    6 checks: required fields, id matching, dependency resolution, path
    validity, type validation, trigger requirements.

### Prior application code (in `content/triage/`)

Study these for architectural patterns and reusable components:

11. **`content/triage/wsl-backup/emsemioverse/engine/`** — A previous
    FastAPI application attempt. Key files:
    - `api/main.py` — FastAPI app with lifespan manager, MCP mount,
      CORS, health endpoints, skill manifest loading
    - `api/api_v1.py` — Versioned REST routes with Pydantic models
      (SkillSummary, SkillListResponse, APIError envelope)
    - `api/skill_runner.py` — Subprocess-based skill execution with
      JSON output parsing, timeout handling
    - `api/app_state.py` — Application state management
    - `api/mcp_sdk_adapter.py` — MCP SDK integration
    **Reuse these patterns** — especially the Pydantic models, error
    envelope, and skill execution approach.

12. **`content/triage/library/deprecated-relational-research/`** — An
    earlier FastAPI knowledge graph application with:
    - SQLite database (relational cells, edges, provenance)
    - Modular API routers (web, stats, git, query, graph, recognition,
      relation, metadata_discovery)
    - Entity recognition and relationship management
    **Study for**: modular router organization, graph query patterns.

13. **`content/triage/engine/contracts/semiotic-markdown/`** — Python
    library for parsing semiotic markdown. Has:
    - `parse.py` — YAML frontmatter parser
    - `vault.py` — Recursive vault indexing with duplicate detection
    - `model.py` — DocumentRecord data model
    - `slug.py` — Deterministic path-to-ID normalization
    **Reuse the parser and vault indexer** — they are tested and correct.

## Endpoints to implement

### Phase 1: Wrap existing scripts as REST endpoints

These are straightforward — call the existing scripts and return JSON.

```
GET  /api/v1/content/search?q=<query>&discipline=<disc>&type=<type>
GET  /api/v1/content/stats
GET  /api/v1/plans?status=<status>&priority=<priority>
GET  /api/v1/plans/board
GET  /api/v1/skills?kind=<kind>&search=<term>
POST /api/v1/validate/frontmatter          {path: "..."}
POST /api/v1/validate/content              {path: "..."}
POST /api/v1/validate/manifest             {path: "..."}
GET  /api/v1/triage/index?enrichment=<level>&discipline=<disc>
POST /api/v1/triage/rebuild-index
POST /api/v1/triage/enrich                 {batch: N, dry_run: bool}
GET  /api/v1/llm/status
POST /api/v1/llm/delegate                  {task: "...", context: "...", model: "..."}
```

### Phase 2: Semantic analysis endpoints

These require importing logic from the analysis scripts:

```
GET  /api/v1/graph/stats
GET  /api/v1/graph/triplets/<page>
GET  /api/v1/graph/incoming/<page>
GET  /api/v1/graph/query?predicate=<pred>
GET  /api/v1/graph/satisfy/<page>
GET  /api/v1/graph/satisfy-all?gaps_only=true
GET  /api/v1/fragments/<page>
GET  /api/v1/fragments/<page>/closure
GET  /api/v1/fragments/delta?a=<page1>&b=<page2>
GET  /api/v1/fragments/summary/<directory>
GET  /api/v1/content/undefined-terms
GET  /api/v1/content/weakest?limit=20
```

The `/content/weakest` endpoint is the most important — it composes
satisfaction deficit + fragment analysis + validation to rank pages by
how much improvement they need. This is the "what should I work on?"
answer.

### Phase 3: Pipeline endpoints

These chain multiple operations into single calls:

```
POST /api/v1/pipelines/triage-enrich-full
     Runs: mechanical enrich → LLM inference → validate → update index
     Params: {batch: N, model: "...", dry_run: bool}

POST /api/v1/pipelines/gap-fill
     Runs: find undefined terms → generate stubs via local LLM → validate
     Params: {limit: N, model: "...", dry_run: bool}

POST /api/v1/pipelines/assess-directory
     Runs: fragment summary + satisfaction check + validation → report
     Params: {directory: "...", depth: N}

POST /api/v1/pipelines/classify-triage
     Runs: mine-relevance → infer-frontmatter → classify → suggest destination
     Params: {focus: "...", batch: N, model: "..."}

GET  /api/v1/pipelines/session-briefing
     Runs: plan status + satisfaction deficit + weakest files + triage stats
     Returns: everything an agent needs to know at session start
     (This single endpoint replaces ~5,000 tokens of Claude inference
      per session)
```

### Phase 4: Dashboard

A simple server-rendered HTML dashboard (Jinja2, no JavaScript
framework) with these views:

1. **Overview**: Total pages, satisfaction rate, triage stats, active
   plans
2. **Board**: Plan board view (Draft / Shaped / Active / Closed columns)
3. **Weakest Files**: Table of pages ranked by improvement need
4. **Triage**: Enrichment status breakdown, process buttons
5. **Graph**: Predicate graph statistics, type distribution
6. **Validation**: Recent validation results, common errors

## Frontmatter specification

Every markdown file in the repo has YAML frontmatter between `---`
delimiters. The minimum required fields are:

```yaml
---
title: "Page title"
date-created: 2026-03-08T00:00:00
---
```

Common semantic fields:
- `type`: term | topic | concept | text | lesson | skill | index |
  question | person | school | babble | letter
- `tags`: CamelCase list (e.g., [Anarchism, PoliticalTheory])
- `defines`: list of terms/concepts this page defines
- `requires`: list of prerequisite pages (paths)
- `extends`: list of pages this builds on
- `cites`: list of intellectual references
- `teaches`: list of concepts taught
- `part-of`: parent structure
- `description`: one-sentence summary
- `authors`: list of author identifiers

Domain-specific extensions add fields like `proven-by`, `axiom`,
`argued-by`, etc.

## Local LLM integration

The application delegates text-forming tasks to local models running
via **Ollama** (HTTP API at `localhost:11434`). The existing
`local_llm.py` client handles:

- Backend discovery (Ollama + Foundry Local)
- OpenAI-compatible `/v1/chat/completions` calls
- Model suggestion by task type
- Automatic fallback between backends

**Key principle**: Local models are **text-forming tools**, not
knowledge sources. All knowledge is supplied as context. The model
transforms, classifies, or formats — it never generates facts from
training data.

Task types and recommended models:
- **classification** (type/tag inference): qwen2.5:3b (fast, sufficient)
- **generation** (definitions, descriptions): qwen2.5:7b (quality)
- **extraction** (structured output from text): qwen2.5:7b
- **long-context** (summarizing large files): phi-3-mini-128k

The model trust ordering from `infer-triage-frontmatter.py` should be
respected: don't re-enrich a file if it was already enriched by an
equal or higher-trust model.

## Plan data structure

Plans are markdown files at
`content/technology/specifications/agential-semioverse-repository/plans/NNNN-slug.md`
with frontmatter:

```yaml
---
title: "Plan title"
date-created: 2026-03-08T00:00:00
status: draft | proposed | accepted | active | completed | abandoned | deferred
priority: critical | high | medium | low
depends-on: [4, 17]      # plan numbers
milestone: "milestone-name"
appetite: small | medium | large
goal: "goal-id"
---
```

The board view groups plans into columns:
- **Draft**: status=draft
- **Shaped**: status=proposed or accepted
- **Active**: status=active (WIP limit: 3)
- **Closed**: status=completed, abandoned, or deferred

## Technical requirements

- **Python 3.11+**, **FastAPI**, **Uvicorn**
- **Jinja2** for dashboard templates
- **No database** — all data comes from the filesystem (markdown files)
  and cached JSON indexes
- **No JavaScript frameworks** — dashboard is server-rendered HTML with
  minimal vanilla JS for interactivity
- The application reads from the `content/` directory (read-only for
  query endpoints, write for enrichment/pipeline endpoints)
- Scripts are in `scripts/` — import their logic directly rather than
  shelling out to subprocess where possible
- For Ollama integration, adapt `scripts/local_llm.py` directly
- Respect the project structure: keep the application code in a new
  top-level `app/` directory

## What "done" looks like

1. `uvicorn app.main:app` starts the server
2. `/docs` shows the OpenAPI schema with all endpoints
3. `/dashboard` shows the content health overview
4. `GET /api/v1/pipelines/session-briefing` returns a complete briefing
   in <2 seconds
5. `GET /api/v1/content/weakest?limit=10` returns the 10 pages most
   needing improvement
6. `POST /api/v1/pipelines/triage-enrich-full` processes a batch of
   triage files through the full pipeline
7. The predicate graph and fragment computations work correctly against
   the actual content

## Build order

Start with Phase 1 (script wrapping) — get the API skeleton working
with real data. Then Phase 2 (semantic analysis) — this is the
highest-value layer. Phase 3 (pipelines) composes Phase 1+2. Phase 4
(dashboard) visualizes everything.

The `/api/v1/pipelines/session-briefing` endpoint is the single
most valuable endpoint — prioritize it. An agent calling this one
endpoint at session start replaces 5,000+ tokens of file reading and
inference.
