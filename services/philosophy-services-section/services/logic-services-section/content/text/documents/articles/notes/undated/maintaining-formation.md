---
name: maintaining-formation
description: Reads drone-position cells, computes graph-Laplacian-based corrections, emits position-adjustment actuation cells.
category: sdk
inputs:
  - name: arg1
    type: formation-record
  - name: arg2
    type: drone-position-cell
output:
  type: cell-record
title: maintaining-formation
---
