---
title: Fixed Observation Carrier
id: fixed-observation
role: structure
status: plan
derived_from: acts/profile-observation-recognitions
proof_refs: []
---


# Fixed Observation Carrier

## Definition
- Carrier: observations whose domains and codomains lie in the fixed profile,
  as a restriction of the full [Observation](observation.md) carrier.
- Source: earned from [Profile Observation Recognitions](../acts/profile-observation-recognitions.md), restricted to the fixed-profile subset.

## Invariants
- Fixedness: observations remain invariant under the fixed-profile flow/nucleus stack.
- Profile-compatibility: domains/codomains reside in the fixed-profile recognitions.

## Proof
- Derived from: [Profile Observation Recognitions](../acts/profile-observation-recognitions.md), with fixedness enforced via [Fixed Profile Recognitions](../acts/fixed-profile-recognitions.md).
- Shows that: restricting profile observations to the fixed-profile recognitions yields the fixed observation carrier; it is the fixed-profile subcarrier of [Observation](observation.md).
