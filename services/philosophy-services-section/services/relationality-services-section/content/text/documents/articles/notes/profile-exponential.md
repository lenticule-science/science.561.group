---
title: Profile Exponential
act: ProfileExponential
top: FormFunctionTerm
bottom: ProfileRecognitions
summary: Restrict function-term constructions to the active profile recognitions to obtain internal exponentials.
tags:
- act
layer: act
status: plan
---

Exponentials `A ⇒ B` are represented by function-term recognitions.
[FormFunctionTerm](./form-function-term.md) already constructs these objects, and
restricting it to the current [ProfileRecognitions](./profile-recognitions.md)
yields the internal exponentials of that profile:
`(FormFunctionTerm ProfileRecognitions)` earns
***ProfileExponential***.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
