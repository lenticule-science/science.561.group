---
name: Relational Physics
description: "The physical reading of a relational field: stable recognitions as states, measurements as observables, flow as evolution, what flow leaves unchanged as invariants. Coherence is conserved and only redistributed, every symmetry that commutes with flow yields a conserved quantity, and settling is gradient flow of a free energy with a Lyapunov function."
aliases: [states and observables, physical reading, conserving, conservation, noether correspondence, relational action]
---
**Relational physics** is the physical reading of a relational field, or of a [profile](profile.md) within one.

- A **state** is a stable recognition of the field.
- An **observable** measures the truth or presence of a recognition within a state.
- **Evolution** is [flow](../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/flow.md): a family of maps carrying a state forward.
- An **invariant** is an observable unchanged by evolution; **reachability** is which states flow can carry a state to.

In the acts derivation these arrive together: observing a recognized observation in a seeded term, systematizing it through a profile, evolving and measuring the profile's physics state, and stabilizing its invariants.

## Conservation

Coherence, the total intensity of a field's relational consistency, is neither created nor destroyed under flow, only redistributed. Three statements of this are equivalent:

- **Invariance.** An observable $I$ is conserved when $I \circ F = I$: what is measured does not change under evolution.
- **Continuity.** For an observable density $\rho$, the change of $\rho$ over time plus its divergence under flow is zero.
- **Variation.** The relational action, the accumulated coherence on the [stable envelope](../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/flow.md) of the evolving state, is stationary: the actual evolution extremizes it.

**The Noether correspondence.** If a symmetry commutes with flow, it yields a quantity conserved under flow: every consistency in the logic shows up as a measurable invariant. Every conserved observable factors through the stable envelope. Energy measures deviation from coherence, zero exactly on the stabilized states, and entropy decreases under iteration until stabilization.

## What Obsmetrologia proves

Settling is gradient flow of a free energy $F = E - T \cdot S$ ([`Dynamics/Flow/FreeEnergyLyapunov.lean`](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/Obsmetrologia/Dynamics/Flow/FreeEnergyLyapunov.lean)). The free-energy deficit is a Lyapunov function that strictly decreases to the unique fixed point, which is an H-theorem for settling (`free_energy_is_lyapunov`); the convergence rate is read off the initial free energy, and in the flat regimes ($H^1 = 0$) the equilibrium is unique.

The Noether correspondence is proved for the ledger's gauge symmetries (`ledger_noether`). The order-preserving generator, negation, conserves every register: flux, commitments, mints and jumps. The order-reversing generator, conflation, conserves none of them. Instead it conjugates the ledger with time reversal: a descent's commitment book read backwards is the anti-descent's mint book.

The general Noether correspondence, the continuity equation and the variational principle are not yet formalized.

## Related

- [Profile](profile.md)
- [Flow](../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/flow.md)
- [Settling](../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/settling.md)
- [Four regimes of natural existence](../../../../../../../natural-science-services-section/content/text/glossary/topics/four-regimes-of-natural-existence.md)
