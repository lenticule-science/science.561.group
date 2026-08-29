---
title: "Conformance vectors"
description: "Test fixtures every implementation must pass. Cross-language byte-identity vectors."
kind: spec
status: normative
version: "0.1"
---

# Conformance vectors

Test fixtures any conformant substrate implementation MUST pass.
The vectors are the agent's check that the substrate's foundational pieces (algebra, canonicalization, hashing, closure construction) are correct before higher-level work proceeds.

## 1. Adjunction property test

For the four-value bilattice, all 64 triples $(a, p, q)$ MUST satisfy:

$$ a \odot p \le_t q \quad \iff \quad p \le_t (a \Rightarrow q) $$

```rust
#[test]
fn adjunction_property() {
    use Value::*;
    let values = [None, True, False, Both];
    for a in values {
        for p in values {
            for q in values {
                let lhs = (a.fuse(p)).leq_truth(q);
                let rhs = p.leq_truth(a.restrict(q));
                assert_eq!(lhs, rhs, "adjunction fails on ({:?}, {:?}, {:?})", a, p, q);
            }
        }
    }
}
```

The test is gating: if it fails, the algebra is wrong, and no further work proceeds.

## 2. Operator truth tables

Verify $\odot$ matches:

| ⊙ | None | True | False | Both |
|---|---|---|---|---|
| **None** | None | True | False | Both |
| **True** | True | True | Both | Both |
| **False** | False | Both | False | Both |
| **Both** | Both | Both | Both | Both |

Verify $\Rightarrow$ matches:

| ⇒ | None | True | False | Both |
|---|---|---|---|---|
| **None** | True | True | True | True |
| **True** | None | True | False | Both |
| **False** | None | True | False | Both |
| **Both** | None | True | False | Both |

These follow from the witness-pair encoding (per [decisions/witness-pair-encoding-internal.md](../decisions/witness-pair-encoding-internal.md)) but the truth tables are explicit conformance fixtures.

## 3. Canonicalization round-trip

For the canonical Boolean cell-record:

```json
{
  "id": "<computed>",
  "kind": "cell",
  "ord": 0,
  "p": "is-a",
  "o": "test",
  "s": "test:fixture",
  "v": "True"
}
```

The canonical bytes (sorted keys, no whitespace) hash to a known SHA-256.
The vector documents the expected hash; implementations verify.

## 4. Event-log replay

For a known events.jsonl fixture (provided in `tests/fixtures/canonical-log.jsonl`):

- Replay produces a known fiber map.
- The fiber map's per-entity hashes match documented values.
- Idempotent: replay-then-replay produces the same final state.

## 5. Closure-rule firing

For a known fiber state plus a known closure rule:

- Premise matching produces a known set of bind assignments.
- Conclusion firing produces a known sequence of cell events.
- Repair log entries match documented hashes.
- Settlement reaches fixed point in the documented number of layers.

## 6. Federation merge

For two peer fibers (provided in fixtures):

- Per-cell merge via $\odot$ produces a known merged fiber.
- Disagreements correctly produce $\top$.
- The merge's repair log matches documented entries.

## 7. Cross-language vectors

The same input must hash to the same SHA-256 across Rust, Python, Go, JavaScript implementations.
Vectors:

```json
{
  "input": <canonical record>,
  "canonical_bytes": <UTF-8 bytes as base64>,
  "sha256": "<lowercase hex>",
  "id": "<lowercase hex, equal to sha256>"
}
```

A reference Python implementation (in `tests/cross-lang/canonical.py`) produces the documented hashes; Rust, Go, and JS implementations must match.

## 8. Where the vectors live

- `tests/fixtures/` — the canonical fixtures themselves.
- `tests/conformance/` — the test code that runs them.
- The fixture set is small enough to ship in the repo and large enough to catch foundational bugs.

## 9. CI integration

`cargo test --package pc-engine` runs the conformance suite.
Failures block merge.
The CI output names the specific vector that failed, with diff against expected.

## 10. Adding new vectors

Vectors are added when:

- A new substrate primitive is implemented (e.g., when federation merge ships, the merge vectors are added).
- A bug is discovered (the bug becomes a regression vector).
- A cross-language implementation diverges (the divergence becomes a test).

Vectors are NEVER weakened or removed.
Once a vector is in the suite, it stays.

## 11. Stratification and σ/Δ pass vectors

Per [specs/kernel/stratified-facts.md](kernel/stratified-facts.md), [specs/kernel/sigma-delta-passes.md](kernel/sigma-delta-passes.md), and [specs/filesystem/presheaf-storage.md](filesystem/presheaf-storage.md):

### 11.1 Stratum field round-trip

For a cell-record fixture at each of the three strata (`"asserted"`, `"saturated"`, `"settled"`):

- The canonical bytes hash to a known SHA-256.
- The same `(s, p, o, v)` at a different stratum produces a different SHA-256 id.
- A record at stratum `"saturated"` or `"settled"` lacking `derived_from` is rejected with `PCC_MISSING_WITNESS`.
- A record with an unknown stratum string is rejected with `PCC_UNKNOWN_STRATUM`.

### 11.2 σ-only fixture

A fixture with asserted cells and closure rules that produce saturated cells but trigger no bilattice movement:

- The σ-pass emits the documented set of `"saturated"` cells with the documented `derived_from` chains.
- The Δ-pass is a no-op (no `"settled"` cells emitted; no `PCR_DELTA_STABILIZED` repair-log entries).
- The repair log contains exactly one `PCM_RESPOND_PHASE` `"sigma-start"` entry and one `"delta-start"` entry, with no `PCR_RULE_FIRED` entries between `"delta-start"` and the final phase marker.

### 11.3 Δ-only fixture

