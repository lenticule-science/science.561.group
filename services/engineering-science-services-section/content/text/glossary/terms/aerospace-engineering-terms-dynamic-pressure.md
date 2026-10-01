---
name: "Dynamic Pressure"
date-created: 2026-03-06
---

The kinetic energy per unit volume of a moving fluid, equal to ½ρv², governing aerodynamic forces and structural loads.

Dynamic pressure (q) is the kinetic energy per unit volume of a fluid in motion:

q = ½ρv²

where ρ is the fluid density and v is the flow velocity. Every aerodynamic force — [lift](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/lift.md), [drag](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/drag.md), side force — is proportional to dynamic pressure. The lift equation L = q × S × C_L and drag equation D = q × S × C_D both scale linearly with q. Double the dynamic pressure, double every aerodynamic force.

Dynamic pressure has units of pascals (Pa) or pounds per square foot (psf).

### Max Q

In rocketry, &ldquo;max Q&rdquo; is the point during ascent where dynamic pressure reaches its maximum. At launch, velocity is low so q is low. As the rocket accelerates, q rises. But as altitude increases, atmospheric density ρ drops. The competition between rising velocity and falling density produces a maximum — max Q — typically occurring 60–90 seconds after launch at altitudes of 10–15 km.

Max Q is the point of maximum aerodynamic loading on the vehicle structure. Many rockets throttle down approaching max Q to limit structural loads, then throttle up after passing through it. The Space Shuttle&rsquo;s main engines throttled from 104% to 67% thrust during the max Q period.

Vehicle
Max Q (kPa)
Altitude at max Q
Time after launch

Saturn V
~33
~13 km
~80 s

Space Shuttle
~32
~11 km
~60 s

Falcon 9
~28
~12 km
~75 s

### Incompressible vs. compressible

At low [Mach numbers](../../../../services/aerospace-engineering-science-services-section/content/text/glossary/terms/mach-number.md) (M < 0.3), density is effectively constant and q = ½ρv² is exact. At higher Mach numbers, compressibility modifies the relationship — the &ldquo;impact pressure&rdquo; felt by a body differs from ½ρv² because the air compresses ahead of the body.
