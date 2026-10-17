---
title: "Content Validation in an ASR"
date-created: 2026-03-05T00:00:00
type: lesson
authors:
  - claude-opus-4-6
status: draft
teaches:
  - "content validation"
  - "MUST vs SHOULD rules"
  - "cross-domain requires"
requires:
  - frontmatter
  - typed relations
keywords:
  - agential-semioverse
  - repository
description: This lesson explains how content validation works in an Agential Semioverse Repository.
---

This lesson explains how content validation works in an [Agential Semioverse Repository](../index.md). After completing it, you should understand what the validator checks, why the checks are structured as they are, and how to interpret and act on results.

## What validation checks

Validation operates at three levels:

### General rules (all content)

Every page in the repository must have `title:` and `date-created:` in its frontmatter. These are not domain-specific — they are structural requirements for any page to be a well-formed thing in the ASR.

When a page declares `requires:` or `extends:`, each path-like entry must resolve to an actual file. A `requires:` entry that points to nothing is a broken dependency. The validator also catches self-references (a page requiring itself).

Non-path entries in `requires:` (like conceptual prerequisites: `"group theory"`, `"frontmatter"`) are treated as informational. They signal what a reader should know, not what files must exist.

### Domain-specific rules (mathematical and philosophical content)

Each domain-specific ASR spec defines validity requirements for its content types. These come in three strengths:

- **MUST**: constitutive. A violation means the content is ill-formed or mistyped. A definition without `defines:` is not a definition. An objection without `targets:` is not an objection.
- **MUST NOT**: constitutive in the negative. An axiom with `proven-by:` contradicts what an axiom is. A conjecture with `proven-by:` should be reclassified as a theorem.
- **SHOULD**: recommended but not constitutive. A definition without `notation:` is valid but could be improved. A claim without `argued-by:` is an assertion — weaker, but not ill-formed.

The validator reports MUST violations as errors and SHOULD gaps as warnings.

### Notation scoping (mathematical content)

Mathematical pages may declare `notation:` — symbolic representations of the objects they define. Within a single page, each symbol must denote at most one thing. Duplicate symbols in the same page are an error.

The broader scoping rule (no symbol conflicts within a page's `requires:` chain) is documented in the [mathematical ASR spec](../../../mathematics/specifications/mathematical-agential-semioverse-repository/index.md) but not yet enforced by the validator, because it requires traversing the dependency graph. This is a known gap.

## Why two validation tools

The repository has two complementary validation tools:

1. **validate-content** (the [script](../scripts/validate-content.py)): validates frontmatter against domain spec rules at scale. Fast, no prerequisites, checks hundreds of files in seconds. Good for broad sweeps after bulk operations.

2. **validate-thing** (the [skill](../skills/validate-thing/SKILL.md)): validates a single thing against its SHACL shapes. Deeper and more formal, but requires RDF generation first. Good for verifying one item in detail.

The difference reflects a design principle: validation should be available at multiple levels of formality. Frontmatter validation is fast and lightweight. SHACL validation is thorough and formal. Neither replaces the other.

## Cross-domain requires

A page can declare `requires:` entries that cross domain boundaries. A philosophical term like [tautology](../../../../../../../../philosophy-services-section/content/text/glossary/terms/tautology.md) requires the mathematical definition of [formula](../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/formula.md). The validator checks that these cross-domain paths resolve regardless of which domain the source page belongs to.

This is how the ASR supports pages that participate in multiple domains: each `requires:` link is validated independently, and the domain-specific rules apply based on the page's own `type:`, not on where its dependencies live.

## Check for understanding

Given a file with this frontmatter:
```yaml
type: definition
defines: []
requires:
  - ./nonexistent.md
```

1. How many errors will the validator report? (Two: `defines:` is empty — MUST violation; `requires:` path does not resolve.)
2. What severity are they? (Both are errors, not warnings.)
3. What should be done? (Add at least one entry to `defines:`, fix or remove the broken path.)

Given a file with:
```yaml
type: axiom
proven-by:
  - ./proof.md
```

1. What error does this produce? (`axiom MUST NOT have proven-by:`)
2. What should be done? (Either remove `proven-by:` if this is genuinely an axiom, or reclassify as `theorem` if it has been proven.)

## Key takeaway

Validation makes the rules in the domain specs executable. The specs say what MUST and SHOULD be true; the validator checks whether it is. This closes the loop between specification and implementation — the specs are not just documentation, they are enforced constraints.
