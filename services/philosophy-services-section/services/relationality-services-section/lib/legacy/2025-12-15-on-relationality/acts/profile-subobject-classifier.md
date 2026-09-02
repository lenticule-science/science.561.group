---
title: Profile Subobject Classifier
act: ProfileSubobjectClassifier
slug: profile-subobject-classifier
top: Negate
bottom: ProfileRecognitions
summary: >-
  Restrict Heyting negation to the potential profile recognitions to obtain the
  internal truth object.
tags:
  - act
---
# Profile Subobject Classifier

A subobject classifier identifies which recognitions count as “true” subobjects.
`Negate = (ImplyRecognition GroundRecognition)` already encodes Heyting
negation, so restricting it to the profile recognitions yields the internal
truth object:
`(Negate ProfileRecognitions)` earns
***ProfileSubobjectClassifier***.

The resulting Ω carries the `⊤`, `⊥`, and implication inherited from the
recognition algebra.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
