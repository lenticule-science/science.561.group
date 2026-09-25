---
title: Cosmic regimes as the n-bonacci RG flow — grounding and physical mapping
status: grounded-in-a-proved-theorem
grounds: [cosmos, cosmic-thermalization, hubble-tension, hubble-constant, observer-stage]
depends-on: [critical-exponents-at-step-n-fixed-point, renormalization-group-flow, step-n-fixed-point, cosmogenerating]
description: This note grounds the regime → λ tower in a proved corpus theorem (not numerology), and reads the field identification off it.
---

# Cosmic regimes as the n-bonacci RG flow

This note grounds the regime → λ tower in a **proved** corpus theorem (not numerology), and reads the field identification off it.
The λ-tower is not a free assignment and the field-to-regime identification is not a separate "interpretation" laid on top: three of the four bands are *exactly* the proved Perron eigenvalues, and which field sits at which band is fixed by which generator produces it.
The one genuinely open item — whether the cosmological phase transition is a critical point of this RG flow — is marked **Conjecture** below, and is the only thing here that is not proved.

## The proved grounding

The predication-categories corpus proves ([`critical-exponents-at-step-n-fixed-point`](../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/aperiodic-settling/content/step-n-substitution-recurrence/content/step-n-substitution-rule/references/critical-exponents-at-step-n-fixed-point.md)) that the **canonical n-bonacci substitution** `σ_n^nb` has substitution matrix `M_n^nb` whose Perron–Frobenius eigenvalue λ_n satisfies

$$x^{n+1} - 2x^n + 1 = 0 \quad(x\neq 1), \qquad \lambda_n = 2 - \frac{1}{\lambda_n^{\,n}},$$

is Pisot, is monotone increasing, and **accumulates at 2**:

| n | λ_n | role |
|---|---|---|
| 2 | **φ = 1.618** (golden) | step-2 / Fibonacci |
| 3 | **1.839** (tribonacci) | step-3 |
| 4 | 1.928 (tetranacci) | step-4 |
| … | … | … |
| ∞ | **2** | the RG fixed point `M^(∞)` (colimit of the step-shift flow) |

So the **regime → λ tower is not a free assignment** — three of cosmos's four bands are *exactly* these proved values:

| cosmic regime | λ | = n-bonacci |
|---|---|---|
| aperiodic | → 2 | λ_∞ (the RG fixed point) |
| transfinite | tribonacci 1.839 | λ_3 |
| cosmic-scott | golden φ 1.618 | λ_2 (the floor of the sequence) |
| cosmic-finite | plastic ρ 1.325 | **off-sequence** — the smallest Pisot, IR endpoint of a *different* extension-data trajectory (`e^Pad`) |

The cosmic descent **is** the n-bonacci RG flow run from n=∞ downward, bottoming at the n=2 floor (φ), with the thermal state (ρ) lying off the n-bonacci family entirely.

## The field at each band

> **Merge note:** the cosmic-* tower this note was written against has been merged into the four-field descent — `cosmic-transfinite = quantum-spacetime`, `cosmic-scott = classical-spacetime`, `cosmic-finite = thermal-spacetime`, and the aperiodic top *is* informational-spacetime.
> Read "cosmic regime" below as "field."

| field | regime | λ | physics |
|---|---|---|---|
| informational-spacetime | aperiodic (κ≥ω₁) | 2 | **the aperiodic base = what this lab studies** — the articulated whole / the mathematics itself; the generated totality. The RG fixed point. |
| quantum-spacetime | transfinite (ω<κ<ω₁) | tribonacci | **quantum** — the value-free substrate. |
| classical-spacetime | cosmic-scott (κ=ω) | golden φ | **natural existence as we experience it now** — not-yet-thermal (the ω-limit is not yet reached), still converging. We are *somewhere later in* this band, not at its start. |
| thermal-spacetime | cosmic-finite (κ<ω) | plastic ρ | **heat death** — full thermalization (κ<ω, quiescence). |

**The Big Bang is the generation of cosmic-scott from cosmic-transfinite** — the transfinite→scott step, the `λ_3 → λ_2` (tribonacci→golden) descent — i.e. the emergence of classical natural existence from the quantum substrate.
It is **not** the aperiodic top (that is the studied whole), and **not** a κ<ω event.

### Why "we can't hit plastic until heat death" is a theorem, not a mood

Cosmic-scott is the **n=2 floor** of the n-bonacci sequence.
There is no n-bonacci λ below φ; the plastic number ρ < φ is unreachable within the n-bonacci flow. ρ is the smallest Pisot — the IR endpoint of the `e^Pad` trajectory — and a thermalizing reaches it only by fully thermalizing to κ<ω.
So "stuck above ρ until the end" = "on the n-bonacci flow (floor φ) until full thermalization," and full thermalization of the cosmos is heat death.

## Consequence for the Hubble tension (supersedes the band-mismatch mapping)

The earlier `hubble-tension` / `hubble-constant` cells mapped late-time → cosmic-finite (plastic ρ) and early-time → cosmic-scott (golden φ), a **cross-band** mismatch.
That is wrong: **we are in cosmic-scott now, and the CMB is *early* cosmic-scott** (just after the Bang generated scott from transfinite).
So both pipelines are **golden-φ scott readings at different stages τ** — an **intra-scott stage offset on the one golden spiral**, not a band mismatch.
`observer-stage`'s old "finite observer ⟹ finite band" was likewise wrong: the present observer is an *unconverged* (scott) thermalization, not a finite one — a finite (thermal) cosmos is heat death, observerless.

This note is the authority for that correction, and the affected cells have been brought into line with it: `hubble-tension`, `hubble-constant`, `observer-stage`, `cosmology`, `flow`, `lambda-cdm`, `reflexive-friedmann-system`, `cosmic-scott-posit`, `thermalizing`, `cosmic-finite-thermalization-algebra`, `cosmic-thermalization`, `cosmic-transfinite-predication`, the `cosmic-band-mismatch-law` prediction (legacy filename), and the hubble-tension notes.

## Conjecture (flagged): RG critical exponents ↔ the cosmological phase transition

In physics, critical exponents at an RG fixed point are the physics of a phase transition.
The [`reflexive-friedmann-system`](reflexive-friedmann-system.md) carries a Landau order parameter g(z) with a critical redshift z_c (matter→Λ). **Conjecture:** the cosmological phase transition is a critical point of the cosmic RG flow, and RFS's Landau exponents are the corpus's critical exponents.
If so, the H¹/phase-change thread and the band/λ thread are one object — the RG flow — at its fixed point vs. along its trajectory.

## What this grounding establishes

The grounding above fixes *where the λ-tower comes from* — the n-bonacci RG flow — and *what the Big Bang is structurally* — the transfinite→scott generation.
The physical identification of the expansion rate with λ is made by [[cosmic-thermalization]], which reads the spiral inflation factor λ as $H$ at each stage.
The RG-fixed-point reading (Part C of `critical-exponents-at-step-n-fixed-point`) and the colimit-fixed-point identity `cosmogenerating` = `M^(∞)` are admitted under `hacking/`; the grounding fixes the regime structure (which Pisot at which band), not a km/s/Mpc number or the stage offset within scott.
