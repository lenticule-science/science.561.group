---
title: Relational Equivalence
aliases:
  - Relational Equivalence
  - relational equivalence
keywords:
  - text
  - equivalence
  - semantics
depends_on:
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
---

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
[Normalize Observation Equivalence](../../acts/normalize-observation-equivalence.md)
through
[Contextualize Normalize Observation Equivalence](../../acts/contextualize-normalize-observation-equivalence.md)—defines
contextual indistinguishability: two observations are equivalent iff no
observation context can distinguish them.

*Proof sketch.* Each act restricts the equivalence to a different slice (head,
tail, contextual, re-entry). Their composition
([Trace Observation Equivalence](../../acts/trace-observation-equivalence.md)
through
[Reenter Observation Equivalence](../../acts/reenter-observation-equivalence.md))
proves closure, yielding the familiar CIU characterization. ∎

**Corollary (Judgemental CIU).**  
The judgemental lift—[Normalized Judgement Equivalence](../../acts/normalized-judgement-equivalence.md)
through
[Witness Judgement Equivalence](../../acts/witness-judgement-equivalence.md)—extends
observation equivalence to judgements so typing contexts respect CIU.

## 2. Relational bisimulation

**Theorem 2 (Profile bisimulations).**  
Profiles and flows (from
[Profile Recognitions](../../acts/profile-recognitions.md)
through
[Physics Profile](../../acts/physics-profile.md)) provide a bisimulation principle:
two recognitions are bisimilar if they inhabit the same profile and evolve
identically under inherited flows and nuclei.

*Proof.* [Profile Recognitions](../../acts/profile-recognitions.md) fix
the state space; [Trace Profile](../../acts/trace-profile.md) reuses the
trace structure; [Flow Profile](../../acts/flow-profile.md) and
[Nucleate Profile](../../acts/nucleate-profile.md) ensure dynamics agree.
Thus matching evolution across profiles yields bisimulation. ∎

## 3. Step-indexed reasoning

**Theorem 3 (Step-indexed invariants).**  
The tower-and-invariant family—starting with
[Build Profile Tower](../../acts/build-profile-tower.md) and culminating in
[Reach](../../acts/reach.md)—supplies step-indexed logic: each level
of the tower refines the equivalence by one “step,” and
[Stabilize Invariant](../../acts/stabilize-invariant.md) records the limit.

*Proof sketch.* [Build Profile Tower](../../acts/build-profile-tower.md),
[Build Nested Profile Tower](../../acts/build-nested-profile-tower.md),
and [Build Composite Profile Tower](../../acts/build-composite-profile-tower.md)
iteratively refine recognitions.  The physics acts
([Observe](../../acts/observe.md) through
[Stabilize Invariant](../../acts/stabilize-invariant.md)) track invariants along
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