A fixture with asserted cells whose values force bilattice stabilization without any closure-rule firings:

- The σ-pass is a no-op (no `"saturated"` cells emitted).
- The Δ-pass emits the documented `"settled"` cells with `derived_via` set to `"⊙-stabilize"` or `"⇒-stabilize"`.
- The four-valued bilattice's bounded-settlement property holds: every cell stabilizes within `delta_fuel = 4` substeps.

### 11.4 Combined σ-then-Δ fixture

A fixture where σ-pass conclusions feed Δ-pass stabilization:

- The σ-pass emits saturated cells.
- The Δ-pass emits settled cells with `derived_from` chains pointing to the saturated cells.
- The outer-fuel σ↔Δ alternation converges within 1–2 round-trips.

### 11.5 Retraction fixture

Assert premises; settle the substrate; retract one asserted premise:

- The σ-pass detects dependent-invalidity for every saturated cell whose `derived_from` includes the retracted premise; it emits retraction-cells at stratum `"saturated"`.
- The Δ-pass detects dependent-invalidity for every settled cell whose `derived_from` includes a now-retracted saturated cell; it emits retraction-cells at stratum `"settled"`.
- The asserted retraction itself remains visible at stratum `"asserted"` (asserted facts are first-class claims; retraction is a new asserted cell, not a deletion).
- Replay from the original event log up to before the retraction reproduces the pre-retraction settled fiber byte-identically.

### 11.6 Pathological fuel-exhaustion fixture

A fixture designed to exceed `outer_fuel`:

- The engine surfaces `PCR_SIGMA_DELTA_DIVERGED` with partial state preserved.
- The repair log records the outer-fuel iteration boundary entries up to and including the failure.
- The cells emitted before the failure carry the correct stratum tags.

### 11.7 Presheaf projection round-trip

For an entity touched by σ-pass and Δ-pass within a fixture:

- `project_stratum(fiber, "asserted")`, `project_stratum(fiber, "saturated")`, `project_stratum(fiber, "settled")` return byte-identical bytes for byte-identical (entity, ord) tuples.
- Composition of projections is commutative across distinct indices: `project_stratum(project_peer(fiber, P), s)` equals `project_peer(project_stratum(fiber, s), P)`.
- Discarding the materialised projection files and rebuilding from the event log reproduces byte-identical bytes (per [specs/filesystem/presheaf-storage.md](filesystem/presheaf-storage.md) §10).
- A request for a projection at a future event-ordinal cursor surfaces `PCC_PROJECTION_AT_FUTURE_ORD`.

### 11.8 Federation derivation-trust fixture (v0.2)

Per [specs/kernel/stratified-facts.md](kernel/stratified-facts.md) §5:

- A peer's `"asserted"` cell is absorbed unconditionally.
- A peer's `"saturated"` cell without `(peer:<peer>, derivation-trust, <predicate>) = t` is demoted to `"asserted"` at receive; the receiving substrate runs its own σ-pass against it.
- A peer's `"saturated"` cell with the trust predicate is absorbed at its claimed stratum and its `derived_from` chain is preserved through merge.

## 12. Computation-tier routing vectors

Per [specs/process/computation-tiers.md](process/computation-tiers.md), [specs/agential/non-lm-models.md](agential/non-lm-models.md), and [specs/scheduling/tier-routing.md](scheduling/tier-routing.md).
These vectors gate the cheapest-sufficient tier-routing discipline and the byte-identity property of Tier-2 model inference.

### 12.1 Tier-1 settles, no escalation

A fixture `tests/fixtures/tier-routing/tier-1-settles.jsonl`:

- Asserts an office and a task whose expected-output predicates are fully derivable by closure rules already present in the fixture.
- Expected: the σ/Δ engine settles every expected-output predicate at non-$\bot$.
  The session record carries `computation-tier: tier-1`.
  No `tier-escalated-from` / `tier-escalated-to` events are emitted.
  No model record or LLM event is touched.
  Replay reproduces the fiber state byte-identically.

### 12.2 Tier-2 dispatch instead of LLM

A fixture `tests/fixtures/tier-routing/tier-2-dispatch.jsonl` per [specs/scheduling/tier-routing.md](scheduling/tier-routing.md) §13:

- Establishes an office `office:dispatch-router-test` at `formality-layer: F2` with default admissibility.
- Establishes a model `model:dispatch-router-rfc-v3` per [specs/agential/non-lm-models.md](agential/non-lm-models.md) §1 with pinned weights and confidence-threshold $\tau$.
- Asserts a task whose substrate-algebra alone returns $\bot$ for `dispatch-to-suboffice`.
- Asserts the cells the model needs to reach confidence $\ge \tau$.
- Expected:
  - Tier 1 fires; settles at $\bot$ for the expected-output predicate.
  - The `tier-escalate-bottom-to-tier-2` rule fires; matching `tier-escalated-from: tier-1` and `tier-escalated-to: tier-2` events are emitted with documented hashes.
  - Tier 2 inference fires; the output cell `(task:..., dispatch-to-suboffice, office:..., t)` is emitted with `computation-tier: tier-2` attribution and `derived_from = [model-id, weights-cell-id, input-projection-id]`.
  - The session does NOT touch any Tier-3 LLM invocation event.
  - Replay reproduces every cell byte-identically.
  - Cross-language replay (Python and Rust) produces byte-identical output cells.

### 12.3 Tier-3 escalation denied

A fixture `tests/fixtures/tier-routing/escalation-denied.jsonl`:

- Establishes an office at `formality-layer: F6` with default admissibility (which excludes Tier 3 by §3 of computation-tiers.md).
- Asserts a task whose Tier 1 settles at $\bot$ and for which no Tier-2 model matches the dispatch shape.
- Expected: the scheduler surfaces `PCS_TIER_ESCALATION_DENIED`; the respond returns to the operator with `requires-operator-review: True`.
  No LLM is invoked.
  The decision is replayable.

