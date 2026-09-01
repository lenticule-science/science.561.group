---
name: "Navier-Stokes Equations"
date-created: 2026-03-06T00:00:00
aliases:
  - "Navier-Stokes Equations"
  - "Navier-Stokes equations"
  - "Navier-Stokes"
  - "N-S equations"
keywords:
  - FluidDynamics
  - Mathematics
  - Aerodynamics
description: "The partial differential equations governing the motion of viscous fluids — the fundamental equations of fluid mechanics."
authors:
  - emsenn
  - claude-opus-4-6
---

The Navier-Stokes equations are the fundamental governing equations of viscous fluid flow. They express Newton's second law applied to a continuous fluid: the rate of change of momentum of a fluid element equals the sum of pressure forces, viscous forces, and body forces (gravity) acting on it.

In their incompressible form:

ρ(∂v/∂t + v·∇v) = -∇p + μ∇²v + ρg

where ρ is density, v is the velocity vector, p is pressure, μ is dynamic viscosity, and g is gravitational acceleration. The left side is the acceleration of a fluid particle; the right side is the sum of forces per unit volume.

The equations are supplemented by the continuity equation (conservation of mass):

∇·v = 0 (incompressible)

and, for compressible flows, by the energy equation (conservation of energy) and an equation of state relating pressure, density, and temperature.

### Why they matter in aerospace

Every aerodynamic phenomenon — [lift](../../topics/uavs/terms/lift.md), [drag](../../topics/uavs/terms/drag.md), [boundary layer](../../topics/uavs/terms/boundary-layer.md) separation, [shock waves](./shock-wave.md), turbulence, [stall](../../topics/uavs/terms/stall.md) — is a solution of the Navier-Stokes equations for particular boundary conditions. The equations are exact, but they cannot be solved analytically for any geometry of practical interest. All of aerospace fluid dynamics is the history of approximations:

- **Euler equations** — drop the viscous term (μ∇²v = 0). Valid away from surfaces. Cannot predict drag or separation.
- **Boundary layer equations** — Prandtl's 1904 simplification for thin viscous layers near surfaces. Made aerodynamic analysis practical.
- **Potential flow** — assume irrotational, inviscid flow. Elegant and fast but misses all viscous effects.
- **Reynolds-Averaged Navier-Stokes (RANS)** — time-average the equations and model turbulent fluctuations. The workhorse of modern computational fluid dynamics (CFD).
- **Large Eddy Simulation (LES)** — resolve the large turbulent structures, model only the smallest. More accurate than RANS, 100–1000× more expensive.
- **Direct Numerical Simulation (DNS)** — solve the full equations at all scales. Currently feasible only for simple geometries at low [Reynolds numbers](../../topics/uavs/terms/reynolds-number.md).

The Navier-Stokes existence and smoothness problem — whether solutions always exist and remain smooth in three dimensions — is one of the Clay Mathematics Institute Millennium Prize Problems, with a \$1 million prize for a solution.

## Related terms

- [Reynolds Number](../../topics/uavs/terms/reynolds-number.md) — the dimensionless ratio that determines whether viscous or inertial forces dominate
- [Boundary Layer](../../topics/uavs/terms/boundary-layer.md) — the thin region near surfaces where viscous effects concentrate
- [Mach Number](./mach-number.md) — determines whether the compressible or incompressible form applies
