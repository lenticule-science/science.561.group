---
title: Observables
aliases:
  - Observables
  - observables
date-created: "2026-03-04T00:00:00"
keywords:
  - observation
  - profile
  - normalization
depends_on:
  - profile-observation-recognitions
  - fixed-profile-recognitions
  - profile-observe
  - fixed-observe
  - fixed-normalize-observation
  - fixed-witness-observation
---

# Theorem (Observables)

With acts

- `ProfileObservationRecognitions = (RecognizeObservation ProfileRecognitions)`,
- `FixedObservationRecognitions = (ProfileObservationRecognitions FixedProfileRecognitions)`,
- `ProfileObserve = (ProfileObservationRecognitions SeedTerm)`,
- `FixedObserve = (FixedObservationRecognitions SeedTerm)`,
- `FixedNormalizeObservation = (Normalization FixedObserve)`,
- `FixedWitnessObservation = (FixedObservationRecognitions EquateContexts)`,

we have:

1. **Internality.**
   Fixed observables are internal to the fixed profile:
   `FixedObserve` defines observables whose domains and codomains lie entirely
   in `FixedProfileRecognitions`.

2. **Normalization.**
   `FixedNormalizeObservation` ensures that fixed observables normalize along
   the step trace: iteration along `StepTrace` stabilizes and is recognised by
   `Normalization`.

3. **Observational sufficiency.**
   `FixedWitnessObservation` shows that contextual equivalence restricted to
   the fixed profile can be witnessed using only fixed observations: if two
   terms are indistinguishable to all fixed contexts, the fixed observation
   recognitions suffice to witness that equivalence.

## Proof sketch

1. `ProfileObservationRecognitions = (RecognizeObservation ProfileRecognitions)`
   keeps observations inside the active profile, and composing with
   `FixedProfileRecognitions` further restricts them to the fixed subset.
   `SeedTerm` injects traced terms into the context layer, so `FixedObserve`
   acts entirely within the fixed profile.

2. `FixedNormalizeObservation = (Normalization FixedObserve)` applies the
   earned normalization recognition to fixed observables, guaranteeing that the
   associated reduction traces stabilize.

3. `FixedWitnessObservation = (FixedObservationRecognitions EquateContexts)`
   restricts the observation witness to fixed observations.  Since
   `EquateContexts` is closed under profile restriction and
   `FixedProfileRecognitions` captures the fixed contexts, the resulting
   recognition is observationally complete for the fixed profile.
