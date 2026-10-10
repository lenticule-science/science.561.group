---
name: loading-markdown-corpus
description: Reads the markdown corpus, parses each file into a cell-record, invokes respond on each to write at the asserted stratum.
category: kernel
inputs:
  - name: arg1
    type: boot-session-record
  - name: arg2
    type: markdown-corpus-record
output:
  type: source-cells-loaded-state-record
---
