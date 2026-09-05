---
title: Testing Stack
tags:
  - testing
  - validation
depends_on:
  - theorem/internal/evaluation-engine
  - theorem/internal/measurement-stack
  - theorem/internal/scheduling-stack
  - theorem/internal/module-wiring
---
# Theorem (Testing Stack)

The calculus already supports automated testing: we can construct test traces,
run them through evaluation, and compare their resulting observables against
expected values.

1. **Test generation.**  
   Using the evaluation engine, we can build finite traces/contexts that serve as
   test cases.  Because substitution and normalization are earned, each test is a
   valid relational program fragment.

2. **Execution.**  
   The scheduling stack lets us run these tests (possibly in parallel) while
   preserving trace order and dependencies.

3. **Measurement/comparison.**  
   The measurement stack provides observables for assertions: expected entropy,
   kernels, or other metrics can be contrasted against actual results.

4. **Module integration.**  
   Module wiring ensures any module under test can consume the generated traces
   and produce outputs for comparison.

Thus the calculus incorporates a testing stack: for every module, we can generate
tests, execute them deterministically, and assert on observables—all using earned
acts.  Future specs and architecture components can cite this theorem to justify
their test harnesses.
