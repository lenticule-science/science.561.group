---
name: probability-space
description: A measure space (Ω, 𝓕, P) with the additional constraint P(Ω) = 1. The basic object of probability theory.
specializing: measure-space

---

A **probability space** is a triple (Ω, 𝓕, P) where (Ω, 𝓕) is a measurable space and P: 𝓕 → [0, 1] is a *probability measure* — a measure with P(Ω) = 1. Specializes [measure-space](../../measure-space.md) by constraining the total mass to 1. Events are elements of 𝓕; the probability of event A is P(A). For events A, B with P(B) > 0, the *conditional probability* of A given B is P(A|B) = P(A ∩ B) / P(B); this defines a new probability measure P(·|B) on 𝓕. Estimating a conditional probability from counted outcomes is realized at [doing/working/estimating-a-conditional-probability/](doing/working/estimating-a-conditional-probability/).
