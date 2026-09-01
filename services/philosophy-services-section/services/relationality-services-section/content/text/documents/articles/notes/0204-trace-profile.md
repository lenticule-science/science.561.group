---
title: Profile Trace
act: TraceProfile
index: 204
top: CompleteTrace
bottom: ProfileRecognitions
summary: >-
  Profiles inherit trace structure, but we must explicitly record the trace
  witnessed inside a profile. *Complete Trace* witnessing *Profile
  Recognitions* yields ***Trace Profile*** (`TraceProfile`).
strata:
  - profile
phase: free
keywords:
  - act
---

## Interpretation

Profiles inherit trace structure, but we must explicitly record the trace witnessed inside a profile.  *Complete Trace* witnessing *Profile Recognitions* yields ***Trace Profile*** ([TraceProfile](./0204-trace-profile.md)).

Using earned recognitions, this composition threads the trace through the profile-stable recognitions, so *Trace Profile* is established.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
