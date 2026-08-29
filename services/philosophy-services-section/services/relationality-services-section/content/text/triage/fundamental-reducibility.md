---
title: Fundamental Reducibility
keywords:
  - normalization
  - reducibility
layer: internal-theorem
status: plan
depends_on:
  - math/structure/reducible-environment
  - math/operator/reducible-substitution
  - acts/establish-fundamental-reducibility
claims:
  - type: operator
    judgement: Every well-typed term is reducible in every reducible environment
---
# Fundamental Reducibility

## Statement

The act [`establish-fundamental-reducibility`](../acts/establish-fundamental-reducibility.md)
earns that every well-typed term is reducible in every reducible environment,
closing the logical-relations argument.

## Proof sketch

`SelectReducibilityCandidate` witnessing `SubstituteReducibility` is the
standard logical-relations argument; the act records that every well-typed term
lies in the reducibility relation in any `ReducibleEnvironment`.

## Uniqueness

Because the reducibility relation and environment are fixed by the earned acts,
this fundamental property is unique in the earned sense.
