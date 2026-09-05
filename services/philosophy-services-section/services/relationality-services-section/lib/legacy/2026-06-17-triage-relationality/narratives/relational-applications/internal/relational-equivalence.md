---
title: Relational Equivalence
aliases:
  - Relational Equivalence
  - relational equivalence
tags:
  - text
  - equivalence
  - semantics
depends-on:
  - normalize-observation-equivalence
  - contextualize-normalize-observation-equivalence
  - trace-observation-equivalence
  - reenter-observation-equivalence
  - normalized-judgement-equivalence
  - witness-judgement-equivalence
  - profile-recognitions
  - physics-profile
  - build-profile-tower
  - reach
form: research
in-domain: science/relationality
readiness: raw
# Theorem (Relational Equivalence)

Relational calculi earn equivalence relations in three stages:

1. **CIU (Contextual Indistinguishability up to observation)** via the
   observation acts.
2. **Bisimulation-style reasoning** across profiles and flows.
3. **Step-indexed logic** captured by towers and invariants.

This text records the theorems witnessing each layer.

## 1. Contextual equivalence (CIU)

**Theorem 1 (Observation CIU).**  
The observation-equivalence cluster—running from
Normalize Observation Equivalence
through
Contextualize Normalize Observation Equivalence—defines
contextual indistinguishability: two observations are equivalent iff no
observation context can distinguish them.

*Proof sketch.* Each act restricts the equivalence to a different slice (head,
tail, contextual, re-entry). Their composition
(Trace Observation Equivalence
through
Reenter Observation Equivalence)
proves closure, yielding the familiar CIU characterization. ∎

**Corollary (Judgemental CIU).**  
The judgemental lift—Normalized Judgement Equivalence
through
Witness Judgement Equivalence—extends
observation equivalence to judgements so typing contexts respect CIU.

## 2. Relational bisimulation

**Theorem 2 (Profile bisimulations).**  
Profiles and flows (from
Profile Recognitions
through
Physics Profile) provide a bisimulation principle:
two recognitions are bisimilar if they inhabit the same profile and evolve
identically under inherited flows and nuclei.

*Proof.* Profile Recognitions fix
the state space; Trace Profile reuses the
trace structure; Flow Profile and
Nucleate Profile ensure dynamics agree.
Thus matching evolution across profiles yields bisimulation. ∎

## 3. Step-indexed reasoning

**Theorem 3 (Step-indexed invariants).**  
The tower-and-invariant family—starting with
Build Profile Tower and culminating in
Reach—supplies step-indexed logic: each level
of the tower refines the equivalence by one “step,” and
Stabilize Invariant records the limit.

*Proof sketch.* Build Profile Tower,
Build Nested Profile Tower,
and Build Composite Profile Tower
iteratively refine recognitions.  The physics acts
(Observe through
Stabilize Invariant) track invariants along
these refinements.  Taking the limit provides the step-indexed logic. ∎

## Summary

| Equivalence notion | Witnessing acts |
| ------------------ | --------------- |
| CIU (contextual)   | Observation-equivalence family (Normalize -> Contextualize) plus the judgemental lift (Normalized Judgement Equivalence -> Witness Judgement Equivalence) |
| Bisimulation       | Profile/flow family (Profile Recognitions -> Physics Profile) |
| Step-indexed       | Tower/invariant family (Build Profile Tower -> Reach) |

Relational equivalence thus proceeds from local observational agreement (CIU),
through global dynamical agreement (bisimulation), to stratified,
step-indexed invariants.
