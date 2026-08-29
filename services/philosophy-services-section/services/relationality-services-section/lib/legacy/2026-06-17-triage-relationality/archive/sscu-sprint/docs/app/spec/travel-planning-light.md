---
title: Travel Planning (Lightweight)
keywords:
  - idea
  - travel
part-of: relational-computer
description: "Keeps simple trips organized as recognitions with bookings and packing lists."
---
# Idea: Travel Planning (Lightweight)

Keep simple trips organized as recognitions.

## 1. Recognitions

- `TripRecognition`: destination, dates, purpose.
- `BookingRecognition`: flights, trains, stays, tickets.
- `PackingListRecognition`: items to bring per trip type.

## 2. Measurement and topology

- Topology:
  - trips ↔ people, projects, notes.
- Measurement:
  - cost, travel time, subjective stress/joy.

Runbooks: `plan_trip`, `generate_packing_list`, `debrief_trip`.

