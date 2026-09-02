---
title: Fixed Monad Unit
act: FixedMonadUnit
slug: fixed-monad-unit
top: FixedIdentity
bottom: FixedNucleateProfile
summary: >-
  Inject fixed recognitions into their closure by composing the identity with
  the fixed nucleus, yielding the monad unit.
tags:
  - act
---
# Fixed Monad Unit

`FixedNucleateProfile` acts as a closure on fixed recognitions, and the monad
unit injects each recognition into its closure.  We witness this by letting the
identity observe the nucleus:
`(FixedIdentity FixedNucleateProfile)` earns
***FixedMonadUnit***.

[FixedIdentity](fixed-identity.md) gives the identity morphism on each fixed
object, and [FixedNucleateProfile](fixed-nucleate-profile.md) sends each
recognition to its fixed closure.  Their composition states that each object is
mapped into its closure via the identity, i.e. `η_X : X → N(X)`.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
