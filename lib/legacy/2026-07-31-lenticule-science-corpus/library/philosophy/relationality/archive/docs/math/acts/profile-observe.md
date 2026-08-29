---
title: Profile Observe
act: ProfileObserve
slug: profile-observe
top: ProfileObservationRecognitions
bottom: SeedTerm
summary: Observe traced terms inside a profile by composing `ProfileObservationRecognitions` with `SeedTerm`.
tags:
- act
layer: act
status: plan
---
# Profile Observe

[Observe](observe.md) designates observables acting on a traced term using all
contextual recognitions.  To stay within a specific profile we use
[ProfileObservationRecognitions](profile-observation-recognitions.md):
`(ProfileObservationRecognitions SeedTerm)` earns
***ProfileObserve***.

`SeedTerm` inserts the trace head into a recognised context, producing the basic
term to be observed, and `ProfileObservationRecognitions` restricts observations
to those compatible with the potential profile.  Their composition records
observables that both act on traced terms and remain inside that profile.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
