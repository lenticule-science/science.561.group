---
title: "UAV Guidance, Navigation, and Control"
date-created: 2026-03-06T00:00:00
type: concept
aliases:
  - "UAV Guidance, Navigation, and Control"
  - "UAV GNC"
  - "drone navigation"
  - "drone autonomy"
authors:
  - emsenn
  - claude-opus-4-6
keywords:
  - ControlSystems
  - Navigation
description: "How uncrewed aircraft know where they are, where to go, and how to get there — from IMU stabilization through GPS waypoint following to vision-based autonomy."
---

Guidance, navigation, and control (GNC) is the engineering discipline concerned with three questions: Where am I?
Where should I go?
How do I get there?
For UAVs, these questions are answered by a layered system of sensors, estimation algorithms, and control laws running on the [flight controller](../terms/flight-controller.md).

## The three layers

**Control** (innermost loop, 100–8,000 Hz): Stabilize the aircraft's attitude.
Read the [IMU](../terms/imu.md), compare measured attitude to desired attitude, compute actuator commands ([servo](../terms/servo.md) deflections or [ESC](../terms/esc.md) throttle values) to minimize the error.
This loop runs fastest because attitude changes happen on millisecond timescales, especially for inherently unstable platforms like multirotors.

**Navigation** (middle loop, 1–50 Hz): Estimate the aircraft's position and velocity.
Fuse IMU data with GPS, barometric altitude, magnetometer heading, and optionally airspeed, optical flow, or visual odometry.
The standard estimation tool is the extended Kalman filter (EKF), which produces a best estimate of the full state (position, velocity, attitude, sensor biases) from noisy, delayed, and intermittent sensor data.

**Guidance** (outermost loop, 0.1–10 Hz): Decide where to fly.
Follow a sequence of waypoints, orbit a target, execute a search pattern, respond to operator commands, or — in autonomous systems — make targeting decisions.
This layer converts mission-level intent into a sequence of desired positions and velocities that the navigation and control layers execute.

## Sensor fusion

No single sensor provides reliable state estimation across all conditions:

| Sensor | Measures | Strengths | Weaknesses |
|---|---|---|---|
| [IMU](../terms/imu.md) (gyro + accel) | Angular rate, linear acceleration | Fast (kHz), always available | Drifts within seconds without correction |
| GPS | Position, velocity | Absolute, global | Update rate slow (1–10 Hz), denied in jamming, multipath in urban areas |
| Magnetometer | Heading | Absolute reference to magnetic north | Distorted by motors, batteries, metal structures, power lines |
| Barometric altimeter | Altitude (relative) | Smooth, high-rate | Drifts with weather, affected by prop wash |
| Airspeed sensor (pitot tube) | Indicated airspeed | Direct measurement of aerodynamic state | Mechanical (can ice or clog), not relevant for multirotors |
| Optical flow | Ground-relative velocity | Works indoors, GPS-denied | Fails over featureless surfaces, altitude-dependent scaling |
| LiDAR altimeter | Height above ground | Precise, fast | Weight, cost, single-point (not a full position solution) |
| Visual odometry / SLAM | Position, orientation | No external infrastructure needed | Computationally expensive, fails in featureless or dark environments |

The flight controller's EKF fuses these inputs by weighting each according to its reliability and consistency.
If GPS is available, it dominates position estimation.
If GPS is lost (jamming, indoor flight, canyon), the EKF falls back to IMU dead reckoning corrected by whatever other sensors are available — optical flow, visual odometry, or barometric altitude.
The quality of this fallback determines whether the UAV can continue its mission or must return home.

## GPS-denied navigation

Operating without GPS is the defining challenge for military UAVs in contested environments and for commercial drones in indoor or urban settings:

- **Inertial navigation** — pure [IMU](../terms/imu.md) integration.
  MEMS IMUs drift at 0.5–10°/hour, making this usable for minutes at most.
  Military INS units with fiber-optic or ring-laser gyroscopes can navigate for hours, but cost \$10,000–\$100,000.
- **Terrain-referenced navigation** — comparing onboard sensor measurements (radar altimeter profile, camera imagery) against a stored terrain database.
  Used in cruise missiles for decades; increasingly available for UAVs with lightweight cameras and onboard compute.
- **Visual-inertial odometry (VIO)** — fusing camera imagery with IMU data to track position by matching visual features between frames.
  Requires a textured environment and sufficient compute.
  The standard approach for indoor drone navigation.
- **Simultaneous localization and mapping (SLAM)** — building a map of the environment while simultaneously localizing within it.
  LiDAR SLAM or visual SLAM can provide centimeter-level accuracy in unknown environments but requires significant processing power.
- **Collaborative navigation** — UAVs in a swarm share position estimates, with inter-vehicle ranging (radio time-of-flight, UWB) providing relative position data even without absolute GPS fixes.

## Control architectures

**PID control** (proportional-integral-derivative) is the workhorse of UAV attitude control.
Three gains — proportional (reacts to current error), integral (corrects accumulated error), derivative (damps oscillation) — are tuned for each axis (roll, pitch, yaw) and each loop (rate, angle, position).
PID tuning is one of the most common practical tasks in UAV development; undertoned controllers oscillate, and overtoned controllers respond sluggishly.

**Cascaded PID** — the standard architecture: an outer position controller commands velocity, a velocity controller commands attitude, an attitude controller commands angular rate, and a rate controller commands actuators.
Each loop runs faster than the one above it.

**Model-based control** — linear quadratic regulator (LQR), model predictive control (MPC), and adaptive control methods use a mathematical model of the aircraft's dynamics to compute optimal actuator commands.
These provide better performance than PID in theory but require accurate models and more computational resources.
Emerging in research and high-end commercial autopilots.

**Neural network control** — reinforcement learning and neural network-based controllers trained in simulation and transferred to real hardware.
Still experimental for primary flight control but increasingly used for higher-level tasks (obstacle avoidance, aggressive maneuvering, landing site selection).

## Autonomy levels

The GNC architecture determines what level of autonomy the UAV can achieve:

1. **Manual / rate mode** — pilot directly commands angular rates.
  The flight controller only stabilizes against IMU noise.
  No navigation.
  Requires continuous pilot input.
2. **Stabilized / angle mode** — flight controller maintains commanded pitch and roll angles.
  Pilot releases sticks, aircraft levels out.
  IMU-only.
3. **Position hold** — flight controller maintains GPS position and altitude.
  Pilot commands velocity or gives no input.
  Requires GPS + barometer.
4. **Waypoint mission** — flight controller follows a pre-programmed sequence of positions, altitudes, and speeds.
  Operator monitors.
  Standard for survey, mapping, and delivery UAVs.
5. **Reactive autonomy** — the UAV responds to sensor input in real time: obstacle avoidance, terrain following, moving target tracking.
  Requires onboard perception (cameras, LiDAR) and sufficient compute.
6. **Deliberative autonomy** — the UAV makes mission-level decisions: selecting targets, replanning routes around threats, coordinating with other UAVs.
  The frontier of military UAV development.

## Related concepts

- [Wing Planform Selection for UAVs](./wing-planform-selection-for-uavs.md) — planform affects stability characteristics that the control system must manage
- [UAV Propulsion Systems](./uav-propulsion-systems.md) — propulsion vibration and response time interact with GNC
- [Additive Manufacturing in UAV Airframes](./additive-manufacturing-in-uav-airframes.md) — IMU mounting and vibration damping in printed structures affect navigation quality
