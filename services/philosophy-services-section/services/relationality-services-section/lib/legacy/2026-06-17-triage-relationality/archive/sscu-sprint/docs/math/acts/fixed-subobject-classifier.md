---

title: Fixed Subobject Classifier
act: FixedSubobjectClassifier
slug: fixed-subobject-classifier
top: ProfileSubobjectClassifier
bottom: FixedProfileRecognitions
summary: "Restrict the profile\u2019s truth object to fixed recognitions by composing `ProfileSubobjectClassifier` with `FixedProfileRecognitions`."
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

The profile already carries an internal truth object via
[ProfileSubobjectClassifier](profile-subobject-classifier.md).  To reason purely
inside the fixed profile we restrict that classifier to
[FixedProfileRecognitions](fixed-profile-recognitions.md):
`(ProfileSubobjectClassifier FixedProfileRecognitions)` earns
***FixedSubobjectClassifier***.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
