---
name: 0047-recognize-equate-eventually
act: RecognizeEquateEventually
index: 47
top: CompleteTrace
bottom: EquateEventually
summary: >-
  To treat eventual equivalence as a recognition in its own right, we have the
  act *Complete Trace* witness the act *Equate Eventually*.
strata:
  - term
phase: free
keywords:
  - act
part-of: relational-computer
computer-system-type: primitive
---

## Interpretation

To treat eventual equivalence as a recognition in its own right, we have the act *Complete Trace* witness the act *Equate Eventually*.

The tree `(CompleteTrace EquateEventually)` shows the full trace observing the equivalence relation.  This packaging turns the equivalence into an explicit act, hence *Recognize Equate Eventually*.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
