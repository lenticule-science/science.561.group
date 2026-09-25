---
title: "Navier-Stokes Equations"
type: "term"
date-created: 2026-03-06
---

The partial differential equations governing the motion of viscous fluids — the fundamental equations of fluid mechanics.

The Navier-Stokes equations are the fundamental governing equations of viscous fluid flow. They express Newton&rsquo;s second law applied to a continuous fluid: the rate of change of momentum of a fluid element equals the sum of pressure forces, viscous forces, and body forces (gravity) acting on it.

In their incompressible form:

ρ(∂v/∂t + v·∇v) = -∇p + μ∇²v + ρg

where ρ is density, v is the velocity vector, p is pressure, μ is dynamic viscosity, and g is gravitational acceleration. The left side is the acceleration of a fluid particle; the right side is the sum of forces per unit volume.

The equations are supplemented by the continuity equation (conservation of mass):

∇·v = 0 (incompressible)

and, for compressible flows, by the energy equation (conservation of energy) and an equation of state relating pressure, density, and temperature.

### Why they matter in aerospace

Every aerodynamic phenomenon — [lift](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/lift.md), [drag](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/drag.md), [boundary layer](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/boundary-layer.md) separation, [shock waves](../../../../services/aerospace-engineering-science-services-section/content/text/glossary/terms/shock-wave.md), turbulence, [stall](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/stall.md) — is a solution of the Navier-Stokes equations for particular boundary conditions. The equations are exact, but they cannot be solved analytically for any geometry of practical interest. All of aerospace fluid dynamics is the history of approximations:

- **Euler equations** — drop the viscous term (μ∇²v = 0). Valid away from surfaces. Cannot predict drag or separation.

- **Boundary layer equations** — Prandtl&rsquo;s 1904 simplification for thin viscous layers near surfaces. Made aerodynamic analysis practical.

- **Potential flow** — assume irrotational, inviscid flow. Elegant and fast but misses all viscous effects.

- **Reynolds-Averaged Navier-Stokes (RANS)** — time-average the equations and model turbulent fluctuations. The workhorse of modern computational fluid dynamics (CFD).

- **Large Eddy Simulation (LES)** — resolve the large turbulent structures, model only the smallest. More accurate than RANS, 100–1000× more expensive.

- **Direct Numerical Simulation (DNS)** — solve the full equations at all scales. Currently feasible only for simple geometries at low [Reynolds numbers](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/reynolds-number.md).

The Navier-Stokes existence and smoothness problem — whether solutions always exist and remain smooth in three dimensions — is one of the Clay Mathematics Institute Millennium Prize Problems, with a $1 million prize for a solution.
