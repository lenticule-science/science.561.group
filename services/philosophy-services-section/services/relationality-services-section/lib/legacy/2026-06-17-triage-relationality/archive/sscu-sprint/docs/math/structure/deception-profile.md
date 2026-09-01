---
title: Deception Profile
role: structure
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Tracks divergence between an agent's private and public epistemic profiles.

## Definition
- Components: private [Epistemic Profile](epistemic-profile.md), public
  epistemic profile, and a divergence witness (recognition of mismatch).
- Role: quantify or witness deception/strategy by comparing public claims to
  private beliefs.

## Invariants
- Divergence monotonicity: increasing mismatch increases divergence witness.
- Consistency: when private = public, divergence collapses to neutral/top.

## Proof
- Uses: two [Epistemic Profiles](epistemic-profile.md) and recognition of their
  differences.
- Shows that: epistemic mismatch can be encoded as a structure for reasoning
  about deception/strategy.
