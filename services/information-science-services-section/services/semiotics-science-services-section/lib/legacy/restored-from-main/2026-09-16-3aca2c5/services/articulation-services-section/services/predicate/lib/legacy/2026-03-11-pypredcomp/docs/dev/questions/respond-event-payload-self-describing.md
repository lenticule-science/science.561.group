---
title: "Should respond event bodies carry payload-key witness data, or stay pure pointers into the cell store?"
description: "The substrate emits respond events with body {target, sender, cell_id, rules_fired, parent_cell_id} — no payload, no predicate-key digest. An auditor querying 'which event asserted predicate p on entity e' must follow cell_id into the cell store. The conformance test test_reboot_with_same_manifest_is_no_op assumes events are self-describing at the predicate-key level. One of the two surfaces is wrong about its contract."
kind: question
status: open
opened: 2026-05-03
opened-by: agent
disposition-default: defer-to-v0.2b
status-resolved: 2026-05-03
resolved-as: R1 — payload_keys + payload_digest on respond event bodies
resolved-by: captain (build-mode directive)
---

> **Resolved 2026-05-03 (R1).** Captain ruled in favour of self-describing > event bodies.
`respond.py` Phase 4 now writes `payload_keys` > (sorted list) and `payload_digest` (SHA-256 of canonical payload > bytes) on every respond event body.
The cell store remains the > value-of-record; the event log alone now answers > "which event asserted predicate `p` against entity `e`" via a > linear scan, no cell-store join required.
The pt-02 / t02-126 > audit-log fiber stays — its load-bearing job is the > `licensed-by-capability:*` witness data, which `payload_keys` > alone does not carry. ---


## Question

When `respond` writes a `respond`-kind event, should the event body include the payload's predicate keys (or a digest thereof), so the event log alone can answer "which respond asserted predicate `p` against entity `e`" — OR should the event body remain a pure pointer into the cell store (the current shape, body `{target, sender, cell_id, rules_fired, parent_cell_id?}
`), forcing every audit query to join through `cell_id` into the cell store?

## Context

This question surfaced during pt-02 / t02-126 (per-stratum capability fiber for retraction) when a pre-existing conformance test failed: `tests/conformance/test_bootstrap_users_manifest.py::test_reboot_with_same_manifest_is_no_op`.

The test filters the event log by:

```python
e for e in log.iter_events()
if (e.get("body") or {}).get("target") == "deployment"
and any(p.startswith("bootstrap-user-manifest-hash:")
        for p in ((e.get("body") or {}).get("payload") or {}))
```

This filter returns **zero events**, structurally, for *every* respond event the substrate ever emits — not just the bootstrap one — because `respond` (`src/substrate/respond.py` Phase 4) writes:

```python
event_log.append(
    kind="respond",
    body={
        "target": target,
        "sender": sender,
        "cell_id": cell.id,
        "rules_fired": [...],
        "parent_cell_id": parent_id,
    },
    ...
)
```

There is no `payload` key.
The cell exists on disk (the deployment fiber's `predicates` and `cells_by_predicate` maps both contain `bootstrap-user-manifest-hash:<hex>`); the event body just doesn't republish the predicate set the cell encodes.

The test was written expecting events to be self-describing at the predicate-key level.
The substrate doesn't currently do that.
One of the two surfaces is wrong about its contract, and the choice is doctrinal.

## Why this is a real question

Three pulls.

**Pull toward self-describing event bodies (`payload_keys` field):**

- Auditing "which event last touched predicate `p` on entity `e`" becomes a single linear scan over the event log — no cell-store join required.
  This matches the [`event-ordinal-is-time`](../decisions/event-ordinal-is-time.md) posture: the event log is meant to be the time-ordered audit surface.
- It would make the per-stratum retraction audit-log fiber (`specs/security/tool-risk-scoring.md` §3 + pt-02/t02-126) partially redundant — the licensing-capability ids still want to live on a structured fiber, but the "which predicate was asserted at which ordinal" question would already be answerable from the event log alone.
- A predicate-key digest (sorted-keys SHA-256) keeps event bodies small and content-addressed — auditors can spot-check predicate membership without inflating event size.

**Pull toward pure-pointer event bodies (current shape):**

- The cell IS the truth; the event is just "this happened at this ordinal, here is the witness pointer."
  Republishing predicate keys in the event is data duplication, and any divergence between the two surfaces is a substrate-integrity bug ([`PCM_PAYLOAD_INVALID`](../specs/error-codes.md) territory).
- The [`storage-as-projection`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/storage-as-projection.md) theorem positions the cell store as the canonical projection surface; the event log is one specific projection (time-ordered), but it should not duplicate the projection that the cell store already provides (predicate-indexed).
- Keeping events small matters for federation throughput and for the v0.2b heartbeat back-pressure work.

**Pull toward a third path — codify the join discipline:**

- Leave event bodies as pointers; spec an audit-query helper (`audit-query.md` skill?) that documents the event-log → cell-store join as the canonical predicate-aware audit query.
  Update the failing conformance test to use that helper.
- Tradeoff: every higher-level reader (test, dashboard, replay validator) must go through the helper, and the audit surface ends up being two-stage rather than one.

## Default disposition

**`defer-to-v0.2b`**.
The current pure-pointer shape is the substrate's shipped behavior at v0.2a; the failing conformance test is a single point of evidence that one or the other surface diverged from the other's expectations during round-2/round-3 spec enrichment.

Until the captain rules:

1. The failing test `test_reboot_with_same_manifest_is_no_op` is annotated with an `xfail`-marker pointing at this question (see PR notes for t02-126), so the regression doesn't get silently absorbed into the green-test envelope.
2. New audit surfaces (including pt-02 / t02-126's audit-log fiber) continue to record their structured witness data on the **cell store** (audit-log fiber `predicates` map), not in event bodies, keeping the substrate consistent with itself even if the eventual ruling adds a `payload_keys` digest to event bodies.
3. The v0.2b observability work ([milestones/v0.2b-drivers-observability-packaging.md](../milestones/v0.2b-drivers-observability-packaging.md)) is the natural place to revisit, since it formalises what dashboards and replays read from the event log directly.

## What would resolve it

A captain ruling:

- **R1.** "Add a `payload_keys` (sorted list) and `payload_digest` (SHA-256 of canonical bytes) field on `respond` event bodies; the cell-store remains the value-of-record but the event log becomes predicate-aware."
  Implementation: extend `respond.py` Phase 4 + add a kernel spec section to `specs/kernel/respond.md` §"event body schema" + ship target + conformance test stays as-written.
- **R2.** "Event bodies stay as pure pointers."
  Implementation: rewrite the failing conformance test to follow `cell_id` into the cell store; add an audit-query helper module under `src/substrate/audit_query.py`; spec a dedicated `specs/audit/event-cell-join.md` documenting the canonical join.
- **R3.** "Both — events carry `payload_keys` AND a structured audit-log fiber for security-critical surfaces (retraction, capability change, federation receive)."
  This is the union of R1 and the existing pt-02/t02-126 design.

## Cross-references

- Failing test: `tests/conformance/test_bootstrap_users_manifest.py::test_reboot_with_same_manifest_is_no_op`
- Adjacent design: [`specs/security/tool-risk-scoring.md`](../specs/security/tool-risk-scoring.md) §3 (audit-log fiber).
- Adjacent decision: [`decisions/event-ordinal-is-time.md`](../decisions/event-ordinal-is-time.md).
- Adjacent theorem: [`storage-as-projection`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/storage-as-projection.md).
- Round-3 frontier survey verdict to revisit: kernel §"event body schema" (currently `DEFER-TO-v0.2b`).
