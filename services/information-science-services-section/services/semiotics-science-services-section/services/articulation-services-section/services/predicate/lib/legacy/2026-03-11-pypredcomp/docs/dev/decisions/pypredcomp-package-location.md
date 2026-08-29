---
title: "Python substrate package is pypredcomp"
description: "The Python implementation of the substrate is `pypredcomp`, located at `operations/engineering/tools/predication-computer/pypredcomp/`. Its top-level packages are `substrate`, `storage`, `network`, `drivers`, `shell`, `init_boot`, and `process`. Runtime entrypoint is `substrate.runtime:main`; MCP-driver entrypoint is `drivers.mcp_driver:main`. The Rust port at `operations/engineering/services/mash/` is the cross-language sibling targeting the same conformance vectors."
kind: decision
date: "2026-05-02"
status: committed
---

# Python substrate package is pypredcomp

## What

The Python implementation of the OS substrate is the `pypredcomp` package, which lives at:

```
operations/engineering/tools/predication-computer/pypredcomp/
```

Its on-disk shape, per its own `pyproject.toml` and `setuptools.packages.find`:

| Package | Purpose | Spec area |
|---|---|---|
| `substrate` | Bilattice algebra, fibers, ISA, `respond`, closure-engine, σ/Δ pass split, regime, projection, message-language, canonicalisation, error codes, runtime | [specs/kernel/](../specs/kernel/) |
| `storage` | Cell record, event log (JSONL), storage layout, aliases, presheaf-storage projections | [specs/filesystem/](../specs/filesystem/) |
| `network` | FastAPI HTTP server, WebSocket subscription, federation receive | [specs/network/](../specs/network/) |
| `drivers` | Driver base; the MCP driver (built on the official `mcp` Python SDK) | [specs/drivers/](../specs/drivers/) |
| `shell` | REPL, web-GUI shell (Jinja templates + minimal JS) | [specs/shell/](../specs/shell/) |
| `init_boot` | Boot sequence, runlevels, bootstrap-users, fiber-reconcile, self-test, fixture loader | [specs/init-boot/](../specs/init-boot/) |
| `process` | Process model (sessions, dispatch, runbooks, inter-session messaging, output streaming) — added as v0.2 work lands per [milestones/v0.2-os-class.md](../milestones/v0.2-os-class.md) | [specs/process/](../specs/process/) |

Conformance fixtures live at `operations/engineering/tools/predication-computer/pypredcomp/tests/fixtures/<area>/`.
Every fixture path named in [specs/conformance-vectors.md](../specs/conformance-vectors.md) resolves under that root.

Runtime entrypoints, per `[project.scripts]` in `pyproject.toml`:

- `substrate = "substrate.runtime:main"` — the substrate runtime; what the `Start application` workflow runs.
- `substrate-mcp = "drivers.mcp_driver:main"` — the MCP driver entrypoint; what an MCP client connects to.

Declared dependencies, per `pyproject.toml` (load-bearing, per [implementation/python.md](../implementation/python.md)):

- `pydantic>=2.5`, `fastapi>=0.110`, `uvicorn[standard]>=0.27`, `websockets>=12.0`, `httpx>=0.27`, `cryptography>=42.0`, `aiofiles>=23.2`, `anyio>=4.2`, `jinja2>=3.1`, `python-multipart>=0.0.9`, `langgraph>=0.2`, `mcp>=1.0`.
- Dev: `pytest>=8.0`, `pytest-asyncio>=0.23`, `hypothesis>=6.100`, `ruff>=0.4`.

The package is **not** installed editable on Replit (the Nix store is read-only); the source is added to `PYTHONPATH` at runtime by `tests/conftest.py` and by the workflow's environment.
`[tool.uv] package = false` records this.

The Rust port at `operations/engineering/services/mash/` is the cross-language sibling.
Both implementations target the same [specs/conformance-vectors.md](../specs/conformance-vectors.md) byte-identically, per [implementation/](../implementation/) and [decisions/engine-language-rust.md](engine-language-rust.md).

