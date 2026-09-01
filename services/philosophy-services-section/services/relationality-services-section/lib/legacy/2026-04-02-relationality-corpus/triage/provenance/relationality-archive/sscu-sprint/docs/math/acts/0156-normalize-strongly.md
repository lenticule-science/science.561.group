---

name: 0156-normalize-strongly
act: NormalizeStrongly
index: 156
top: Normalization
bottom: StepTrace
summary: >-
  A term is strongly normalizing when no infinite reduction can occur.
  *Normalization* witnessing *Step Trace* yields ***Normalize Strongly***
  (`NormalizeStrongly`).
strata:
  - semantics
phase: free
keywords:
  - act
part-of: relational-computer
computer-system-type: primitive
---

## Interpretation

A term is strongly normalizing when no infinite reduction can occur.  *Normalization* witnessing *Step Trace* yields ***Normalize Strongly*** ([NormalizeStrongly](0156-normalize-strongly.md)).

This composition records that normalization eliminates all infinite traces, so *Normalize Strongly* follows.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
