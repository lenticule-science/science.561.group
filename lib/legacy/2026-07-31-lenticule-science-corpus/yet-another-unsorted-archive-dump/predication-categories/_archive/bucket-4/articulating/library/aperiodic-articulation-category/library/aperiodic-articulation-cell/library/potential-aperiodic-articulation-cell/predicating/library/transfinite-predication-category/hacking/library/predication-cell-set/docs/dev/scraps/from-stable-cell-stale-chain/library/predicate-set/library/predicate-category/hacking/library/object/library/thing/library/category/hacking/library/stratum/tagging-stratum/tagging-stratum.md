---
name: tagging-stratum
description: Tags a cell-record with its stratum and (for non-asserted strata) the witness-link recording its derivation.
category: kernel
inputs:
  - name: arg1
    type: cell-record
  - name: arg2
    type: stratum-tag-record
  - name: arg3
    type: witness-link-record
output:
  type: cell-record
---
