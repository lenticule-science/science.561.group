---
name: checking-via-residual
description: Applies the right-residual operator (named ⇒ in the substrate's algebra) to determine whether a capability fiber admits a proposed cell-write. Non-amplifying by construction.
category: kernel
inputs:
  - name: arg1
    type: capability-fiber-record
  - name: arg2
    type: cell-record
output:
  type: capability-check-result
---
