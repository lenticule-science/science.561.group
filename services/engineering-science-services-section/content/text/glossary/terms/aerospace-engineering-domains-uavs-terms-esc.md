---
name: "ESC"
date-created: 2026-03-06
---

The power electronics that convert DC battery voltage into the phased AC signals needed to drive a brushless motor at a commanded speed.

An electronic speed controller (ESC) is a circuit that drives a brushless DC (BLDC) motor by converting the DC voltage from a battery pack into the three-phase AC waveform the motor requires. The [flight controller](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/flight-controller.md) sends a throttle command (typically as a PWM, DShot, or serial protocol signal) and the ESC regulates motor speed to match.

ESC parameters relevant to UAV design:

- **Current rating** — maximum continuous current the ESC can supply, typically 10–60 A for small multirotors, 80–200+ A for large or racing platforms. Must exceed the motor&rsquo;s peak current draw with margin; an undersized ESC overheats and fails.

- **Voltage rating** — maximum battery voltage supported (2S–12S LiPo, i.e., 7.4–50.4 V). Must match the battery configuration.

- **Protocol** — the communication method between flight controller and ESC. PWM (legacy, slow update rate), OneShot (faster analog), DShot (digital, no calibration needed, telemetry-capable), and BLHeli_32/AM32 (configurable firmware with advanced features like bidirectional DShot for RPM telemetry).

- **BEC (battery eliminator circuit)** — some ESCs include a voltage regulator that provides 5V power for the flight controller and [servos](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/servo.md), eliminating the need for a separate power supply.

On multirotors, the ESCs are the primary actuators — all attitude and position control happens through differential motor speed, and the ESCs must respond fast enough to maintain stability. Update rates of 8–32 kHz (with DShot protocols) are typical for modern racing and acrobatic builds.

On fixed-wing UAVs with a single propulsion motor, the ESC is simpler: it drives one motor at a commanded throttle level, with [servos](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/servo.md) handling attitude control separately.
