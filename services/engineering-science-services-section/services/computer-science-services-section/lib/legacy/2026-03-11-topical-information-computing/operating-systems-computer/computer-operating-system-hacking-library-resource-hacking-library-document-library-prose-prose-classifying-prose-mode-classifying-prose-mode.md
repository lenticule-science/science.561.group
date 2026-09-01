---
name: classifying-prose-mode
description: Reads a prose record and classifies its mode against the Diátaxis quartet; flags mode-mixing as a defect.
category: sdk
inputs:
  - name: arg1
    type: cell-record
output:
  type: lint-diagnostic-cell
---
