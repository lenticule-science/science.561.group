---

name: profile-semantics
act: ProfileSemantics
top: StructureSemantics
bottom: ProfileRecognitions
summary: Interpret the recognition algebra inside the potential profile by composing `StructureSemantics` with `ProfileRecognitions`.
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

[StructureSemantics](structure-semantics.md) packages the full algebra of
recognitions, meets, joins, implication, and nuclei.  Restricting it to the
active [ProfileRecognitions](profile-recognitions.md),
`(StructureSemantics ProfileRecognitions)`, earns
***ProfileSemantics***.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
