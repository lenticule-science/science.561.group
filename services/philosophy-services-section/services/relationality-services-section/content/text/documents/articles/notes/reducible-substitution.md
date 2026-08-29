---
title: Reducible Substitution
keywords:
  - normalization
  - reducibility
layer: internal-theorem
status: plan
depends_on:
  - math/structure/reducible-environment
  - acts/select-reducibility-candidate
  - acts/substitute-reducibility
  - acts/judge-typing
claims:
  - type: operator
    judgement: substitute_reducible : ReducibleEnvironment × Term ⇀ ReducibleEnvironment preserves reducibility
---
# Reducible Substitution

## Statement

The earned acts
[`select-reducibility-candidate`](./select-reducibility-candidate.md) and
[`substitute-reducibility`](./substitute-reducibility.md) show that
substituting typed reducible terms into a `ReducibleEnvironment` preserves
reducibility.

## Proof sketch

`BuildReducibleEnvironment` seeds the logical relation. The selection act
chooses the candidate relation for each term, and
`SubstituteReducibility = (BuildReducibleEnvironment JudgeTyping)` certifies
that typed substitutions stay reducible.

## Uniqueness

Given the earned environment and substitution acts, reducible substitution is
fixed up to nucleus equivalence.
