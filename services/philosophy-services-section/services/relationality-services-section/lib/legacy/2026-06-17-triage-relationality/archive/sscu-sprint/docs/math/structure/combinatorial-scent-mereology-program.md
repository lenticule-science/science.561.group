---
title: Combinatorial Scent Mereology Program
role: structure
derived_from:
- computer/type/documentation-interpreter
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Exploratory program to model combinatorial scent/mereology concepts as
recognitions so olfactory experience and perfumery can live in the relational
universe with explicit part–whole structure.

## Behaviour
- Represent odour/accord/whole scents as recognitions with explicit
  part–whole links:
  - `OdorantRecognition`: basic notes (descriptors, intensity ranges,
    volatility, associations).
  - `ScentComponentRecognition`: intermediate accords/blends linked to
    odorants with weights/interaction notes.
  - `ScentWholeRecognition`: perceived whole scent with context (place, time,
    weather), sources, subjective descriptors.
  - `PartWholeRelationRecognition`: mereological links (part contributions:
    foreground/background/base).
- Measurement/topology:
  - intensity over time (evaporation curves), perceptual dimensions
    (fresh–stale, sweet–bitter, clean–dirty), association metrics (memories,
    moods).
  - scent-space neighbourhoods; graphs odorants→components→wholes; cross-links
    to places/events/foods/emotions.
- Runbooks/use cases:
  - `decompose_scent(whole_id)`: infer likely components/odorants from a whole.
  - `compose_scent(target_profile)`: propose combinations to approximate a
    desired profile.
  - `trace_scent_associations(whole_id)`: explore links between a scent,
    memories, moods, and paracosms/MUD locations.

## Invariants
- Uses only earned recognitions; no new semantics beyond kernel.
- Part–whole relations and measurements are traceable and auditable.

## Proof
- Derived from: [Documentation Interpreter](../../../computer/type/documentation-interpreter.md).
- Shows that: this program instantiates the documentation interpreter to realise the described behaviour without extending machine semantics.

