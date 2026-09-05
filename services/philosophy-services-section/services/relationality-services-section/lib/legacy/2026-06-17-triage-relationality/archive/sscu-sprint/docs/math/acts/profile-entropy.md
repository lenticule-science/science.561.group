---

title: Profile Entropy
act: ProfileEntropy
top: TraceProfile
bottom: ProfileEntropyMeasure
summary: Propagate the profile entropy measure across the trace by composing `TraceProfile` with `ProfileEntropyMeasure`.
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

To obtain the entropy of a full profile we propagate the entropy measure across
the trace of recognitions inside that profile.
[TraceProfile](trace-profile.md) records the trace structure, so letting it
witness [ProfileEntropyMeasure](profile-entropy-measure.md),
`(TraceProfile ProfileEntropyMeasure)`, earns
***ProfileEntropy***.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
