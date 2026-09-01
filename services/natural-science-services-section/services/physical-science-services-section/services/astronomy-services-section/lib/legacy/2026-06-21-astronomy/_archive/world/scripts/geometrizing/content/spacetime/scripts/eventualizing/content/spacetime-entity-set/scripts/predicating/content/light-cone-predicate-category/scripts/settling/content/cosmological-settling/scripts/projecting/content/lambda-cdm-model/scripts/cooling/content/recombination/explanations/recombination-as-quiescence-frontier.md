---
type: theorem
status: sketch
depends-on: [cmb-quiescent-frontier, cosmological-settling, recombination]
---

# Recombination as quiescence frontier

**Statement.** Within the [cosmological settling](../objects/cosmological-settling.md), the photon-electron scattering sub-settling — the family of valuations restricted to predicates of the form $(p_\gamma, \mathrm{scatters\text{-}with}, p_{e^-})$ — reaches [settling quiescence](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-quiescence.md) at cosmic time $t_{\mathrm{rec}} \approx 380{,}000$ years.

After $t_{\mathrm{rec}}$, the photon-temperature predicate's evolution decouples from the electron-density predicate's evolution and is governed only by [redshift reindexing](../morphisms/redshift-reindexing.md). The boundary surface in the [spacetime entity set](../objects/spacetime-entity-set.md) is the **[CMB quiescent frontier](../objects/cmb-quiescent-frontier.md)**, identified with the surface of last scattering of standard cosmology.

## Proof sketch

The closure rule of interest is the Thomson scattering rule:

$$\Gamma_T : (p_\gamma, \mathrm{at\text{-}position}, e) \wedge (p_{e^-}, \mathrm{at\text{-}position}, e) \implies (p_\gamma, \mathrm{scatters\text{-}with}, p_{e^-}) \text{ at } e.$$

The firing rate per unit cosmic time is $\Gamma_T = n_e \sigma_T c$, where $n_e$ is the free-electron number density and $\sigma_T$ the Thomson cross-section. Comparing to the cosmic-time successor rate set by the Hubble parameter, $H(t)$:

- For $t < t_{\mathrm{rec}}$: $\Gamma_T \gg H(t)$. Many scatterings per Hubble time. The cell $(p_\gamma, \mathrm{scatters\text{-}with}, p_{e^-})$ updates at every cosmic-time step. The photon-electron sub-settling is $\leq_k$-jumping rapidly.
- For $t > t_{\mathrm{rec}}$: $\Gamma_T \ll H(t)$. Recombination has converted free electrons to neutral atoms, cutting $n_e$ by orders of magnitude. The cell stops jumping. The sub-settling is at quiescence.

The crossover at $\Gamma_T \sim H(t)$ defines $t_{\mathrm{rec}}$, and the locus in $E_{\mathrm{cos}}$ at this cosmic time is the CMB quiescent frontier. $\square$

## What this is doing for us

Three things the predicated framing makes explicit that the standard formulation leaves implicit:

1. **The CMB is structurally a sub-settling boundary.** Not "the oldest light" as a contingent observation, but the formal completion of a particular sub-settling, derivable from the relative firing rate of the operative closure rule. The predicated framing makes the necessity of a CMB-like observation a consequence of having a closure-rule-driven settling.
2. **Free-streaming is the trivial dynamics of a quiescent fiber.** After $t_{\mathrm{rec}}$, the photon-temperature trajectory is determined only by the [redshift reindexing](../morphisms/redshift-reindexing.md) — a non-firing morphism that just rescales values. This is the predicated content of "photons free-stream after recombination."
3. **The quiescent frontier is the locus of all subsequent observers' shared past.** Every observer at $t > t_{\mathrm{rec}}$ has the frontier in their past light cone. The CMB is universal *because* the quiescence is universal — the closure rule's firing rate dropped below threshold at the same cosmic time everywhere, simultaneously across the comoving slice (under the [cosmological principle](../../../terms/cosmological-principle.md)).

## Status

Sketch. The closure-rule-firing-rate calculation is standard cosmology and the inequality $\Gamma_T \ll H$ for $t > t_{\mathrm{rec}}$ is well-established; the predicated reformulation is a translation, not an independent derivation. Open: the corresponding statement for **decoupling** of neutrinos at $t \sim 1$ s and for **dark-matter freeze-out** at earlier times — both should be sub-settling quiescences, but with different fiber structures (cf. [dark-sector-fiber](../objects/dark-sector-fiber.md)).
