---
name: ultrastability
kind: structure
description: "Ashby's two-tier closure-rule-system: inner regulator absorbs disturbances; outer regulator adjusts inner parameters when essential variables drift. The outer loop maintains the inner loop's capacity to maintain essential variables."
of: closure-rule-system
---

**Ultrastability** (Ashby 1952) is the two-tier closure-rule-system structure where a fast inner regulator absorbs disturbances on a short timescale, and a slow outer regulator adjusts the inner regulator's parameters when essential variables drift beyond physiological limits.

## Structure

Let $V_{\mathrm{ess}}$ be a designated set of essential variables that must be maintained within physiological limits $L \subseteq V_{\mathrm{ess}}.\mathrm{state\text{-}space}$.
The ultrastable system has:

- **Inner regulator** $R_{\mathrm{in}}$: a closure-rule-system with rules parameterized by $\theta$.
  Fast timescale.
  Absorbs disturbances by closing $V_{\mathrm{ess}}$ toward $L$.
- **Outer regulator** $R_{\mathrm{out}}$: a closure-rule-system whose rules act on the parameters $\theta$ of $R_{\mathrm{in}}$.
  Slow timescale.
  Triggered when $V_{\mathrm{ess}}$ drifts outside $L$.

The outer regulator selects new parameters $\theta'$ for $R_{\mathrm{in}}$ when the inner regulator fails to maintain $V_{\mathrm{ess}} \subseteq L$.
The outer search is typically random or guided by gradient-of-failure.

## Why ultrastability matters

Single-tier closure-rule-systems fail when the disturbance space exceeds the regulator's [requisite-variety](../requisite-variety/requisite-variety.md).
An ultrastable system handles this by re-parameterizing its inner regulator when failure is detected — exploring the parameter space of regulators until one with sufficient variety against the actual disturbances is found.

This is the substrate-realization of "learning to regulate": the outer loop is a meta-regulator whose regulated variable is "is the inner regulator succeeding."

## Connection to two-tier closure-2-monad

The closure-2-monad's K1 lax-idempotence structure provides the 2-categorical generalization: the inner regulator is a closure operator at one level; the outer regulator is a closure operator on the 2-cells (the parameters of inner regulators).
Ultrastability is the structural condition that the 2-monad is genuinely two-tiered — not collapsing to a 1-monad — which corresponds to the regimes where parameter-search is non-trivial.
