---
name: opening-boot-session-morphism
description: Specialization of opening-session that opens the boot session with root capability and binds it to the boot-sequence runbook.
category: kernel
inputs:
  - name: arg1
    type: supervisor-handle-record
  - name: arg2
    type: boot-sequence-runbook-record
output:
  type: boot-session-record
---
