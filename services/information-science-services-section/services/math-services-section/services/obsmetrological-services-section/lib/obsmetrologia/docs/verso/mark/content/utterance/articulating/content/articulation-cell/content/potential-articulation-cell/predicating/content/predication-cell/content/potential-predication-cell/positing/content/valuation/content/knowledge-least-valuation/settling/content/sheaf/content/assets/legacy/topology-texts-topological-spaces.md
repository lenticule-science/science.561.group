---
title: "Topological Spaces"
aliases:
  - "Topological Spaces"
id: topology-lesson-1
- gpt-5.2-codex
date-created: 2025-12-26
type: lesson
tags: []
teaches:
  - "Topological Spaces"
---

## Entry conditions

Use topology only when you can specify a collection of "open sets" with closure properties.

## Definitions

A **topology** on a set $X$ is a collection $\mathcal{T}$ of subsets of $X$ such that:

1. $\emptyset$ and $X$ are in $\mathcal{T}$.
2. Any union of sets in $\mathcal{T}$ is in $\mathcal{T}$.
3. Any finite intersection of sets in $\mathcal{T}$ is in $\mathcal{T}$.

The pair $(X,\mathcal{T})$ is a **topological space**.

## Vocabulary (plain language)

- **Open set**: a subset declared open by the topology rules.
- **Union**: combine sets by taking anything in any of them.
- **Intersection**: combine sets by taking only what is in all of them.

## Symbols used

- $X$: the underlying set.
- $\mathcal{T}$: the collection of open sets.

## Intuition

Topology is about which subsets count as "open" so that we can talk about continuity and gluing without relying on distance.

## Worked example

On any set $X$, the **discrete topology** declares every subset open. The **indiscrete topology** declares only $\emptyset$ and $X$ open.

## How to recognize the structure

- You can list or describe the open sets.
- The axioms are satisfied.

## Common mistakes

- Declaring opens without checking closure under unions and finite intersections.
