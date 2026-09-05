---
title: Program Transformation
contains:
  - generative-programming
  - model-driven-engineering
  - model-driven-reverse-engineering
  - bidirectional-transformation
  - large-scale-change
  - codemod
  - interface-definition-language
  - pretty-printer
  - developer-productivity-engineering
  - architecture-conformance-checking
  - hoare-program
  - informational-programming-paradigm
---

Program transformation is the study of programs, models, and code as data that other programs read, derive, check, and rewrite, rather than as prose an engineer alone authors and edits by hand. It gathers the vocabulary for that study: a specification from which a family of programs is generated (generative programming) rather than framework-instantiated; a model conforming to a declared metamodel from which code and documents are derived (model-driven engineering), together with its inverse, recovering such a model from existing code (model-driven reverse engineering); the coupled forward/backward pair and its round-trip laws that keep a derived view and its source consistent (bidirectional transformation); the tooling class that rewrites a parsed syntax tree by a mechanical rule (codemod) and the organizational practice of applying one rule across a whole codebase in reviewed, reversible batches (large-scale change); the contract-first schema from which server code, client code, and documentation are all generated (interface definition language); the function that projects a canonical textual layout from a parsed tree (pretty-printer); and the automated check of a codebase's actual dependency structure against its declared architecture (architecture conformance checking). Developer productivity engineering is the professional office that owns and runs this machinery as a codebase's own infrastructure.

It sits under computer science, not computer-code engineering, because what unifies these terms is a claim about programs as mathematical and structural objects — what a specification, a model, a transformation, and a conformance relation are, and what laws (GetPut/PutGet, generator totality over a feature space) they must satisfy — independent of any one toolchain that realizes them. The org's own practice of this theory, the fabrication line that reads a work order into a generator and projects every artifact from one specification, is the engineering-side realization these terms describe from the outside: `hoare-program` names the atomic process shape a generated script must have, and `informational-programming-paradigm` names the typed-term discipline the generator itself is built on, both admitted here as the theory this program's practice sits over.
