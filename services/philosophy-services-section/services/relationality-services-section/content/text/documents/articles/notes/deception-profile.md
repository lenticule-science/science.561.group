---
title: Deception Profile
id: deception-profile
role: structure
status: plan
proof_refs: []
---


# Deception Profile

Tracks divergence between an agent's private and public epistemic profiles.

## Definition
- Components: private [Epistemic Profile](./epistemic-profile.md), public
  epistemic profile, and a divergence witness (recognition of mismatch).
- Role: quantify or witness deception/strategy by comparing public claims to
  private beliefs.

## Invariants
- Divergence monotonicity: increasing mismatch increases divergence witness.
- Consistency: when private = public, divergence collapses to neutral/top.

## Proof
- Uses: two [Epistemic Profiles](./epistemic-profile.md) and recognition of their
  differences.
- Shows that: epistemic mismatch can be encoded as a structure for reasoning
  about deception/strategy.
