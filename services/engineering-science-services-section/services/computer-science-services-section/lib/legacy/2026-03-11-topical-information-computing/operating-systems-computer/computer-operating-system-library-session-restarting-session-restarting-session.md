---
name: restarting-session
description: Restarts a failed session per its restart policy.
category: kernel
inputs:
  - name: arg1
    type: supervisor-handle-record
  - name: arg2
    type: session-record
  - name: arg3
    type: restart-policy-record
output:
  type: session-record
---
