---

name: 0135-identify-morph
act: IdentifyMorph
index: 135
top: Morph
bottom: Reflex
summary: >-
  Identity maps trivially preserve all recognitions. *Morph* witnessing
  *Reflex* produces ***Identify Morph*** (`IdentifyMorph`).
strata:
  - semantics
phase: free
keywords:
  - act
part-of: relational-computer
computer-system-type: primitive
---

## Interpretation

Identity maps trivially preserve all recognitions.  *Morph* witnessing *Reflex* produces ***Identify Morph*** ([IdentifyMorph](0135-identify-morph.md)).

*Reflex* already serves as the identity act, so composing it with *Morph* records the identity morphism, as required.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
