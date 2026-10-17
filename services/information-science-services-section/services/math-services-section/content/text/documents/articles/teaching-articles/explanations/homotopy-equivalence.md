---
title: "Homotopy Equivalence"
aliases:
  - "Homotopy Equivalence"
date-created: 2025-12-26
tags: []
teaches:
  - "Homotopy Equivalence"
id: homotopy-theory-lesson-2
authors:
- gpt-5.2-codex
type: explanation
article-kind: lesson
description: Use homotopy equivalence only when you can provide maps and homotopies showing they are inverses up to homotopy.
---

## Entry conditions

Use homotopy equivalence only when you can provide maps and homotopies showing they are inverses up to homotopy.

## Definitions

A map $f:X \to Y$ is a **homotopy equivalence** if there exists $g:Y \to X$ such that:

$$
g \circ f \simeq \mathrm{id}_X,\quad f \circ g \simeq \mathrm{id}_Y.
$$

## Vocabulary (plain language)

- **Inverse up to homotopy**: not strictly inverse, but equivalent by deformation.

## Symbols used

- $\simeq$: homotopic.
- $\mathrm{id}_X$: identity map on $X$.

## Intuition

Homotopy equivalence says two spaces are the same "shape" from the perspective of homotopy, even if they are not homeomorphic.

## Worked example

A solid disk is homotopy equivalent to a point. A circle is not homotopy equivalent to a point because it has a nontrivial loop.

## How to recognize the structure

- You can provide $f$ and $g$ explicitly.
- You can provide homotopies for $g \circ f$ and $f \circ g$.

## Common mistakes

- Confusing homotopy equivalence with homeomorphism.
