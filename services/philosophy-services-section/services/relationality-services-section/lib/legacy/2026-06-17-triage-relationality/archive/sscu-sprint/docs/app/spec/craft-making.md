---
title: Craft & Making (Cooking, Woodworking, etc.)
keywords:
  - idea
  - craft
  - making
part-of: relational-computer
description: "Models making processes as recognitions so recipes and builds are reproducible and relatable across domains."
---
# Idea: Craft & Making (Cooking, Woodworking, etc.)

Model making processes as recognitions so recipes/builds are reproducible and
relatable across domains.

## 1. Recognitions

- `RecipeRecognition` / `BuildPlanRecognition`: step lists, materials,
  parameters.
- `RunRecognition`: a specific execution of a recipe or build.
- `MaterialRecognition`: ingredients, lumber, hardware, tools.
- `OutcomeRecognition`: the result, with quality notes and photos.

## 2. Measurement and runbooks

- Measurement:
  - time, cost, success/failure, sensory ratings, durability.
- Runbooks:
  - `plan_build`, `execute_build`, `review_build`; same pattern for cooking.

Craft becomes another space where you can apply relational diagnostics and
interventions.

