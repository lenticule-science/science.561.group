---
kind: theorem
status: proved
depends-on: [settling-cohomology, settling-associated-sheaf, settling-convergence, paraconsistent-settling-associated-sheaf]
---

# Finite-settling $H^0$ in polynomial time

Given a finite knowledge presheaf specified by parameters $(\mathbf{L}, \mathcal{C}, E, \lambda)$ with $\mathbf{L}$, $E$, $\mathcal{C}$ all finite and $\lambda$ a finite ordinal, together with an [increment sequence](../objects/increment-sequence.md) $U$, the zeroth [settling cohomology](../objects/settling-cohomology.md) $H^0(\mathbf{T}^*, \mathcal{F}_U^{(\bullet)})$ is computable in time polynomial in $(|\mathbf{L}|, |E|, |\mathcal{C}|, \lambda)$ for $\bullet \in \{t, k, \top\}$.

## Proof

Compute the settling orbit by transfinite iteration of the [settling endofunctor](../morphisms/settling-endofunctor.md). Each step is polynomial in $(|\mathbf{L}|, |E|, |\mathcal{C}|)$ — closure firing on each fiber algebra is polynomial in the rule count and entity-pair count, and incrementation is cellwise. By [settling convergence](settling-convergence.md) under the finite-Scott-continuous hypotheses, quiescence is reached in at most $O(|\mathbf{L}|^{|E|^2})$ steps; for the polynomial-in-$\lambda$ bound, truncate at the settling-bound $\lambda$.

At quiescence, $H^0$ is the count of designated cells in the settling-associated sheaf — directly readable from the orbit. Counting is linear in the cell count $|\mathcal{C}| \cdot |E|^2$. Total time polynomial in the parameters. $\square$

## Notes

The polynomial bound is in the *encoded* sizes of the parameters; the dependence on $\lambda$ is linear in the encoding length, not in the ordinal value. For Scott-continuous settlings the truncation at $\omega$ is computed lazily — see [Scott-continuous regime MLD-equivalence in polynomial time](scott-continuous-regime-mld-polynomial.md).

The three variants $\bullet \in \{t, k, \top\}$ correspond to the truth-designated, knowledge-designated, and inconsistent cells respectively, each tracked by its own [settling-associated sheaf](../objects/settling-associated-sheaf.md) (or [paraconsistent variant](../objects/paraconsistent-settling-associated-sheaf.md) for $\top$).
