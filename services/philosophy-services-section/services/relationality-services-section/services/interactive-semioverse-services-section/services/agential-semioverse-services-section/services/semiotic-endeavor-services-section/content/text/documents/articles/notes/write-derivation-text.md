---
description: Write a text documenting how a source domain or practice contributes to the semiotic-endeavor theory, following the derivation text pattern
id: write-derivation-text
name: write-derivation-text
version: [0, 1]
type: operational
runtime: inference
triggers:
  - "write derivation text"
  - "document derivation"
  - "trace what X contributes"
  - "how does X influence the endeavor"
inputs:
  source: string
  target: string?
  derivation_type: string?
outputs:
  path: string
region:
  reads:
    - "content/technology/specifications/semiotic-endeavor/"
    - "content/technology/specifications/agential-semioverse-repository/plans/decisions/"
  writes:
    - "content/technology/specifications/semiotic-endeavor/texts/"
dependencies:
  - find-thing
scopes: []
part-of: technology/specifications/semiotic-endeavor
follows-policies: [3, 4, 6, 8]
---
Write derivation text for: $ARGUMENTS

## Instructions

### 1. Identify the derivation

Determine:

- **Source**: what domain, practice, or tradition contributes?
- **Target**: what part of the endeavor receives the contribution?
  (Default: semiotic-endeavor itself)
- **Derivation type**: what kind of contribution?
  - `domain` — method substance (what the endeavor's method contains).
    The domain derivation chain is decision 0007.
  - `practice` — implementation substrate (how to build it).
    Example: MUD heritage.
  - `procedural` — design patterns (how to handle exceptions,
    failures, boundaries). Example: Starfleet.
  - `formal` — mathematical tools or structures.
    Example: category theory, Heyting algebras.

### 2. Research the source

Read existing content about the source. If source material exists
in triage or published content, use it. If external research is
needed, produce texts first (policy 006).

For each major concept the source contributes, identify:
- What the concept is in its original context
- What it contributes to the target (abstracted, discipline-neutral)
- How it maps to existing endeavor vocabulary

### 3. Write the text

Create the file at:
```
technology/specifications/semiotic-endeavor/texts/{source}-as-{type}-derivation.md
```

Frontmatter:
```yaml
---
title: "{Source} as {type} derivation source"
date-created: {today ISO 8601}
authors:
  - {who identified the derivation}
  - claude
type: text
tags:
  - SemioticEndeavor
  - Derivation
  - {SourceTag}
  - {TypeTag}
description: "Documents {source} as a {type} derivation source for {target}."
---
```

Body structure:
1. **Opening paragraph**: state what the source is, what kind of
   derivation it provides, and how it relates to other derivation
   sources (domain chain, practice substrate, etc.)
2. **What {source} contributes**: one subsection per major concept.
   Each subsection: what it is in the source → what it maps to in
   the endeavor.
3. **Relationship to other derivation sources**: how this source
   complements or contrasts with others. Use a comparison table.

### 4. Update related texts

- If a cross-domain derivation text exists, add a reference to the
  new source.
- If a gap analysis exists, check whether the new source addresses
  any listed gaps.
- If the source connects to the conceptual dependency map, add a
  `derives-from` edge.

### 5. Report

State the path created and what concepts were documented.

## Anti-slop checklist

- Each concept is written in the target's vocabulary, not the
  source's jargon
- The text says what the source contributes, not what the source IS
  (that's for its own discipline directory)
- The derivation type is explicit and consistent with decision 0007
- The relationship table at the end distinguishes this source from
  others