### 12.4 Tier-2 weights byte-identity

A fixture `tests/fixtures/tier-routing/training-replay.jsonl`:

- Asserts a training-event record per [specs/agential/non-lm-models.md](agential/non-lm-models.md) §3 with pinned RNG state in the hyperparameters cell, a documented corpus cursor range, and a documented hyperparameters cell.
- Expected: running the training event from a clean cell store produces the documented `produced-weights-cell` SHA-256.
  A second run from a clean cell store produces the same SHA-256.
  Cross-language training (Python and Rust) produces the same SHA-256.

### 12.5 Tier-3 LLM-response substitution on replay

A fixture `tests/fixtures/tier-routing/tier-3-replay.jsonl`:

- Establishes an office that admits Tier 3.
- Establishes a recorded Tier-3 invocation event with the LLM response cell present.
- Expected: replay re-asserts the recorded response cell rather than re-invoking the LLM.
  The downstream cells derived from the response are byte-identical to the original run.
  A test runner with no LLM credentials can complete the replay.

### 12.6 Model retraction propagation

A fixture `tests/fixtures/tier-routing/model-retraction.jsonl`:

- Establishes a model and a settled fiber whose `derived_from` chain includes the model's weights.
- Asserts a retraction cell `(model:..., retired-at-ord, <ord>, t)`.
- Expected: the σ-pass detects dependent-invalidity for every saturated/settled cell whose `derived_from` chain includes the retracted model record or its weight cell, per [specs/kernel/sigma-delta-passes.md](kernel/sigma-delta-passes.md).
  The dispatch scheduler stops selecting the retracted model on subsequent ticks.
  Replay before the retraction reproduces pre-retraction inference outputs byte-identically.

## 13. Boundary projection vectors

Per [specs/security/user-as-boundary.md](security/user-as-boundary.md), [specs/security/persona-and-personnel.md](security/persona-and-personnel.md), and [specs/process/session-as-process.md](process/session-as-process.md).
These vectors gate the boundary-entity discipline at v0.2 multi-user.

### 13.1 Boundary projection composition

A fixture `tests/fixtures/boundary/projection-composition.jsonl`:

- Establishes `boundary:emsenn` with auth-method, holds-office `office:planner` (with documented capability-grants), and operates-persona `persona:cassia-lorne`.
- Opens three sessions: `acting-as: personnel`, `acting-as: office:planner`, `acting-as: persona:cassia-lorne`.
- Expected:
  - The personnel-projected session's authz fiber hash equals the documented hash of `boundary-authz` alone.
  - The office-projected session's authz fiber hash equals the documented hash of `boundary-authz ⊙ office-authz`.
  - The persona-projected session's authz fiber hash equals the documented hash of the persona's bounded capability set rebased to `persona:cassia-lorne`.
  - Reordering the asserted-intake of the boundary's projection-cells produces the same projected authz fiber hashes (composition is order-stable).
  - Cross-language replay (Python and Rust) produces byte-identical projected authz fibers.

### 13.2 Persona-attribution does not leak operating boundary

A fixture `tests/fixtures/boundary/persona-quotient.jsonl`:

