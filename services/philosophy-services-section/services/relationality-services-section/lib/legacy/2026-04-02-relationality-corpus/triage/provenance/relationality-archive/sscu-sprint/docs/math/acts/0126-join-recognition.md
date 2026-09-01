---

name: 0126-join-recognition
act: JoinRecognition
index: 126
top: OrderRecognition
bottom: ContextualizeTrace
summary: >-
  Complementing meet, we need the least recognition containing a pair. *Order
  Recognition* witnessing *Contextualize Trace* produces ***Join
  Recognition*** (`JoinRecognition`).
strata:
  - semantics
phase: free
keywords:
  - act
part-of: relational-computer
computer-system-type: primitive
---

## Interpretation

Complementing meet, we need the least recognition containing a pair.  *Order Recognition* witnessing *Contextualize Trace* produces ***Join Recognition*** ([JoinRecognition](0126-join-recognition.md)).

*Contextualize Trace* already records how recognitions extend; composing with the order yields the corresponding join, so *Join Recognition* follows.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
