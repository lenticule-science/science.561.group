---
title: "Self-test"
description: "Boot-time fixture replay. The substrate refuses to enter ready state until the self-test passes."
kind: spec
status: normative
version: "0.1"
---


At every startup, the substrate runs a deterministic self-test before transitioning from `initializing` to `ready`.
The self-test verifies that the algebra, canonicalization, and storage paths are operating correctly in this specific runtime.

## 1. Self-test sequence

Run in order during initialization:

1. **Algebra round-trip.** Compute the adjunction property test on all 64 triples.
  If any fails, fatal: enter `stopped` with `PCC_ALGEBRA_INCONSISTENT`.
2. **Canonicalization round-trip.** Take the canonical Boolean cell fixture (per [conformance-vectors.md](conformance-vectors.md) §3); canonicalize; hash; verify against the documented hash.
  If mismatch, fatal: enter `stopped` with `PCC_CANONICALIZATION_BROKEN`.
3. **Storage round-trip.** Write a known cell to a temp location; read it back; verify byte-identical.
  If mismatch, fatal: enter `stopped` with `PCS_CORRUPT_STORE`.
4. **Event-log integrity.** Validate `events.jsonl` hash chain.
  If broken, transition to `degraded` with `PCS_CORRUPT_STORE` (read-only mode); refuse writes.
5. **Cell-record spot check.** Random sample (default 1%) of cell-record files; verify each file's hash matches its filename stem.
  Mismatches → `degraded`.
6. **Closure rule load.** Load the active rule set from substrate; verify each rule record parses and its premise patterns are valid.
  Invalid rules → `degraded`; specific rules listed in health endpoint.
7. **MCP server start.** Bind the configured transport; verify a no-op tool call round-trips.
  Failure → `degraded` with MCP unavailable.
8. **HTTP server start.** Bind port; verify `/health/live` returns 200.
  Failure → `degraded` with HTTP unavailable.

Steps 1–3 are gating: any failure leaves the substrate in `stopped`.
Steps 4–8 may produce `degraded` with specific capabilities unavailable, but the substrate continues.

## 2. Outcomes

After the self-test:

- All steps passed → `ready`.
- Steps 1–3 failed → `stopped`.
- Steps 4–8 failed → `degraded` with `reason` predicate naming the failure.

The state is itself a substrate cell: `(node:<id>, runtime-state, "<state>") = t`.
External monitors read this via the `node_state` MCP tool or `/health/ready` HTTP endpoint.

## 3. Self-test fixture

The fixture is a small self-contained substrate state:

- 5 entities.
- 12 cells across the four bilattice values.
- 2 closure rules.
- A known final fiber map after settlement.

Stored at `tests/fixtures/self-test/events.jsonl` and `tests/fixtures/self-test/expected-fibers.json`.

The fixture is deterministic; replay always produces the same result.
The test is byte-identity, not heuristic.

## 4. Performance budget

The self-test must complete in < 1 second on commodity hardware.
This is a hard budget; if a runtime change makes it slower, that change is reverted unless explicitly justified.

The reasoning: startup latency matters operationally; a slow self-test discourages restarts; restarts must be cheap to encourage them when needed.

## 5. Operations

```bash
# explicit self-test from CLI
pc-cli self-test

# via MCP
mcp tool call self_test {}
```

CLI self-test runs the full sequence and prints a pass/fail report.
It does NOT advance state — it's diagnostic.

The MCP `self_test` tool returns `{ status: "ok" | "degraded" | "fatal", failures: [...] }` for monitoring integration.

## 5.1. Witness lifecycle

Boot-failure witnesses produced on self-test failure conform to [`_patterns/witness-lifecycle.md`](../_patterns/witness-lifecycle.md) — `boot-failure` class with `kind` set `{repair-and-rerun, quarantine-driver, acknowledge}`.
The four-state monotone lifecycle (`open → proposed → resolved → archived`, with the `open → resolved` acknowledgement shortcut) applies uniformly with the inconsistency-witness case.
Cross-link added in round 4.

## 6. Why this matters

The substrate's value is determinism.
The self-test is the runtime's own confirmation that determinism is preserved on this hardware, this OS, this rust toolchain version, this point in time.
A passing self-test means the implementation is *exactly* what conformance vectors expect; a failing one is structural drift.

Without the self-test, drift accumulates silently: a new compiler optimization changes a hash, a system library update changes JSON encoding, a SHA-256 implementation has a subtle bug.
The self-test catches these on first startup, not after weeks of corrupted data.
