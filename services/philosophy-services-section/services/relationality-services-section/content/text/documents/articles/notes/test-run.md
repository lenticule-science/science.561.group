---
title: Test Run
keywords:
  - testing
  - execution
layer: system
status: plan
claims:
  - type: operator
    judgement: "Run : TestCase × Schedule → ExecutionResult respecting dependencies/commutation"
depends-on:
  - system/structure/test-case
  - system/structure/task-carrier
  - system/operator/task-precedence
  - math/operator/task-commutation
  - system/operator/task-parallelization
description: Uses the scheduling structure (and commutation/parallelization operators) to execute test cases while preserving trace order and dependencies, possibly in parallel when commutation allows.
---
# Test Run

Uses the scheduling structure (and commutation/parallelization operators) to
execute test cases while preserving trace order and dependencies, possibly in
parallel when commutation allows.
