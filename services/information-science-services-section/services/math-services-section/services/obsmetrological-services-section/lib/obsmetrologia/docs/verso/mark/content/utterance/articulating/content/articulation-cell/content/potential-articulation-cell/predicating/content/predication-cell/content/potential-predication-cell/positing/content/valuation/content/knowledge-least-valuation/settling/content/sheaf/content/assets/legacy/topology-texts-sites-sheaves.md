---
title: "Sites"
aliases:
  - "Sites"
id: sheaf-theory-lesson-1
- gpt-5.2-codex
date-created: 2025-12-26
type: lesson
tags: []
teaches:
  - "Sites"
---

## Entry conditions

Use sites only when you can:

- Define a category of contexts or observations.
- Define what it means for a family of [morphisms](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/morphism.md) to "cover" an object.
- State what it means for local pieces to cover a whole.

If there is no notion of coverage, a site is not appropriate.

## Definitions

- A **site** is a category $C$ equipped with a Grothendieck topology $J$.

## Vocabulary (plain language)

- **Site**: a collection of objects and arrows plus a rule for which arrows count as covers.
- **Cover**: a family of arrows that are declared to give local pieces of an object.
## Symbols used

- $C$: a category.
- $J$: a Grothendieck topology on $C$.
- $U_i \to U$: a cover family with arrows into $U$.

## Intuition

A site formalizes "local pieces" and how they cover a whole.

If you only have a list of objects but no meaningful notion of coverage, then a site is the wrong tool.

## What the axioms mean

- **Covering**: a family of [morphisms](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/morphism.md) $\{U_i \to U\}$ is declared to cover $U$ if the $U_i$ jointly provide the local pieces of $U$.

## Worked examples

### Example 1: Open sets

Let $C$ be the category of open sets of a topological space, with inclusions as [morphisms](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/morphism.md). A cover is the usual open cover.

### Example 2: Contexts as traces

If objects are observational contexts and [morphisms](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/morphism.md) are refinements, then a cover says which refinements are enough to reconstruct the original context.

## How to recognize the structure

- Can you say when a family of [morphisms](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/morphism.md) covers an object?
## Common mistakes

- Declaring a topology without checking the Grothendieck axioms.
- Treating any family of maps as a cover without justification.

## Minimal data

- A category $C$.
- A topology $J$ that specifies covering families for each object.

## Misuse warnings

- Do not use sites when coverage is only metaphorical.
