---
title: "Infinity-Categories"
aliases:
  - "Infinity-Categories"
date-created: 2025-12-26
tags: []
teaches:
  - "Infinity-Categories"
id: higher-topos-theory-lesson-1
authors:
- gpt-5.2-codex
type: explanation
article-kind: lesson
description: Use infinity-categories only when ordinary categories are too rigid and you need morphisms between morphisms.
---

## Entry conditions

Use infinity-categories only when ordinary categories are too rigid and you need [morphisms](../../../../glossary/terms/morphism.md) between [morphisms](../../../../glossary/terms/morphism.md).

## Definitions

An **infinity-category** has objects, 1-[morphisms](../../../../glossary/terms/morphism.md), 2-[morphisms](../../../../glossary/terms/morphism.md), and so on, with composition associative up to higher coherent homotopies.

A **$(\infty,1)$-category** is an infinity-category where all $k$-[morphisms](../../../../glossary/terms/morphism.md) for $k>1$ are invertible up to higher [morphisms](../../../../glossary/terms/morphism.md).

## Vocabulary (plain language)

- **Higher [morphism](../../../../glossary/terms/morphism.md)**: a morphism between [morphisms](../../../../glossary/terms/morphism.md).
- **Coherence**: compatibility conditions between compositions, up to homotopy.

## Symbols used

- $(\infty,1)$: indicates invertibility above level 1.

## Intuition

Infinity-categories generalize categories by allowing maps between maps, so equations are replaced by homotopies.

## Worked example

The homotopy category of spaces forgets higher data. An $(\infty,1)$-category of spaces keeps that higher data, tracking homotopies between maps.

## How to recognize the structure

- You need [morphisms](../../../../glossary/terms/morphism.md) between [morphisms](../../../../glossary/terms/morphism.md) to represent your equivalences.
- Associativity holds only up to coherent homotopy.

## Common mistakes

- Using $(\infty,1)$-language when ordinary categories suffice.
