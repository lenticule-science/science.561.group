---
name: collatz modulation function
symbol: C
type: parity-modulated recursive transformation
domains: N
codomain: N
description: The base modulation rule that defines recursive constraint evolution in the Collatz system. Behavior depends on binary parity and selects between two exclusive constraint paths. This function assumes no terminal identity unless defined separately via tau or tau_o.
aliases:
  - Collatz Corollary Modulation Function
title: collatz modulation function
introduces: parity-modulated recursive transformation
---

The **collatz modulation function** (`C`) defines a piecewise transformation over the natural numbers, modulated by binary parity.

Let:
- N be the domain of natural numbers ≥ 1  
- mod_2(n) := n mod 2  
- E(n) := n / 2 (even contraction)  
- O(n) := 3n + 1 (odd expansion)

Then:

C(n) :=  
  E(n)  if mod_2(n) = 0  
  O(n)  if mod_2(n) = 1

Formally:

C(n) :=  
  n / 2   if ∃ k ∈ N such that n = 2k  
  3n + 1  if ∃ k ∈ N such that n = 2k + 1

This function does not specify a fixed point. It must be composed into a recursive evaluation structure (e.g., T_C, tau, tau_o) to determine stabilization or divergence.

Note: Identity or terminality must be explicitly evaluated using tau(n) or tau_o(n); this function alone does not resolve to a halting condition.
