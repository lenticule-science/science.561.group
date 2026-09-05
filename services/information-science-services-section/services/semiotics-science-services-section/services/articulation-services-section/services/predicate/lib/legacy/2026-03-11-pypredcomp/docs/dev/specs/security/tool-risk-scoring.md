---
title: "Tool risk scoring"
description: "Every tool call is logged with a risk score. The risk score is computed at log-emit time from the tool's declared risk profile and the call's arguments. High-risk firings trigger closure rules for surfacing and intervention."
kind: spec
status: normative
version: "0.2"
---


Every tool call the substrate emits or accepts — MCP tool calls, driver invocations, runbook step invocations, federation pushes — is recorded as an audit-log cell with a **risk score**.
The risk score is computed at log-emit time from the tool's declared `risk-profile` cell composed with the call's arguments.
Closure rules subscribe to high-risk firings and act on them: surfacing to the captain, requiring operator confirmation, blocking until reviewed, or recording an anomaly.

This spec generalises the captain's existing `bash-audit-log.js` pattern (referenced in the source idea) and the ECC2 tool-logging-with-risk-scores feature into a substrate-resident discipline that applies to every tool surface, not just bash.

Per [decisions/tool-calls-are-risk-scored-at-log-time.md](../../decisions/tool-calls-are-risk-scored-at-log-time.md).
The captain's source idea is [`ecc2-feature-port.md`](../../../../engineering/triage/operations/command/ideas/triage/ecc2-feature-port.md) §2.

## 1. Tool record extension

Every tool the substrate exposes (per [drivers/mcp-driver.md](../drivers/mcp-driver.md) §3 for MCP tools; per [drivers/driver-model.md](../drivers/driver-model.md) for driver operations; per [process/runbook-as-program.md](../process/runbook-as-program.md) §3 for skills) carries a `risk-profile` predicate:

```json
{"s": "tool:respond", "p": "risk-profile", "o": "risk-profile:respond-default", "v": "True"}
{"s": "tool:fs-write", "p": "risk-profile", "o": "risk-profile:fs-mutation", "v": "True"}
{"s": "tool:smtp-send", "p": "risk-profile", "o": "risk-profile:outbound-email", "v": "True"}
```

A `risk-profile` is itself a substrate cell:

```json
{
  "kind": "risk-profile",
  "id": "<sha256>",
  "slug": "risk-profile:fs-mutation",
  "base-score": 30,
  "axes": [
    {"axis": "destructive", "weight": 40, "predicate-pattern": "delete|truncate|overwrite"},
    {"axis": "scope-breadth", "weight": 20, "argument-key": "target-pattern"},
    {"axis": "irreversibility", "weight": 30, "predicate-pattern": "irreversible|hard-delete"},
    {"axis": "external-effect", "weight": 25, "predicate-pattern": "outbound|publish|federate"}
  ],
  "thresholds": {
    "low": 0,
    "medium": 40,
    "high": 70,
    "critical": 90
  }
}
```

The `axes` describe how the score is computed; the `thresholds` describe how the resulting numeric score maps to the four canonical bands.
Both are substrate cells, so the captain can revise risk profiles without code changes; revisions are signed and auditable.

## 2. Score computation

At log-emit time, for a tool call:

```
score = risk-profile.base-score + sum(axis.weight * axis-match(call) for axis in axes)
```

