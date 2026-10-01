---
name: "Elevon"
type: "term"
date-created: 2026-03-06
---

A combined elevator/aileron control surface on the trailing edge of a tailless or delta wing, providing both pitch and roll control.

An elevon is a [control surface](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/control-surface.md) on the trailing edge of a tailless aircraft — a delta wing, flying wing, or blended wing body — that combines the functions of [ailerons](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/aileron.md) (roll) and [elevator](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/elevator.md) (pitch) in a single pair of surfaces.

**Mixing logic:** The [flight controller](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/flight-controller.md) mixes pitch and roll commands to drive the two elevons:

- **Pitch up:** Both elevons deflect trailing-edge-up (symmetric).

- **Pitch down:** Both deflect trailing-edge-down (symmetric).

- **Roll left:** Left elevon up, right elevon down (differential).

- **Combined:** Superposition of pitch and roll commands. A simultaneous pitch-up and roll-left command deflects the left elevon further up while the right elevon is near neutral.

Elevons are the standard control system for delta-winged expendable drones (Shahed-136, [LUCAS](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/lucas.md), and derivatives), flying-wing stealth UAVs (RQ-170, nEUROn), and many hobbyist flying-wing designs. They reduce part count to just two [servos](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/servo.md) — the minimum for controlled fixed-wing flight.

The limitation of elevons is coupling: a large pitch command reduces the roll authority available (the elevons are already near full deflection for pitch), and vice versa. This limits the total control authority compared to a conventional layout with independent surfaces. For most UAV flight envelopes, this limitation is not operationally significant — the [flight controller](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/flight-controller.md) manages the mixing and saturates gracefully.

**Split elevons** (each elevon divided into upper and lower halves that can deflect independently) provide rudder-equivalent yaw control through differential drag — opening one split elevon like an airbrake while the other remains closed. This adds two more servos but provides three-axis control without a vertical tail.
