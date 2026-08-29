---

name: pair-least-fix
act: PairLeastFix
slug: pair-least-fix
top: FormApplicationTerm
bottom: HeadTrace
summary: Application terms can self-apply, so to capture the least stabilizing pair we have the act *Form Application Term* witness the act *Head Trace*.
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

## Interpretation

Application terms can self-apply, so to capture the least stabilizing pair we have the act *Form Application Term* witness the act *Head Trace*.

The composition `(FormApplicationTerm HeadTrace)` represents self-application at the head, recording the behaviour needed for a least fixpoint, hence *Pair Least Fix*.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
