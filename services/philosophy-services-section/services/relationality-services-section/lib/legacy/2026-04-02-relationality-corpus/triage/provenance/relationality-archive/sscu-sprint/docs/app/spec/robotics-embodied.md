---
name: robotics-embodied
keywords:
  - idea
  - robotics
  - embodied
part-of: relational-computer
description: "Represents robots, sensors, tasks, and environments as recognitions for physical behavior."
---

Represent robots, sensors, tasks, and environments as recognitions so physical
behavior fits into the same relational universe.

## 1. Recognitions

- `RobotRecognition`: platform, capabilities, kinematics, joints, tools.
- `SensorRecognition`: cameras, lidars, IMUs, tactile sensors; calibration data.
- `TaskRecognition`: goals, constraints, success criteria (pick/place, navigate).
- `EnvironmentRecognition`: maps, obstacles, affordances.
- `TrajectoryRecognition`: executed motion plans, timing, errors.

## 2. Topology and measurement

- Topology:
  - workspace graphs, kinematic chains, task decompositions.
- Measurement:
  - latency, throughput, error rates, energy use, safety margins.

Runbooks like `plan_motion`, `execute_task`, `evaluate_run` wrap robotics
planning/control in your intake/topology/measurement/traceability framework.

