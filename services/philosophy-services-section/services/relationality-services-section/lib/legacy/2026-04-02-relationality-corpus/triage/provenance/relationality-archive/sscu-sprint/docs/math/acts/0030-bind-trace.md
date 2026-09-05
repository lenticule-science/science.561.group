---
name: 0030-bind-trace
act: BindTrace
index: 30
top: FirstName
bottom: HeadTrace
summary: >-
  To name the immediate act of the trace, we let the act *First Name* witness
  the act *Head Trace*.
strata:
  - trace
phase: free
keywords:
  - act
part-of: relational-computer
computer-system-type: primitive
---

## Interpretation

To name the immediate act of the trace, we let the act *First Name* witness the act *Head Trace*.

The composition `(FirstName HeadTrace)` has *First Name* observe *Head Trace*, explicitly naming the head.  This act is therefore *Bind Trace*.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
