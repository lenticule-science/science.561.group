---
title: Testing Structure
tags:
  - testing
  - validation
depends_on:
  - theorem/internal/evaluation-engine
  - theorem/internal/measurement-stack
  - theorem/internal/scheduling-stack
  - theorem/internal/module-wiring
# Testing Structure

The evaluation engine, measurement structure, scheduling structure, and wiring
structure induce a testing structure: a way to generate, run, and assert on
relational tests as first-class objects.

Formally, there exists a structure

```text
Testing = (TestCases, Run, Assert)
```

such that:

1. **Test generation.**  
   `TestCases` is a set of finite traces/contexts built using the evaluation
   engine and judgment calculus. Because substitution and normalisation are
   earned, each test case is a valid relational program fragment.

2. **Execution operator.**  
   `Run` uses the scheduling structure (and optionally the concurrency
   structure) to execute test cases while preserving trace order and
   dependencies, possibly in parallel when commutation allows.

3. **Assertion operator.**  
   `Assert` uses the measurement structure to compare observed results against
   expected observables: entropy, kernels, or other metrics can be contrasted
   against expectations, respecting nucleus equivalence where applicable.

The wiring structure ensures that any component under test can consume the
generated traces and produce outputs for comparison. Thus the calculus induces
an explicit testing structure: for every admissible component, we can generate
test cases, execute them deterministically (up to commutation), and assert on
observables, all using earned acts.
