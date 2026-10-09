---
title: Claim. Multiple simultaneous single-tone instruments with slightly different fundamentals aggregate into a stochastic cluster.
description: Claim.
---
# Claim. Multiple simultaneous single-tone instruments with slightly different fundamentals aggregate into a stochastic cluster.

**Claim.** When n single-tone aerophones (typically eagle wing-bone whistles) play simultaneously, with each instrument's fundamental fᵢ slightly different from the others (by ~5–50 cents typically, due to per-bone geometric variation), the aggregate sound is a **stochastic cluster**: a discrete measure on R⁺ with support {f₁, ..., fₙ} concentrated near a central frequency f*, with a shared breath-pulse sequence applied across all support points.
The cluster is a music-theoretic object structurally analogous to Ligeti's late micropolyphony but achieved through acoustic identity-with-variation across players rather than through compositional voice-design.

**Argument.**

*Variation in per-instrument fundamental.* Eagle wing-bone whistles are constructed from individual bone sources; bone length and bore diameter vary across whistles.
Two whistles from the same craftsman differ in fundamental by typically tens of cents.
There is no convention in the source tradition of tuning whistles to one another.

*Aggregate is a discrete measure.* The simultaneous sound of n whistles is the sum of n sinusoid-plus-harmonics signals at distinct fundamentals.
The spectral content has discrete support at {fᵢ} (and their integer harmonics).
It is not a chord (no harmonic intent, no consonance/dissonance grammar) and not noise (definite pitch content with small finite support).

*Shared pulse articulation.* In ceremonial use, the multiple players articulate the same drum-driven pulse, producing simultaneous attacks across the cluster.
The rhythmic dimension is shared; the pitch dimension is scattered.

*Distinct from chord and noise.* A chord is a designed selection of harmonically related pitches.
A stochastic cluster is an un-designed scatter of related-but-not-identical pitches.
Both are distinct from noise (which has continuous spectral support).

*Analogue to Ligeti micropolyphony.* Ligeti's late micropolyphony (e.g., *Lontano*, *Lux Aeterna*) constructs textures from many slightly-different instances of the same underlying line, achieved compositionally.
The Lakotaean stochastic cluster achieves the same structural object by acoustic means: many slightly-different instances of the same single-tone object, achieved through per-instrument variation.

**Structures produced.**

- [stochastic-cluster](../../../code/structures/stochastic-cluster.md) — a discrete measure on pitch space with small finite support, plus a shared temporal articulation.

**Transformers produced.**

- [aggregation](../code/transformers/aggregation.md) — the morphism (single-tone)ⁿ → stochastic-cluster sending n simultaneous single-tone events to their aggregate cluster.
