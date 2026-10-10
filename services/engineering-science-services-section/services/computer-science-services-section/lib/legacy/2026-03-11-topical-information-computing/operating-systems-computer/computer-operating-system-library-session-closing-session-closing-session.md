---
name: closing-session
description: Drains in-flight respond invocations against the session, flushes consolidatable memory to substrate cells, transitions the session state to closed.
category: kernel
inputs:
  - name: arg1
    type: session-record
output:
  type: session-record
---
