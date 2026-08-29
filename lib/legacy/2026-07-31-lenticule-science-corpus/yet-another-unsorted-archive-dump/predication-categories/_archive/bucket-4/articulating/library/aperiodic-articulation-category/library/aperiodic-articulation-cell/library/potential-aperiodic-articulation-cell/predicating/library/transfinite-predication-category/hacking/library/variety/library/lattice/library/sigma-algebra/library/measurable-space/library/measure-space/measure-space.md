---
name: measure-space
description: A triple (Ω, 𝓕, μ) where (Ω, 𝓕) is a measurable space and μ: 𝓕 → [0, ∞] is a σ-additive measure.
specializing: measurable-space

---

A **measure space** is a triple (Ω, 𝓕, μ) where (Ω, 𝓕) is a measurable space and μ: 𝓕 → [0, ∞] is a *measure*: μ(∅) = 0 and μ(⋃_n A_n) = Σ_n μ(A_n) for any countable disjoint family {A_n} ⊆ 𝓕 (σ-additivity). The measure may take the value ∞. Examples: Lebesgue measure on (ℝ, 𝓑(ℝ)); counting measure on any (Ω, 2^Ω); Hausdorff measures on metric spaces. Specializes [measurable-space](../../measurable-space.md) by adding the measure as a structure-cell.
