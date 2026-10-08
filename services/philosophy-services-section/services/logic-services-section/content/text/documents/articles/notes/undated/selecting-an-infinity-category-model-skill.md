---
name: selecting-an-infinity-category-model
description: Compares common infinity-category models and selects one for a given task, recording the model and the reason it fits. Use when a project requires choosing a specific higher-categorical framework.
title: selecting-an-infinity-category-model
---

## Requirements

- A description of the task or problem requiring an infinity-category model.
- Familiarity with infinity-categories (see `learn-infinity-categories`).

## Steps

1. Identify the task's constraints: does it need explicit combinatorics (quasi-categories), algebraic structure (complete Segal spaces), strict models (relative categories), or Lean formalization compatibility (Mathlib conventions)?
2. Compare the leading models against those constraints: quasi-categories (good for general homotopy theory), complete Segal spaces (good for model-category arguments), simplicial categories (good for explicit enrichment).
3. Select the model that best fits. If no single model dominates, prefer quasi-categories as the default (widest Mathlib support).
4. Record the selected model and the reason in the project's decision log using `record-decision`.

## Outcomes

- A selected infinity-category model with a written rationale.
- A decision record exists in the project log.
