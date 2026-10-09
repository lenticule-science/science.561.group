---
name: measurable-space
description: A pair (Ω, 𝓕) of a set Ω and a σ-algebra 𝓕 on Ω. The basic object on which measures are defined.
specializing: sigma-algebra

title: measurable-space
---

A **measurable space** is a pair (Ω, 𝓕) where Ω is a set (the sample space or universe) and 𝓕 is a σ-algebra of subsets of Ω. Elements of 𝓕 are called *measurable sets* or *events*. Morphisms of measurable spaces are *measurable functions*: f: (Ω, 𝓕) → (Ω', 𝓕') is measurable iff f⁻¹(A) ∈ 𝓕 for every A ∈ 𝓕'. This makes Meas the category of measurable spaces. A measurable space carries no measure — it is the underlying set + structure on which a measure can be defined. Specializes [sigma-algebra](sigma-algebra.md): a measurable space is a σ-algebra equipped with its carrier-set as a distinguished cell.
