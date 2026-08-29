---
title: Profile Finite Limits
act: ProfileFiniteLimits
slug: profile-finite-limits
top: ProfileInvariantLattice
bottom: EqualizeTerms
summary: Combine the profile invariant lattice with equalizers to witness finite limits inside the active profile.
tags:
- act
layer: act
status: plan
---
# Profile Finite Limits

[ProfileInvariantLattice](profile-invariant-lattice.md) provides finite meets
and joins on profile invariants, and `EqualizeTerms` detects equalizing
recognitions.  Their composition records that finite limits exist inside the
active profile:
`(ProfileInvariantLattice EqualizeTerms)` earns
***ProfileFiniteLimits***.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
