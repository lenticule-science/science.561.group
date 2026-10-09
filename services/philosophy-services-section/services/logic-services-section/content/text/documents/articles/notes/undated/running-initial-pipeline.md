---
name: running-initial-pipeline
description: Drives the sigma-pass engine to fixed point, then the delta-pass engine to fixed point, over the asserted fiber loaded from the markdown corpus.
category: kernel
inputs:
  - name: arg1
    type: sigma-pass-engine-record
  - name: arg2
    type: delta-pass-engine-record
  - name: arg3
    type: presheaf-storage-handle
output:
  type: initial-closure-complete-state-record
title: running-initial-pipeline
---
