---
title: Apply Historical Collapse
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



Performs collapse using full flow history.

## Definition
- Inputs: a [Historical Collapse](../structure/historical-collapse.md) policy and
  a [Trace Shuffle Class](../structure/trace-shuffle-class.md).
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
