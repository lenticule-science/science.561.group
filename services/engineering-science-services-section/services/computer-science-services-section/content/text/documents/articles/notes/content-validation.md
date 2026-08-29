---
title: "Content Validation in an ASR"
date-created: 2026-03-05T00:00:00
authors:
  - emsenn
type: text
keywords:
  - ContentValidation
  - SHACL
  - Frontmatter
description: "How the ASR validates content frontmatter, typed relations, and cross-domain dependencies."
---

# Content Validation in an ASR

Content validation checks that every file in the repository conforms to the structural and semantic rules of its domain. It catches broken links, missing required fields, invalid relation values, and type mismatches before they become invisible corruption.

## What validation checks

### Frontmatter schema

Every content type has required and optional fields. A term requires `title`, `type: term`, `description`, and `tags`. A lesson requires `title`, `type: lesson`, `teaches`, and `requires`. The validator checks that fields exist, have the right YAML type, and use values from the allowed vocabulary.

### Typed relations

Relation fields such as `defines`, `requires`, `extends`, `cites`, and `part-of` have domain and range constraints. A page can `defines` a term, but a term cannot `teaches` a lesson. The validator catches relation pairs that do not make semantic sense.

### Link resolution

Every wikilink and Markdown link must resolve to an existing file. The validator walks all links, follows relative paths, and reports any target that does not exist. This catches files moved without updating their references, renamed terms with stale backlinks, and deleted pages still cited by other content.

### Domain rules

Each domain can add its own validation rules. Mathematical content validates theorem/proof relationships. Philosophical content validates claim/argument/objection structures. Educational content validates curriculum prerequisites. These rules are expressed as SHACL shapes and applied after the base schema checks.

## Validation levels

Validation runs at three levels:

1. **Syntax**: Is the YAML valid? Are required fields present? Do links parse?
2. **Structure**: Do types and relations conform to the domain schema? Are references valid?
3. **Semantics**: Do domain-specific constraints hold? Does a proof cite a theorem? Does a lesson's `requires` chain form a directed acyclic graph?

The first two levels are fast and run on every commit. The third level may require generating RDF or evaluating constraints across many files, so it runs in CI and on explicit request.

## Cycle detection

The validator detects cycles in `requires:` chains. A lesson that requires itself indirectly creates an impossible prerequisite loop. The cycle detector uses depth-first search with a visited set and reports the full cycle path:

```
lesson-a → lesson-b → term-c → lesson-a
```

The broader scoping rule (no symbol conflicts within a page's `requires:` chain) requires walking the same dependency graph. Each page has a `symbols` field listing the symbols it defines; the validator collects symbols along every transitive dependency path and reports duplicates.

## Tools

The repository has two complementary validation tools:

1. **validate-content** (the [script](../../../../../lib/legacy/2026-08-17-emsenn-google-drive-library-artifacts/relationality/domains/universes/semiotic-universe/domains/interactive-semioverse/domains/agential-semioverse/domains/computing/agential-semioverse-repository/scripts/validate-content.py)): validates frontmatter against domain spec rules at scale. Fast, no prerequisites, checks hundreds of files in seconds. Good for broad sweeps after bulk operations.

2. **validate-thing** (the [skill](./validate-thing.md)): validates a single thing against its SHACL shapes. Deeper and more formal, but requires RDF generation first. Good for verifying one item in detail.

The difference reflects a design principle: validation should be available at multiple levels of formality. Frontmatter validation is fast and lightweight. SHACL validation is thorough and formal. Neither replaces the other.

## Cross-domain requires

A page can declare `requires:` entries that cross domain boundaries. A philosophical term like [tautology](../../../../../../../../philosophy-services-section/services/western-services-section/services/logic-services-section/services/classical-services-section/content/text/glossary/terms/tautology.md) requires the mathematical definition of [formula](../../../mathematics/disciplines/logic/terms/formula.md). The validator checks that these cross-domain paths resolve regardless of which domain the source page belongs to.

This is how the ASR supports pages that participate in multiple domains: each `requires:` link is validated independently, and the domain-specific rules apply based on the page's own `type:`, not on where its dependencies live.
