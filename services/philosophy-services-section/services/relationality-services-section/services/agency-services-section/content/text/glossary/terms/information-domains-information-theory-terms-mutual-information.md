---
name: "mutual information"
date-created: 2025-12-30
---

A technical introduction to mutual information.

# Mutual Information and Dependence

## Assumed audience

- Reading level: technical.

- Background: probability and basic entropy.

- Goal: understand mutual information as shared uncertainty.

## Definition

Mutual information measures how much knowing one variable reduces uncertainty
about another:

I(X;Y)=H(X)+H(Y)−H(X,Y).
I(X;Y) = H(X) + H(Y) - H(X,Y).

## Interpretation

- If XX and YY are independent, I(X;Y)=0I(X;Y)=0.

- If XX determines YY, mutual information is high.

## Why this matters

Mutual information is a core tool for dependency detection and feature
selection.
