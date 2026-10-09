---
name: composing-session-capability-fiber
description: Composes a session's effective capability fiber by merging the identity's boundary fiber with the acting-as projection sub-fiber via the merge operator, then bounding the result via the right-residual operator against the sender's authority. Non-amplifying.
category: kernel
inputs:
  - name: arg1
    type: boundary-record
  - name: arg2
    type: capability-fiber-record
output:
  type: capability-fiber-record
title: composing-session-capability-fiber
---
