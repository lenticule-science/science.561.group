---
name: "Endurance"
date-created: 2026-03-06
aliases:
  - "Endurance"
  - "endurance"
  - "flight endurance"
  - "loiter time"
authors:
  - emsenn
  - claude-opus-4-6
keywords:
  - Aerodynamics
  - Propulsion
description: "The maximum time an aircraft can remain airborne on a given fuel or battery load, the most constrained performance parameter for most UAV missions."
---

Endurance is the maximum time a UAV can remain airborne. It is the duration counterpart to range (maximum distance): endurance is maximized by flying slowly at minimum power, while range is maximized by flying at the speed for best [lift-to-drag ratio](./lift-to-drag-ratio.md).

For electric UAVs, endurance is:

t = E_battery × η / P_required

where E_battery is battery energy (Wh), η is overall efficiency (motor × ESC × propeller, typically 0.5–0.7), and P_required is the power needed to sustain flight.

For fuel-burning UAVs, endurance follows the Breguet endurance equation, which shows that endurance improves with:
- Higher [L/D ratio](./lift-to-drag-ratio.md) (less drag to overcome)
- Lower specific fuel consumption (more efficient engine)
- Higher fuel fraction (more fuel relative to total weight)

Representative endurance values across the UAV spectrum:

| Platform class | Typical endurance | Primary limit |
|---|---|---|
| Racing quadcopter | 3–8 min | Battery energy vs. power demand |
| Photography multirotor | 20–45 min | Battery energy density |
| Small fixed-wing (electric) | 45–120 min | Battery weight fraction |
| Tactical fixed-wing (fuel) | 4–12 hr | Fuel capacity, engine reliability |
| Expendable strike (fuel) | 2–8 hr | One-way; all fuel consumed |
| MALE (MQ-9 Reaper) | 24–27 hr | Fuel capacity, crew rotation |
| HALE (RQ-4 Global Hawk) | 30–36 hr | Fuel capacity |
| Solar HALE (Zephyr) | Weeks–months | Structural fatigue, weather |

Endurance is the binding constraint for most UAV missions. A survey drone that can only fly 25 minutes covers far less area than one that flies 50 minutes; the engineering effort to gain those extra minutes — better [L/D](./lift-to-drag-ratio.md) through higher [aspect ratio](./aspect-ratio.md), lighter [airframe](./wing-planform-selection-for-uavs.md), more efficient [propulsion](./uav-propulsion-systems.md), higher energy density battery — drives most of the design trade-offs in UAV engineering.

## Related terms

- [Lift-to-Drag Ratio](./lift-to-drag-ratio.md) — the aerodynamic efficiency parameter that directly determines endurance
- [Wing Loading](./wing-loading.md) — affects the power required for flight and therefore endurance
- [Thrust-to-Weight Ratio](./thrust-to-weight-ratio.md) — determines the minimum power state
