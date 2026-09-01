---
title: Historical Collapse
id: historical-collapse
role: structure
status: plan
proof_refs: []
---



Collapse that depends on full flow history, not just current recognition.

## Definition
- Components: recognition plus its [Trace Shuffle Class](./trace-shuffle-class.md)
  history; collapse outcome may vary by history.
- Role: memory-aware nucleus variant.

## Invariants
- History sensitivity: different histories may yield different collapses even
  for same current recognition.
- Consistency: collapse respects admissible histories; avoids paradox.

## Proof
- Uses: trace history and nucleus semantics.
- Shows that: collapse can be made history-dependent when required.
