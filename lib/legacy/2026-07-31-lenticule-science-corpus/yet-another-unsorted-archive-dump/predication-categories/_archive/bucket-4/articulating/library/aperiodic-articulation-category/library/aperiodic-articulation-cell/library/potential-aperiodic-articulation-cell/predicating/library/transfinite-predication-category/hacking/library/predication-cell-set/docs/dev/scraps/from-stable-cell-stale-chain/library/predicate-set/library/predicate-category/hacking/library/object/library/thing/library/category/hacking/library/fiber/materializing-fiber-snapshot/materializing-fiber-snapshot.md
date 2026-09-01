---
name: materializing-fiber-snapshot
description: Writes a fiber-snapshot to its on-disk file at the path determined by the projection-context, with byte-identical bytes for byte-identical inputs.
category: kernel
inputs:
  - name: arg1
    type: presheaf-storage-handle
  - name: arg2
    type: fiber-snapshot
  - name: arg3
    type: projection-context-record
output:
  type: presheaf-storage-handle
---
