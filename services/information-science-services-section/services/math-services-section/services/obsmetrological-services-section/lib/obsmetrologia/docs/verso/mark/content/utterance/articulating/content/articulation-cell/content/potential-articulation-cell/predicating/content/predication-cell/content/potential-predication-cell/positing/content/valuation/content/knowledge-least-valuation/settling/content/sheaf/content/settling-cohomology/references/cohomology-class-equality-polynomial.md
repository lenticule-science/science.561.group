---
kind: theorem
status: proved
depends-on: [settling-cohomology, finite-settling-h0-polynomial-time, strict-regime-cohomology-vanishing]
---

# Cohomology class equality in polynomial time (strict regime)

For finite knowledge presheaves in the [strict regime](strict-regime-cohomology-vanishing.md), equality of cohomology classes in $H^0$ and $H^1$ of the [settling-associated sheaf](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/apps/agent-organization-engine/lib/relating/docs/settling-associated-sheaf.md) is decidable in time polynomial in the encoded parameters.

## Proof

**$H^0$ equality.** A class in $H^0$ is the set of designated cells at quiescence, computable in polynomial time by [finite-settling $H^0$](finite-settling-h0-polynomial-time.md).
Equality is set equality — linear in the cell count.

**$H^1$ equality.** In the strict regime, $H^1 = 0$ identically by [strict-regime cohomology vanishing](strict-regime-cohomology-vanishing.md), so any two classes are trivially equal.

For the underlying linear-algebra check (when working at finite truncations of richer regimes, before invoking the vanishing theorem), $H^1$ equality reduces to solving a linear system over $\mathbb{Z}$: $[\omega] = [\omega']$ iff $\omega - \omega'$ is a coboundary, iff there exists a 0-cochain $\lambda$ with $d\lambda = \omega - \omega'$.
This is a $\mathbb{Z}$-linear-system solvability question, decidable via Smith normal form — [@storjohann1996] gives the standard polynomial bound.
The matrix sizes are bounded by the cover and cell counts, polynomial in $(|\mathbf{L}|, |E|, |\mathcal{C}|)$. $\square$
