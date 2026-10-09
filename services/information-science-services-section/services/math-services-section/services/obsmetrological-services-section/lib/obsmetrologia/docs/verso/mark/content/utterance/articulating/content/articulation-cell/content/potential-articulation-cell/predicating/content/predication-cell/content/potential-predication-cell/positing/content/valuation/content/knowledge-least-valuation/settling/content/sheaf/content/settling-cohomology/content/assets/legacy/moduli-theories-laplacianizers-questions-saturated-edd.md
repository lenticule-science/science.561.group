---
type: question
status: open
explores: [bipartite-distance-degree, hilbert-degeneracy-stratification, stratification-i, stratification-ii]
---

# What is the SPD-interior-saturated EDD on the (2,1) chain?

The Euclidean Distance Degree of $V(\Pi_A)$ on the $(2, 1)$ chain complex was computed in M2 to be 40 ([example](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/documents/articles/teaching-articles/examples/edd-computation-on-2-1-chain/edd-computation-on-2-1-chain.md)). The expected value from the bipartite multinomial $\binom{r_1+r_2}{r_1, r_2} = \binom{3}{2, 1} = 3$ — or more conservatively from the free-bipartite Bik–Draisma analog — was much smaller.

The discrepancy is explained by [Stratification II](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/stratification-ii.md): EDD = 40 is computed in the algebraic ambient $\overline{\mathcal H}$ and includes critical points at the SPD-cone boundary ($\det Q_n = 0$ degenerations). The intrinsic EDD restricted to the SPD interior $\mathcal H$ would saturate away these boundary contributions.

## Question

Compute the **saturated EDD**: the EDD of $V(\Pi_A) \cap \mathcal H$ in the SPD interior, equivalently the EDD of $V(\Pi_A)$ saturated by the determinants $\det Q_0 \cdot \det Q_1 \cdot \det Q_2$.

Conjecturally, this saturated EDD equals 1 (matching the bipartite multinomial in the free-bipartite ambient), or some other clean small number explainable from intrinsic bipartite multipartition data.

## Status

- M2 computation attempted; Gröbner basis blew up. The saturated ED ideal couldn't be computed by direct elimination.
- Singular locus of $V(\Pi_A)$ identified as 5 components: 1 likely Stratification-I ($V(\Pi_T)$), 4 Stratification-II contributions matching the boundary structure ([entry](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/documents/articles/teaching-articles/examples/edd-computation-on-2-1-chain/edd-computation-on-2-1-chain.md)).

## Approaches to try

1. **Decompose into prime components**. The 5 singular components have specific dims/degrees. Each can be analyzed separately for its EDD contribution. Sum the Stratification-I contribution to get the saturated EDD.

2. **Symbolic EDD on the saturated ideal**. Possibly tractable if the saturation produces a smaller ideal whose Gröbner basis is computable.

3. **Numerical EDD via random distance**. Sample random points in $\mathcal H$ at varying distance to $V(\Pi_A) \cap \mathcal H$, count critical points. Statistical lower bound on the saturated EDD.

4. **Hand-computation on the free-bipartite analog**. The bipartite Bik–Draisma multinomial conjecture says EDD of $V(\lambda) \subseteq \mathrm{Sym}^+_{r_1} \times \mathrm{Sym}^+_{r_2}$ in the *unconstrained* free-bipartite ambient (no chain coupling) is $\binom{r_1+r_2}{r_1, r_2}$. Verify this on small cases by hand. If it holds, the chain-coupled EDD is the free-bipartite EDD plus boundary contributions.

## Why this matters

A clean saturated EDD formula would:
- Recover the bipartite Bik–Draisma multinomial as the SPD-interior EDD.
- Identify the EDD = 40 result as 1 (Stratification-I) + 39 (Stratification-II + mixed strata).
- Confirm the dual-stratification framework's quantitative predictions.

If the saturated EDD is *not* the bipartite multinomial, this signals additional structural content — Stratification-I has more critical points than the free-bipartite case predicts, suggesting the chain-coupling itself contributes to interior EDD.

## Generalization

Compute saturated EDD on:
- $(3, 2, 1)$ or other chain rank profiles.
- $\partial \Delta^k$ for small $k$.

Look for a closed-form pattern across cases. If it matches a chain-complex-aware multinomial formula, that's the chain-complex Bik–Draisma analog. If not, isolate what extra structure the chain-coupling contributes.

## Connection to bipartite Vassiliev

EDD is one numerical invariant of $V(\Pi)$; its cohomology is the structural object. Once the bipartite Vassiliev spectral sequence is established ([related question](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/documents/articles/research-articles/questions/e2-degeneration-bipartite-vassiliev.md)), the cohomology of $V(\Pi)$ — possibly including Stratification-II boundary contributions — can be computed and compared to the EDD count via Euler-characteristic considerations.
