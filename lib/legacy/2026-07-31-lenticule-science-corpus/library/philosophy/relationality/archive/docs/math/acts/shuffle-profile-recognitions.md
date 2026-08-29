---
title: Profiling Shuffle-Stable Recognitions
act: ShuffleProfileRecognitions
slug: shuffle-profile-recognitions
top: FixFlowNucleus
bottom: CollapseShuffle
summary: Recognitions fixed by flow and nucleus and invariant under shuffle collapse witness the shuffle profile, so we let `FixFlowNucleus` observe `CollapseShuffle`.
tags:
- act
layer: act
status: plan
---
# Profiling Shuffle-Stable Recognitions

[FixFlowNucleus](fix-flow-nucleus.md) already records recognitions fixed by both
[Flow](flow.md) and [Nucleate](nucleate.md).  [CollapseShuffle](collapse-shuffle.md)
records which trace differences vanish under the nucleus: admissible shuffles.
To obtain the shuffle profile, we want recognitions that are simultaneously
flow–nucleus fixed and active under identification of trace shuffles, so we let
`FixFlowNucleus` witness the shuffle collapse:
`(FixFlowNucleus CollapseShuffle)` earns
***ShuffleProfileRecognitions***.

Any recognition stabilized by flow and nucleus lies in `FixFlowNucleus`, and
`CollapseShuffle` identifies recognitions whose traces differ only by admissible
reordering.  The composition therefore picks out exactly those recognitions
whose stabilized form is invariant under (a) the global dynamics and closure,
and (b) the reordering of trace-progress steps.  These recognitions do not care
which admissible trace we used to reach them, so they define the shuffle
profile.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
