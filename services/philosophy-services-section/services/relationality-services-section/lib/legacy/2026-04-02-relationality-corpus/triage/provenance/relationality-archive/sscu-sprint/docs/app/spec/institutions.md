---
name: institutions
keywords:
  - idea
  - institutions
part-of: relational-computer
description: "Represents institutional structures as recognitions so they can be reasoned about like any other system."
---

Represent institutional structures as recognitions so they can be reasoned
about like any other system.

## 1. Recognitions

- `InstitutionRecognition`: a school, org, lab.
- `RoleRecognition`: positions, responsibilities.
- `ProgramRecognition` / `CourseRecognition`.
- `PolicyRecognition`: institutional policies.
- `DecisionRecognition`: governance outcomes.

## 2. Topology and measurement

- Topology:
  - org charts, program structures, committee membership.
- Measurement:
  - participation, outcomes, resource allocation, churn.

Runbooks: `create_program`, `assign_role`, `run_review` formalize institutional
processes in your relational calculus.

