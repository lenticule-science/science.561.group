---
title: Judgment Triad
id: judgment-triad
role: structure
status: plan
proof_refs: []
derives-from:
  - acts/trace-judgement-triad
description: The Judgment Triad bundles context, term, and observation recognitions along a trace.
---



The **Judgment Triad** bundles context, term, and observation recognitions along
a trace.

## Definition
- Built by the seed/step/trace judgment triad acts, producing a trace of
  judgments `(context, term, observation)` over the trace infrastructure.

## Invariants
- Trace captures the full history of judgments with admissible steps.
- Components remain in their earned carriers.

## Proof
Derived from the triad acts (`seed-judgement-triad`, `step-judgement-triad`,
`trace-judgement-triad`), which inductively build the judgment trace over
contexts, terms, and observations.
