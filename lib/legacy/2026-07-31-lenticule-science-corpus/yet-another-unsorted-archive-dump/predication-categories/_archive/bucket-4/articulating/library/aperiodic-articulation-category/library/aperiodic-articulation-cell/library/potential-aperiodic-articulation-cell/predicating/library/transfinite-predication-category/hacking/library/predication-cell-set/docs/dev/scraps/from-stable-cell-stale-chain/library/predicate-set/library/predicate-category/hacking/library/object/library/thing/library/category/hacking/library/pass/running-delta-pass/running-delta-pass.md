---
name: running-delta-pass
description: Runs the delta-pass engine over the union of asserted and saturated strata to fixed point, producing the settled stratum in the presheaf storage.
category: kernel
inputs:
  - name: arg1
    type: delta-pass-engine-record
  - name: arg2
    type: presheaf-storage-handle
output:
  type: presheaf-storage-handle
---
