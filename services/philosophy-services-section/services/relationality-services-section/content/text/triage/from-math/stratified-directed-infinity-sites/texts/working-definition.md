---
title: "Working Definition"
aliases:
  - "Working Definition"
id: stratified-directed-infinity-sites-lesson-3
authors:
- gpt-5.2-codex
date-created: 2025-12-26
type: lesson
tags: []
teaches:
  - "Working Definition"
---

## Entry conditions

Use this working definition only when you have both a stratification and an $\infty$-site structure.

## Definition (working, repository-specific)

A **stratified directed $\infty$-site** is an $\infty$-site $(\mathcal{C},J)$ together with:

- a stratification of objects into layers,
- a directed structure where [morphisms](../../../../../../../../../information-science-services-section/services/math-services-section/services/categorical-services-section/services/ordinary-categories-services-section/content/text/glossary/terms/morphism.md) respect the stratification,
- and a topology $J$ that is compatible with the directed structure.

## Vocabulary (plain language)

- **Compatible topology**: covers that do not violate the stratification or direction.

## Intuition

This structure models systems where local contexts are layered and causal or refinement direction matters, and where gluing must respect that direction.

## Worked example

If objects are layered by "resolution level" and [morphisms](../../../../../../../../../information-science-services-section/services/math-services-section/services/categorical-services-section/services/ordinary-categories-services-section/content/text/glossary/terms/morphism.md) are refinement maps, then the topology should only allow covers that refine upward, not backward.

## How to recognize the structure

- The stratification is explicit.
- Morphisms preserve direction and strata ordering.
- Covers respect direction.

## Common mistakes

- Treating the topology as independent of direction.
