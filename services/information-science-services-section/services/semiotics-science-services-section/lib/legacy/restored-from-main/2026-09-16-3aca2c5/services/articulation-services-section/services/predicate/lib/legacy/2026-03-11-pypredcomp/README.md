# pypredcomp — Python implementation of the predicated-computing OS substrate

`pypredcomp` is the Python implementation of the 561 group's predicated-computing OS substrate.
One of two canonical implementations (the other is the Rust port at `operations/engineering/services/mash/`); both pass the same conformance vectors byte-identically.

Current version is `v0.2` (per `pyproject.toml`).
The substrate kernel and v0.1's substrate-boots gate have shipped. v0.2 is in progress: shell + stdlib + process + IPC + driver framework + capabilities + init runlevels + multi-user + packaging + self-hosting, per [`docs/dev/milestones/`](docs/dev/milestones/).

## Boot

```bash
PYTHONPATH=src python -m substrate.runtime
```

Or via the Replit `Start application` workflow (port 5000 → preview pane).
The MCP driver is reachable as `python -m drivers.mcp_driver`.

## Source layout

```
src/
  substrate/        kernel
    algebra              Belnap 2⊗2 bilattice, fibers, ISA
    canonicalization     canonical JSON + content-id
    error_codes          PCC_* / PCR_* / PCM_* / PCS_* / PCH_* / PCA_* / PCE_* / PCB_*
    closure_engine       premise → conclusion fixed-point firing under fuel
    delta_pass           Δ-pass wavefront-worklist settling
    respond              the single write primitive (Phase 1-4)
    runtime              state machine + heartbeat + main()
    projection           presheaf projection
    regime               regime declaration + per-regime envelope
    authorization        ⇒-bounded modal restriction (□_R evaluator)
    cost                 Lawvere-quantale cost composition
    inconsistency        H¹ audit
    message_language     term calculus / β-η reduction (with fuel)
    stdlib               message-language stdlib verbs
  storage/          on-disk
    cell, cell_record, event_log, storage_layout, aliases
  network/          surfaces
    http_server, websocket, federation
  drivers/          drivers
    driver_base, mcp_driver (15-tool catalog over MCP-style stdio)
  shell/            UI
    repl, web_gui
  init_boot/        boot
    boot, runlevels, self_test, bootstrap_users, fiber_reconcile, fixtures/
  process/          process model (v0.2 in progress)
    session, user
tests/
  conftest.py       puts src/ on PYTHONPATH
  conformance/      28 vectors
  property/         hypothesis-driven
  unit/             per-module
  fixtures/         by conformance area
```

The unrelated `operations/engineering/pypred/` tree is math-research tooling and is **not** part of the substrate stack.

## Development docs

`docs/dev/` is the dev project for pypredcomp: charter, decisions, specs, milestones, tasks, questions, references, implementation guides.
Source-of-truth ordering (lowest → highest):

1. **Math** — `library/.../predication-categories/`
2. **Engineering theory** — `library/.../predicated-computing/`
3. **Dev project records** — `docs/dev/specs/`, `docs/dev/decisions/`
4. **Implementation** — `src/`

Code in `src/` cites the spec it implements via module docstrings (e.g. `# specs/kernel/canonicalization.md`); paths resolve under `docs/dev/`.

| Doc | Purpose |
|---|---|
| [`docs/dev/_index.md`](docs/dev/_index.md) | Project landing |
| [`docs/dev/charter.md`](docs/dev/charter.md) | Captain's commitments |
| [`docs/dev/decisions/`](docs/dev/decisions/) | ~50 decisions every implementation inherits |
| [`docs/dev/specs/`](docs/dev/specs/) | OS subsystem specs |
| [`docs/dev/milestones/`](docs/dev/milestones/) | Per-release execution records v0.1 → v1.0 (legacy `plans/` paths redirect here) |
| [`docs/dev/questions/`](docs/dev/questions/) | Open items pending captain answer |
| [`docs/dev/implementation/python.md`](docs/dev/implementation/python.md) | Python implementation guide |
| [`docs/dev/references/`](docs/dev/references/) | Library + RFC pointers |

## HTTP endpoints (`network/http_server.py`)

| Verb | Path | Purpose |
|------|------|---------|
| `GET` | `/` | Web GUI shell |
| `GET` | `/cell/<id>` | Content-addressed cell record |
| `GET` | `/rule/<id>` | Content-addressed rule record |
| `GET` | `/event/<id>` | Event log entry |
| `GET` | `/fiber/<entity-slug>` | Per-entity fiber cache |
| `GET` | `/alias/<name>` | Alias lookup |
| `POST` | `/respond` | Submit a respond call |
| `GET` | `/events?after_ord=N&limit=N` | Stream the event log |
| `GET` | `/health/{live,ready}` | Liveness / readiness |
| `GET` | `/metrics` | Prometheus exposition |
| `GET` | `/node/state` | Full runtime state summary |
| `GET` | `/federation/peers` | Peer list (empty at v0.1) |
| `POST` | `/federation/sync` | ⊙-merge fiber from a peer (demo) |
| `WS` | `/ws` | Fiber subscription |

## MCP tools (15)

`respond`, `query`, `get_cell`, `get_rule`, `get_fiber`, `entity_history`, `add_rule`, `retire_rule`, `set_alias`, `remove_alias`, `witness`, `evidence`, `node_state`, `peers`, `sync_peer`.
Run as `python -m drivers.mcp_driver` (line-delimited JSON-RPC over stdio).

## On-disk layout under `$SUBSTRATE_ROOT`

```
$ROOT/
  events.jsonl
  cells/<pp>/<cell-id>.json       # <pp> = first two hex chars of content-id
  rules/<pp>/<rule-id>.json
  fibers/<entity-slug>/fiber.json
  aliases/<name>
  evidence/<exec-id>.json
  signatures/<id>.json
  config.json
```

## Nix / packaging

The repo-root flake ships:

| Output | Purpose |
|--------|---------|
| `packages.default` / `packages.substrate` | Python application. `nix run` boots substrate on `$SUBSTRATE_PORT` (default 5000). |
| `packages.image` | OCI container image (`dockerTools.buildLayeredImage`). Single-file deploy artifact. The v0.1 "bootable artifact". |
| `apps.boot-check` / `packages.boot-check` | Smoke test: boots on a temp root, polls `/health/ready` for 30s. |
| `devShells.default` | Python 3.12 + pip + pytest + hypothesis + uv. Sets `PYTHONPATH=src`. |

A true QEMU/microvm Linux image is **deferred to v0.2**; v0.1 ships the OCI image as the portable bootable artifact.

## Tests

```bash
pytest                        # full suite
pytest tests/conformance      # gating conformance vectors
pytest tests/property         # hypothesis property tests
pytest tests/unit             # unit tests
```

## Decisions in scope

See [`docs/dev/decisions/`](docs/dev/decisions/).
Most binding at v0.1: no globals / import-time side effects, canonical JSON byte-identity, single `respond` primitive, event-ordinal is time, federation-by-construction, witness-pair encoding internal, slug alphabet lower-kebab, [`pypredcomp-package-location`](docs/dev/decisions/pypredcomp-package-location.md). v0.2 grounding: [`authorization-is-modal-restriction`](docs/dev/decisions/authorization-is-modal-restriction.md), [`cost-is-lawvere-quantale`](docs/dev/decisions/cost-is-lawvere-quantale.md), [`regime-classification-is-load-bearing`](docs/dev/decisions/regime-classification-is-load-bearing.md).
