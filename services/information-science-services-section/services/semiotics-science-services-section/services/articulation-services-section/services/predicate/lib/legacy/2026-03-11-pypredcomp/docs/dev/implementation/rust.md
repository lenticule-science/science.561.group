---
title: "Rust implementation"
description: "The Rust implementation guide. Hardened/firm version. Ports forward from Python; uses the existing mash-engine crate as a seed. Canonical at v0.x → v1.0."
kind: implementation-guide
status: normative
---

# Rust implementation

The Rust implementation is the OS's hardened canonical implementation, taking over as primary at v0.x → v1.0.
It is **not** the v0.1 implementation; the Python implementation (`pypredcomp` at `operations/engineering/tools/predication-computer/pypredcomp/`) ships first per [decisions/engine-language-rust.md](../decisions/engine-language-rust.md).
The Rust sibling lives at `operations/engineering/services/mash/` and inherits the same dev project as `pypredcomp` (this directory tree, per [decisions/dev-project-relocated-under-pypredcomp.md](../decisions/dev-project-relocated-under-pypredcomp.md)).
There is exactly one dev project per implementation lineage; the Rust sibling does not have its own `docs/dev/`.

The Rust implementation comes after the Python one for two reasons: (1) the design is proven before commitment to Rust's stricter type discipline; (2) the existing `mash-engine` crate provides a seed for the algebra, but the surrounding subsystems are easier to iterate in Python first.

## Canonical crates

These are the load-bearing dependencies for the Rust port.
Substituting any of these requires a captain decision.

### Core

