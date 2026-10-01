---
name: "Flight Controller"
type: "term"
date-created: 2026-03-06
---

The central processing unit of a UAV that reads sensors, estimates attitude and position, and commands actuators to achieve stable, controlled flight.

A flight controller (FC) is the hardware and firmware that makes autonomous or stabilized flight possible. It reads data from an [IMU](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/imu.md) (accelerometers and gyroscopes), fuses it with other sensors (GPS, magnetometer, barometer, airspeed sensor, optical flow), estimates the aircraft&rsquo;s state (attitude, position, velocity), and commands the actuators ([servos](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/servo.md) on fixed-wing, [ESCs](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/esc.md) on multirotors) to follow a desired trajectory or maintain a desired attitude.

**Hardware** ranges from single-chip microcontroller boards (STM32-based boards like the Matek F405 or SpeedyBee F7, costing $15–50) used in hobby and small commercial drones, to mil-spec embedded computers with redundant sensors, hardened electronics, and encrypted communications used in military platforms.

**Firmware** is the real-time software running on the flight controller:

- **ArduPilot** — open-source, supports fixed-wing (ArduPlane), multirotor (ArduCopter), and rover. The most widely used autopilot for research, commercial, and DIY UAVs. Supports full autonomous waypoint navigation, return-to-home, geofencing, and failsafes.

- **PX4** — open-source, developed by Dronecode/Auterion. Similar capability to ArduPilot with a different architecture. Strong in commercial and research applications.

- **Betaflight / INAV** — open-source, focused on FPV racing (Betaflight) and GPS navigation (INAV) for hobby fixed-wing and multirotors. Optimized for fast control loops and pilot responsiveness.

- **Proprietary military systems** — closed-source autopilots with encrypted links, anti-jamming GPS, vision-based navigation, and autonomous target recognition. Used in platforms like the MQ-9 Reaper, RQ-170, and [LUCAS](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/lucas.md).

**Core control loop:** The flight controller runs a feedback loop at 100–8,000 Hz (depending on platform and firmware):

- Read IMU (and other sensors)

- Estimate attitude (typically via complementary filter or extended Kalman filter)

- Compare estimated state to desired state (commanded by pilot input, waypoint mission, or higher-level autonomy)

- Compute actuator commands via PID (proportional-integral-derivative) control or more advanced algorithms

- Send commands to servos/ESCs

The flight controller is what allows a UAV to fly without a pilot&rsquo;s real-time input. A multirotor is inherently unstable — without continuous correction hundreds of times per second, it tumbles immediately. Even inherently stable fixed-wing configurations benefit from autopilot augmentation for mission execution, navigation, and failsafe behavior.
