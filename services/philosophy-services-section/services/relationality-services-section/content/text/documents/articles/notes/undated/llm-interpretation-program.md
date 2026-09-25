---
title: LLM Interpretation Program
kind: structure
layer: program
status: someday
uses:
- system/structure/recognition-carrier
- system/structure/trace-carrier
produces: []
derives-from:
  - computer/structure/computer-kernel
description: This program interprets large language model behaviour as recognitions so outputs can be analysed, aligned, and audited.
---

This program interprets large language model behaviour as recognitions so
outputs can be analysed, aligned, and audited.

## Behaviour

- Represent prompts, completions, intermediate traces, and sampled paths as
  recognitions with provenance.
- Attach measurements: likelihoods, entropy, diversity, error/repair events,
  alignment with value/policy recognitions.
- Map failure modes and capabilities across tasks and contexts.

## Intended operators

- Record and trace LLM interactions; segment into recognitions for analysis.
- Evaluate outputs against measurements and policies; surface anomalies.
- Feed findings into policy, safety, and agent programs.

## Proof
- Derived from: [Computer Kernel](../../../../triage/triage/computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the described behaviour without extending machine semantics.
