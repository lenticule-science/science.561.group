---
type: definition
realizes: [cohomological-equivalence]
class: bigraded-cohomology
symbol: "H^{m, n}_{k, t}"
depends-on: [settling-associated-sheaf, paraconsistent-settling-associated-sheaf, inconsistency-sheaf, truth-knowledge-cohomology-long-exact-sequence]
---

# Bigraded settling cohomology

A bigraded refinement of [settling cohomology](settling-cohomology.md) organizing data by (cohomological degree $n$, designation grade $m$), corresponding to the two adjoint systems of the predication hyperdoctrine.

## Bigraded cochain complex

For a predication settling with [paraconsistent settling-associated sheaf](paraconsistent-settling-associated-sheaf.md) $\mathcal{F}_U^{(k)} \cong \mathcal{F}_U^{(t)} \oplus \mathcal{F}_U^{(\top)}$, the **bigraded cochain complex** is

$$C^{m, n}_{k, t}(\mathbf{T}^*, \mathcal{F}_U) \;:=\; \begin{cases} C^n(\mathbf{T}^*, \mathcal{F}_U^{(t)}) & m = 0, \\ C^n(\mathbf{T}^*, \mathcal{F}_U^{(\top)}) & m = 1, \\ 0 & m \geq 2. \end{cases}$$

The horizontal differential $d_h : C^{m, n} \to C^{m, n + 1}$ is the standard cochain differential. The vertical differential $d_v : C^{0, n} \to C^{1, n}$ is the composition $\mathcal{F}_U^{(t)} \hookrightarrow \mathcal{F}_U^{(k)} \twoheadrightarrow \mathcal{F}_U^{(\top)}$ at each $n$.

The **bigraded settling cohomology** is

$$H^{m, n}_{k, t}(\mathbf{T}^*, \mathcal{F}_U) \;:=\; H^n\bigl(H^m\bigl(C^{\bullet, \bullet}_{k, t}(\mathbf{T}^*, \mathcal{F}_U)\bigr)\bigr),$$

equivalently the cohomology of the total complex.

## Two-row collapse

Because the bicomplex has only two non-zero rows ($m = 0, 1$), the total complex is a straightforward mapping cone — see [bigraded cohomology via mapping cone](../theorems/bigraded-cohomology-via-mapping-cone.md).

## Regime specialization

In most consistent examples ([strict and Scott-continuous regimes](four-regime-dichotomy.md) settlings), $\mathcal{F}_U^{(\top)} = 0$ and the bigraded cohomology collapses: $H^{1, n}_{k, t} = 0$ and $H^{0, n}_{k, t} = H^n_t$. In *inconsistent* transfinite-bounded or aperiodic settlings — as arise from contradicting sources merged across many rounds — the bigrading is genuinely 2-dimensional, and both rows carry distinct content.

## Spectral sequences

Two spectral sequences converge to the bigraded total cohomology:

- *Filtration by rows:* $E_2^{p, q}$ computes $H^q(\mathcal{F}_U^{(t)})$ and $H^q(\mathcal{F}_U^{(\top)})$ in separate columns.
- *Filtration by columns:* $E_2^{p, q}$ computes the mapping-cone differential's effect on $H^q$.

Both degenerate at $E_2$ in the two-row case; the total cohomology is determined by the [truth-knowledge cohomology long exact sequence](../theorems/truth-knowledge-cohomology-long-exact-sequence.md) with no higher-page content.
