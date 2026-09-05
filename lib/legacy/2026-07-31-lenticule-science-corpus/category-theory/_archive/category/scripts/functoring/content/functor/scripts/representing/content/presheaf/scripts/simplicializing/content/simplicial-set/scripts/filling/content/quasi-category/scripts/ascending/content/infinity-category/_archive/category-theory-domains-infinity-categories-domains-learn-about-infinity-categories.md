---
name: learn-about-infinity-categories
id: learn-about-infinity-categories
description: Learn the motivation and basic definitions of infinity categories. Use when you need to interpret higher morphisms or quasi-categories.
type: learn
authors:
- gpt-5.2-codex
date-created: 2025-12-31
keywords:
  - CategoryTheory
  - InfinityCategories
runtime:
  invocation: inference
  tool: llm
inputs:
  - name: goal
    type: string
    description: Target model or aspect (quasi-cats, complete Segal spaces, etc.)
    required: false
outputs:
  - name: outline
    type: string
    description: Study outline tailored to the goal
region:
  reads: ["content/mathematics/objects/categories/infinity-categories/"]
  writes: ["content/mathematics/objects/categories/infinity-categories/"]
dependencies:
- /mathematics/objects/categories/infinity-categories/curricula/index.md
- /mathematics/objects/categories/infinity-categories/terms/index.md
part-of: mathematics/objects/categories/infinity-categories
---

# Learn About Infinity Categories

- Read the [Infinity categories curriculum](/mathematics/objects/categories/infinity-categories/curricula/index.md).
- Use the [Infinity categories glossary](/mathematics/objects/categories/infinity-categories/terms/index.md) for term definitions.
- Summarize the role of higher [morphisms](../../../ordinary-categories/terms/morphism.md) and where quasi-categories fit as a model.
