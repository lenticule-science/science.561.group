---
name: verifying-safe-envelope
description: Verifies a proposed embodied workitem against the active HJ-reachability and CBF records; produces or refuses a verified-safe-envelope cell.
category: industrial-control
inputs:
  - name: arg1
    type: hj-reachability-precondition-record
  - name: arg2
    type: control-barrier-function-record
output:
  type: verified-safe-envelope-record
---
