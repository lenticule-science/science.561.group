---
name: Čech Cohomology
aliases: [Cech cohomology, Cech H1, sheaf gluing obstruction]
date-created: 2026-09-03
references:
  cech1932:
    authors: ["Eduard Čech"]
    title: "Théorie générale de l'homologie dans un espace quelconque"
    publication: "Fundamenta Mathematicae"
    year: 1932
  bott-tu1982:
    authors: ["Raoul Bott", "Loring W. Tu"]
    title: "Differential Forms in Algebraic Topology"
    publisher: "Springer (Graduate Texts in Mathematics 82)"
    year: 1982
---

Given a topological space $X$, an open cover $\mathcal{U} = \{U_i\}$, and a
[presheaf](./presheaf.md) $\mathcal{F}$ of abelian groups on $X$, the **Čech complex**
of $\mathcal{U}$ with coefficients in $\mathcal{F}$ is the cochain complex whose degree-$n$
term is

$$C^n(\mathcal{U}, \mathcal{F}) = \prod_{i_0 < \cdots < i_n} \mathcal{F}(U_{i_0} \cap \cdots \cap U_{i_n}),$$

with coboundary maps $\delta : C^n \to C^{n+1}$ given by the alternating sum of
restrictions to the $(n{+}1)$-fold intersections. Its cohomology $\check{H}^n(\mathcal{U},
\mathcal{F})$ (Čech 1932) is the **Čech cohomology** of the cover; taking the limit over
finer and finer covers gives the Čech cohomology $\check{H}^n(X, \mathcal{F})$ of the
space.

The low-degree groups have a direct reading in terms of gluing local data into global
data. $\check{H}^0(\mathcal{U}, \mathcal{F})$ is exactly the group of **global sections**
of $\mathcal{F}$ — the sheaf condition already forces a compatible family of local
sections $\{s_i \in \mathcal{F}(U_i)\}$ agreeing on overlaps to glue uniquely to one
global section, and $\check{H}^0$ recovers that group. $\check{H}^1(\mathcal{U},
\mathcal{F})$ measures the **obstruction to gluing**: a 1-cocycle is a compatible family
of *transition data* on overlaps satisfying the cocycle condition on triple overlaps,
and it represents the coboundary of an honest global choice — i.e. is trivial in
$\check{H}^1$ — exactly when the local data can be corrected, patch by patch, into a
single globally consistent choice. A nonzero class in $\check{H}^1$ is a certificate
that no such correction exists (Bott & Tu 1982, on the Čech-to-de Rham comparison and
gluing).

## In Obsmetrologia

`Obsmetrologia.Cohomology.SettlingCohomologyH1` states its own scope directly: "This
module is the Čech cohomology of the settling-associated sheaf `F_U`... on the
bitopological settling site." It formalizes `H⁰` as a count of designated cells (the
global-section reading above) and `H¹` as the gluing obstruction of local sections over
a cover, with the corpus's load-bearing fact that `H¹ = 0` exactly in the strict and
Scott-continuous [closure-ordinal](./closure-ordinal.md) regimes and can be non-zero
only in the transfinite-bounded and aperiodic regimes.

`Obsmetrologia.QuantumContextuality.CohomologicalContextuality` instantiates the same
Čech machinery at $\mathbb{Z}/2\mathbb{Z}$ coefficients over a **context graph**
(measurements as vertices, measurement contexts as edges) rather than an open cover of a
space: `hasGlobalSection_iff_coboundary` proves that, for a parity measurement scenario
with pairwise contexts, a global section of the empirical model exists iff its target
XOR pattern is a coboundary — an ordinary Čech $H^1$-vanishing criterion specialized to
the discrete cohomology of a graph, with the PR-box's non-coboundary target
(`prBox_hasGlobalSection_iff`) as the concrete non-vanishing witness.

## See also

- [Presheaf](./presheaf.md), [Sheaf](./sheaf.md) — the data Čech cohomology is computed on
- [Closure ordinal](./closure-ordinal.md) — the invariant whose regime determines whether the corpus's settling `H¹` vanishes
