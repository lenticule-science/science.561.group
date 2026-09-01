---

name: 0152-preserve-typing
act: PreserveTyping
index: 152
top: JudgeTyping
bottom: StepTrace
summary: >-
  Reductions recorded in *Step Trace* must preserve typing judgements. *Judge
  Typing* witnessing *Step Trace* yields ***Preserve Typing***
  (`PreserveTyping`).
strata:
  - semantics
phase: free
keywords:
  - act
part-of: relational-computer
computer-system-type: primitive
---

## Interpretation

Reductions recorded in *Step Trace* must preserve typing judgements.  *Judge Typing* witnessing *Step Trace* yields ***Preserve Typing*** ([PreserveTyping](0152-preserve-typing.md)).

Composing these recognitions records the assertion “if a context recognises term t at type A and t reduces to t′ then the context recognises t′ at type A,” so *Preserve Typing* follows.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
