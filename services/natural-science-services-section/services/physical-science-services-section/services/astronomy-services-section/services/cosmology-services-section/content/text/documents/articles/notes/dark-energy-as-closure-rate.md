---
type: conjecture
status: open
depends-on: [cosmological-settling, dark-sector-fiber, dark-energy, accelerating-expansion]
title: Dark energy as closure rate
description: Conjecture.
---

# Dark energy as closure rate

**Conjecture.** In the [cosmological settling](../objects/cosmological-settling.md), the [accelerating expansion](../../../../../../../content/text/glossary/terms/accelerating-expansion.md) attributed to [dark energy](../../../../../../../content/text/glossary/terms/dark-energy.md) is the macroscopic projection of a structural property of the closure-rule system: the rate at which the cosmological settling fires closure rules globally is asymptotically constant rather than decaying with cosmic-time-dilution of the matter density.

Operationally: define the **global closure rate** $\Gamma_{\mathrm{cl}}(t)$ of the cosmological settling at cosmic time $t$ as the expected number of closure-rule firings per unit comoving volume per unit cosmic time.
The conjecture is that

$$\lim_{t \to \infty} \Gamma_{\mathrm{cl}}(t) > 0,$$

and that this asymptotic floor is identified with the cosmological constant $\Lambda$ via

$$\Lambda = \frac{8\pi G}{c^4} \cdot \rho_{\mathrm{cl}}, \quad \rho_{\mathrm{cl}} := \frac{\hbar \Gamma_{\mathrm{cl}}^\infty}{V_{\mathrm{Planck}}}$$

(modulo constant factors fixing the dimensional analysis).

## Why this is plausible

The matter sector's contribution to $\Gamma_{\mathrm{cl}}$ dilutes as $a^{-3}$ (matter density goes down as the universe expands).
The radiation sector dilutes as $a^{-4}$.
A floor on $\Gamma_{\mathrm{cl}}$ must come from a non-diluting source.
The standard candidate — vacuum energy — is interpreted in the predicated framing as a closure rule that fires at every spacetime event regardless of matter content: a "vacuum closure" that produces $\bot \to (\mathbf{t}, \mathbf{f})$-pair predications at every cell at a constant per-volume rate.

This identification has two appealing features:

1. **It connects the cosmological constant to the closure-rule system rather than to a vacuum field.** Avoids the worst-prediction-in-physics problem of computing $\Lambda$ from quantum-field-theory vacuum energy: $\Lambda$ here is a property of the *rule system*, not a ground-state energy.
2. **It predicts that $\Lambda$ is constant in cosmic time.** A property of the closure-rule system (the rule is or isn't there; it fires or doesn't fire at every event uniformly) does not evolve.
  This matches the equation-of-state $w = -1$ that current observations strongly favor for $\Lambda$.

## Why this is unproven and possibly wrong

The conjecture currently has no derivation.
It is a suggestive identification, not a calculation.
Concretely:

- The "vacuum closure rule" has not been written down explicitly; it would need to fire on a universal predicate that holds at every cell, which is a non-trivial categorical construction.
- The connection between $\Gamma_{\mathrm{cl}}^\infty$ and $\Lambda$'s observed value would require a derivation of the proportionality constant — which is precisely what fails in standard QFT vacuum-energy calculations.
  There is no a priori reason the predicated framing escapes this problem.
- Alternative dark-energy models (quintessence, modified gravity) would have $w \ne -1$ and would correspond to a $\Gamma_{\mathrm{cl}}$ that does evolve with cosmic time — distinguishable in principle, but not in a way that obviously favors the closure-rate framing over the standard one.

The conjecture is filed here as a structurally interesting hypothesis that the predicated framing makes phrasable, not as a settled claim.
Its testability depends on first executing the [cosmological-settling](../objects/cosmological-settling.md)'s closure-rule construction; without that, the conjecture is a name attached to a hope.

## Status

Open.
This is the predicated reframing of "why is the cosmological constant small but nonzero?"
The reframing does not answer it; it relocates the question.
Whether the relocation is productive — whether closure-rule rates are easier to compute or constrain than vacuum energies — is itself an open question.
