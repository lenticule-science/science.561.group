---
name: composing-via-merge
description: Applies the bilattice merge operator (named ⊙ in the substrate's algebra) to two cell values at the same (subject, predicate, object) coordinate, producing the knowledge-order join ∨_k. Two cells at t and f merge to ⊤; one at t and the other at ⊥ merge to t.
category: kernel
inputs:
  - name: arg1
    type: cell-record
  - name: arg2
    type: cell-record
output:
  type: cell-record
---
