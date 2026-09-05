---
title: Substitution Discipline
keywords:
  - substitution
  - reducibility
layer: internal-theorem
status: plan
depends_on:
  - seed-term
  - substitution-term
  - substitute-reducibility
---

The acts `SeedTerm`, `SubstitutionTerm`, and `SubstituteReducibility` define a
substitution discipline for relational terms:

- `SeedTerm` embeds terms into the relational setting and ties them to trace
  positions,
- `SubstitutionTerm` records how one term is substituted for another inside
  contexts, and
- `SubstituteReducibility` asserts that substituting reducible terms into
  reducible environments preserves reducibility.

Together they induce a function on the term and context structures that:

- is well-defined on the earned term grammar,
- preserves the reducibility predicates used in normalization arguments, and
- interacts coherently with evaluation contexts built from the evaluation
  context structure.

This theorem isolates the substitution discipline so later theorems can cite
it when reasoning about evaluation and normalization.

