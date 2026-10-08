---
title: Construction Grammar Program
id: construction-grammar-program
role: structure
status: someday
proof_refs: []
derives-from:
  - computer/type/documentation-interpreter
description: Program idea to model construction grammar patterns as recognitions with explicit form–meaning pairings.
---



Program idea to model construction grammar patterns as recognitions with explicit
form–meaning pairings.

## Behaviour
- Recognitions:
  - `ConstructionRecognition`: schematic patterns (template + semantic/function).
  - `ConstructionInstanceRecognition`: specific use in an utterance linked to
    tokens/syntax/frames.
- Topology/measurement:
  - networks of constructions per language/sociolect; links to stance/affect.
  - measurements: construction usage across domains; correlation with outcomes
    (persuasion/confusion/rapport).
- Runbooks:
  - `annotate_constructions(text_slice)`,
  - `analyze_construction_usage(subject_slice)`,
  - `generate_with_construction(agent_id, construction_id)`.

## Proof
- Derived from: [Documentation Interpreter](../../../../../../../../content/text/documents/articles/notes/documentation-interpreter.md).
- Shows that: this program instantiates the documentation interpreter to realise the described behaviour without extending machine semantics.

