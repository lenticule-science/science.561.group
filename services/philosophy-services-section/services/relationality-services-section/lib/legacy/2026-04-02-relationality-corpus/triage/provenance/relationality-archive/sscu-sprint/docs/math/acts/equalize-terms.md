---

name: equalize-terms
act: EqualizeTerms
slug: equalize-terms
top: RecognizeObservation
bottom: JudgeTyping
summary: Equality of terms is detected by observational recognitions applied to typing judgments. *Recognize Observation* witnessing *Judge Typing* yields the act ***Equalize Terms*** (`EqualizeTerms`).
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

## Interpretation

Equality of terms is detected by observational recognitions applied to typing judgments.  *Recognize Observation* witnessing *Judge Typing* yields the act ***Equalize Terms*** ([EqualizeTerms](equalize-terms.md)).

This composition records that two terms are equal when no observation distinguishes their typing behaviour, so *Equalize Terms* is valid.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
