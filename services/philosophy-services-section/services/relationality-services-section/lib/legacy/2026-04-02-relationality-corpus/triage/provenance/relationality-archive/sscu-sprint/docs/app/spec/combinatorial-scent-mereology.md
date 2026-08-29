---
name: combinatorial-scent-mereology
keywords:
  - idea
  - scent
  - mereology
  - sensory
part-of: relational-computer
description: "Models smells as combinatorial wholes built from parts so olfactory experience and perfumery live in the relational universe."
---

Model smells as combinatorial wholes built from parts, so olfactory experience
and perfumery can live in the relational universe with explicit part–whole
structure.

## 1. Core recognitions

- `OdorantRecognition`
  - basic odorants or notes (jasmine, smoke, ozone, petrichor, etc.).
  - fields: descriptors, intensity ranges, volatility, associations.

- `ScentComponentRecognition`
  - intermediate “accords” or blends used as building blocks.
  - links to `OdorantRecognition` with weights and interaction notes.

- `ScentWholeRecognition`
  - a perceived whole scent (a perfume, a room smell, a forest after rain).
  - fields: context (place, time, weather), source(s), subjective descriptors.

- `PartWholeRelationRecognition`
  - explicit mereological links:
    - which odorants/components are parts of which wholes,
    - how parts contribute (foreground, background, lingering base).

## 2. Measurement and topology

- Measurement:
  - intensity over time (evaporation curves),
  - perceived dimensions (fresh–stale, sweet–bitter, clean–dirty, etc.),
  - association metrics (memories, moods, domains).

- Topology:
  - scent-space neighborhoods (similar wholes),
  - graphs from odorants → components → wholes,
  - cross-links to other recognitions (places, events, foods, emotions).

## 3. Runbooks and uses

- `decompose_scent(whole_id)`: infer likely components/odorants from a whole.
- `compose_scent(target_profile)`: propose combinations of odorants/components
  to approximate a desired profile.
- `trace_scent_associations(whole_id)`: explore links between a scent, memories,
  moods, and paracosms/MUD locations.

This gives you a way to treat smell as a structured, combinatorial phenomenon,
not an afterthought—another sensory dimension woven into your relational
manifold.

