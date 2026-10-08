---
name: composing-cost
description: Composes two cost-records via the quantale's binary operation ⊗, producing the total cost of running them in sequence. Federation-graph paths compose by the same operation.
category: kernel
inputs:
  - name: arg1
    type: cost-record
  - name: arg2
    type: cost-record
output:
  type: cost-record
title: composing-cost
---