`axis-match` returns 1 when the call satisfies the axis condition (predicate pattern matches the call's payload predicates, argument value matches an argument-key heuristic) and 0 otherwise.
Multipliers and continuous metrics MAY be added by extending the axis schema; the canonical scoring is monotone in axis matches and bounded by the sum of axis weights plus base-score.

The score is mapped to a band:

```
band = highest threshold whose value <= score
```

If no threshold is defined for the matched score range, the band is `low`.
The four canonical bands are normative; risk profiles MAY add custom intermediate bands but every profile MUST include `low`, `medium`, `high`, `critical`.

Scoring runs **at log-emit time, not at policy-evaluation time**.
The score is an attribute of the audit cell, not a derived view.
This makes replay byte-identical: re-running the event log re-computes the same scores from the same risk-profile cells.

## 3. Audit-log cell

Every tool call appends an `audit-log` cell:

```json
{
  "kind": "audit-log",
  "id": "<sha256>",
  "slug": "audit-log:<short-id>",
  "tool": "tool:fs-write",
  "session-id": "session:<id>",
  "boundary": "boundary:<slug>",
  "acting-as": "office:<slug>",
  "fired-at-ord": 12345,
  "input-summary-cell": "cell:<id>",
  "output-summary-cell": "cell:<id>",
  "duration-ord-delta": 4,
  "risk-score": 75,
  "risk-band": "high",
  "risk-profile-version": "<sha256>"
}
```

The cells emitted are EAVT:

```json
{"s": "audit-log:<id>", "p": "kind", "o": "audit-log", "v": "True"}
{"s": "audit-log:<id>", "p": "tool", "o": "tool:fs-write", "v": "True"}
{"s": "audit-log:<id>", "p": "session-id", "o": "session:<id>", "v": "True"}
{"s": "audit-log:<id>", "p": "input-summary-cell", "o": "cell:<id>", "v": "True"}
{"s": "audit-log:<id>", "p": "output-summary-cell", "o": "cell:<id>", "v": "True"}
{"s": "audit-log:<id>", "p": "risk-score", "o": "75", "v": "True"}
{"s": "audit-log:<id>", "p": "risk-band", "o": "high", "v": "True"}
{"s": "audit-log:<id>", "p": "risk-profile-version", "o": "<sha256>", "v": "True"}
```

Input and output summaries are content-addressed cells; large payloads are referenced by `cell-id`, not inlined, so audit-log cells stay small while the actual payload is the witnessed source.

**Per-stratum capability fields (v0.2a, pt-02 / t02-126).** Audit-log cells emitted for retractions carry the stratum at which authority was exercised AND the licensing capability id(s) drawn from the $\Box_R$ gate's matched-cell projection per [capability-model.md](capability-model.md) §3a:

```json
{"s": "audit-log:<id>", "p": "at-stratum",              "o": "saturated",     "v": "True"}
{"s": "audit-log:<id>", "p": "licensed-by-capability",  "o": "capability:<id>", "v": "True"}
{"s": "audit-log:<id>", "p": "retraction-of-target",    "o": "<entity>",       "v": "True"}
```

A retraction is any respond whose `at-stratum` is `"saturated"` or `"settled"`.
Asserted-stratum responds (the legacy default) emit no audit-log cell — payload writes already land as auditable asserted cells via the standard cell + event-log discipline.
The audit-log cell is the load-bearing answer to "by what authority was this derived cell retracted?"; without it, retraction is uninspectable.

In the v0.1 unary-cell substrate the ternary `(audit-log:<id>, p, o)` forms above are inlined into the predicate string per the `bootstrap-users` precedent ([init-boot/bootstrap-users](../init-boot/bootstrap-users.md) §"v0.2-pragmatic shim"); the [binary-cell-emission](../kernel/binary-cell-emission.md) ship target will rewrite this surface to the proper s≠o form.

The `risk-profile-version` pins the exact risk-profile cell that scored this call; later revisions to the profile do not retroactively re-score historical audit-log cells.
This is what makes the risk score replay-stable.

## 4. Closure rules on high-risk firings

The substrate ships canonical closure rules subscribed to high-risk audit-log cells:

```json
{
  "kind": "rule",
  "name": "surface-high-risk-firing-to-captain",
  "premise": [
    {"s": "$audit", "p": "kind", "o": "audit-log", "v": "True"},
    {"s": "$audit", "p": "risk-band", "o": "high", "v": "True"}
  ],
  "conclusion": [
    {"s": "$audit", "p": "captain-attention-required", "o": "True", "v": "True"}
  ]
}
```

```json
{
  "kind": "rule",
  "name": "block-critical-firings-pending-confirmation",
  "premise": [
    {"s": "$audit", "p": "kind", "o": "audit-log", "v": "True"},
    {"s": "$audit", "p": "risk-band", "o": "critical", "v": "True"},
    {"s": "$audit", "p": "operator-confirmation", "o": "*", "v": "None"}
  ],
  "conclusion": [
    {"s": "$audit", "p": "blocked-pending", "o": "operator-confirmation", "v": "True"}
  ]
}
```

A `critical`-band firing produces an audit cell with `blocked-pending`; the substrate's tool-execution layer treats `blocked-pending` as a signal to refuse the call until the operator confirms.
The session's `respond` returns `PCS_TOOL_BLOCKED_PENDING` with the audit-log cell's id; the operator confirms by appending `(audit-log:<id>, operator-confirmation, boundary:<their-id>) = True`; the substrate retries.

Custom closure rules MAY be added per-deployment: the captain can subscribe to `(*, risk-band, critical)` for paging, can subscribe to `(*, tool, tool:smtp-send) ⊙ (*, risk-band, high)` for email-specific surfacing, and so on.
The discipline is open-ended; the canonical rules are the floor.

## 5. Composition with capability discipline

Risk scoring is **observability**, not authorization.
A high-risk firing is logged and surfaced; whether the call is permitted is a separate question handled by the capability fiber per [security/capability-model.md](../security/capability-model.md) §3.

In particular:

- A call that the capability fiber denies returns `PCA_SCOPE_INSUFFICIENT` before the audit-log cell is computed; no audit cell is emitted for a denied call (the capability denial is itself audit-able via the standard repair log).
- A call that the capability fiber permits proceeds; the audit-log cell is emitted; the risk-band rules fire; if `critical`, the call is held by the `block-critical-firings-pending-confirmation` rule pending operator confirmation.
- The two layers compose: capabilities decide *whether* a call is permitted; risk scoring decides *whether the call's emission warrants surfacing or blocking*.

This separation matches the existing substrate discipline: capability is structural, risk score is observable.
A cap-permitted but operationally-risky call is the case the risk score handles.

## 6. Risk profile inheritance

Risk profiles compose.
A driver's tool inherits from its driver's risk profile:

```json
{"s": "driver:smtp", "p": "risk-profile", "o": "risk-profile:outbound-network-default", "v": "True"}
{"s": "tool:smtp-send", "p": "tool-of", "o": "driver:smtp", "v": "True"}
{"s": "tool:smtp-send", "p": "risk-profile-extends", "o": "risk-profile:outbound-network-default", "v": "True"}
{"s": "tool:smtp-send", "p": "risk-profile-additional-axes", "o": "risk-profile:smtp-additional", "v": "True"}
```

Inheritance is via `risk-profile-extends`: the tool's effective risk profile is the union of axes from the extended profile and its own additional axes; weights add.
This lets driver authors ship sane defaults that downstream tool definitions only refine.

## 7. Federation

Audit-log cells federate per [network/federation-protocol.md](../network/federation-protocol.md).
A peer's audit-log cell is admitted under federation-trust and includes the originating peer's risk-profile-version cell-id; the local substrate can verify the peer's risk profile out-of-band if needed.

A peer may have a different risk profile for the same tool slug; the audit-log cell's `risk-profile-version` field disambiguates.
Cross-peer correlation of "all `high`-band SMTP sends across the federation last month" is a query over the federated event log.

## 8. Errors

| Code | Meaning |
|---|---|
| `PCS_TOOL_BLOCKED_PENDING` | A `critical`-band tool call is held pending operator confirmation. Returned to the calling session with the audit-log cell-id. |
| `PCS_RISK_PROFILE_MISSING` | The tool has no `risk-profile` cell; the substrate refuses to execute the call until a profile is asserted. (Tools ship with default profiles; absence is a deployment misconfiguration.) |
| `PCS_RISK_PROFILE_INVALID` | The risk-profile cell is missing required fields (`base-score`, `thresholds.{low,medium,high,critical}`). |
| `PCC_RISK_SCORE_OUT_OF_RANGE` | A re-derived risk score does not match the audit-log cell's recorded score under the cell's pinned `risk-profile-version`. Indicates substrate corruption or a non-deterministic scoring axis (the latter is forbidden). |

## 9. Implementation

### Python (v0.2+)

- Risk profiles as pydantic `RiskProfile` models; axes as typed `RiskAxis` models.
- Score computation in `substrate/risk_scoring.py`; called from the audit-log emit path in `runtime/audit.py`.
- The block-critical and surface-high closure rules ship as substrate cells in the boot-image's `boot/rules/risk-scoring.jsonl`.

### Rust (v0.2+)

- Risk profiles as serde-derived structs with the same axis schema.
- Score computation as a pure function over the call payload + risk-profile cells.
- Audit-log emission integrated into the `respond` path so every tool firing is scored before the call returns.

## 10. Conformance

Tool risk scoring passes:

1. **Score determinism.** The same call payload + the same risk-profile cell produce the same numeric score across replays and across Python/Rust runtimes.
2. **Profile pinning.** A historical audit-log cell's score is computable from the cell's pinned `risk-profile-version`; later revisions to the named profile do not change the historical score.
3. **Band mapping.** A score crossing a threshold value maps to the correct band; threshold edges are inclusive on the lower side per §2.
4. **Critical block.** A `critical`-band firing emits the `blocked-pending` cell and the call returns `PCS_TOOL_BLOCKED_PENDING`; appending the operator-confirmation cell unblocks; the call proceeds and a follow-up audit-log cell records completion.
5. **Inheritance.** A tool extending a parent risk profile produces an effective profile equal to the union of parent and additional axes; scores match the per-axis weight sums.
6. **Capability orthogonality.** A capability-denied call produces no audit-log cell; only capability-permitted calls are scored.
7. **Federation.** A federated audit-log cell admitted under federation-trust carries a verifiable `risk-profile-version` reference; cross-peer queries return correctly attributed audit cells.
8. **Cross-language equivalence.** Python and Rust produce byte-identical audit-log cells (including risk score, risk band, and risk-profile-version) for byte-identical inputs.

## 11. Plan 9 / Unix analogue

| Unix concept | Risk-scoring analogue |
|---|---|
| `auditd` rules | Closure rules on `audit-log` cells |
| `sudo` requiring confirmation | `block-critical-firings-pending-confirmation` rule |
| SELinux labels on operations | `risk-profile` predicate on tools |
| `strace` per-call recording | Audit-log cell per tool call |
| Linux capabilities (CAP_*) per syscall | Capability fiber per call (orthogonal to risk) |
| GRSecurity learning mode | Continuous-learning pipeline observing audit-log cells (v0.9) |
