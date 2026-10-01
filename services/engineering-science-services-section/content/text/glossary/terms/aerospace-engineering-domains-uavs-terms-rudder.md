---
name: "Rudder"
type: "term"
date-created: 2026-03-06
---

A control surface on the vertical tail, deflected to yaw the aircraft left or right.

A rudder is a hinged [control surface](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/control-surface.md) on the vertical stabilizer (fin). Deflecting the rudder generates a side force on the tail, yawing the aircraft&rsquo;s nose left or right. The rudder is primarily used for coordinating turns (preventing sideslip), correcting for crosswinds, and maintaining directional control during asymmetric thrust conditions (one engine failed on a twin-engine platform).

### Why yaw matters

In a coordinated turn, the aircraft&rsquo;s nose points along its flight path — the airflow hits both wings symmetrically, and [drag](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/drag.md) is minimized. Without yaw control, banking to turn creates adverse yaw: the outer wing produces more [induced drag](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/induced-drag.md) than the inner wing, pulling the nose away from the turn. The result is sideslip — airflow hitting the aircraft at an angle, increasing total drag and making the turn inefficient. The rudder corrects this by deflecting to yaw the nose into the turn.

For crosswind landings (relevant for conventional-takeoff UAVs), the rudder maintains the fuselage aligned with the runway while the wings are banked into the wind. Without rudder authority, crosswind capability is limited to the aircraft&rsquo;s natural weathervane tendency from the vertical fin alone.

### UAV configurations without rudders

Many small UAVs omit the rudder entirely. Delta-winged designs rely on differential [elevon](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/elevon.md) deflection (split elevons) or drag rudders for yaw control. Flying wings use split trailing-edge surfaces or spoilerons. Some conventional fixed-wing UAVs use only [ailerons](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/aileron.md) and [elevator](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/elevator.md), accepting that uncoordinated turns produce slightly more drag but eliminating one [servo](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/servo.md) and the vertical tail&rsquo;s structural weight. On autopilot-controlled platforms, the [flight controller](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/flight-controller.md) can compensate for the absence of a rudder by using bank angle and differential thrust (on multi-engine platforms) for yaw management.

Where a rudder is present on small UAVs, it is typically small — sufficient for yaw damping and crosswind correction but not intended for aggressive yaw maneuvers. The vertical fin itself provides passive directional [stability](../../documents/articles/research/2026/07/31/lenticule-import/library/applied-sciences/technology/terms/stability.md) (weathervane effect); the rudder adds potential control authority on top of this.
