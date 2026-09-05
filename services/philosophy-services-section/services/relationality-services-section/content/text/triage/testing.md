---
title: Testing Harness Simulation
keywords:
  - simulation
  - testing
layer: spec
status: plan
depends_on:
  - system/structure/test-case
  - system/operator/test-run
  - system/operator/test-assert
---

This specification instantiates the **Testing Structure**: it explains how to
implement automated tests for relational components using the `TestCases`,
`Run`, and `Assert` operators.

## State representation

- **Test library.**  
  Repository of test cases (trace fragments, contexts, expected observables).

- **Runner.**  
  Harness that executes tests via the scheduling/concurrency layers, aligned
  with the evaluation engine.

## Inputs

1. Test cases (trace + expected observables).
2. Component under test (service endpoint or internal API).

## Procedures

1. **Compilation.**  
   Convert high-level test descriptions into judgment-calculus terms and trace
   fragments using the evaluation engine.
2. **Execution.**  
   Queue tests in the scheduler; run sequentially or in parallel depending on
   the commutation relation.
3. **Assertion.**  
   Collect observables and compare against expectations via the measurement
   structure, respecting nucleus equivalence where applicable.
4. **Reporting.**  
   Log pass/fail results; persist failing snapshots for debugging.

## Invariants

- Test execution must be deterministic up to commutation (trace spine
  preserved).
- Assertions must use earned observables; comparisons must respect the
  probabilistic and nucleus equivalence semantics.

## Outputs

- Test results (pass/fail + diagnostics).
- Snapshot references for failures.
