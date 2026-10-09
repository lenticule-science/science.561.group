---
title: Pairing Least Fix
act: PairLeastFix
top: FormApplicationTerm
bottom: HeadTrace
summary: Application terms can self-apply, so to capture the least stabilizing pair we have the act *Form Application Term* witness the act *Head Trace*.
tags:
- act
layer: act
status: plan
index: 56
strata:
  - term
phase: free
keywords:
  - act
description: Application terms can self-apply, so to capture the least stabilizing pair we have the act *Form Application Term* witness the act *Head Trace*.
---

## Interpretation

Application terms can self-apply, so to capture the least stabilizing pair we have the act *Form Application Term* witness the act *Head Trace*.

The composition `(FormApplicationTerm HeadTrace)` represents self-application at the head, recording the behaviour needed for a least fixpoint, hence *Pair Least Fix*.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
