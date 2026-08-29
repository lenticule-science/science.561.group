---
title: Calendar, Tasks, and Life Planning
keywords:
  - idea
  - calendar
  - tasks
part-of: relational-computer
description: "Models events, tasks, and habits as recognitions to track commitments and load relationally."
---
# Idea: Calendar, Tasks, and Life Planning

Model events, tasks, and habits as recognitions to track commitments and load
relationally.

## 1. Core recognitions

- `EventRecognition`
  - start/end, location, participants, related projects.
- `TaskRecognition`
  - description, due date, status, estimated effort.
- `HabitRecognition`
  - recurring actions with desired frequency and measurement channels.

## 2. Topology and measurement

- Topology:
  - events/tasks linked to projects, people, locations, and resources.
- Measurement:
  - time spent, completion rates, context switching, “load” on each day/week.

## 3. Runbooks and views

- Runbooks:
  - plan week, rebalance tasks, negotiate conflicts, schedule focus time.
- Views:
  - calendar is a projection over time topology,
  - kanban is a projection over task status,
  - “life load” charts draw from measurement channels.

