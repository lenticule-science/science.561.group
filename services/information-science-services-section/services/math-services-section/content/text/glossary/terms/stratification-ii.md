---
term-kind: object
class: stratification
depends-on: [pataki-rank-stratum, schubert-invariant, hilbert-structure-cone]
see-also: [stratification-i, hilbert-degeneracy-stratification]
classical-anchor: [pataki-cone-lp]
---

# Stratification II (Hilbert degeneracy)

The boundary stratification of $\overline{\mathcal H}$ (and its image in $\overline{\mathcal M_{\mathrm{Lap}}}$) by Pataki rank tuples and chain-complex Schubert refinements.

## Definition

The decomposition
$$\overline{\mathcal H} = \bigsqcup_{\mathbf r, \sigma} \mathrm{Stratum}_{\mathrm{II}}(\mathbf r, \sigma)$$
where:
- $\mathbf r = (r_0, \ldots, r_N)$ ranges over rank tuples with $0 \le r_n \le m_n$ (the [Pataki coarse stratum](./pataki-rank-stratum.md) labels).
- $\sigma = (a_n, z_n, k_n)_n$ ranges over [Schubert invariant](./schubert-invariant.md) tuples consistent with $\mathbf r$.

Stratification II records how each $Q_n$ becomes rank-deficient and how its kernel sits relative to the chain filtration.

## Key properties

- **Coarse codim** (Pataki only): $\sum_n \binom{m_n - r_n + 1}{2}$.
- **Refined codim** (with Schubert): adds Grassmannian Schubert codim per degree.
- **Closure poset**: Pataki product chain × Schubert orders, combined.
- **Top stratum**: $\mathbf r = (m_0, \ldots, m_N)$, generic Schubert — equals the SPD interior $\mathcal H$.
- **Bottom stratum**: $\mathbf r = 0$ — equals $\{0\}$.
- **All non-trivial strata** (with at least one $r_n < m_n$): live entirely in the boundary $\partial \overline{\mathcal H}$.

## What it sees

Stratification II depends only on **rank/kernel data** of $Q$ itself — not on the spectral data of $\Delta$. It sees the *embedding* of $\mathcal H$ into the linear ambient $\prod_n \mathrm{Sym}(C_n)$ and how that embedding terminates at the cone boundary.

## Distinct from Stratification I

| Aspect | Stratification I | Stratification II |
|---|---|---|
| Lives in | SPD interior $\mathcal H$ | Boundary $\partial \overline{\mathcal H}$ |
| Indexed by | Bipartite multipartition | Pataki rank + Schubert invariants |
| Depends on | Spectral data of $\Delta$ | Rank/kernel data of $Q$ |
| Closure poset | Bipartite refinement lattice | Pataki chain × Schubert order |
| Intrinsic? | Yes (gauge-invariant) | No (depends on linear ambient) |

A point $Q$ in the SPD interior is in exactly one Stratification-I stratum and the unique Stratification-II "interior" stratum (top Pataki); a boundary point $Q \in \partial \overline{\mathcal H}$ is in exactly one Stratification-II stratum.

## Mixed strata

In the algebraic closure $\overline{\mathcal M_{\mathrm{Lap}}}$, both stratifications meet. **Mixed strata** are loci with both Stratification-I and Stratification-II structure: e.g., a stratum where $Q_1$ is rank-deficient AND the surviving spectrum has a specific multipartition. The (2, 1) chain EDD = 40 computation found 5 singular components: 1 pure Stratification-I (Component 0 = $V(\Pi_T)$ if conjecturally) and 4 Stratification-II (Components 1–4), with Components 1, 3 actually mixed.

The systematic study of mixed strata is [open](../../documents/articles/research-articles/questions/mixed-stratification-strata.md).

## Generalizes Pataki

The classical [Pataki rank stratification](./pataki-rank-stratum.md) of a single SDP cone $\mathrm{Sym}^+_n$ is a special case of Stratification II for a chain complex with a single chain space (no boundary). The chain-complex extension adds: product structure across chain degrees + Schubert refinement by intersection with chain filtration.

## Connection to compactified moduli

A natural compactification of $\mathcal M_{\mathrm{Lap}}$ — call it $\overline{\mathcal M_{\mathrm{Lap}}}$ — adds Stratification II at the boundary. This is a Borel–Serre-style stratified compactification, with the interior carrying Stratification I and the boundary carrying Stratification II. Whether this compactification represents a categorical moduli (functor on graded comm algebras / chain complexes) is open.
