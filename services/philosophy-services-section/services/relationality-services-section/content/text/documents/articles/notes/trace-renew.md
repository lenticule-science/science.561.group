---
title: Trace Renewal Operators
id: trace-renew
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
description: renew-trace and restep-trace earn re-entry of stabilized tails into the trace without altering earned history, acting on TraceCarrier.
---



`renew-trace` and `restep-trace` earn re-entry of stabilized tails into the
trace without altering earned history, acting on `TraceCarrier`.

## Definition
- Inputs: [Trace Carrier](undated/trace.md).
- Outputs: renewed/restep traces within the same carrier.
- Behaviour: reintroduces stabilised tails into the trace, preserving earned
  prefix history.

## Invariants
- History preservation: prefix/history unchanged by renewal.
- Stability: renewed segments respect trace ordering and earned constraints.

## Proof
- Uses: [Renew Trace](renew-trace.md) and `restep-trace` acts to manage
  re-entry of stabilized tails.
- Shows that: renewal/restep operators re-enter tails without altering earned
  history, preserving trace carrier invariants.

## Earlier material

## Definition
- Inputs: [Trace Carrier](undated/trace.md).
- Outputs: renewed/restep traces within the same carrier.
- Behaviour: reintroduces stabilised tails into the trace, preserving earned
  prefix history.

## Proof
- Uses: [Renew Trace](renew-trace.md) and `restep-trace` acts to manage
  re-entry of stabilized tails.
- Shows that: renewal/restep operators re-enter tails without altering earned
  history, preserving trace carrier invariants.
