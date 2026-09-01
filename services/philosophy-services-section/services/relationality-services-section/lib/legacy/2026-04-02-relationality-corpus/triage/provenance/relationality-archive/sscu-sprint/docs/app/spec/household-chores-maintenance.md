---
name: household-chores-maintenance
keywords:
  - idea
  - chores
  - maintenance
part-of: relational-computer
description: "Models chores and maintenance as recognitions to distribute work and avoid surprises."
---

Model chores and maintenance as recognitions to distribute work and avoid
surprises.

## 1. Recognitions

- `ChoreRecognition`: recurring tasks (dishes, laundry, trash).
- `MaintenanceTaskRecognition`: less frequent tasks (filter changes, repairs).
- `AssignmentRecognition`: who is responsible, when.

## 2. Measurement and topology

- Measurement:
  - frequency, completion timeliness, distribution of effort.
- Topology:
  - chores ↔ rooms/assets; assignments ↔ people.

Runbooks: `plan_chore_schedule`, `rotate_assignments`, `log_completion`.

