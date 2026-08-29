---
title: Spectral Structure Plan
description: Describes spectral structures including shadow-class barcodes, relational holography, quantum correspondence, and conservation laws underlying entity observation.
date-created: 2026-04-06
type: note
name: pws-spectral-structure
keywords:
  - spectral-structure
  - shadow-class-barcodes
  - relational-holography
  - quantum-correspondence
  - conservation-laws
  - quasicrystal
specialization: plan
application: world-sim
architecture-note: Application sublocale, not OS infrastructure — see applications-as-sublocales analysis
project: ordering-first-computation
serves-system: fars
work-type: derivation
horizon: month
owner: first-officer
priority: "2"
depends-on: [pws-math-mining]
also-serves:
  - "sunday-funday-sprint: \"Shadow barcodes enrich character sheets beyond simple XP/level\""
  - "fars-architecture-coherence: \"The quasicrystal IS what settled entities look like\""
  - "user-boundary-system: \"The acceptance window IS the boundary between temporary and permanent\""
  - "web-ui-foundation: \"The diffraction spectrum IS the bridge's resonance view\""
---

The spectral structure plan covers the deep mathematical structures that give entities their observable properties — how entities LOOK when examined, what patterns emerge in their settlement, and what physical analogies the algebra produces.

**Shadow-class barcodes:** Each entity's predicates distribute across H*_t / SatShadow / FreeShadow. The distribution IS the barcode — a THREE-dimensional settlement signature (Part 218 correction: TrShadow is empty at fiber level). Different barcodes mean different kinds of entities.

**The quasicrystal:** H*_t is a Fibonacci cut-and-project from ℤ² with acceptance window W = [-1/φ, 1). Inter-point distances L:S in ratio φ. Diffraction spectrum is pure point at ℤ[φ]. Every Bragg peak has a Galois shadow at φ → -1/φ.

**Spectral black holes:** Entities with high defect eigenvalues have "trapped modes" behind a spectral horizon. They evaporate as the tower deepens (Hawking-like). T_H = 1/(2·Tr(δ_t)). Total tunneling energy = initial spectral mass (conservation). Healing = tunneling.

**Noether conservation:** Fiber automorphisms preserve eigenspaces of the defect operator. Conservation laws from symmetry — no metric needed.

**BivSpec:** (gap-size, shadow-type) pairs give strictly finer entity signatures than either component alone.

**Uncertainty:** Can't simultaneously know σ-depth and Δ-depth (R7 orientation). Divination costs memory clarity; reminiscence costs destiny clarity.

**Sheaf erasure code:** The sheaf condition = optimal error correction. Covering families = minimum recovery sets. Planck scale = recovery threshold.

**Instability interval:** [Env_t(a), π_t(a)] brackets every entity between its greatest stable lower bound and least stable upper bound. Width = instability measure.

**The Relational Holograph (Part 286, proved):** The canonical holograph (R, Phase, Stab) is a Chu space: the bulk (the full universe) and the boundary (the settled invariant locale) are each other's observation spaces under a non-degenerate recovery pairing. Self-dual: observing the bulk from the boundary and observing the boundary from the bulk use the SAME pairing. Tower holography: each depth level R_n is the boundary of R_{n+1}. At the fixed point (R = U_G(R)), bulk = boundary — the holograph is complete.

For the world sim: **perception IS holographic projection.** When an entity perceives the world, it's projecting the bulk (the full world-fiber) through the stabilization map onto its invariant locale (what's settled from its perspective). What you perceive IS the boundary of the world you're in. Two entities perceive different boundaries because their invariant locales differ.

The recovery pairing means: from the boundary (what you perceive), you can RECOVER the bulk (what actually exists) — if you know the observation dual. A player who knows both the settled facts (H*) and the observation operators ((H∨)*) can reconstruct EVERYTHING in the world. The Chu construction's self-duality is the mathematical statement that knowing what you see + knowing HOW you see = knowing everything.

**Global quasicrystalline aperiodicity (Part 291, proved):** The invariant sheaf H* is globally aperiodic — no nontrivial automorphism preserves the settled structure. The settled world has no repeating pattern at any scale. This is stronger than the fiber-level quasicrystal result (Part 112): it holds for the ENTIRE sheaf, not just individual fibers.

## Quantum mechanics correspondence (Part 307, mined 2026-04-06)

| QM concept | Relational counterpart |
|---|---|
| Density operator ρ | Fiber element in H*_t normalized by fiber entropy |
| Observable A | Fiber element with spectral decomposition into eigenspaces |
| Unitary evolution U_t | Directed comonad U_G application |
| Born rule | Spectral weight p_{t,λ} = λ · dim(E_{t,λ}) / M_t(δ) |
| Measurement collapse | σ_t acting on fiber element — collapse to σ-stable part |
| Schrödinger picture | Dynamics on fibers via U_G |
| Heisenberg picture | Dual action on observables via observation duality |

Status: stub. The correspondence is numerical/structural, not yet categorical. Connecting to Abramsky-Coecke dagger categories or ZX calculus would make it precise.

## Derivation impossibility — what survives, what fails (Part 326, full detail)

The meet-algebra has NO nonzero diagonal derivations (char ≠ 2). Three-line proof from meet-idempotence. **Universal** — doesn't depend on any specific fiber or axiom.

**Survives (additive structure):** eigenspace decomposition, zero-eigenspace = stable mode sheaf, mode sheaf theorem (conditional on IFC), spectral mass Tr(δ), Hawking operator, all constructions using eigenvalues through traces/sums.

**Fails (multiplicative structure):** graded algebra E_λ · E_μ ⊆ E_{λ+μ}, DG algebra, Künneth formula.

**Replacement:** filtered algebra F^{≤j} · F^{≤k} ⊆ F^{≤min(j,k)}. Meet CONTRACTS eigenvalues: λ_{a∧b} ≤ min(λ_a, λ_b). This is the correct multiplicative relationship.

## Interval Faithfulness Condition (Part 130, mined 2026-04-06)

The IFC states: restriction maps preserve projection-gap intervals BIJECTIVELY. Without IFC, restriction can only SHRINK gaps (λ_{H(f)(a)} ≤ λ_a). The IFC is OPEN — not derived from the eight axioms. It is required for defect operator naturality (the mode sheaf being a genuine sheaf, not just a presheaf).

Also: nuclear depth ≠ interval depth (Part 131). The two concepts coincide only when the fiber is graded by nuclear depth — an open structural condition.
