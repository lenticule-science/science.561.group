---
title: Interface Stack
aliases:
  - Interface Stack
  - interface stack
keywords:
  - interface
  - ingestion
  - API
depends_on:
  - theorem/internal/intake-stack
  - theorem/internal/measurement-stack
  - theorem/internal/policy-stack
---

# Theorem (Interface Stack)

To expose the relational calculus to external clients, we need an interface layer
that validates inputs, enforces policies, and presents observables.  Intake,
measurement, and policy stacks together witness such an interface.

1. **Input validation.**  
   Intake stack ensures incoming data becomes recognized observations/views.

2. **Policy enforcement.**  
   Policy stack defines which modules/contexts are allowed, so external requests
   can be checked before entering the system.

3. **Output shaping.**  
   Measurement stack defines how to present observables/metrics to clients.

This interface stack underpins any external API: every request is validated,
policies are enforced, and responses are well-defined observables.
