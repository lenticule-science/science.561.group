---
name: signing-with-ed25519
description: Signs an envelope's canonical bytes with the peer's Ed25519 private key.
category: kernel
inputs:
  - name: arg1
    type: federation-envelope-record
output:
  type: ed25519-signature-record
title: signing-with-ed25519
---
