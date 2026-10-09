---
title: "Homotopies"
aliases:
  - "Homotopies"
date-created: 2025-12-26
tags: []
teaches:
  - "Homotopies"
id: homotopy-theory-lesson-1
authors:
- gpt-5.2-codex
type: explanation
article-kind: lesson
description: Use homotopy only when you have topological spaces and continuous maps between them.
---

## Entry conditions

Use homotopy only when you have topological spaces and continuous maps between them.

## Definitions

Two continuous maps $f,g:X \to Y$ are **homotopic** if there exists a continuous map
$$
H:X \times [0,1] \to Y
$$
with $H(x,0)=f(x)$ and $H(x,1)=g(x)$.

## Vocabulary (plain language)

- **Deformation**: a continuous transformation over time.
- **Parameter**: the time variable in $[0,1]$.

## Symbols used

- $H$: the homotopy between $f$ and $g$.

## Intuition

Homotopy says that two maps are the same if one can be continuously deformed into the other.

## Worked example

On the circle $S^1$, the identity map is not homotopic to a constant map, because the deformation would have to "collapse" the circle.

## How to recognize the structure

- You can define $H$ as a continuous map on $X \times [0,1]$.
- The endpoints of $H$ are the given maps.

## Common mistakes

- Using homotopy without specifying the parameter interval.
