---
name: "Gimbal"
date-created: 2026-03-06T00:00:00
aliases:
  - "Gimbal"
  - "gimbal"
  - "thrust vector control"
  - "TVC"
  - "gimbaled engine"
keywords:
  - RocketEngineering
  - ControlSystems
  - FlightMechanics
description: "A pivoting mount that allows a rocket engine to be tilted, directing thrust for vehicle steering — the primary attitude control method during powered flight."
authors:
  - emsenn
  - claude-opus-4-6
---

A gimbal is a pivoting mount that allows a rocket engine (or its nozzle) to be tilted relative to the vehicle's longitudinal axis. By deflecting the thrust vector away from the vehicle's center of mass, gimbaling produces a torque that pitches or yaws the vehicle. This is thrust vector control (TVC) — the primary method of steering a rocket during powered flight.

Typical gimbal ranges are ±5° to ±8° from the centerline. Larger deflections are possible but reduce axial thrust (thrust × cos(gimbal angle)) and impose higher structural loads on the gimbal actuators and thrust structure.

## Gimbal systems

**Hydraulic gimbals** — hydraulic actuators pivot the entire engine assembly. Used on large engines (RS-25, Merlin, F-1) where the forces required to move a multi-ton engine against thrust loads demand hydraulic power. The Space Shuttle's RS-25 engines each gimbaled ±10.5° in pitch and ±8.5° in yaw.

**Electromechanical gimbals** — electric motors drive screw or linkage mechanisms. Lighter than hydraulic systems but limited in force output. Used on smaller engines and upper stages.

**Flex-bearing/flex-seal nozzles** — the nozzle itself flexes on an elastomeric bearing rather than the entire engine pivoting. Used on solid rocket motors (Space Shuttle SRBs, many ICBMs) where the fixed combustion chamber cannot be moved.

## Alternatives to gimbaling

- **Vernier engines** — small auxiliary engines mounted at the vehicle's edge, fired differentially for steering. Used on early Soviet rockets (R-7/Soyuz).
- **Jet vanes** — refractory vanes in the exhaust plume that deflect thrust. Simple but erode quickly. Used on the V-2 and early tactical missiles.
- **Differential throttling** — on vehicles with multiple engines, steering by varying thrust between engines on opposite sides. Used by Falcon Heavy (three cores with independent throttle control).
- **Reaction control system (RCS)** — small thrusters using hypergolic or cold gas propellant, used for attitude control when main engines are off (coast phases, orbital flight).

## Relationship to stability

During the first seconds of flight, when the vehicle is moving slowly and aerodynamic [control surfaces](../../../topics/uavs/terms/control-surface.md) are ineffective, gimbaling is the only steering mechanism available. Rocket [stability](../../terms/stability.md) during powered flight depends entirely on the TVC system's ability to keep the thrust vector passing through (or near) the center of mass. If the TVC system fails, the vehicle tumbles within seconds.

## Related terms

- [Thrust](../../terms/thrust.md) — the force being vectored
- [Stability](../../terms/stability.md) — what gimbaling maintains during powered flight
- [Combustion Chamber](./combustion-chamber.md) — the assembly that gimbaling tilts
