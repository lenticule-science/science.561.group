---
name: emitting-readiness
description: Invokes respond from the boot session with a payload that writes the (os, has-status, ready, t) cell to the asserted stratum.
category: kernel
inputs:
  - name: arg1
    type: boot-session-record
  - name: arg2
    type: respond-primitive-record
output:
  type: ready-state-record
---
