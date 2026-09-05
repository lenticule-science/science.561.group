---

name: entropy-measure
act: EntropyMeasure
top: ProfileEntropyMeasure
bottom: EntropySeed
summary: Collapse entropy seeds using the profile entropy machinery by composing `ProfileEntropyMeasure` with `EntropySeed`.
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

[ProfileEntropyMeasure](profile-entropy-measure.md) already collapses entropy
seeds using the profile nucleus.  Supplying the entropy seed,
`(ProfileEntropyMeasure EntropySeed)` earns
***EntropyMeasure***,
giving the fixed entropy measure.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
