---
form: research
title: Judgment Calculus Evaluation Structure
tags:
  - lambda
  - evaluation
layer: internal-theorem
status: plan
depends-on:
  - seed-evaluation-context
  - build-evaluation-context
  - seed-value
  - recognize-value# Judgment Calculus Evaluation Structure

The acts

- `SeedEvaluationContext`,
- `BuildEvaluationContext`,
- `SeedValue`, and
- `RecognizeValue`

define evaluation contexts and values for terms in the judgment calculus in the relational
calculus:

- evaluation frames are built by extending contexts along the trace,
- values are recognized at the head of the trace using `SeedValue` and
  `RecognizeValue`,
- together they yield the call-by-value evaluation structure used in the
  judgment calculus, and externally correspond to the simply-typed lambda
  calculus evaluation when read through the correspondence theorem.
