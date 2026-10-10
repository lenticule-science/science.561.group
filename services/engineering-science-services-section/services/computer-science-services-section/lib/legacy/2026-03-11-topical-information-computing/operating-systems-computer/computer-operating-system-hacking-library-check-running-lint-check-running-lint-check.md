---
name: running-lint-check
description: Runs one check from the check manifest against one record's content, emitting a lint-diagnostic cell if the check fires.
category: sdk
inputs:
  - name: arg1
    type: lint-check-manifest-record
  - name: arg2
    type: cell-record
output:
  type: lint-diagnostic-cell
---
