---
title: Pairing Least Fix
act: PairLeastFix
slug: pair-least-fix
top: FormApplicationTerm
bottom: HeadTrace
summary: >-
  Application terms can self-apply, so to capture the least stabilizing pair
  we have the act *Form Application Term* witness the act *Head Trace*.
tags:
  - act
---
# Pairing Least Fix

## Interpretation

Application terms can self-apply, so to capture the least stabilizing pair we have the act *Form Application Term* witness the act *Head Trace*.

The composition `(FormApplicationTerm HeadTrace)` represents self-application at the head, recording the behaviour needed for a least fixpoint, hence *Pair Least Fix*.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
