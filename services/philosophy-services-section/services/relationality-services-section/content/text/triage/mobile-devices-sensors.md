---
title: Mobile Devices and Personal Sensors
status: someday
keywords:
  - idea
  - mobile
  - sensors
---
# Idea: Mobile Devices and Personal Sensors

Integrate phones, wearables, and other personal sensors as recognitions so the
relational computer can observe and support life as it is lived, not just at a
desk.

## 1. Core recognitions

- `DeviceRecognition`
  - Phones, watches, fitness trackers, smart rings; capabilities, owners,
    connectivity, and relevant domains (fitness, sleep, location, alerts).
- `SensorStreamRecognition`
  - Streams such as heart rate, step count, GPS traces, accelerometer, ambient
    noise/light, phone usage events.
- `ContextEpisodeRecognition`
  - Episodes inferred from sensors: commute, walk, work session, rest, social
    gathering, sleep phases.

## 2. Topology and measurement

- **Topology**
  - Devices link to identities and to environments (home, work, city).
  - Sensor streams attach to measurement channels shared with health, fitness,
    system weather, and rituals.
  - Episodes connect sensor patterns to recognitions like tasks, calendar
    events, moods, and rituals.
- **Measurement**
  - Per-device reliability and coverage metrics; gaps, noise, calibration.
  - Cross-domain signals: how sensor-derived context correlates with system
    weather, health metrics, project progress, or MUD/Play activity.

## 3. Runbooks and flows

- `run_ingest_device_streams`
  - Normalize and record streams from devices into `SensorStreamRecognition`s
    with appropriate consents and policies.
- `run_infer_context_episodes`
  - Segment sensor streams into `ContextEpisodeRecognition`s; tie them to
    calendar/tasks, health events, and rituals.
- `run_context-aware_routing`
  - Use current context when routing notifications, scheduling tasks, or
    prompting rituals/interventions.

## 4. Cross-domain connections

- Extends:
  - `fitness-movement.md`, `medical-data-care.md`, `system-weather.md`,
    `micro-rituals-everyday-magic.md`, `care-networks.md`.
- Provides a bridge between the “desktop” relational computer and embodied life
  via phones and wearables.
