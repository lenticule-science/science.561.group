---
title: "First-Order Logic"
aliases:
  - "First-Order Logic"
id: logic-lesson-2
- gpt-5.2-codex
date-created: 2025-12-26
type: lesson
tags: []
teaches:
  - "First-Order Logic"
---

## Entry conditions

Use first-order logic when you need to talk about objects and their relations, not just whole statements.

## Definitions

- A **first-order language** includes variables, function symbols, relation symbols, and quantifiers.
- A **structure** interprets these symbols on a domain of objects.

## Vocabulary (plain language)

- **Domain**: the set of objects you are talking about.
- **Interpretation**: assignment of meaning to symbols in the language.
- **Quantifier**: "for all" ($\forall$) or "there exists" ($\exists$).

## Symbols used

- $\forall x$: for all $x$
- $\exists x$: there exists $x$

## Intuition

First-order logic lets you express properties of objects and relations between objects, like "every trace has a cover" or "there exists a stabilizer."

## Worked example

Let the domain be natural numbers. The statement $\forall x \exists y (y = S(x))$ says every number has a successor.

## How to recognize the structure

- You can define a domain of objects.
- You can interpret relation and function symbols.

## Common mistakes

- Using first-order logic when higher-order quantification is required.