The unrelated `operations/engineering/pypred/` tree is mathematics-research tooling, not part of the substrate stack, and is never cited by sprint records.

## Why

The captain has long held that FARS (file substrate) and MASH (Rust runtime engine) should be **real software packages with real names, real specs, and real package boundaries** (per the triage idea [`fars-mash-as-packages`](../../../engineering/triage/operations/command/ideas/triage/fars-mash-as-packages.md)).
The Node/Rust split (per [`node-rust-responsibility-split`](../../../engineering/triage/operations/command/ideas/triage/node-rust-responsibility-split.md)) generalises: the OS has two canonical implementations, each shippable as a packageable artefact, both passing the same conformance vectors.
`pypredcomp` is what that idea looks like once the substrate is Python rather than Node.

The captain's [`naming-coherence`](../../../engineering/triage/operations/command/ideas/triage/naming-coherence.md) note flags that we have called the same things many names.
Codifying `pypredcomp` as the Python substrate's package name — distinct from the math-research `pypred`, distinct from the legacy `mash-engine` — closes that drift inside the sprint records.

The captain's [`system-already-matches-specs`](../../../engineering/triage/operations/command/ideas/triage/system-already-matches-specs.md) instinct applies directly: the substrate the agent imagines from reading `implementation/python.md` (a `src/` tree at the repo root) is not the substrate that exists.
Pointing the records at the real package is the smaller half of "see what is already true."
The architecture-from-first-principles synthesis ([`fars-faoh-mash-architecture-from-first-principles`](../../../engineering/triage/operations/command/ideas/triage/fars-faoh-mash-architecture-from-first-principles.md)) frames `pypredcomp` as the *settled face* (predication at rest as a typed Python package) of the system the Rust engine animates.

The choice resolves three concrete record-vs-reality drifts:

1. The v0.1 conformance gate ("substrate boots, all seven items pass") is satisfied by the running `pypredcomp` tree — the records that say `src/substrate/` are correct in spirit but wrong in path.
2. Every spec that names a fixture path (`tests/fixtures/<area>/...
  `) must resolve to a real file; the only `tests/fixtures/` in the repo is the one under `pypredcomp/`.
3. New executor agents reading the records need to know *where to import from*.
  `from substrate.runtime import ...
  ` works because `pypredcomp/src/` is on `PYTHONPATH`; the records must say so.

## What it rules out

- **Records that name `src/substrate/`, `src/storage/`, etc. as if relative to the repo root.** There is no `src/` at the repo root.
  Such citations are non-conformant and must be rewritten to `operations/engineering/tools/predication-computer/pypredcomp/src/<package>/` or to the package-qualified import (`substrate.runtime`, `drivers.mcp_driver`, etc.).
- **Conformance-fixture paths outside `pypredcomp/tests/fixtures/`.** A spec that names a fixture without a resolvable path under `pypredcomp/tests/fixtures/<area>/` is non-conformant and must be rewritten.
- **Confusion with `operations/engineering/pypred/`.** `pypred` is unrelated math-research tooling.
  No sprint record cites it, depends on it, or imports from it.
- **A second Python substrate.** The Python substrate is `pypredcomp`.
  New Python substrate code goes there, not under a parallel package elsewhere in the repo.

## What it does not constrain

- **Renaming or relocating `pypredcomp` later.** This decision pins the *current* location and shape; a future relocation is a future decision.
- **The internal layout of `pypredcomp/src/<package>/`.** This decision lists which top-level packages exist and what each is for; the file-by-file decomposition inside each package is implementation work and may evolve as v0.2+ work lands.
- **The Rust port's package layout.** `operations/engineering/services/mash/` ships its own `Cargo.toml` and crate boundaries; this decision says only that the Rust port is the cross-language sibling.
- **The dependency set going forward.** Adding or removing a load-bearing dependency on the Python side is captured in [implementation/python.md](../implementation/python.md) and (if substantive) a separate decision; this decision records the dependency set as it stands.
- **The eventual on-disk install location after `nix build`.** The Nix flake produces a self-contained derivation; the source-tree path documented here is for in-tree development and the running `Start application` workflow.
