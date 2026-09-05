---
title: Test Run
keywords:
  - testing
  - execution
layer: system
status: plan
depends_on:
  - system/structure/test-case
  - system/structure/task-carrier
  - system/operator/task-precedence
  - math/operator/task-commutation
  - system/operator/task-parallelization
claims:
  - type: operator
    judgement: Run : TestCase × Schedule → ExecutionResult respecting dependencies/commutation
---
# Test Run

Uses the scheduling structure (and commutation/parallelization operators) to
execute test cases while preserving trace order and dependencies, possibly in
parallel when commutation allows.
