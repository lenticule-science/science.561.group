---

title: Profile Kernel Chain
act: ProfileKernelChain
slug: profile-kernel-chain
top: ProfileKernelStep
bottom: TraceProfile
summary: Build the kernel chain across profiles by letting `ProfileKernelStep` witness `TraceProfile`.
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

A kernel chain repeatedly applies the observation kernel across layers.  Having
a profile-step kernel ([ProfileKernelStep](profile-kernel-step.md)), we obtain
the profile chain by iterating the chain recogniser `TraceProfile`.  Letting the
step witness the trace,
`(ProfileKernelStep TraceProfile)`, earns ***ProfileKernelChain***.

`TraceProfile = (CompleteTrace ProfileRecognitions)` projects traces through the
profile recognitions, and `ProfileKernelStep` updates one profile to the next.
Their composition yields the recognitional chain that threads updates through
the trace of profiles.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
