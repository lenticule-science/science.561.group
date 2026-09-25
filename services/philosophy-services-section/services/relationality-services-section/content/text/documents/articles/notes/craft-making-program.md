---
title: Craft & Making Program
id: craft-making-program
role: structure
status: someday
proof_refs: []
derives-from:
  - computer/type/documentation-interpreter
description: Program idea to model making processes (cooking, woodworking, etc.) as recognitions for reproducibility and cross-domain links.
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
- Derived from: [Documentation Interpreter](./documentation-interpreter.md).
- Shows that: this program instantiates the documentation interpreter to realise the described behaviour without extending machine semantics.

## Earlier material

## Proof
- Derived from: [Documentation Interpreter](documentation-interpreter.md).
- Shows that: this program instantiates the documentation interpreter to realise the described behaviour without extending machine semantics.
