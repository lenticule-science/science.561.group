---
title: City Infrastructure & Transit
keywords:
  - idea
  - city
  - transit
part-of: relational-computer
description: "Models roads, transit, utilities, and flows as recognitions for planning and analysis."
---
# Idea: City Infrastructure & Transit

Model roads, transit, utilities, and flows as recognitions for planning and
analysis.

## 1. Recognitions

- `RoadSegmentRecognition`, `TransitLineRecognition`, `StopRecognition`.
- `ScheduleRecognition`: planned service.
- `IncidentRecognition`: outages, accidents, construction.
- `FlowRecognition`: observed flows (traffic counts, ridership).

## 2. Topology and measurement

- Topology:
  - network graphs (roads, lines), interchanges, zones.
- Measurement:
  - congestion, reliability, access time, emissions.

Runbooks for `plan_route`, `simulate_disruption`, `schedule_maintenance`
support both analytics and potential in-game city simulations.

