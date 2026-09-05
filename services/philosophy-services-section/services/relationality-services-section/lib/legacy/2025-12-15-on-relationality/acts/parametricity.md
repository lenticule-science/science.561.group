---
title: Parametricity
act: Parametricity
slug: parametricity
top: ParametricEffect
bottom: ParametricCoeffect
summary: >-
  Enforce relational parametricity by composing the indexed effect monad with
  the indexed coeffect comonad.
tags:
  - act
---
# Parametricity

A term is parametric if it respects all reindexings and all fixed morphisms.  We
encode this uniformity by letting the effect monad and coeffect comonad witness
each other:
`(ParametricEffect ParametricCoeffect)` earns ***Parametricity***.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
