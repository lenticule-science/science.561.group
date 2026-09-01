---
title: "Continuity"
aliases:
  - "Continuity"
id: topology-lesson-2
authors:
- gpt-5.2-codex
date-created: 2025-12-26
type: lesson
tags: []
teaches:
  - "Continuity"
---

## Entry conditions

Use topological continuity only when you have topological spaces on both domain and codomain.

## Definitions

A function $f:X \to Y$ between topological spaces is **continuous** if for every open set $U$ in $Y$, the preimage $f^{-1}(U)$ is open in $X$.

## Vocabulary (plain language)

- **Preimage**: the set of all points in $X$ that map into a set in $Y$.

## Symbols used

- $f^{-1}(U)$: preimage of $U$ under $f$.

## Intuition

Continuity is defined by the behavior of open sets, not by distances. If openness is preserved under pullback, the function is continuous.

## Worked example

Every function from a discrete space is continuous because all subsets are open, so every preimage is open.

## How to recognize the structure

- You can compute preimages.
- Preimages of opens are open.

## Common mistakes

- Using distance-based continuity without specifying a metric.
