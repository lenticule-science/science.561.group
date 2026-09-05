---

name: 0153-progress-typing
act: ProgressTyping
index: 153
top: RecognizeValue
bottom: JudgeTyping
summary: >-
  Closed typed terms are either values or can step. *Recognize Value*
  witnessing *Judge Typing* produces ***Progress Typing*** (`ProgressTyping`).
strata:
  - semantics
phase: free
keywords:
  - act
part-of: relational-computer
computer-system-type: primitive
---

## Interpretation

Closed typed terms are either values or can step.  *Recognize Value* witnessing *Judge Typing* produces ***Progress Typing*** ([ProgressTyping](0153-progress-typing.md)).

This composition states that a judgement in the empty context is either witnessed as a value or advances along the step trace, so *Progress Typing* is valid.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
