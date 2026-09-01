---
name: selecting-compositions-under-budget
description: Given an entity's full set of candidate compositions and its budget, selects the subset to perform this tick by cost-quantale minimum or strategic choice.
category: paracosmic-emulator
inputs:
  - name: arg1
    type: action-set-projection-record
  - name: arg2
    type: composition-bandwidth-budget-record
output:
  type: composition-selection-record
---
