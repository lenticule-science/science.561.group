---
name: minimal positive modulation
symbol: mu_plus
alias: μ⁺
type: recursive unit-scale constructor
domains: N
codomain: N
description: The base recursive modulation operator over the natural numbers. Represents the minimal positive extension of a constraint field element. Defined independently of symbolic constants.
title: minimal positive modulation
aliases:
  - Minimal Positive Modulation
introduces: recursive unit-scale constructor
---

μ⁺(x) := the next distinguishable value after x under minimal constraint extension.

Behavior:
- μ⁺(0) := 1 (if 1 is defined)  
- μ⁺(x) := x +̂ 1, where +̂ is internally defined as distinct from external arithmetic  
- μ⁺(x) is not assumed to be symmetric or invertible unless separately constructed
