---
title: Combinatorial Scent Mereology Program
id: combinatorial-scent-mereology-program
role: structure
status: someday
proof_refs: []
derives-from:
  - computer/type/documentation-interpreter
description: Exploratory program to model combinatorial scent/mereology concepts as recognitions so olfactory experience and perfumery can live in the relational universe with explicit part–whole structure.
---



Exploratory program to model combinatorial scent/mereology concepts as
recognitions so olfactory experience and perfumery can live in the relational
universe with explicit part–whole structure.

## Canonical CSM evidence records

The surviving machine-readable CSM research sources are maintained **once** in the [Neuroscience olfactory corpus](https://github.com/lenticule-science/science-services-section/tree/main/services/natural-science-services-section/services/biological-science-services-section/services/neuroscience-services-section/data/records/combinatorial-scent-mereology). Benchmark-source rights, perceptual evidence, assay contracts, vendor-source observations, proposed scene IR and service contracts retain their **distinct** claim types; they are not automatically proved, accredited or implemented by being present in this Science corpus.

On October 15, 2026, the ten byte-identical copies formerly in this Relationality directory and in Chemistry were retired from active Git paths after exact blob comparison. They remain recoverable from the Git ancestry; readers of this relationality program and of chemical materials should reference the canonical files rather than copy or edit local analogues. The neuroscience/chemistry/relationality disciplines remain distinct—only duplicate file storage is retired. New executable parsing, validation or manufacturing belongs with its actual Red Cup owner rather than under any of these Science record paths.

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
- Derived from: [Documentation Interpreter](./documentation-interpreter.md).
- Shows that: this program instantiates the documentation interpreter to realise the described behaviour without extending machine semantics.
