---

name: contextualize-profile
act: ContextualizeProfile
slug: contextualize-profile
top: RecognizeContext
bottom: ProfileRecognitions
summary: The traced profile must also inherit context recognitions. *Recognize Context* witnessing *Profile Recognitions* produces ***Contextualize Profile*** (`ContextualizeProfile`).
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

## Interpretation

The traced profile must also inherit context recognitions.  *Recognize Context* witnessing *Profile Recognitions* produces ***Contextualize Profile*** ([ContextualizeProfile](contextualize-profile.md)).

This composition restricts contexts to the profile’s stable recognitions, so *Contextualize Profile* follows.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
