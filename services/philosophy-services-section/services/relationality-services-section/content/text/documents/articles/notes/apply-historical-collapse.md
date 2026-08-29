---
title: Apply Historical Collapse
id: apply-historical-collapse
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---


# Apply Historical Collapse

Performs collapse using full flow history.

## Definition
- Inputs: a [Historical Collapse](./historical-collapse.md) policy and
  a [Trace Shuffle Class](./trace-shuffle-class.md).
- Output: collapsed recognition depending on the trace history.
- Behaviour: evaluate collapse with history-sensitive rules; output recognition.

## Invariants
- Determinism given history: same history yields same collapse.
- History relevance: different histories can produce different outcomes even for
  same current state.

## Proof
- Uses: historical collapse policy and trace history.
- Produces: recognition in the carrier.
- Shows that: collapse can incorporate history explicitly.
