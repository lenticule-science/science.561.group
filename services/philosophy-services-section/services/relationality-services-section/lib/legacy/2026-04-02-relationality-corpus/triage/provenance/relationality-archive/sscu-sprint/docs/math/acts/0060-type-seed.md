---
name: 0060-type-seed
act: TypeSeed
index: 60
slug: type-seed
top: RecognizeContext
bottom: BindTerm
summary: >-
  To situate a bound term inside a recognised context, the act *Recognize
  Context* must witness the act *Bind Term*.
strata:
  - term
phase: free
keywords:
  - act
part-of: relational-computer
computer-system-type: primitive
---

## Interpretation

To situate a bound term inside a recognised context, the act *Recognize Context* must witness the act *Bind Term*.

In `(RecognizeContext BindTerm)` the context recogniser observes the binding, recording the initial typing judgement; this composition is *Type Seed*.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
