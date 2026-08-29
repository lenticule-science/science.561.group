---
name: learn-about-enriched-categories
id: learn-about-enriched-categories
description: Learn how enriched categories generalize ordinary categories using
  monoidal bases. Use when you need to interpret hom-objects and enriched composition.
type: guide
article-kind: learn
authors:
- gpt-5.2-codex
date-created: 2025-12-31
keywords:
  - CategoryTheory
  - EnrichedCategories
runtime:
  invocation: inference
  tool: llm
inputs:
  - name: base_monoidal_category
    type: string
    description: Base of enrichment (e.g., V)
    required: false
  - name: goal
    type: string
    description: Topic to cover (data, examples, coherence)
    required: false
outputs:
  - name: outline
    type: string
    description: Study outline tailored to the goal
region:
  reads: ["content/mathematics/objects/categories/enriched-categories/"]
  writes: ["content/mathematics/objects/categories/enriched-categories/"]
dependencies:
- /mathematics/objects/categories/enriched-categories/curricula/index.md
- /mathematics/objects/categories/enriched-categories/terms/index.md
part-of: mathematics/objects/categories/enriched-categories
---

# Learn About Enriched Categories

- Read the [Enriched categories curriculum](/mathematics/objects/categories/enriched-categories/curricula/index.md).
- Use the [Enriched categories glossary](/mathematics/objects/categories/enriched-categories/terms/index.md) for term definitions.
- Write the data of an enriched category in the form of hom-objects, composition, and units.
