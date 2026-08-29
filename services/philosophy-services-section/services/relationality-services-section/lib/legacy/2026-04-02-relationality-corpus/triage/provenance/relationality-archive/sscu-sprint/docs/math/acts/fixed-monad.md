---

name: fixed-monad
act: FixedMonad
slug: fixed-monad
top: FixedMonadUnit
bottom: FixedMonadMultiply
summary: Package the nucleus functor, unit, and multiplication into a single monad on the fixed profile.
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

Together, the nucleus functor, unit, and multiplication form a monad on the
fixed profile, so we package these laws in one act:
`(FixedMonadUnit FixedMonadMultiply)` earns ***FixedMonad***.

The usual monad laws (associativity, left/right unit) follow from the
idempotence and compatibility already earned for
[FixedNucleateProfile](fixed-nucleate-profile.md) (e.g.
`AbsorbClosure`, `EqualizeNucleusDistribution`).  `FixedMonadUnit` and
`FixedMonadMultiply` are the structural maps, and `FixedMonad` names the
resulting closure monad.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
