---

name: sheaf-condition
act: SheafCondition
slug: sheaf-condition
top: Presheaf
bottom: FixedNucleateProfile
summary: Enforce glueability of presheaves by composing them with the nucleus.
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

A presheaf is a sheaf when sections defined on overlapping contexts glue under
nucleus stability.  We express this by letting the presheaf witness the
nucleus:
`(Presheaf FixedNucleateProfile)` earns
***SheafCondition***.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
