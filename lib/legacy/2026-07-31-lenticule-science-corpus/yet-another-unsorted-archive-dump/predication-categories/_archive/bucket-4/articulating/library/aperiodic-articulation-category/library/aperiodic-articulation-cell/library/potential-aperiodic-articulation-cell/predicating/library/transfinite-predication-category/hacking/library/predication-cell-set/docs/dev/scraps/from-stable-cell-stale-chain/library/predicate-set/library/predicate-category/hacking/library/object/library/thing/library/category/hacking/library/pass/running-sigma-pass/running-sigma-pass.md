---
name: running-sigma-pass
description: Runs the sigma-pass engine over the asserted stratum to fixed point, producing the saturated stratum in the presheaf storage with witness links recorded on every emitted cell.
category: kernel
inputs:
  - name: arg1
    type: sigma-pass-engine-record
  - name: arg2
    type: presheaf-storage-handle
output:
  type: presheaf-storage-handle
---
