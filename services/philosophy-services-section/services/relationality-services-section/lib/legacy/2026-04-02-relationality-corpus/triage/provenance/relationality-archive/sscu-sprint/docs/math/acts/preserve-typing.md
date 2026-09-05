---

name: preserve-typing
act: PreserveTyping
top: JudgeTyping
bottom: StepTrace
summary: Reductions recorded in *Step Trace* must preserve typing judgments. *Judge Typing* witnessing *Step Trace* yields ***Preserve Typing*** (`PreserveTyping`).
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

## Interpretation

Reductions recorded in *Step Trace* must preserve typing judgments.  *Judge Typing* witnessing *Step Trace* yields ***Preserve Typing*** ([PreserveTyping](preserve-typing.md)).

Composing these recognitions records the assertion “if a context recognises term t at type A and t reduces to t′ then the context recognises t′ at type A,” so *Preserve Typing* follows.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
