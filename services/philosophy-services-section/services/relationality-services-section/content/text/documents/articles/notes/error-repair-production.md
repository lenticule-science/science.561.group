---
title: Error & Repair in Language Production
status: someday
keywords:
  - idea
  - linguistics
  - repair
description: Model slips and repairs in speech/writing to see how difficulty, sensitivity, and complexity show up.
---
# Idea: Error & Repair in Language Production

Model slips and repairs in speech/writing to see how difficulty, sensitivity,
and complexity show up.

## 1. Core recognitions

- `SlipRecognition`
  - speech/writing errors (mispronunciations, wrong word, typos) with context.

- `SelfRepairRecognition`
  - when the speaker/writer corrects themselves.

- `OtherRepairRecognition`
  - when another party corrects or clarifies.

- `RepairEpisodeRecognition`
  - a small sequence where something goes wrong and is fixed (or not).

## 2. Measurement and topology

- Measurement:
  - frequency and location of repairs (per topic, per interlocutor, per state),
  - association with affect (anxiety, excitement) or topic sensitivity.

- Topology:
  - links between repair episodes and subjects/topics, people, or contexts.

## 3. Runbooks and uses

- `annotate_repairs(conversation_slice)`,
- `analyze_repair_patterns(subject_slice)`,
- `help_agent_be_gentle_in_repairs(style_profile)`.

This gives the system a way to see where language work is hard and how people
care for each other in communication.
