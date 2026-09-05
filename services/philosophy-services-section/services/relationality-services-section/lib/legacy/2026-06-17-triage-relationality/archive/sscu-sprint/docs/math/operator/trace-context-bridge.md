---
title: "Trace\u2013Context Bridge"
role: operator
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---



`seed-first-context`, `extend-context`, and `retrace-context` earn the link
between traces and contexts: anchoring, extending, and replaying contexts along
`TraceCarrier` compatibly.

## Definition
- Inputs: [Trace Carrier](../structure/trace.md) and earned context
  acts (seed/extend/retrace).
- Outputs: updated [Trace Carrier](../structure/trace.md) reflecting
  context anchoring/extension/replay.
- Behaviour: seeds the first context, extends along trace steps, and retraces
  to replay contexts, ensuring compatibility with trace ordering.

## Invariants
- Trace-context consistency: context anchoring/replay respects trace order.
- Stability: retracing preserves earned context invariants.

## Proof
- Uses: [Retrace Context](retrace-context.md) and supporting acts (seed/extend)
  to anchor, extend, and replay contexts.
- Shows that: lifting context-seeding/extension/retracing yields a bridge
  operator over the trace carrier with trace-order consistency.
