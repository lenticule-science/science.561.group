---
name: "Structural Load"
type: "term"
date-created: 2026-03-06
---

The forces and moments acting on an aerospace vehicle's structure — from aerodynamic pressure, inertia, thrust, and ground contact.

Structural loads are the forces and moments that an aerospace vehicle&rsquo;s structure must withstand without failure. The structure must be designed for the worst combination of loads it will encounter in service — the critical load case — with an appropriate [safety factor](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/safety-factor.md).

## Load sources

**Aerodynamic loads** — pressure distributions from [lift](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/lift.md), [drag](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/drag.md), and side forces. These scale with [dynamic pressure](../../../../services/aerospace-engineering-science-services-section/content/text/glossary/terms/dynamic-pressure.md) and increase with maneuver intensity (load factor).

**Inertial loads** — the reaction of the vehicle&rsquo;s mass to acceleration. In a 3g pull-up, every kilogram of structure experiences 3× its weight in inertial load. These loads distribute through the structure from where they originate (fuel in tanks, engines on mounts, payload in bays) to where they are reacted (wing [spars](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/spar.md), fuselage frames).

**Thrust loads** — forces from propulsion systems, transferred through engine mounts to the airframe. Rocket thrust loads can be enormous: a Falcon 9 first stage transfers ~7,600 kN through nine engine mounts into the base structure.

**Ground loads** — landing impact, taxiing, and towing. Landing gear design is driven by the worst landing the vehicle might experience.

**Pressurization loads** — cabin pressure differential in crewed aircraft and spacecraft. A fuselage at 8,000-foot cabin altitude at 40,000 feet experiences ~6 psi differential pressure across its skin — enough to turn the fuselage into a pressure vessel with hoop and longitudinal stresses.

**Thermal loads** — differential expansion from temperature gradients. A Shuttle orbiter wing at reentry has its lower surface at 1,200°C and upper surface at 400°C; the differential expansion induces large internal stresses.

## Load factor

The load factor (n) is the ratio of lift to weight:

n = L/W

In level flight, n = 1 (1g). In a 60° banked turn, n = 2 (2g). In a 3g pull-up, n = 3. The load factor determines the structural loads on the airframe — a 3g maneuver triples every aerodynamic and inertial load compared to 1g flight.

Category
Positive limit load
Negative limit load

Normal (utility) aircraft
+3.8g
-1.5g

Aerobatic aircraft
+6g
-3g

Fighter aircraft
+9g
-3g

UAVs (typical)
+3–5g
-1–2g

Transport aircraft
+2.5g
-1g

## Ultimate load

The ultimate load is the limit load multiplied by the [safety factor](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/safety-factor.md) (typically 1.5 for crewed aircraft). The structure must withstand limit loads without permanent deformation and ultimate loads without rupture. For expendable UAVs, the safety factor may be reduced to 1.2–1.3, saving structural weight.
