---
title: Calendar & Tasks Program
id: calendar-tasks-program
role: structure
status: someday
derived_from:
- computer/type/documentation-interpreter
proof_refs: []
---



Program idea to manage calendars, tasks, and habits within the relational
computer.

## Behaviour
- Recognitions:
  - `EventRecognition`: start/end, location, participants, related projects.
  - `TaskRecognition`: description, due date, status, estimated effort.
  - `HabitRecognition`: recurring actions with desired frequency and
    measurement channels.
- Topology/measurement:
  - events/tasks linked to projects, people, locations, resources.
  - measurements: time spent, completion rates, context switching, daily/weekly
    load.
- Runbooks/views:
  - plan week, rebalance tasks, negotiate conflicts, schedule focus time.
  - calendar as time projection; kanban as status projection; “life load”
    charts from measurement channels.

## Proof
- Derived from: [Documentation Interpreter](../../../computer/type/documentation-interpreter.md).
- Shows that: this program instantiates the documentation interpreter to realise the described behaviour without extending machine semantics.

