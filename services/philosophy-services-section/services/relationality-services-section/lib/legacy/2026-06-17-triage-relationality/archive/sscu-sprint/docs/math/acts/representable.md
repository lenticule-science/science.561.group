---

title: Representable Functor
act: RepresentableFunctor
top: FixedFunctor
bottom: FixedIdentity
summary: Encode representability by letting the fixed functor witness the fixed identity.
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

A representable functor is naturally isomorphic to “morphisms out of an object.”
In the fixed profile the representative object is the identity, so we let the
functor witness it:
`(FixedFunctor FixedIdentity)` earns ***RepresentableFunctor***.

[FixedFunctor](fixed-functor.md) maps objects and morphisms, and
[FixedIdentity](fixed-identity.md) is the terminal identity on each fixed
object.  Their composition asserts that the functor’s action is determined by
its values on identities, matching representability.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
