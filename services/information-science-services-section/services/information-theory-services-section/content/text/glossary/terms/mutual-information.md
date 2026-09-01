---
name: "mutual information"
aliases:
  - "mutual information"
id: mutual-information-and-dependence
date-created: 2025-12-30
description: A technical introduction to mutual information.
tags: []
dependencies:
  - /information/curricula/entropy-and-surprise.md
date-updated: 2026-03-09
part-of: information/disciplines/information-theory/terms
---

# Mutual Information and Dependence

## Assumed audience

- Reading level: technical.
- Background: probability and basic entropy.
- Goal: understand mutual information as shared uncertainty.

## Definition

Mutual information measures how much knowing one variable reduces uncertainty
about another:

$$
I(X;Y) = H(X) + H(Y) - H(X,Y).
$$

## Interpretation

- If $X$ and $Y$ are independent, $I(X;Y)=0$.
- If $X$ determines $Y$, mutual information is high.

## Why this matters

Mutual information is a core tool for dependency detection and feature
selection.
