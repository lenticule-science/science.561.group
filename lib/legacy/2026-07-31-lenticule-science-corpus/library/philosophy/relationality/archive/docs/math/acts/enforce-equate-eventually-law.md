---
title: Enforcing Eventual Equivalence Law
act: EnforceEquateEventuallyLaw
slug: enforce-equate-eventually-law
top: CompleteTrace
bottom: RecognizeEquateEventually
summary: Eventual equivalence satisfies reflexive, symmetric, and transitive laws along the trace, so we let the act *Complete Trace* witness the act *Recognize Equate Eventually*.
tags:
- act
layer: act
status: plan
---
# Enforcing Eventual Equivalence Law

## Interpretation

Eventual equivalence satisfies reflexive, symmetric, and transitive laws along the trace, so we let the act *Complete Trace* witness the act *Recognize Equate Eventually*.

By composing `(CompleteTrace RecognizeEquateEventually)`, the entire trace enforces the recognised equivalence, restating the equivalence law explicitly; we name this act *Enforce Equate Eventually Law*.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
