---
kind: concept
type: entropy-invariant
symbol: "S_L"
depends-on: [settling-cohomology, coordination-cohomology, four-regime-dichotomy, edge-colouring-entropy]
see-also: [stochastic-settling, detailed-balance, lorentzian-causal-settling]
---

# Landauer entropy

**Landauer's principle** — erasing one bit of information costs `kT ln 2` of entropy, while
*reversible* (information-preserving) operations are thermodynamically free — has a precise home in
the settling cohomology: it is the **thermodynamic name of the coordination obstruction `Ȟ¹`**.

The deep content of Landauer is **irreversibility ⟺ entropy generation**, and that is the
reversibility structure the settling already carries, at two levels that are the same statement.

## Incidence: `Ȟ¹` is the Landauer entropy

The Möbius orthogonality `μ * ζ = δ` makes the down-summation `ζ` (accumulate the past) *invertible*:
`μ` recovers what `ζ` summed away. An invertible settling loses no information — it is **Landauer-free**.
Where the inversion fails — the coordination cohomology `Ȟ¹ ≠ 0`, a cyclic (non-forest) cover nerve —
information is irreversibly lost, one bit per independent cycle. So the **Landauer entropy in bits is
the cycle rank `Ȟ¹`**:
$$S_L(N) \;=\; \mathrm{rank}\,\check H^1(N) \;=\; |E| - (|V| - |C|),$$
the coordination cost. It vanishes exactly when the nerve is a forest — the reversible,
coordination-free case. *(Built+green: `Landauer.landauerBits`, `landauer_zero_iff_reversible`
(`= h1_vanishes_iff_forest` read thermodynamically), `landauer_eq_coordination_cost`.)* Each erased
bit is the `edge-colouring-entropy` quantum — one properly-2-coloured edge, `kT ln 2`.

## Stochastic: detailed balance is Landauer-free

The same principle for the [stochastic settling](../../../../../continuous-valued-settling/content/stochastic-settling/stochastic-settling.md):
a **detailed-balance (reversible)** kernel — `π(z)·P(z,o) = π(o)·P(o,z)` — produces no entropy, so its
distribution is a stationary settling fixed point with no obstruction. Reversibility is exactly the
zero-entropy-production condition; deviation from detailed balance is the Landauer cost per step.
*(Built+green: `Landauer.reversible_is_landauer_free`.)*

## The regime reading

Landauer entropy stratifies by the [four regimes](../../../../../../references/four-regime-dichotomy.md):
`Ȟ¹ = 0` in the **strict** and **Scott** regimes (reversible, Landauer-free) and is alive in the
**transfinite-bounded** and **aperiodic** regimes. The aperiodic sector — no global time function —
is where the settling is genuinely irreversible: the *arrow of time* is the Landauer entropy
production, and the un-recoverable residue `Ȟ¹` is the cost of that arrow. This is the same
obstruction that, in the [Lorentzian setting](../../../../../lorentzian-causal-settling/lorentzian-causal-settling.md),
marks the horizon sector — Landauer entropy and horizon (Bekenstein–Hawking) entropy as one
boundary-information count.

## Maturity

The identification `Ȟ¹ = S_L` (entropy = cohomological obstruction, in bits) and the
reversible⟺Landauer-free equivalences are **built and green**, resting on the already-proven Möbius
orthogonality, `h1_vanishes_iff_forest`, and the detailed-balance bridge. The `kT ln 2` *physical*
scaling (bits → energy) is the analytic dressing, and the precise tie to horizon entropy is
research-grade — but the discrete claim, that irreversibility *is* the cohomology obstruction, is
exact.
