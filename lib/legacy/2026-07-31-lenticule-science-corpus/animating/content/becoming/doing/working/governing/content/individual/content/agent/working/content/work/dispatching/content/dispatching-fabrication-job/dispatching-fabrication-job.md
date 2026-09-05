---
name: dispatching-fabrication-job
description: Selects the cheapest-suitable printer for a fabrication job under the multi-dimensional cost-quantale.
category: industrial-control
inputs:
  - name: arg1
    type: fabrication-job-record
  - name: arg2
    type: material-stock-record
  - name: arg3
    type: machine-time-budget-record
output:
  type: cell-record
---
