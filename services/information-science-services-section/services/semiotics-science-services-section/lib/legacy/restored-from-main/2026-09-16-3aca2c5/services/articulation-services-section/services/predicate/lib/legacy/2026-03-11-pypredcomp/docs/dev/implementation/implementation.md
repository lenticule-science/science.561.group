---
title: "Implementation"
description: "Per-language implementation guides. Two canonical implementations: Python first (v0.1 → v0.x), Rust second (v0.x → v1.0). Both pass the same conformance vectors."
kind: index
---


The OS has **two canonical implementations**, per [decisions/engine-language-rust.md](../decisions/engine-language-rust.md):

1. **Python** — first; v0.1 → v0.x.
  Built on PydanticAI, LangGraph, and common Python tooling.
2. **Rust** — second; v0.x → v1.0.
  Ports from Python once the design is proven; uses the existing `mash-engine` crate as a seed.

Both implementations:

- Pass the same conformance vectors byte-identically.
- Speak the same wire formats (canonical JSON, JSONL event log, MCP envelope, federation protocol).
- Bind the same network protocols at byte-level fidelity (citing the same RFCs).
- Implement the same OS subsystem specs.

The two implementations exist for **language-vs-theory separation**: writing the substrate twice in two different languages exposes places where the OS is leaning on language features rather than expressing the predicated-computing theory.
If a substrate feature only works in Python due to duck typing or only works in Rust due to zero-cost abstractions, the design is wrong.
The algebra is the algebra in both languages.

## Open this session

1. **[next-stretch-now.md](next-stretch-now.md)** — pick your v0.2a-closing landing (L1, L2, L3, or L4) and follow the ordered moves.
  Each landing is one pull-request-shaped piece of work with code pointers, theorem grounding, procedural steps keyed to source modules, and conformance proof.
2. **[next-stretch-soon.md](next-stretch-soon.md)** — open this once v0.2a's ship targets are met and the next agent is picking up v0.2b's first slice.
  Same shape as `next-stretch-now.md` but for v0.2b's five parallel-eligible landings (S1 driver model, S2 observability, S3 stdlib + dispatch, S4 nix-flake skeleton, S5 network spec stubs).
3. **[workflows.md](workflows.md)** — recipes for the recurring bits: landing a `t02-NN` task end-to-end, writing a paired fixture, adding a closure rule, debugging settlement non-convergence, debugging projection divergence, debugging non-deterministic replay, working with the event log.
4. **[../references/theory-for-developers.md](../references/theory-for-developers.md)** — read before opening a kernel module; pairs every PredCat / PredComp construct with the spec section that contracts it and the source module that realises it.

## Reference (open as needed)

- [capability-ladder.md](capability-ladder.md) — single canonical view of the build-X-to-enable-Y forward chain across all releases (v0.2a L1 → v1.0 10A).
  Each rung names what it builds, the on-disk theorem authorising it, the captain-trove idea it realises, and the specific later rung it unblocks.
  Telescopes the "Enables next" subsections scattered across the four next-stretch docs into one ordered chain.
  Open when scoping a session whose horizon spans multiple rungs, or when verifying the dependency chain is forced by theorems rather than convenience.
- [next-stretch.md](next-stretch.md) — multi-stage stretch v0.2a residual → v0.2b → v0.3 on-ramp.
  One section per stage with theorem authorisation, captain-trove imaginative grounding, and what each stage unlocks for the next.
  Open at the top of any session whose horizon extends past a single landing.
- [next-stretch-v0.4-v0.6.md](next-stretch-v0.4-v0.6.md) — continuation v0.4 (federation) → v0.5 (industrial control) → v0.6 (third-party SDK).
  Same shape as `next-stretch.md`.
- [next-stretch-v0.7-v1.0.md](next-stretch-v0.7-v1.0.md) — continuation v0.7 (561 productivity stack) → v0.8 (agential layer) → v0.9 (continuous learning + publishing) → v1.0 (self-developing OS).
  Where the captain's imaginative material lands procedurally as corollaries of existing on-disk theorems.
- [python.md](python.md) — Python implementation guide.
  Canonical libraries (PydanticAI, LangGraph, FastAPI, pydantic, asyncio, cryptography, MCP Python SDK).
- [rust.md](rust.md) — Rust implementation guide.
  Starts from `mash-engine`.
  Canonical crates (tokio, serde, axum, tungstenite, ed25519-dalek, MCP Rust SDK).
  Comes after Python; ports forward.
- [conformance-cross-language.md](conformance-cross-language.md) — *(TBD)* test plan that proves both implementations are equivalent.

## Sequencing across releases

| Release | Python implementation | Rust implementation |
|---|---|---|
| v0.1 | Primary; substrate boots in Python | Stretch; algebra-only via `mash-engine` |
| v0.2 | Primary; OS-class | Begin port (substrate kernel only) |
| v0.3 | Primary; bundled userland | Continue port (substrate + drivers) |
| v0.4 | Primary; federation | Catch up; both shippable |
| v0.5 | Both | Both; ICS in either |
| v0.6 | Both | Both |
| v0.7+ | Rust takes over as primary; Python as reference | Primary |
| v1.0 | Reference / interop | Primary; self-developing in Rust |

The Python implementation is **not deprecated** at any point.
It remains a canonical reference implementation through v1.0, especially valuable for:

- Teaching / onboarding new agents.
- Reproducing bugs against a slower-but-clearer codebase.
- Cross-implementation conformance (any new feature must work in both before shipping).

## What MUST be the same across both implementations

- **Wire formats.** Canonical JSON encoding (lexicographic key sort, minimal numeric form).
  JSONL event log line format.
  SHA-256 content addressing.
  Ed25519 signature encoding.
- **Network protocols.** Same RFC bindings; same byte-level fidelity to public specs.
- **MCP surface.** Same tool catalog, same envelope, same error codes.
- **Conformance vectors.** Same fixture replays produce byte-identical fiber state.
- **Determinism.** Same inputs + same state → byte-identical outputs in both languages.
- **Settlement convergence.** Same fuel + same rules → same fixed point.
- **Federation merge.** $\odot$ on a cell value produces the same result in both.

## What MAY differ across implementations

- **Performance characteristics.** Rust is faster; Python is faster to write.
- **Concurrency model internals.** Python uses asyncio; Rust uses tokio.
  Both serialize on the event-log append lock.
- **Memory layout.** Pydantic models vs. Rust structs.
  Same canonical JSON wire form.
- **Library choices for non-substrate work.** Python uses pydantic for type checks; Rust uses serde + the type system.
- **Build pipeline.** Python uses `poetry` / `pdm` / `uv` + Nix flake; Rust uses `cargo` + Nix flake.

## How to pick which implementation to work in

For new feature work, start in **Python**.
It's faster to iterate.
Once the design is proven and tests pass, port forward to Rust if the Rust implementation is at the relevant version.

For bug investigation, **reproduce in both**.
A bug that's only in one language is interesting — it's a hint that the spec is incomplete or one implementation has diverged.

For performance work (sensor-rate ingestion, federation at scale), work in **Rust** if available; otherwise profile Python and either fix or note the bottleneck for the Rust port.

For reading and understanding, the **Python** implementation is canonical.
