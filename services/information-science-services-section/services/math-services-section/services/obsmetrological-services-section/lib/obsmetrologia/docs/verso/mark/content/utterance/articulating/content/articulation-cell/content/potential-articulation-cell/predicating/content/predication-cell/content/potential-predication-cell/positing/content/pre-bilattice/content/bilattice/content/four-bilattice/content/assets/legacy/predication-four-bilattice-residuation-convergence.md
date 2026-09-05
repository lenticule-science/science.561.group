---
type: theorem
status: proved
lean:
  - PredicationCategories.Homebrew.Algebra.FOURTheorems.fusion_orbit_step2
  - PredicationCategories.Homebrew.Algebra.FOURTheorems.twResiduum_orbit_step2
depends-on: [four-bilattice, left-multiplication-operator, right-residuation-operator]
---

# Four-bilattice residuation convergence rate

On [$\mathbf{FOUR}$](../objects/four-bilattice.md), for every $a \in \mathbf{FOUR}$ and every starting point $x_0 \in \mathbf{FOUR}$, the orbit $(x_n)$ defined by $x_{n+1} = \mathrm{L}_a(x_n)$ — using the [left multiplication operator](../morphisms/left-multiplication-operator.md) — satisfies $x_2 = x_3$. The same holds for the [right residuation operator](../morphisms/right-residuation-operator.md) $\mathrm{R}_a$.

## Proof

Verified by direct enumeration on the $|\mathbf{FOUR}|^2 = 16$ pairs $(a, x_0)$ for each operator. For each pair, compute $x_1, x_2, x_3$ using the [twist-product fusion](../morphisms/twist-product-fusion.md) formula for $\mathrm{L}_a$ or the [twist-product right residual](../morphisms/twist-product-right-residual.md) formula for $\mathrm{R}_a$ and confirm $x_2 = x_3$. The verification is a finite case-enumeration. $\square$

## Remark

This is a strengthening of the abstract Knaster–Tarski bound for the specific case of $\mathbf{FOUR}$.
