---
name: "Lift-to-Drag Ratio"
type: "term"
date-created: 2026-03-06
---

The ratio of lift to drag, the single best measure of aerodynamic efficiency and the primary determinant of range and endurance.

Lift-to-drag ratio (L/D) is the ratio of [lift](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/lift.md) force to total [drag](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/drag.md) force at a given flight condition. It is the single most informative measure of aerodynamic efficiency: an aircraft with L/D of 20 generates 20 units of lift for every unit of drag, meaning it can glide 20 meters forward for every meter of altitude lost (hence the alias &ldquo;glide ratio&rdquo;).

L/D varies with airspeed and [angle of attack](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/angle-of-attack.md). Maximum L/D occurs at the speed where [induced drag](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/induced-drag.md) equals [parasitic drag](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/parasitic-drag.md) — the minimum-drag speed. Flying faster or slower than this speed reduces L/D.

Representative maximum L/D values across the UAV spectrum:

Platform
Max L/D
Notes

Indoor micro UAV
4–6
Low [Re](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/reynolds-number.md), high parasitic drag relative to size

Small quadcopter (in forward flight)
3–5
Rotors are inefficient in cruise

Small fixed-wing (2 kg, AR 6)
8–12
Limited by low Reynolds number

Tactical UAV (50 kg, AR 10)
12–18
Conventional planform, moderate Re

Shahed-class delta (AR 2)
5–8
Low AR drives high induced drag

MQ-9 Reaper (AR 17)
18–22
High AR, turbulent Re, clean airframe

RQ-4 Global Hawk (AR 25)
28–35
Sailplane-class efficiency at altitude

These numbers illustrate why [planform selection](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/wing-planform-selection-for-uavs.md) matters: the Global Hawk achieves 4–5× the L/D of a Shahed-class drone, translating directly to 4–5× the range for the same fuel fraction. The Shahed accepts this penalty because L/D is not its binding constraint — cost is.

For range estimation, the Breguet range equation relates L/D directly to distance: range is proportional to L/D × ln(W_initial / W_final), where the weight ratio reflects fuel consumed. Every 10% improvement in L/D yields roughly 10% more range.
