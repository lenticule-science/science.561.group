---
name: conserving
type: concept
status: sketch
---

The principle that coherence — the total intensity of being's relational consistency — is neither created nor destroyed during transformation, only redistributed through the relational field. Conservation is not imposed from outside; it is implicit in the relational structure.

## Three equivalent formulations

Conservation is expressed three equivalent ways:

1. **Invariance condition.** An observable $I$ is conserved if $I \circ \text{Flow} = I$. What is measured does not change under evolution.
2. **Continuity equation.** For an observable density $\rho$, the change in $\rho$ over time plus the divergence of $\rho$ under Flow equals zero. The total amount of any observable is preserved, only redistributed.
3. **Variational principle.** The relational action $S[F_t, a] = \int \text{coherence intensity on } \text{Env}_F(F_t(a))$ is stationary. The actual evolution extremizes the accumulated self-consistency of the process.

Each expresses, in a different form, that the total intensity of coherence remains constant throughout directed transformation.

## The Noether correspondence

If $S$ is a continuous symmetry of the system — an endofunctor that commutes with [Flow](flow.md) — then there is an associated conserved quantity $I_S(a)$ that remains invariant under Flow. *Every symmetry yields a conservation law.*

This is the relational analogue of Noether's theorem. Here, conservation is not a physical assumption; it follows from the structure of coherent relating. Any consistency in the logic finds expression as a measurable invariant.

## Conservation as redistribution

Flow maintains the total intensity of being while allowing that intensity to move through different forms and regions. No part of relation vanishes; it flows. *Energy*, in this reading, quantifies the deviation from coherence: if a state is fully self-consistent and unchanging, $E(a) = 0$. Conservation of energy expresses constancy of total coherence through transformation.

## Note on formalization

In the Lean development, `IsConserved` is defined as $\text{obs} \circ \text{flow} = \text{flow} \circ \text{obs}$. The theorem `conserved_preserves_fixed` proves that conserved observables preserve flow-fixed states. The Noether correspondence, continuity equation, and variational principle are not yet formalized.
