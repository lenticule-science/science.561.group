---
name: checking-replay-determinism
description: Compares replay output against the conformance vector and reports any divergence.
category: kernel
inputs:
  - name: arg1
    type: replay-determinism-vector-record
output:
  type: event-log-record
---
