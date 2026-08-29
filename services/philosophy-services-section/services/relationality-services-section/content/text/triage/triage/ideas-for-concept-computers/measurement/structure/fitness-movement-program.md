---
title: Fitness and Movement Program
kind: structure
layer: program
status: someday
derived_from:
- computer/structure/computer-kernel
uses:
- system/structure/recognition-carrier
- system/structure/trace-carrier
produces: []
---
# Fitness and Movement Program

This program represents movement as recognitions so patterns, training blocks,
and recovery can be reasoned about.

## Behaviour

- Capture activities (walks, workouts, chores), plans/programs, and locations
  as recognitions with provenance.
- Measure duration, intensity, heart rate, perceived exertion, and recovery to
  understand load and adaptation.
- Link activities to locations and goals (e.g., training for a hike) for
  contextual planning.

## Intended operators

- Plan sessions, log activities, and review training blocks with trace.
- Analyse trends in load and recovery to adjust plans.
- Surface routes or venues that fit current goals and constraints.

## Proof
- Derived from: [Computer Kernel](../../../computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the described behaviour without extending machine semantics.
