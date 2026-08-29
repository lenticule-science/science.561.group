---

title: Fixed Nucleus Profile
act: FixedNucleateProfile
slug: fixed-nucleate-profile
top: Nucleate
bottom: FixedProfileRecognitions
summary: Specialize the nucleus closure to the fixed profile by composing `Nucleate` with `FixedProfileRecognitions`.
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

The fixed profile must inherit the closure behaviour of the nucleus.
`NucleateProfile = (Nucleate ProfileRecognitions)` did this for a generic
profile.  We specialize by letting [Nucleate](nucleate.md) witness
[FixedProfileRecognitions](fixed-profile-recognitions.md):
`(Nucleate FixedProfileRecognitions)` earns
***FixedNucleateProfile***.

`Nucleate` is the closure act derived from the normalized observation and
judgment equivalences, while `FixedProfileRecognitions` is a closed
subcollection of recognitions.  Their composition restricts the closure
operation to the fixed profile domain, yielding the nucleus appropriate to the
fixed recognitions.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
