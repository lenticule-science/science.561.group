---
name: check-enrichment-data
id: check-enrichment-data
description: Verify that proposed hom-objects and composition maps satisfy enriched
  category axioms. Use when validating an enriched category definition.
type: learn
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
  - name: base
    type: string
    description: Base monoidal category of enrichment
    required: false
  - name: hom_objects
    type: object
    description: Proposed hom-objects/composition/unit data
    required: false
outputs:
  - name: validation
    type: string
    description: Which axioms hold or fail
region:
  reads: ["content/mathematics/objects/categories/enriched-categories/"]
  writes: ["content/mathematics/objects/categories/enriched-categories/"]
dependencies:
- /mathematics/objects/categories/enriched-categories/curricula/enriched-categories.md
- /mathematics/objects/categories/enriched-categories/terms/index.md
part-of: mathematics/objects/categories/enriched-categories
---

# Check Enrichment Data

- Identify the base monoidal category and its tensor unit.
- List the hom-objects `V(x, y)` for all object pairs.
- Check that the composition maps land in the correct hom-objects.
- Verify associativity and unit coherence using the base monoidal constraints.
- Record any missing data or violated axioms.
