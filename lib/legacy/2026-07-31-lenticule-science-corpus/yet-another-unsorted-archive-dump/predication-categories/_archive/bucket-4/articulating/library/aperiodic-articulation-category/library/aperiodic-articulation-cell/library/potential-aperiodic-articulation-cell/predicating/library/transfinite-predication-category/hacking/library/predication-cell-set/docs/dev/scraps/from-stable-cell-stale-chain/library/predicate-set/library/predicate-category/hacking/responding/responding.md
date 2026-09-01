---
name: responding
description: Runs one respond invocation — checks capabilities via the right-residual operator on the sender's authority and the payload cells, appends the payload cells to the event log at the asserted stratum, runs the sigma-pass engine, runs the delta-pass engine, materializes the affected fiber-snapshots, composes the cost-record against any active budget, emits the witness-record.
category: kernel
inputs:
  - name: arg1
    type: respond-primitive-record
  - name: arg2
    type: payload-record
output:
  type: witness-record
---
