---
title: Presenting Variable Term
act: PresentVariableTerm
index: 51
top: BindTerm
bottom: HeadTrace
summary: >-
  A bound name should expose the corresponding head, so the act *Bind Term*
  must witness the act *Head Trace*.
strata:
  - term
phase: free
keywords:
  - act
part-of: relational-computer
computer-system-type: primitive
---

## Interpretation

A bound name should expose the corresponding head, so the act *Bind Term* must witness the act *Head Trace*.

In `(BindTerm HeadTrace)` the binding observes the trace head, presenting that head as a variable; this composition is therefore *Present Variable Term*.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
