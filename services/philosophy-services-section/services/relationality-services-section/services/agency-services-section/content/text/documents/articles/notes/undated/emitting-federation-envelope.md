---
name: emitting-federation-envelope
description: Bundles cells into a signed envelope and emits it to a federated peer over HTTP.
category: kernel
inputs:
  - name: arg1
    type: federated-peer-record
  - name: arg2
    type: cell-record
output:
  type: federation-envelope-record
title: emitting-federation-envelope
---
