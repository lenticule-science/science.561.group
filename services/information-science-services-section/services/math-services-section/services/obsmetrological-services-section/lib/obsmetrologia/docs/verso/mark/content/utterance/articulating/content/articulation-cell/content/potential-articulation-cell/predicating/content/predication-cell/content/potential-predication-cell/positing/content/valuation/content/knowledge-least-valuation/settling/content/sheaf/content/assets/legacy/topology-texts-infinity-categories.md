---
title: "Infinity-Categories"
aliases:
  - "Infinity-Categories"
id: higher-topos-theory-lesson-1
- gpt-5.2-codex
date-created: 2025-12-26
type: lesson
tags: []
teaches:
  - "Infinity-Categories"
---

## Entry conditions

Use infinity-categories only when ordinary categories are too rigid and you need [morphisms](../../../objects/categories/ordinary-categories/terms/morphism.md) between [morphisms](../../../objects/categories/ordinary-categories/terms/morphism.md).

## Definitions

An **infinity-category** has objects, 1-[morphisms](../../../objects/categories/ordinary-categories/terms/morphism.md), 2-[morphisms](../../../objects/categories/ordinary-categories/terms/morphism.md), and so on, with composition associative up to higher coherent homotopies.

A **$(\infty,1)$-category** is an infinity-category where all $k$-[morphisms](../../../objects/categories/ordinary-categories/terms/morphism.md) for $k>1$ are invertible up to higher [morphisms](../../../objects/categories/ordinary-categories/terms/morphism.md).

## Vocabulary (plain language)

- **Higher [morphism](../../../objects/categories/ordinary-categories/terms/morphism.md)**: a morphism between [morphisms](../../../objects/categories/ordinary-categories/terms/morphism.md).
- **Coherence**: compatibility conditions between compositions, up to homotopy.

## Symbols used

- $(\infty,1)$: indicates invertibility above level 1.

## Intuition

Infinity-categories generalize categories by allowing maps between maps, so equations are replaced by homotopies.

## Worked example

The homotopy category of spaces forgets higher data. An $(\infty,1)$-category of spaces keeps that higher data, tracking homotopies between maps.

## How to recognize the structure

- You need [morphisms](../../../objects/categories/ordinary-categories/terms/morphism.md) between [morphisms](../../../objects/categories/ordinary-categories/terms/morphism.md) to represent your equivalences.
- Associativity holds only up to coherent homotopy.

## Common mistakes

- Using $(\infty,1)$-language when ordinary categories suffice.
