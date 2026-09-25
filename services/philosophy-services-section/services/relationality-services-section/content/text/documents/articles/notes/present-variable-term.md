---
title: Presenting Variable Term
act: PresentVariableTerm
top: BindTerm
bottom: HeadTrace
summary: A bound name should expose the corresponding head, so the act *Bind Term* must witness the act *Head Trace*.
tags:
- act
layer: act
status: plan
index: 51
strata:
  - term
phase: free
keywords:
  - act
description: A bound name should expose the corresponding head, so the act *Bind Term* must witness the act *Head Trace*.
---

## Interpretation

A bound name should expose the corresponding head, so the act *Bind Term* must witness the act *Head Trace*.

In `(BindTerm HeadTrace)` the binding observes the trace head, presenting that head as a variable; this composition is therefore *Present Variable Term*.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
