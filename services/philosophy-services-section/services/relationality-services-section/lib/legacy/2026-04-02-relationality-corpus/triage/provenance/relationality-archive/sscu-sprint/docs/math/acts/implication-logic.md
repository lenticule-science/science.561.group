---

name: implication-logic
act: ImplicationLogic
top: ImplyRecognition
bottom: BoxModality
summary: Combine recognition implication with the profile necessity modality by letting `ImplyRecognition` witness the box modality.
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

Implication in the profile must respect necessity, so we compose the earned
recognition implication with the box modality:
`(ImplyRecognition BoxModality)` earns
***ImplicationLogic***.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
