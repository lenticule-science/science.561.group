---
title: Metaphor & Figurative Language
layer: spec
keywords:
  - linguistics
  - metaphor
part-of: relational-computer
description: "Treats metaphors and figurative devices as recognitions so the system sees how domains map onto each other."
---

Treat metaphors and other figurative devices as recognitions so the system can
see how domains are mapped onto each other.

## 1. Core recognitions

- `ConceptualMetaphorRecognition`
  - mappings like ARGUMENT IS WAR, DISEASE IS INVASION, ECONOMY IS WEATHER.
  - fields: source/target domains, typical linguistic realizations.

- `MetaphorInstanceRecognition`
  - a specific use in text/speech.
  - links to tokens, frames, and domains invoked.

- `FigurativeDeviceRecognition`
  - simile, metonymy, synecdoche, personification, etc.

## 2. Topology and measurement

- Topology:
  - networks of metaphors connecting domains (health, ecology, politics,
    finance).

- Measurement:
  - which metaphors dominate a topic,
  - shifts in metaphor usage over time (e.g., from WAR to CARE framing).

## 3. Runbooks and uses

- `annotate_metaphors(text_slice)`,
- `summarize_metaphor_landscape(domain_slice)`,
- `guide_agent_metaphor_choice(goal, ethics)`.

This supports critical reading, agent voice design, and cross-domain mapping.
