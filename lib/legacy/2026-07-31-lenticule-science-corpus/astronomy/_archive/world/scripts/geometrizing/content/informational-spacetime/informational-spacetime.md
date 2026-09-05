---
name: informational-spacetime
kind: category
is: aperiodic-articulation-category
generated-by: cosmogenerating
member-of: aperiodic-articulation-category
---

**Informational-spacetime is the aperiodic base field** — the codomain of [cosmogenerating](../../cosmogenerating.md), and the top of the four-field descent.
It is the regime where information is the geometry, before geometry: its only content is held distinctions.
Its unit is the [bit](library/marking/library/bit/bit.md), the bare two-fold of presence/absence; everything below it is arrays of that two-fold run down the descent.
"It from bit" is not a slogan attached to this field — it is what the field *is*, taken as the starting point and proved downward.

## Why this is the aperiodic regime, and why there are exactly four

The closure ordinal $\kappa$ of a thermalizing — the stage at which inference reaches a fixed point — classifies every regime, and the classification is a theorem (the four-regime dichotomy): each $\kappa$ falls in exactly one of $\{<\omega,\ =\omega,\ (\omega,\omega_1),\ \geq\omega_1\}$, and the four cases are mutually exclusive and jointly exhaustive.
Informational-spacetime is the $\kappa \geq \omega_1$ corner: no countable stage is a fixed point, and $H^1 \neq 0$ — the field carries an obstruction it cannot close from countable internal resources.

That obstruction is concrete.
Realizing fills a bit's object-slot but can never fill its claim-slot ([realizing](library/realizing/realizing.md)); the unreachable claim is a non-empty **residue**, and that residue *is* the $H^1 \neq 0$.
The descent is the draining of one obstruction through four regimes to zero: each generator hands its residue down to the next, where a structure absent before (a value algebra, then a confluent comparison) finally lets the residue close.
There are four because the residue drains in exactly four steps — and the cascade stops when it reaches zero ($H^1 = 0$), with nothing left to thermalize.
This is the spine of the proof; the library below is its body.

## The descent (its library)

The path is the proof.
Informational-spacetime's library *is* the four-regime descent, each field nested in the one above through the generator that produces it:

- **aperiodic — here.** [marking](library/marking/marking.md) draws a distinction (a bit); [realizing](library/realizing/realizing.md) (μ) and [forgetting](library/forgetting/forgetting.md) (η) are its monad; [condensing](library/condensing/condensing.md) carries the residue into —
- **transfinite — [quantum-spacetime](library/condensing/library/quantum-spacetime/quantum-spacetime.md)**: the value-free amplitude fibration (superposition).
  `cohering` holds coherence; [collapsing](library/condensing/library/quantum-spacetime/library/collapsing/collapsing.md) (measurement) lets value in, producing —
- **scott — [classical-spacetime](library/condensing/library/quantum-spacetime/library/collapsing/library/classical-spacetime/classical-spacetime.md)**: the valued presheaf, definite worldlines — natural existence as we experience it now.
  Its `spreading/constraining/balancing` relax it, and `thermalizing` glues it into —
- **finite — [thermal-spacetime](library/condensing/library/quantum-spacetime/library/collapsing/library/classical-spacetime/library/thermalizing/library/thermal-spacetime/thermal-spacetime.md)**: the thermal sheaf, $H^1 = 0$ — thermodynamics, heat death.

## Where the cosmos lives

The observable universe — its structure (galaxies, voids), its constituents (matter, dark-energy), its expansion (scale-factor, redshift, Friedmann), its epochs (big-bang … heat death), and the **cosmology** that measures it (the Hubble tension, the observables) — is all **classical-spacetime content**: the cosmos *is* the scott field, "natural existence."

> The cosmos is what is.
> Cosmology is what we make of it.
> The act that **generates** the field and the act that **measures** it are different morphisms (measurement = `collapsing`), which is why a tension between two measurements is a property of the *study*, never of the field.

## Regime → λ (the n-bonacci RG flow)

The four fields are the n-bonacci RG flow run from n=∞ down to its n=2 floor; three of the four λ are *proved* Perron eigenvalues (see [`docs/dev/cosmic-regimes-as-nbonacci-rg-flow`](docs/dev/cosmic-regimes-as-nbonacci-rg-flow.md)).

| field | regime | κ band | λ (n-bonacci) | physics |
|---|---|---|---|---|
| **informational-spacetime** | aperiodic | κ ≥ ω₁ | → 2 (λ_∞, RG fixed point) | information ("it from bit"); the studied whole |
| **quantum-spacetime** | transfinite | ω<κ<ω₁ | tribonacci ≈ 1.839 (λ_3) | quantum mechanics (the value-free substrate) |
| **classical-spacetime** | scott | κ = ω | golden φ ≈ 1.618 (λ_2) | natural existence as we experience it now — still converging |
| **thermal-spacetime** | finite | κ < ω | plastic ρ ≈ 1.325 (off-sequence) | thermodynamics — heat death |

**The Big Bang** is the quantum → classical step (`collapsing`, λ_3 → λ_2, tribonacci → golden): classical existence emerging from the quantum substrate — not the aperiodic top, not a κ<ω event.
The Hubble tension is then **intra-classical** (intra-scott): the CMB (early) and the present (later) read the one golden-φ spiral at different stages — a stage offset, not a band mismatch.
