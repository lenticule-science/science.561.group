---
title: Concurrency Stack
aliases:
  - Concurrency Stack
  - concurrency stack
keywords:
  - concurrency
  - commutation
  - flow
depends_on:
  - commute-flow-and-nucleus
  - distribute-flow
  - flow-index-implication
  - theorem/internal/scheduling-stack
---

# Theorem (Concurrency Stack)

`CommuteFlowAndNucleus`, `DistributeFlow`, and `FlowIndexImplication` show that
many operations commute or distribute over each other, which justifies concurrent
execution.  When combined with the scheduling stack, we get a concurrency layer.

1. **Commutation.**  
   `CommuteFlowAndNucleus` and related acts witness that flow/nucleus operations
   commute, so different threads may apply them independently.

2. **Distribution.**  
   `DistributeFlow` and the residuation acts prove distributing flow over joins
   or meets is safe, enabling parallel evaluation of independent branches.

3. **Scheduler integration.**  
   The scheduling stack enforces dependency order, so concurrent tasks remain
   consistent with the trace spine.

Hence the relational calculus supports concurrency whenever commuting acts are
involved; the concurrency stack is our mathematical guarantee for parallel
execution.
