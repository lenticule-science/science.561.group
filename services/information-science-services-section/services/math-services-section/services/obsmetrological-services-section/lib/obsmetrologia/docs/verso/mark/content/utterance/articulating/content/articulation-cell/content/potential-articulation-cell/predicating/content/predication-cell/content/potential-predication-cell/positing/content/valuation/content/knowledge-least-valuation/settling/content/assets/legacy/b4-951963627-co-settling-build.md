---
name: co-settling-build
description: Composes inputs from multiple builders to the same target fiber, settles, records the entangled pairs from each builder on the result.
category: paracosmic-emulator
inputs:
  - name: arg1
    type: fiber-snapshot
  - name: arg2
    type: fiber-snapshot
output:
  type: collaborative-settlement-record
---
