---
name: admitting-federation-envelope
description: Receives a signed envelope, verifies the signature, applies cell-wise knowledge-join to merge the contained cells into the local cell store.
category: kernel
inputs:
  - name: arg1
    type: federated-peer-record
  - name: arg2
    type: federation-envelope-record
output:
  type: cell-record
---