- **`mash-engine`** (the captain's existing crate at `operations/engineering/services/mash/`) — the bilattice algebra (Belnap 2⊗2, $\odot$, $\Rightarrow$, fixed-point iteration).
  Already implemented and tested.
  The Rust kernel ports from this crate.
- **[`serde`](https://serde.rs/)** + **[`serde_json`](https://github.com/serde-rs/json)** — canonical JSON.
  `serde_json::to_writer_pretty` is wrong; canonical form requires sorted keys + no whitespace; the canonicalization module wraps serde to enforce.
- **[`tokio`](https://tokio.rs/)** — async runtime.
  The heartbeat is a `tokio::main` loop; concurrent respond invocations are `tokio::spawn`ed tasks.
- **[`anyhow`](https://github.com/dtolnay/anyhow)** + **[`thiserror`](https://github.com/dtolnay/thiserror)** — error types.
  PCC_* / PCR_* / etc. mapped to thiserror enums.

### Network

- **[`axum`](https://github.com/tokio-rs/axum)** — HTTP server (FastAPI's Rust analogue).
  Implements [specs/network/http-addressing.md](../specs/network/http-addressing.md) endpoints.
- **[`tungstenite`](https://github.com/snapview/tungstenite-rs)** + **[`tokio-tungstenite`](https://github.com/snapview/tokio-tungstenite)** — WebSocket (RFC 6455).
- **[`reqwest`](https://github.com/seanmonstar/reqwest)** — async HTTP client; for federation pulls/pushes, generic outbound.
- **[`hyper`](https://hyper.rs/)** — lower-level HTTP if needed (axum and reqwest both build on hyper).

### Cryptography

- **[`ed25519-dalek`](https://github.com/dalek-cryptography/ed25519-dalek)** — Ed25519 signing/verification.
- **[`sha2`](https://github.com/RustCrypto/hashes/tree/master/sha2)** — SHA-256.
- **[`ring`](https://github.com/briansmith/ring)** or **[`rustls`](https://github.com/rustls/rustls)** — TLS.

### MCP

- **MCP Rust SDK** — at the time of writing, no first-party Anthropic Rust SDK exists.
  The Rust implementation either:
  1. Calls into the Python MCP SDK via PyO3 (transitional; v0.x).
  2. Implements the MCP wire protocol from spec (canonical; v0.x+).

### CLI / TUI

- **[`clap`](https://github.com/clap-rs/clap)** — for the message-language CLI; pydantic-aware-equivalent (CLI args derive from typed structs).
- **[`ratatui`](https://github.com/ratatui-org/ratatui)** — TUI shell.
  Tooling rich+textual's analogue in Rust.
- **[`crossterm`](https://github.com/crossterm-rs/crossterm)** — terminal control (used by ratatui).
- **[`reedline`](https://github.com/nushell/reedline)** — readline-equivalent for the REPL.

### Storage

- **`std::fs` + `tokio::fs`** — canonical at v0.1+.
  Plain files; FARS-aligned flatfile substrate.
- **(Optional, v0.4+)** **[`heed`](https://github.com/meilisearch/heed)** or **[`sled`](https://github.com/spacejam/sled)** — embedded key-value store for fiber-cache.

### Driver helpers (v0.3+)

- **[`matrix-sdk`](https://github.com/matrix-org/matrix-rust-sdk)** — Matrix client + server (CS + S2S APIs).
- **[`activitypub-federation`](https://crates.io/crates/activitypub_federation)** — ActivityPub for the fediverse edge.
- **[`mail-send`](https://github.com/stalwartlabs/mail-send)** + **[`mail-parser`](https://github.com/stalwartlabs/mail-parser)** — SMTP/MIME.
- **[`async-imap`](https://github.com/async-email/async-imap)** — IMAP client.
- **[`icalendar`](https://github.com/hoodie/icalendar-rs)** — RFC 5545 parsing/serializing.
- **[`rumqttc`](https://github.com/bytebeamio/rumqtt)** — MQTT 5.0 client.
- **[`tokio-modbus`](https://github.com/slowtec/tokio-modbus)** — Modbus TCP.

### Tooling

- **`cargo`** — package manager + build.
- **`rustfmt`** — formatting.
- **`clippy`** — linting.
- **[`cargo-nextest`](https://nexte.st/)** — test runner.
- **[`proptest`](https://github.com/proptest-rs/proptest)** — property-based testing for the algebra.

## Where Rust's strengths help

- **Type safety.** Cell records, rule records, error codes, runtime states all expressed as Rust enums and structs with exhaustive pattern matching.
  Compile-time enforcement of settling-monotonicity invariants.
- **Performance.** Sensor-rate ICS ingestion (v0.5+) and federation at scale work natively.
  No GIL.
- **Memory discipline.** Predictable RSS even with ~10M+ cells in the in-memory fiber map.
  Bounded latency for respond.
- **Memory safety.** The substrate is the security boundary; Rust's borrow checker eliminates a class of bugs.
- **`mash-engine` already exists.** The algebra is correct and tested.
  The Rust port leverages this.
- **Zero-cost abstractions.** Closure-rule firing decomposed to ISA operations decomposed to bit operations on the host — all without runtime overhead.

## Where Rust's constraints surface

- **Bilattice as enum.** `enum BilatticeValue { None, True, False, Both }` — clean, but adding a new value requires touching every match arm.
  (We don't add new values; the algebra is fixed.)
- **Closure rules as data, not code.** Rules are JSON, not Rust functions.
  The closure-rule engine is an interpreter over rule records, not a Rust trait dispatch.
  This is good (rules are substrate cells, per `self-representation-everywhere`) but requires explicit interpretation logic where Python could use `eval`-like patterns.
- **Async coloring.** Async vs sync function coloring requires careful boundary design.
  Acceptable; tokio's ergonomics in 2024+ are good.
- **Compile times.** Iteration is slower than Python.
  Mitigated by `cargo check` and incremental compilation.

## What the Rust implementation MUST NOT do

- **Use unsafe except inside well-justified, documented modules.** The substrate is the security boundary; unsafe should be exceptional, not pervasive.
- **Diverge from the Python implementation's spec.** If the Python implementation produces fiber state X for inputs Y, the Rust implementation must too.
  Spec divergence is bug, not feature.
- **Use compile-time substrate generation.** The substrate is built from event-log replay; using build.rs to generate substrate cells is forbidden.
  Cells are runtime data.
- **Make `serde` shortcut canonical JSON.** `serde_json` defaults are not canonical; the canonicalization module enforces sorted keys, no whitespace, minimal numeric form.

## Source layout

Mirrors the Python source layout:

```
crates/
  substrate/                    # specs/kernel/
    src/
      algebra.rs                # bilattice, fibers, ISA primitives (ports mash-engine::algebra)
      respond.rs                # the respond primitive
      closure_engine.rs         # closure-rule firing
      runtime.rs                # state machine, heartbeat
      canonicalization.rs       # canonical JSON over serde
      error_codes.rs            # PCC_*, PCR_*, etc. as thiserror enums
  storage/                      # specs/filesystem/
    src/
      cell_record.rs
      event_log.rs
      storage_layout.rs
      aliases.rs
  network/                      # specs/network/
    src/
      http_server.rs            # axum
      websocket.rs              # tokio-tungstenite
      federation.rs
      # protocol bindings...
  drivers/                      # specs/drivers/
    src/
      driver_base.rs
      mcp_driver.rs
      matrix_driver.rs
      # ...
  shell/                        # specs/shell/
    src/
      repl.rs                   # reedline
      cli.rs                    # clap
      web_gui.rs                # axum templates
      tui.rs                    # ratatui
  stdlib/                       # specs/stdlib/
    src/
      # 12 verbs
  security/                     # specs/security/
  init_boot/                    # specs/init-boot/
  packaging/                    # specs/packaging/
  scheduling/                   # specs/scheduling/
  apps/                         # specs/bundled-apps/
flake.nix                       # Nix flake (same as Python; multi-language)
Cargo.toml                      # workspace root
```

## Boot procedure (Rust, once at v0.x+)

1. `cargo build --release` from the OS source directory.
2. Configure `$ROOT`.
3. Run `target/release/substrate` to start the runtime in `cold` state.
4. Boot sequence drives transition: `cold → initializing → ready`.
5. MCP server reachable on stdio or HTTP.
6. HTTP server reachable on configured port.
7. Web GUI shell reachable at the configured URL.

## Cross-language conformance

Both implementations pass the same conformance vectors.
Specifically:

1. Algebra round-trip: Python and Rust produce byte-identical fiber state from byte-identical input fixtures.
2. Settlement convergence: same fuel + same rules → same fixed point in both.
3. Federation merge: $\odot$ on a cell value produces the same result.
4. Wire format: canonical JSON encoding is byte-identical between languages.
5. Network protocol bindings: both pass the same RFC-conformance test peers.

The cross-language conformance test suite is run on every PR to either implementation.
A passing test in only one language blocks the PR until both pass.

## Migration plan: when Rust catches up

The Rust implementation begins at v0.2 (after Python's v0.1 substrate boots).
It progresses subsystem-by-subsystem:

- v0.2: kernel (algebra, respond, closure-engine, runtime).
- v0.3: filesystem, network HTTP, MCP driver.
  Catches up to Python's v0.3 by v0.x.
- v0.4: federation, ActivityPub, Matrix S2S.
  Both implementations shippable.
- v0.5: ICS bindings, MQTT, Modbus.
  Rust takes over for sensor-rate ingestion.
- v0.6+: Rust is primary; Python remains a reference / interop / teaching implementation.

The Rust port is **not** a rewrite of Python; it ports the spec directly.
Python is what proved the spec correct; Rust is what makes the spec fast and safe.
