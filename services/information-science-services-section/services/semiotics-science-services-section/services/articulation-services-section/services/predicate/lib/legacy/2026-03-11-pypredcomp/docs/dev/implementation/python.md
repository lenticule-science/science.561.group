---
title: "Python implementation"
description: "The Python implementation guide. Canonical libraries (PydanticAI, LangGraph, FastAPI, pydantic, asyncio, cryptography, MCP Python SDK). Primary implementation for v0.1 → v0.x."
kind: implementation-guide
status: normative
---

# Python implementation

The Python implementation is the OS's primary canonical implementation through v0.x.
It's built on mature, well-documented Python libraries that map well to the substrate's structure.

## Canonical libraries

These are the load-bearing dependencies.
Substituting any of these requires a captain decision.

### Core

- **[pydantic](https://docs.pydantic.dev/latest/)** (≥2.x) — typed records.
  Cell records, rule records, event records, and every other substrate entity is a pydantic BaseModel.
  Validation, serialization, JSON Schema, custom validators all canonical.
- **[PydanticAI](https://ai.pydantic.dev/)** — typed agent framework on top of pydantic.
  Agents with tools, structured outputs, multi-step flows.
  The substrate's agent runtime (sessions, dispatch, persona-agents at v0.8) builds on PydanticAI's Agent class.
  MCP tool catalog maps to PydanticAI tools.
- **[LangGraph](https://langchain-ai.github.io/langgraph/)** — stateful graph orchestration.
  The closure-rule engine is a LangGraph StateGraph: each rule is a node; premise patterns are edges; settlement is graph traversal to fixed point.
  Runbooks at v0.2 are LangGraph workflows.
  Dispatch at v0.7 is LangGraph multi-agent coordination.
- **[asyncio](https://docs.python.org/3/library/asyncio.html)** — concurrency primitive.
  The heartbeat is an asyncio loop.
  Concurrent respond invocations against disjoint targets run as asyncio tasks.
  The event-log append lock is an `asyncio.
  Lock`.
- **[anyio](https://anyio.readthedocs.io/)** — for async portability across runtimes (asyncio, trio).
  Optional but recommended for libraries that may run under multiple async runtimes.

### Network

- **[FastAPI](https://fastapi.tiangolo.com/)** — HTTP server.
  Combines pydantic validation, asyncio, OpenAPI, WebSocket support.
  Implements `web-server-platform`'s endpoint, middleware, REST, GraphQL surfaces.
  The `/cell/<id>`, `/respond`, `/federation/*` HTTP endpoints from [specs/network/http-addressing.md](../specs/network/http-addressing.md) are FastAPI route handlers.
- **[uvicorn](https://www.uvicorn.org/)** — ASGI server hosting FastAPI.
- **[websockets](https://websockets.readthedocs.io/)** — RFC 6455 implementation; for `/ws` substrate-event subscription.
  (FastAPI uses websockets internally.)
- **[httpx](https://www.python-httpx.org/)** — async HTTP client; for federation pulls/pushes, ActivityPub edges, generic outbound HTTP.

### Cryptography

- **[cryptography](https://cryptography.io/)** — Ed25519 signing/verification (`from cryptography.hazmat.primitives.asymmetric import ed25519`).
  SHA-256 hashing.
  TLS via OpenSSL bindings.

### MCP

- **[mcp](https://github.com/modelcontextprotocol/python-sdk)** — the MCP Python SDK from Anthropic.
  Implements the MCP server-side and client-side.
  The substrate's MCP surface ([specs/drivers/mcp-driver.md](../specs/drivers/mcp-driver.md)) is built directly on this SDK.

### CLI / TUI

- **[typer](https://typer.tiangolo.com/)** — for the message-language CLI.
  Pydantic-aware command definitions; type validation on arguments.
- **[rich](https://rich.readthedocs.io/)** — terminal formatting; structured output rendering for the REPL and TUI shell.
- **[textual](https://textual.textualize.io/)** — the TUI shell ([specs/shell/tui-shell.md](../specs/shell/tui-shell.md)).
  Curses-style UI built on rich.
- **[prompt_toolkit](https://python-prompt-toolkit.readthedocs.io/)** — readline-equivalent for REPL input; autocomplete; history.

### Storage

- **Plain files (`pathlib`, `aiofiles`)** — canonical at v0.1.
  The substrate's storage layout is a directory tree of cells/`<pp>/<id>.json` plus `events.jsonl`.
  Plain files keep us aligned with FARS theory's flatfile substrate.
- **[aiofiles](https://github.com/Tinche/aiofiles)** — async file I/O for the heartbeat loop.
- **(Optional, v0.4+)** **[lmdb](https://lmdb.readthedocs.io/)** — embedded key-value store for fiber-cache acceleration.
  Optional; the canonical substrate is plain JSONL.

### Driver helpers (v0.3+)

- **[matrix-nio](https://matrix-nio.readthedocs.io/)** — Matrix client (CS API) for the chat-client and matrix-driver.
- **[aiohttp-client (or httpx)](https://www.python-httpx.org/)** — for ActivityPub HTTP signatures.
- **[aiosmtplib](https://aiosmtplib.readthedocs.io/)** — async SMTP client.
- **[aioimaplib](https://github.com/bamthomas/aioimaplib)** — async IMAP client.
- **[caldav](https://github.com/python-caldav/caldav)** — CalDAV client; sync, layered on httpx.
- **[icalendar](https://icalendar.readthedocs.io/)** — RFC 5545 parsing/serializing.
- **[asyncio-mqtt](https://github.com/sbtinstruments/asyncio-mqtt)** or **[gmqtt](https://github.com/wialon/gmqtt)** — MQTT 5.0 client.
- **[pymodbus](https://pymodbus.readthedocs.io/)** — Modbus TCP.

### Tooling

- **[ruff](https://docs.astral.sh/ruff/)** — linting, formatting (replaces black + isort + flake8).
- **[pyright](https://microsoft.github.io/pyright/)** or **[mypy](https://mypy.readthedocs.io/)** — type checking.
- **[pytest](https://docs.pytest.org/)** — test framework.
  Conformance vectors are pytest tests parameterized over fixture files.
- **[hypothesis](https://hypothesis.readthedocs.io/)** — property-based testing for the bilattice algebra.
- **[poetry](https://python-poetry.org/)** or **[uv](https://docs.astral.sh/uv/)** — dependency management. **uv** preferred for speed and Nix-friendliness.

## Where Python's strengths help

- **Pydantic models for cell records.** A cell record is a pydantic BaseModel; validation, serialization, JSON Schema, custom validators all come for free.
  Settling-monotonicity is a pydantic validator.
- **PydanticAI tools for MCP.** Each MCP tool is a PydanticAI Tool — typed inputs, typed outputs, descriptions, the MCP catalog generated from agent metadata.
- **LangGraph for the closure-rule engine.** A closure-rule firing is a graph node; premise unification is edge condition; settlement is iteration to a fixed point.
  LangGraph's persistence supports replay-from-event-log.
- **Asyncio for the heartbeat.** The heartbeat tick is an asyncio loop; respond invocations are tasks; concurrent handling falls out naturally.
- **Duck typing for cell payload composition.** A cell's `(s, p, o, v)` shape is fixed but its arbitrary predicate-keyed payload composes flexibly.
  Python's dict-shape lets us implement this without elaborate type machinery.
- **Quick iteration.** Edit a Python file, restart the OS process, observe behavior. v0.1 ships faster.

## Where Python's constraints surface

- **Bilattice value as enum.** Python's strict-typing tools require `BilatticeValue = Literal["None", "True", "False", "Both"]` — workable but verbose.
  The internal witness-pair $(a, b)$ encoding is `tuple[bool, bool]`.
- **Concurrency is asyncio, not preemptive.** True concurrency for sensor-rate ingestion at v0.5+ may need multiprocessing or Rust port.
  For v0.1-v0.4 single-process asyncio is sufficient.
- **GIL.** A single Python process is cooperatively concurrent.
  For ICS at v0.5+ this may force separate processes per outpost.
- **Memory pressure.** Python objects are large; in-memory fiber maps for ~1M cells push RSS hard.
  Mitigation: lazy materialization; LMDB for fiber cache; or accept the limit and lean on Rust port at scale.

## What the Python implementation MUST NOT do

- **Use language features that don't have Rust equivalents.** Metaclasses for substrate self-representation, descriptor protocol for capability injection, monkey-patching for closure-rule registration — all forbidden.
  The substrate's structure must be expressible in Rust without runtime metaprogramming.
- **Rely on import-time side effects** for substrate state.
  The substrate is built from event-log replay, not from `import` chains.
- **Use Python globals** for substrate state.
  All state is in substrate cells, in the event log, or in session-attributed memory.
- **Make pydantic models that don't round-trip canonical JSON byte-identically.** Canonical form is canonical form; pydantic's defaults need configuration to match (sort keys, no whitespace, no `null` defaults serialized).

## Source layout

The Python substrate is the `pypredcomp` package per [decisions/pypredcomp-package-location.md](../decisions/pypredcomp-package-location.md).
It lives at `operations/engineering/tools/predication-computer/pypredcomp/`.
The dev project (these docs, the specs, the decisions, the plans) lives at `pypredcomp/docs/dev/` per [decisions/dev-project-relocated-under-pypredcomp.md](../decisions/dev-project-relocated-under-pypredcomp.md).
Every path below is rooted at the package root.
Imports use the package-qualified form (`from substrate.runtime import ...
`); the package is **not** installed editable on Replit (the Nix store is read-only) — `pypredcomp/src/` is added to `PYTHONPATH` by the `Start application` workflow and by `tests/conftest.py`.
The unrelated `operations/engineering/pypred/` tree is math-research tooling and is **not** part of the substrate stack.

The layout below was verified against the actual `src/` tree on 2026-05-02 as part of task #53.

```
operations/engineering/tools/predication-computer/pypredcomp/
  pyproject.toml                      # name=substrate; setuptools find under src/
  README.md
  src/
    substrate/                        # the kernel (specs/kernel/)
      __init__.py
      algebra.py                      # bilattice, fibers, ISA primitives
      respond.py                      # the respond primitive
      closure_engine.py               # closure-rule firing (LangGraph StateGraph)
      delta_pass.py                   # Δ-pass wavefront-worklist settling
      runtime.py                      # state machine, heartbeat (asyncio); entrypoint `main`
      canonicalization.py             # canonical JSON
      error_codes.py                  # PCC_*, PCR_*, PCM_*, PCS_*, PCH_*, PCA_*, PCE_*
      regime.py                       # regime declaration + per-regime envelope
      projection.py                   # presheaf projection (project_stratum / project_peer / project_at_ord)
      message_language.py             # term calculus / β-η reduction (with fuel)
      authorization.py                # $\Rightarrow$-bounded modal restriction
      cost.py                         # Lawvere-quantale cost composition
      inconsistency.py                # H^1 audit
      stdlib.py                       # message-language stdlib verbs
    storage/                          # specs/filesystem/
      __init__.py
      cell.py                         # the Cell atom class
      cell_record.py                  # CellRecord pydantic model + canonical-bytes
      event_log.py                    # events.jsonl append-only log + hash-chain
      storage_layout.py               # $ROOT/{cells,rules,events,fibers,aliases} layout
      aliases.py                      # alias mapping
    network/                          # specs/network/
      __init__.py
      http_server.py                  # FastAPI app, content-addressed read endpoints
      websocket.py                    # WebSocket subscriptions (substrate-events.v1)
      federation.py                   # peer pull/push/bidirectional protocol
    drivers/                          # specs/drivers/
      __init__.py
      driver_base.py                  # driver model
      mcp_driver.py                   # MCP server on the official `mcp` Python SDK; entrypoint `main`
    shell/                            # specs/shell/
      __init__.py
      repl.py                         # interactive REPL
      web_gui.py                      # web GUI shell (Jinja templates + minimal JS)
    init_boot/                        # specs/init-boot/
      __init__.py
      boot.py                         # boot sequence (cold→initializing→ready)
      runlevels.py                    # runlevel transitions
      self_test.py                    # boot-time fixture replay
      bootstrap_users.py              # initial boundary records
      fiber_reconcile.py              # fiber-cache rebuild
      fixtures/                       # bundled boot fixtures
    process/                          # specs/process/ (extended by v0.2 work)
      __init__.py
      session.py                      # session entity (lifecycle landed)
      user.py                         # boundary entity (boundary records ship at v0.2)
      # remaining v0.2 modules: dispatch, runbook-as-program, inter-session messaging,
      # output streaming, fairness-and-priority — owned by t02-31, t02-32,
      # t02-140..t02-145, t02-170..t02-175 respectively.
  docs/
    dev/                              # the dev project (this directory tree)
  tests/
    conftest.py                       # adds src/ to PYTHONPATH
    conformance/                      # conformance vectors per specs/conformance-vectors.md
    unit/                             # per-module
    property/                         # hypothesis-driven
    fixtures/                         # fixture JSONL files referenced by specs/conformance-vectors.md
      stratification/                 # §11
      tier-routing/                   # §12
      boundary/                       # §13
      messaging/                      # §14
      risk-scoring/                   # §15
      streaming/                      # §16
      mcp-catalog/                    # §17
      skill-manifest/                 # §18
      pipeline/                       # §19
```

The repo-root `flake.nix` and `pyproject.toml` cite this tree; the `Start application` workflow runs `substrate.runtime:main`.

## Boot procedure for the agent (v0.1)

1. From the repo root, run `nix run` (the flake's default app), **or** set `PYTHONPATH=operations/engineering/tools/predication-computer/pypredcomp/src` and run `python -m substrate.runtime`.
  The `Start application` workflow already does the latter.
2. Configure `$ROOT` (substrate storage path) — defaults to a workflow-managed location.
3. Boot sequence drives the runtime through `cold → initializing → ready`.
4. The MCP driver is reachable as `python -m drivers.mcp_driver` (or via the installed `substrate-mcp` script when the package is built into a Nix derivation).
5. The HTTP server is reachable on the configured port (default 5000 under the workflow; 8080 outside).
6. The web GUI shell is reachable at `http://localhost:<port>/`.

## Where to find code-level reference

- **In-process Python implementation:** `operations/engineering/tools/predication-computer/pypredcomp/`.
  The package layout above is the truth-source for the v0.1 conformance gate and for every v0.2+ task that lands Python code.
- **Cross-language Rust sibling:** `operations/engineering/services/mash/`.
  The Rust port targets the same conformance vectors byte-identically per [decisions/engine-language-rust.md](../decisions/engine-language-rust.md).
- **Conformance fixtures:** `operations/engineering/tools/predication-computer/pypredcomp/tests/fixtures/<area>/`, named by [specs/conformance-vectors.md](../specs/conformance-vectors.md).
- **Math-research `pypred` tooling:** `operations/engineering/pypred/` is **not** part of the substrate stack and is never imported from substrate code.
