---
title: Craft & Making Program
role: structure
derived_from:
- computer/type/documentation-interpreter
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Program idea to model making processes (cooking, woodworking, etc.) as
recognitions for reproducibility and cross-domain links.

## Behaviour
- Recognitions:
  - `RecipeRecognition` / `BuildPlanRecognition`: steps, materials, parameters.
  - `RunRecognition`: specific execution of a recipe/build.
  - `MaterialRecognition`: ingredients, lumber, hardware, tools.
  - `OutcomeRecognition`: result with quality notes/photos.
- Measurement/runbooks:
  - measurements: time, cost, success/failure, sensory ratings, durability.
  - runbooks: `plan_build`, `execute_build`, `review_build` (and cooking analogues).

## Proof
- Derived from: [Documentation Interpreter](../../../computer/type/documentation-interpreter.md).
- Shows that: this program instantiates the documentation interpreter to realise the described behaviour without extending machine semantics.

