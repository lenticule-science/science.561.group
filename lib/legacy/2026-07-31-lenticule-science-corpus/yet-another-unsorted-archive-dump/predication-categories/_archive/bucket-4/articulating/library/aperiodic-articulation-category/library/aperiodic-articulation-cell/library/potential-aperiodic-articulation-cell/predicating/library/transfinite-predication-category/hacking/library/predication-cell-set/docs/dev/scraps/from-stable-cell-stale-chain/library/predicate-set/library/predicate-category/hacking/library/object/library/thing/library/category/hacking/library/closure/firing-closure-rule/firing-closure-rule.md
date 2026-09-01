---
name: firing-closure-rule
description: Fires one closure rule against the asserted fiber at one bind-variable assignment, producing the new cell-record (tagged saturated, with witness-link to the matching asserted cells) the rule's recipe emits.
category: kernel
inputs:
  - name: arg1
    type: closure-rule-record
  - name: arg2
    type: fiber-snapshot
output:
  type: cell-record
---
