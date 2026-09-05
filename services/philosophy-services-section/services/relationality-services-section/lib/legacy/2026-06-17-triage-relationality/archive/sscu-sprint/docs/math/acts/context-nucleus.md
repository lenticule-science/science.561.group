---

title: Collapsing Context
act: ContextNucleus
top: NucleateProfile
bottom: RecognizeContext
summary: Collapse contexts under the profile nucleus by composing `NucleateProfile` with `RecognizeContext`.
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

Contexts collapse under the nucleus.  We restrict the profile nucleus to
contexts by letting it witness [RecognizeContext](recognize-context.md):
`(NucleateProfile RecognizeContext)` earns
***ContextNucleus***.

[NucleateProfile](nucleate-profile.md) closes recognitions under the nucleus,
and `RecognizeContext` packages context recognitions, so their composition
collapses contexts according to the profile closure.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