- Establishes two boundaries `boundary:emsenn` and `boundary:second-operator`, both with `operates-persona: persona:cassia-lorne`.
- Each boundary opens a persona-projected session and authors one cell `(cell:essay-1, authored-by, persona:cassia-lorne)` and `(cell:essay-2, authored-by, persona:cassia-lorne)` respectively.
- Expected:
  - Reading the projection `(persona:cassia-lorne, *, *)` returns the persona's surface only; no `operates-persona`-reverse cells appear in the projection's image.
  - A respond reading `(persona:cassia-lorne, operated-by, *)` from a session lacking the `privileged-cross-projection` capability returns `PCB_PRIVACY_PROJECTION_VIOLATION`.
  - The same respond from a session holding `privileged-cross-projection` returns both operating boundaries.
  - The two essays are indistinguishable to a downstream consumer in the persona projection (no operating-boundary attribution leaks through `authored-by-boundary`, `signature`, or any predicate in the persona projection's image).

### 13.3 Cross-boundary dispatch is bounded by sender authz

A fixture `tests/fixtures/boundary/cross-boundary-dispatch.jsonl`:

- Establishes two boundaries `boundary:alpha` and `boundary:beta`.
  `boundary:alpha`'s authz fiber denies the predicate `set` on `task:*`.
- `boundary:alpha` opens session A; `boundary:beta` opens session B (with full authority over `task:*`).
- Session A dispatches a respond to session B with payload that, if applied directly, would set a `task:*` cell.
- Expected:
  - The dispatched payload reaching session B is bounded by `boundary:alpha`'s authz fiber via $\Rightarrow$; the `task:*`-setting predicate becomes vacuous.
  - Session B's resulting cells reflect the projected payload, not the raw payload.
  - The repair log carries a `PCA_SCOPE_INSUFFICIENT` (or equivalent) entry for the predicate that was bounded out.
  - A symmetric dispatch (B → A) under B's authority reaches A's session unprojected (B's authz allows the predicate); the cell IS set under A's session attribution.

### 13.4 Projection-not-authorised at session-open

A fixture `tests/fixtures/boundary/projection-not-authorised.jsonl`:

- Establishes `boundary:operator` with no `holds-office` and no `operates-persona` cells.
- Attempts session-open with `acting-as: office:planner` and separately with `acting-as: persona:cassia-lorne`.
- Expected: both opens return `PCB_PROJECTION_NOT_AUTHORISED`.
  The session record is not created.
  The repair log records the rejected open with the requested projection surface.
- After asserting `(boundary:operator, holds-office, office:planner) = t`, retrying the office open succeeds and the resulting session's authz fiber matches §13.1.

### 13.5 Boundary inactive rejects auth

A fixture `tests/fixtures/boundary/boundary-inactive.jsonl`:

- Establishes `boundary:retired` with auth-method and one office.
  Asserts `(boundary:retired, active, False) = t`.
- Attempts session-open under any `acting-as` from `boundary:retired`.
- Expected: open returns `PCB_BOUNDARY_INACTIVE`.
  Federation receive of an event signed by `boundary:retired`'s key after the inactive-ord returns `PCB_BOUNDARY_INACTIVE`.
  Events authored before the inactive-ord remain in the history fiber and verify on replay.

### 13.6 Cross-language projection equivalence

A fixture `tests/fixtures/boundary/cross-lang-projection.jsonl`:

- Establishes a boundary with all four fibers populated and three projection surfaces.
- Expected: Python and Rust implementations produce byte-identical projection bytes for `project_auth`, `project_authz`, `project_attention`, and `project_history`, and byte-identical session authz hashes after composition under each `acting-as`.

## 14. Inter-session messaging vectors

Per [specs/process/inter-session-messaging.md](process/inter-session-messaging.md) and [decisions/inter-session-messaging-is-substrate-cells.md](../decisions/inter-session-messaging-is-substrate-cells.md).
These vectors gate the typed-message discipline at v0.2.

### 14.1 Typed-message round trip

A fixture `tests/fixtures/messaging/typed-round-trip.jsonl`:

- Establishes two open sessions `session:alpha` and `session:beta` with mutual `signal:session-message:*` capability grants.
- `session:alpha` authors one message of each canonical `msg-type` (`task-handoff`, `query`, `response` referencing the prior `query`, `completed`, `conflict`).
- Expected: each message-author event produces the documented `session-message` envelope cells with the documented SHA-256 ids; the `surface-unread-session-messages` rule fires within one heartbeat tick and asserts `(session:beta, has-unread-message, session-message:<id>)` for each; mark-read appends `(session-message:<id>, read, session:beta) = True` and the rule no longer fires for that id; the `responds-to` predicate on the response message reaches the prior query under standard closure-rule traversal; replay reproduces every cell byte-identically.

### 14.2 Unknown msg-type rejection

A fixture `tests/fixtures/messaging/unknown-msg-type.jsonl`:

- Attempts to author a message with `msg-type: invalid-kind` between two sessions whose recipient has not registered `invalid-kind` as a subtype.
- Expected: `PCS_MESSAGE_TYPE_UNKNOWN` returned with the partial repair log preserved; no `session-message` envelope cell is appended.
- After registering the subtype on the recipient via a closure rule, retrying succeeds and the envelope is admitted.

### 14.3 Capability rejection on send

A fixture `tests/fixtures/messaging/capability-rejection.jsonl`:

- Establishes a sender session whose boundary's authz fiber denies `signal:session-message:task-handoff` against the recipient.
- The sender attempts a `task-handoff`.
- Expected: `PCA_SCOPE_INSUFFICIENT` returned with the partial repair log preserved; no `session-message` cell appended; no `has-unread-message` cell appears for the recipient on subsequent ticks.

### 14.4 Broadcast with per-recipient read

A fixture `tests/fixtures/messaging/broadcast-duty.jsonl`:

- Establishes a duty `duty:incident-response` with two incumbent sessions.
- Authors a single `query` message addressed to the duty.
- Expected: per-incumbent `(session:<incumbent>, has-unread-message, session-message:<id>)` cells appear within one tick; one incumbent marks-read; the other still has the cell on the subsequent tick; the per-recipient `(session-message:<id>, read, session:<incumbent>)` cells are independent.

### 14.5 Federated message admission

A fixture `tests/fixtures/messaging/federation-admit.jsonl`:

- Establishes a peer `peer:remote` with valid federation-trust and a remote session authoring a `query` to a local session.
- Expected: signature verifies; federation-trust admits; the message is bounded by remote sender's authority via $\Rightarrow$; the local session's `has-unread-message` surfaces the message within one tick; the local `read` cell is independent of any remote `read` state.
- Cross-language equivalence: Python and Rust receivers admit byte-identical envelope cells.

## 15. Tool risk scoring vectors

Per [specs/security/tool-risk-scoring.md](security/tool-risk-scoring.md) and [decisions/tool-calls-are-risk-scored-at-log-time.md](../decisions/tool-calls-are-risk-scored-at-log-time.md).
These vectors gate the risk-scored audit-log discipline at v0.2.

### 15.1 Score determinism

A fixture `tests/fixtures/risk-scoring/score-determinism.jsonl`:

- Establishes a `risk-profile:fs-mutation` cell with documented `base-score`, axes, and thresholds.
- Asserts a tool call against the profile with documented payload predicates.
- Expected: the audit-log cell carries the documented numeric `risk-score`, the documented `risk-band`, and the `risk-profile-version` SHA-256 of the named profile cell.
  Replay re-derives the same score; cross-language replay produces byte-identical audit-log cells.

### 15.2 Profile pinning under revision

A fixture `tests/fixtures/risk-scoring/profile-pinning.jsonl`:

- Asserts a tool call producing an audit-log cell with `risk-profile-version: <hash-A>`.
- Asserts a revised `risk-profile:fs-mutation` cell with different axes, producing `<hash-B>`.
- Expected: a query for the historical audit-log cell returns the original `risk-score` (computed against `<hash-A>`); a new tool call produces an audit-log cell pinned to `<hash-B>` with the new axes' contribution.
  The historical score is not retroactively re-computed.

### 15.3 Critical-band block and confirm

A fixture `tests/fixtures/risk-scoring/critical-block.jsonl`:

- Asserts a tool call whose computed score exceeds the profile's `critical` threshold.
- Expected: the audit-log cell carries `risk-band: critical`; the `block-critical-firings-pending-confirmation` closure rule asserts `(audit-log:<id>, blocked-pending, operator-confirmation) = True`; the calling session receives `PCS_TOOL_BLOCKED_PENDING` with the audit-log cell-id; appending `(audit-log:<id>, operator-confirmation, boundary:<operator>) = True` removes the hold; the call proceeds and a follow-up audit-log cell records completion.

### 15.4 Profile inheritance

A fixture `tests/fixtures/risk-scoring/inheritance.jsonl`:

- Establishes a parent profile `risk-profile:outbound-network-default` and a tool's profile `risk-profile:smtp-extends-network` referencing the parent via `risk-profile-extends` plus its own additional axes.
- Expected: the effective profile's axes are the union of parent and additional axes; the computed score equals the documented sum-of-weights; cross-language scoring matches.

### 15.5 Capability orthogonality

A fixture `tests/fixtures/risk-scoring/capability-orthogonality.jsonl`:

- Asserts a tool call from a session whose capability fiber denies the call.
- Expected: `PCA_SCOPE_INSUFFICIENT` returned with partial repair log; no `audit-log` cell is appended (capability-denied calls are not scored); the standard capability-denial repair-log entry is preserved.
- A symmetric call from a session with capability succeeds; the audit-log cell is emitted and scored.

## 16. Session output streaming vectors

Per [specs/process/session-output-streaming.md](process/session-output-streaming.md) and [decisions/session-output-streams-over-websocket.md](../decisions/session-output-streams-over-websocket.md).
These vectors gate the streaming-output discipline at v0.2.

### 16.1 Chunk emission byte-identity

A fixture `tests/fixtures/streaming/chunk-byte-identity.jsonl`:

- A session spawns a subprocess that writes a documented sequence of N bytes to stdout.
- Expected: the substrate emits M chunks whose concatenated `bytes` (after base64 decode) equal the N bytes byte-identically; M is bounded by ⌈N / `stream-chunk-max-bytes`⌉; per-(session, handle, stream) `chunk-seq` is monotone starting at 0; cross-language emission produces byte-identical events.

### 16.2 UTF-8 codepoint preservation

A fixture `tests/fixtures/streaming/utf8-boundary.jsonl`:

- The subprocess writes a stream containing multi-byte UTF-8 codepoints, with reads engineered to land mid-codepoint.
- Expected: no chunk ends mid-codepoint for `encoding: utf-8`; the runtime buffers partial bytes and prepends them to the next chunk; concatenated chunks decode to the original UTF-8 string.

### 16.3 Stream-end ordering

A fixture `tests/fixtures/streaming/stream-end-ordering.jsonl`:

- The subprocess emits N chunks then closes its stdout.
- Expected: every `stream-chunk` event for the (session, handle, stdout) triple precedes the matching `stream-end` event in event-log order; a synthesized chunk arriving after `stream-end` is rejected with `PCS_STREAM_AFTER_END`; the `exit-reason` field on the `stream-end` matches the documented value.

### 16.4 WebSocket subscription delivery

A fixture `tests/fixtures/streaming/websocket-delivery.jsonl`:

- A subscriber connects via WebSocket before subprocess spawn and subscribes to topic `stream-chunk` filtered by the session's id.
- Expected: every emitted chunk arrives over WebSocket in `chunk-seq` order; a second subscriber connecting mid-stream may opt to backfill via `entity_history` and combine with live chunks without ordering ambiguity.

### 16.5 Capability denial

A fixture `tests/fixtures/streaming/capability-denial.jsonl`:

- A subscriber whose boundary lacks `read:stream-chunk` against the producing session attempts a WebSocket subscription.
- Expected: the subscription is rejected with `PCA_SCOPE_INSUFFICIENT`; the WebSocket close code is 1008; no chunks are delivered over the connection.

### 16.6 Closure-rule subscription replays

A fixture `tests/fixtures/streaming/closure-rule-subscription.jsonl`:

- A closure rule pattern-matches `stream-chunk` cells with `stream: stderr` and `matches-pattern: regex:fatal|panic|abort`, asserting an `anomaly` cell.
- The subprocess emits a documented stderr stream containing the pattern.
- Expected: the rule fires for each matching chunk; the resulting anomaly cells are byte-identical across replays; cross-language replay produces the same matches.

## 17. Bundled MCP catalog vectors

Per [specs/drivers/mcp-driver.md](drivers/mcp-driver.md) §8 and [decisions/bundled-mcp-catalog-is-normative.md](../decisions/bundled-mcp-catalog-is-normative.md).
These vectors gate the bundled MCP catalog discipline at v0.2 (catalog-cell shape, attach surface, per-tool risk defaults) and are extended at v0.8 (office-wiring conformance) per t08-54.

### 17.1 Catalog cell round trip

A fixture `tests/fixtures/mcp-catalog/cell-round-trip.jsonl`:

- Asserts each of the four bundled `mcp-server-record` cells per [specs/drivers/mcp-driver.md](drivers/mcp-driver.md) §8.1 with the documented `slug`, `version`, `transport`, `start-command`, `tools`, `default-capability-profile`, `default-risk-profile-per-tool`, `wired-to-offices`.
- Expected: each cell's canonical-bytes hash matches the documented SHA-256; replay reproduces the cells byte-identically; cross-language substrates produce identical hashes.

### 17.2 Boot-time attach

A fixture `tests/fixtures/mcp-catalog/boot-attach.jsonl`:

- Boots a v0.2 substrate from a fresh state with the bundled catalog cells in `boot/mcp-servers/`.
- Expected: each of the four servers attaches successfully under its documented restart policy; `tools/list` from each attached server matches the catalog cell's `tools` array; mismatches surface `PCS_MCP_TOOL_UNREGISTERED`.
  A stub-binary-missing scenario surfaces `PCS_MCP_SERVER_MISSING`; a version-mismatch scenario surfaces `PCS_MCP_VERSION_MISMATCH`.

### 17.3 Per-tool default risk band

A fixture `tests/fixtures/mcp-catalog/per-tool-risk-band.jsonl`:

- Asserts one tool call for each documented bundled tool (e.g., `mcp:omega-memory`'s `recall`, `remember`, `forget`).
- Expected: the audit-log cell for each call carries the documented default `risk-band` (e.g., `recall` → `low`, `remember` → `medium`, `forget` → `high`); the `risk-profile-version` field references the documented profile cell.

### 17.4 Per-deployment override

A fixture `tests/fixtures/mcp-catalog/per-deployment-override.jsonl`:

- Asserts a substrate edit removing `mcp:playwright`'s `browser-fill` from `office:scrape`'s wiring.
- Expected: a session opened under `office:scrape` after the edit no longer sees `browser-fill` via MCP discovery; `browser-open` and the other listed tools remain available; reverting the edit restores availability on the next session-open.

### 17.5 Office-wiring conformance (v0.8 extension)

A fixture `tests/fixtures/mcp-catalog/office-wiring.jsonl` activated at v0.8:

- Boots an OS with the bundled catalog wired into agential offices per t08-50 through t08-53.
- Expected: a session opened under each `wired-to-offices` office sees the documented tools via standard MCP discovery; `mcp:sequential-thinking`'s `think` tool is reachable from Tier-3 dispatch invocation per [specs/scheduling/tier-routing.md](scheduling/tier-routing.md) §6; capability-bounded `mcp:omega-memory` operations respect boundary projection per [decisions/identity-is-boundary-projection.md](../decisions/identity-is-boundary-projection.md).

## 18. Skill-manifest vectors

Per [specs/stdlib/skill-manifest.md](stdlib/skill-manifest.md), [specs/agential/skill-registry.md](agential/skill-registry.md), [specs/drivers/mcp-driver.md](drivers/mcp-driver.md) §9, and [decisions/skills-have-manifest-contracts.md](../decisions/skills-have-manifest-contracts.md).
These vectors gate the skill-manifest contract at v0.2 (substrate-side aggregation, MCP exposure, `lint-skills`) and at v0.8 (agential consumption surface).

### 18.1 Manifest validation round trip

A fixture `tests/fixtures/skill-manifest/validation-round-trip.jsonl`:

- Asserts a valid `SKILL.md` frontmatter cell conforming to [specs/stdlib/skill-manifest.md](stdlib/skill-manifest.md) §1 and a deliberately broken counterpart (missing `name`, malformed `version` array, unknown `runtime` enum value).
- Expected: the valid manifest passes schema validation and produces the documented `manifest-version` SHA-256; each broken manifest produces `PCS_SKILL_MANIFEST_INVALID` with the documented validator path; cross-language validation (Python and Rust `jsonschema` adapters) produces byte-identical pass/fail decisions.

### 18.2 Boot-time aggregation byte-identity

A fixture `tests/fixtures/skill-manifest/aggregation-byte-identity.jsonl`:

- Provides a documented source tree under `tests/fixtures/skill-manifest/sources/` containing N valid manifests and M invalid manifests.
- Runs `build-skill-manifest` twice from a clean cell store.
- Expected: both runs produce the same `boot/skill-manifest.json` bytes (sorted keys, lexicographic name order) and the same `skill-manifest-built` event SHA-256; the §2 `skill-record` cells appear at the documented ord; cross-language replay (Python and Rust) produces byte-identical aggregates.

### 18.3 Duplicate-name rejection

A fixture `tests/fixtures/skill-manifest/duplicate-name.jsonl`:

- Provides two manifests claiming the same `name`, one under `.local/skills/` and one under `operations/engineering/skills/`.
- Expected: `build-skill-manifest` surfaces `PCS_SKILL_DUPLICATE_NAME`; the `.local/skills/` source is accepted (higher precedence); the operational source is excluded with the documented details; the accepted manifest's `skill-record` cells appear normally; the rejected source's path appears in the `rejected` list of the build result.

### 18.4 MCP enumeration

A fixture `tests/fixtures/skill-manifest/mcp-enumeration.jsonl`:

- Boots a v0.2 substrate after running `build-skill-manifest` against a documented source tree of K skills.
- Expected: `tools/list` returns the documented `skills/list`, `skills/get`, `skills/select-for-task` tool descriptors; `tools/call` against `skills/list` returns the K skill summaries with the documented `manifest-version` SHA-256s; `tools/call` against `skills/get` for each known name returns the full manifest cell whose canonical bytes hash matches the summary's `manifest-version`; `tools/call` against `skills/get` with a stale `manifest-version` returns `PCS_SKILL_MANIFEST_VERSION_MISMATCH`; `get_cell` against the schema's content-addressed id returns the documented schema bytes.

### 18.5 Lint pass/fail

A fixture `tests/fixtures/skill-manifest/lint-pass-fail.jsonl`:

- Provides a clean source tree (every documented warning and error absent) and a deliberately broken source tree (every documented error and warning code present).
- Expected: `lint-skills` against the clean tree returns no `failed` entries and no `warnings`; against the broken tree, each documented error code (`PCS_SKILL_MANIFEST_INVALID`, `PCS_SKILL_DUPLICATE_NAME`, `PCS_SKILL_RUNTIME_UNREGISTERED`, `PCS_SKILL_CAPABILITY_UNDECLARED`) and each documented warning code (`PCS_SKILL_TRIGGER_AMBIGUOUS`, `PCS_SKILL_MISSING_TRIGGERS`, `PCS_SKILL_BODY_EMPTY`, `PCS_SKILL_SOURCE_ROOT_EMPTY`) appears at least once in the report; `severity: error` exits non-zero only on errors; `severity: warning` exits non-zero on errors or warnings; `severity: none` always exits zero.

### 18.6 Skill-registry deterministic ranking (v0.8)

A fixture `tests/fixtures/skill-manifest/registry-ranking.jsonl` activated at v0.8:

- Establishes a documented substrate state with N skills, K of which match a documented task pattern by trigger.
- Calls `select-skill-for-task` with `max-candidates: K` against a documented session.
- Expected: the returned candidate list ranks identically across two replays and across Python/Rust runtimes; the per-axis breakdown matches the documented per-skill scores; lexicographic tie-breaking on `skill-name` resolves equal composite scores deterministically; pinning a subsequent invocation to a stale `manifest-version` surfaces `PCS_SKILL_MANIFEST_VERSION_MISMATCH`; an `office`-filtered call returns a strict subset of the unfiltered list.

## 19. Ideas-to-plans pipeline vectors

Per [specs/agential/ideas-to-plans-pipeline.md](agential/ideas-to-plans-pipeline.md), [specs/governance/triage-workflow.md](governance/triage-workflow.md), and [decisions/triage-promotes-via-pipeline-stages.md](../decisions/triage-promotes-via-pipeline-stages.md).
These vectors gate the substrate-resident triage-to-spec promotion discipline at v0.8 (pipeline-card cell shape, stage transitions, capability discipline, backlink symmetry) and the v0.7 governance-app triage surface stub (t07-24) that consumes the v0.8 pipeline cells.

### 19.1 Pipeline-card round trip

A fixture `tests/fixtures/pipeline/card-round-trip.jsonl`:

- Asserts a `pipeline-card` cell at stage `idea` per [specs/agential/ideas-to-plans-pipeline.md](agential/ideas-to-plans-pipeline.md) §2 with the documented `slug`, `source-file`, `source-cell` SHA-256, `title`, and default-null `fitted-to-release` / `fitted-to-subsystem` / `*-anchors` / `captain-signoff-decision` / `integrated-into-files` fields.
- Expected: the cell's canonical-bytes hash matches the documented SHA-256; replay reproduces the cell byte-identically; cross-language substrates (Python and Rust) produce identical hashes.

### 19.2 Stage progression under capability

A fixture `tests/fixtures/pipeline/stage-progression.jsonl`:

- Establishes a documented `pipeline-card` at stage `idea`; opens four sessions, each holding one of the four pipeline capabilities per [specs/agential/ideas-to-plans-pipeline.md](agential/ideas-to-plans-pipeline.md) §4 (`signal:pipeline:review-card`, `signal:pipeline:plan-fit`, `signal:pipeline:spec-edit`, `signal:pipeline:integrate`); each session in turn authors the cells the next §3 transition rule's premise consumes (review-notes-cell, fit cells, spec/decision/plan-task anchor cells, captain-signoff decision-record).
- Expected: the card transits `idea → review → plan-draft → spec-edit → integrated` across four heartbeat ticks; each `(card, stage, <new-stage>)` cell is emitted with the documented SHA-256; `(card, stage-since-ord, <ord>)` records the transition ord; replay reproduces every cell byte-identically; cross-language replay produces identical stage-cell hashes.

### 19.3 Capability denial halts the pipeline

A fixture `tests/fixtures/pipeline/capability-denial.jsonl`:

- Establishes a `pipeline-card` at stage `review` and a session whose boundary's authz fiber denies `signal:pipeline:plan-fit`.
- The session asserts the fit cells (`fitted-to-release`, `fitted-to-subsystem`).
- Expected: the substrate returns `PCA_SCOPE_INSUFFICIENT`; the fit cells are not appended; the card stays at `review`; the repair log records the capability-denial entry.
  After granting the capability via a substrate-edit cell, retrying the fit-cell authorship succeeds and the card transits to `plan-draft` on the next tick.

### 19.4 Captain-signoff gating

A fixture `tests/fixtures/pipeline/signoff-gating.jsonl`:

- Establishes a `pipeline-card` at stage `spec-edit` with all anchors registered but `captain-signoff-decision` pointing at a `decision` record whose `approval-required: "captain"` field is unsatisfied.
- Expected: the §3.4 transition rule does not fire; the substrate returns `PCS_PIPELINE_SIGNOFF_MISSING` if a session attempts to assert `(card, stage, integrated)` directly.
  Appending a "request changes" `signoff-feedback-cell` (per [specs/governance/triage-workflow.md](governance/triage-workflow.md) §3) does NOT regress the card; `(card, stage, spec-edit)` remains the current cell and no `(card, stage, plan-draft)` cell is emitted.
  Appending a captain-signed `decision-approval` cell on a fresh signoff decision-record satisfies the §3.4 premise; the rule fires within one heartbeat tick; the card transits to `integrated` and the §5 backlink installation triggers as a derived effect.

### 19.4a Capability gates the spec-edit transition independently of office membership

A fixture `tests/fixtures/pipeline/spec-edit-capability-gate.jsonl`:

- Establishes a `pipeline-card` at stage `plan-draft` with all anchors and fit cells registered.
- Opens session A in `office:specifier` holding `signal:pipeline:spec-edit` per the [specs/agential/ideas-to-plans-pipeline.md](agential/ideas-to-plans-pipeline.md) §4 default grants.
- Opens session B in `office:planner` whose authz fiber denies `signal:pipeline:spec-edit` via an explicit $\Rightarrow$-bound denial cell.
- Each session in turn attempts to assert the cells the §3.3 rule's premise consumes.
- Expected: session A succeeds; the §3.3 rule fires; the card transits to `spec-edit`.
  Session B (after retract restoring the card to `plan-draft`) surfaces `PCA_SCOPE_INSUFFICIENT`; no transition cell is emitted.
  The capability is the gate, not the office membership; replay reproduces both outcomes byte-identically.

### 19.5 Backlink symmetry

A fixture `tests/fixtures/pipeline/backlink-symmetry.jsonl`:

- Drives a card through all five stages to `integrated` per §19.2, then queries `(triage-file:<source-path>, integrated-into, *)` and `(sprint-file:<anchor-path>, source-idea, *)` for each named anchor.
- Expected: each query returns a non-empty set; the triage file's `integrated-into` array contains every named anchor path; each anchor file's `source-idea` field contains the triage source path; the `frontmatter-edited-by-pipeline` audit cells reference the integrated card.
  Manually breaking the symmetry (e.g., editing one anchor's `source-idea` to point at a different triage path without updating the other end) surfaces `PCS_PIPELINE_BACKLINK_ASYMMETRY` on the next conformance check.

### 19.6 Merge at review

A fixture `tests/fixtures/pipeline/merge-at-review.jsonl`:

- Establishes two `pipeline-card` cells `pipeline-card:idea-A` and `pipeline-card:idea-B`, each at stage `review`.
  A session with `signal:pipeline:review-card` asserts `(pipeline-card:idea-A, merged-with, pipeline-card:idea-B) = True`.
- Expected: the saturation step emits the symmetric cell `(pipeline-card:idea-B, merged-with, pipeline-card:idea-A) = True`; both cards remain queryable; subsequent fitting on the lexicographically lower slug (the lead) emits a `(follower, fitting-inherited-from, lead)` cell at the saturated stratum.
  A merge attempt at `plan-draft` or later without a prior anchor retract surfaces `PCS_PIPELINE_MERGE_AFTER_FIT`.

### 19.7 Sweep idempotency

A fixture `tests/fixtures/pipeline/sweep-idempotency.jsonl`:

- Provides a documented triage-source tree under `tests/fixtures/pipeline/triage-sources/` containing N markdown files (some with `integrated-into` frontmatter, some without) and a substrate state with K existing `pipeline-card` cells covering a subset of the un-integrated files.
- Runs `pipeline-card-from-triage` twice from the documented substrate state.
- Expected: the first run emits exactly `N - K - (count-of-files-with-integrated-into)` new `pipeline-card` cells at stage `idea` with documented `source-cell` SHA-256s; the second run emits zero new cells; cross-language sweep (Python and Rust) produces byte-identical card cells.

### 19.8 Catalog migration

A fixture `tests/fixtures/pipeline/catalog-migration.jsonl`:

- Provides documented snapshots of `references/ideas-trove.md` and `references/triage-backlog-os-level.md` containing the documented set of `**(Integrated into ...)**` and `**Integrated into ...**` markers per [specs/governance/triage-workflow.md](governance/triage-workflow.md) §6.
- Runs the catalog migration sweep.
- Expected: a retroactive `pipeline-card` at stage `integrated` is emitted for each marked entry, with `captain-signoff-decision: decision:retroactive-pipeline-migration` and `integrated-into-files` populated from the marker's named paths; a marker referencing a triage file whose source-cell hash cannot be resolved surfaces `PCS_TRIAGE_CATALOG_MIGRATION_AMBIGUOUS` and the entry is skipped (not retried).
  Re-running the sweep on the same substrate emits zero additional cards (idempotency).

### 19.9 Substrate-edit backward movement

A fixture `tests/fixtures/pipeline/backward-substrate-edit.jsonl`:

- Drives a card through to stage `integrated` per §19.2.
- Attempts a `(card, stage, integrated)` retract from a session lacking `signal:pipeline:integrate`.
  Expected: `PCA_SCOPE_INSUFFICIENT`; no retract cell is appended.
- Attempts the same retract from a captain-signed session holding `signal:pipeline:integrate`.
  Expected: the retract succeeds; the substrate's saturation step re-derives the card's stage as `spec-edit` (the highest §3 premise still satisfied); a fresh signoff decision-record on re-submission fires the §3.4 rule and re-integrates the card with documented audit cells.
- Separately, on a card at stage `spec-edit`, attempts a merge with another `spec-edit`-stage card without retracting anchors first.
  Expected: `PCS_PIPELINE_MERGE_AFTER_FIT`; the substrate refuses.
  Retracting the affected `spec-anchors` cells from the planner-authority session drops the card to `plan-draft` (or `review`, depending on which premises remain); the merge then succeeds.

### 19.10 Federation isolation of pipeline-cards

A fixture `tests/fixtures/pipeline/federation-isolation.jsonl`:

- Establishes a peer `peer:remote` and absorbs a remote-peer `pipeline-card` cell at stage `spec-edit` with a remote-signed signoff decision-record.
- Expected: the remote card is visible in the local substrate via standard federation receive; the local governance-app triage queue surface (per [specs/governance/triage-workflow.md](governance/triage-workflow.md) §7) does NOT include the remote card in the local captain-signoff queue absent a `(peer:remote, derivation-trust, pipeline-card)` cell.
  Asserting the trust cell adds the remote card to the local queue on the next render.
  The remote signoff decision-record federates as a standard decision-record; absorbing it without the trust cell does not auto-integrate the remote card on the local substrate.
