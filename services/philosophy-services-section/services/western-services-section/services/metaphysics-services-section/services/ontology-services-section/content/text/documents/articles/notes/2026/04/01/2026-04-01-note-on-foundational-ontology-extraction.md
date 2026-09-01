---
title: Foundational Ontology Extraction
description: Describes the editorial task of extracting foundational ontological primitives from relationality-specific mathematics into a shared library for cross-domain reference.
date-created: 2026-04-01
type: note
name: foundational-ontology-extraction
keywords:
  - ontological-primitives
  - extraction
  - relationality
  - foundational-terms
  - editorial
specialization: plan
date-completed: 2026-04-03
department: engineering
cross-cuts: [science]
project: generative-harness
serves: input-as-thing
depends-on: foundational-ontology-research
---

The four ontological primitives — Object, Quality, Relation, Action — are currently entangled with relationality-specific math in `library/theories/science/theories/relationality/`. They are more foundational than any single domain. They belong at `library/terms/` where every domain can reference them.

Once extracted, the work domain (`library/theories/humanities/theories/sociology/theories/work/`) can say what it means: work is a restricted form of action on objects, qualified by properties, connected by relations. Object = Set, Action = Function — already computable.

Each extraction task is editorial: read the existing relationality content, extract the general concept grounded in real disciplines, write a clean term at `library/terms/`, leave the relationality math in place with a reference to the new foundational term.
