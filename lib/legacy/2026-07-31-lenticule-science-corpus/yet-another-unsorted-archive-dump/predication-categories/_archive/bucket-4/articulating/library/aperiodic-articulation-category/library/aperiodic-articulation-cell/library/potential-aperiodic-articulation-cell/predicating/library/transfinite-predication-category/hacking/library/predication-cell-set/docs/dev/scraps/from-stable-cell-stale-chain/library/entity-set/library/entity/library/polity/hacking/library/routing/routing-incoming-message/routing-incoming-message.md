---
name: routing-incoming-message
description: Routes an inbound email or chat message to the right cell-store address by closure-rule firing.
category: bundled-userland
inputs:
  - name: arg1
    type: cell-record
  - name: arg2
    type: email-client-nucleus-record
output:
  type: cell-record
---
