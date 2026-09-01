---

title: Enforcing Eventual Equivalence Law
act: EnforceEquateEventuallyLaw
top: CompleteTrace
bottom: RecognizeEquateEventually
summary: Eventual equivalence satisfies reflexive, symmetric, and transitive laws along the trace, so we let the act *Complete Trace* witness the act *Recognize Equate Eventually*.
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

## Interpretation

Eventual equivalence satisfies reflexive, symmetric, and transitive laws along the trace, so we let the act *Complete Trace* witness the act *Recognize Equate Eventually*.

By composing `(CompleteTrace RecognizeEquateEventually)`, the entire trace enforces the recognised equivalence, restating the equivalence law explicitly; we name this act *Enforce Equate Eventually Law*.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
