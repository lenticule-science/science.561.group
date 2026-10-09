---
kind: conjecture
type: open-problem
symbol: "\\mathrm{HV}"
depends-on: [sprinkled-causal-set-settling, myrheim-meyer-dimension, causal-dalembertian, einstein-hilbert-action]
see-also: [continuum-lorentzian-limit, landauer-entropy, lorentzian-causal-settling]
---

# Hauptvermutung

The **Hauptvermutung** (the "fundamental conjecture" of causal-set quantum gravity,
[@bombelli-lee-meyer-sorkin1987]): *a causal set that faithfully embeds — by a Poisson
[sprinkling](../sprinkled-causal-set-settling/sprinkled-causal-set-settling.md) — into a Lorentzian
manifold does so into essentially only one, up to approximate isometry.* The discrete order, plus
the counting that fixes volume, determines the continuum geometry uniquely. It is the central
**open** problem of the programme, and the convergence point of this corpus's Lorentzian arc.

## What is green: the testable content

The conjecture's force is that the continuum is *over-determined* by order-intrinsic data. Every
quantity a faithful embedding must reproduce is now built and computed *from the causal order alone*:

- **Dimension.** The [Myrheim–Meyer](../myrheim-meyer-dimension/myrheim-meyer-dimension.md) ordering
  fraction `r(v) = |Apex|/\binom{N}{2}` — `d_MM = f^{-1}(r)`. *(Built+green: `orderingFraction`.)*
- **Volume.** The cardinality `N`; `|E ∩ U|/ρ → Vol(U)`. *(The counting measure.)*
- **Curvature.** The [causal d'Alembertian](../causal-dalembertian/causal-dalembertian.md) on the
  unit field, `□1(x)`, and the [Einstein–Hilbert action](../einstein-hilbert-action/einstein-hilbert-action.md)
  `S = ∑_x □1(x)`. *(Built+green: `localCurvature`, `bdAction`; the Benincasa–Dowker coefficients and
  their moment characterization.)*
- **Topology / obstruction.** The incidence Möbius function `μ` (orthogonality `μ*ζ=δ`, Philip
  Hall's Euler characteristic) and the coordination cohomology `Ȟ¹`. *(Built+green.)*
- **Entropy.** The [Landauer entropy](../../../sheaf/content/settling-cohomology/content/landauer-entropy/landauer-entropy.md)
  `= Ȟ¹` — the irreversibility the arrow of time costs. *(Built+green.)*

These are the **spacetime fingerprint** of the causal order. The "curvature/dimension half" of the
Hauptvermutung — *that the invariants are intrinsic to the order, hence the same for every embedding*
— is exactly this: they are functions of `(E, ≺)` alone, computed with no manifold. So the *necessary*
conditions for embedding-uniqueness are all in hand.

## The discrete uniqueness projection

The corpus *does* prove a discrete projection of the conjecture's uniqueness, on the incidence side: the
order determines its recovered structure **uniquely**. The causal order is the *unique* transitive
closure of its links (`causal_settling_is_transitive_closure`); the Möbius function is the *unique*
inverse of `ζ` (`mobius_orthogonality_causal`, `μ*ζ=δ`); the settling has a *unique* fixed point
(Knaster–Tarski). "The order determines its incidence data uniquely" is the lattice-level rhyme of
"the order determines the continuum uniquely" — the same uniqueness, one regime down.

## What stays open

The Hauptvermutung *proper* — uniqueness of the **continuum manifold** up to approximate isometry —
is genuinely open in the literature and **cannot even be stated** in this corpus's Lean: there are no
Lorentzian manifolds, no approximate-isometry, formalized (that is the honest gap, not a hidden
`sorry`). It is a `conjecture` node, never to be silently upgraded. The path to it runs through the
analytic frontier the green spine stops at: the continuum limit `⟨S⟩ → ∫R√g` (Scott-continuity,
`κ=ω`), the sprinkling-average realization of the BD coefficients, and the faithful-embedding measure
— each flagged roadmap.

## Position

The Hauptvermutung is the capstone the Lorentzian arc points at: dimension, volume, curvature,
topology, entropy — every invariant the continuum must carry, recovered from the bare order. What the
corpus contributes is the **discrete completeness of the fingerprint** and its **discrete
uniqueness**; what remains is the continuum's, and it is honestly the open conjecture.
