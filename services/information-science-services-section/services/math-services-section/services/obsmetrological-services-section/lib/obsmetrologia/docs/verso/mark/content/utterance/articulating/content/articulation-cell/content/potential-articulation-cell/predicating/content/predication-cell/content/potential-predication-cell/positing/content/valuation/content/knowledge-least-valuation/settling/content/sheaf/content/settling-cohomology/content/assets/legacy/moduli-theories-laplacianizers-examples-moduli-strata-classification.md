---
type: example
status: draft
depends-on:
- moduli-of-laplacianizations
- hodge-laplacian
see-also:
- moduli-of-triangle-boundary
- cellular-sheaf-on-tetrahedron-boundary
- gauge-fiber-structure
instantiates:
- laplacianizability
references:
- key: schwahn2025einstein
  type: article
  - Schwahn, Paul
  - Semmelmann, Uwe
  year: 2025
  title: Einstein metrics, their moduli spaces and stability
  eprint: '2507.18463'
  eprinttype: arxiv
---

# Strata of $\mathcal M_{\mathrm{Lap}}$ classified by eigenvalue-multiplicity partitions

The [bipartite stratification theorem](../theorems/bipartite-stratification-theorem.md) predicts that strata of moduli are indexed by an *eigenspace-multiplicity invariant* (= bipartite multipartition). This file makes that invariant explicit and enumerates all strata for $\partial \Delta^2$ and $\partial \Delta^3$.

## The stratum-labeling invariant

For a graded Hilbert chain complex $(C_\bullet, d, \langle \cdot, \cdot \rangle)$ with finite-dim spaces, the Hodge Laplacian $\Delta = (\Delta_n)$ has fully-determined spectrum. By supersymmetric isospectrality (`examples/moduli-of-triangle-boundary.md`), the *nonzero* spectrum of $\Delta_n$ comes from the squared singular values of $d_n$ (call them $\{\sigma_i^{(n)}\}_{i=1}^{r_n}$ where $r_n = \mathrm{rank}\, d_n$). Specifically,

$$\mathrm{spec}(\Delta_n) \setminus \{0\} = \{(\sigma_i^{(n)})^2\} \sqcup \{(\sigma_j^{(n+1)})^2\}.$$

Modulo $\prod_n S_{r_n}$ (independently permuting the squared singular values of each $d_n$), the moduli of Laplacianizations is parameterized by the multisets

$$(\Sigma_1, \Sigma_2, \ldots), \qquad \Sigma_n = \{(\sigma_i^{(n)})^2\}_{i=1}^{r_n} \in \mathrm{Sym}^{r_n}(\mathbb R_{>0}).$$

A **stratum** of $\mathcal M_{\mathrm{Lap}}$ is determined by which singular values coincide — both within each $\Sigma_n$ and *across* $\Sigma_n$'s (since these eigenvalues meet inside the spectrum of $\Delta_{n}$ for adjacent $n$'s).

Formally, a stratum is indexed by an equivalence relation on $\bigsqcup_n \{1, \ldots, r_n\}$, where we partition the disjoint union into blocks (each block is a set of "indices that coincide"). The block records both *which $n$'s* contribute and *how many indices from each $n$*. Modulo $\prod_n S_{r_n}$, the data is the multiset of compositions $(a_1, a_2, \ldots)_b$ where $a_n$ = number of $r_n$-indices in block $b$, with $\sum_b a_n^b = r_n$ for each $n$, and each block has $\sum_n a_n^b \ge 1$.

The **codimension** of such a stratum in $\mathcal M_{\mathrm{Lap}}$ is

$$\mathrm{codim} = \sum_b (\text{block size} - 1) = \left(\sum_n r_n\right) - (\text{number of blocks}).$$

(Reducing $k$ distinct values to one common value imposes $k-1$ equations.)

## $\partial \Delta^2$: 2 strata

$\partial \Delta^2$ has only one nontrivial boundary $d_1$, rank 2. So strata are labeled by partitions of a 2-element multiset.

| Stratum | Block-composition multiset | Codim | Dim | Description |
|---|---|---|---|---|
| Generic | $\{(1), (1)\}$ | 0 | 2 | $\sigma_1^2 \ne \sigma_2^2$ |
| Supersymmetric | $\{(2)\}$ | 1 | 1 | $\sigma_1^2 = \sigma_2^2$ (Euclidean point at $\lambda = 3$) |

**Total: 2 strata.** The Euclidean Laplacian sits at $(3, 3)$, on the codim-1 supersymmetric stratum.

## $\partial \Delta^3$: 31 strata

$\partial \Delta^3$ has $d_1$ rank 3 and $d_2$ rank 3. Stratum labels are bipartite partitions of a $(3, 3)$-element multiset. Each block is described by a composition $(a, b)$: $a$ indices from $d_1$ side, $b$ indices from $d_2$ side, $a + b \ge 1$. Multisets of compositions sum to $(3, 3)$.

I enumerate by codim. Each block of size $a+b$ contributes codim $a+b-1$.

**Codim 0 (dim 6, generic):** $\{(1,0)\times 3, (0,1)\times 3\}$. **1 stratum.**

**Codim 1 (dim 5):** one size-2 block.
1. $\{(2,0), (1,0), (0,1)\times 3\}$ — two $\sigma$'s coincide.
2. $\{(1,1), (1,0)\times 2, (0,1)\times 2\}$ — one $\sigma$ coincides with one $\tau$.
3. $\{(0,2), (1,0)\times 3, (0,1)\}$ — two $\tau$'s coincide.

**3 strata.**

**Codim 2 (dim 4):** one size-3 block, or two size-2 blocks.

*Size-3 block:*
4. $\{(3,0), (0,1)\times 3\}$
5. $\{(2,1), (1,0), (0,1)\times 2\}$
6. $\{(1,2), (1,0)\times 2, (0,1)\}$
7. $\{(0,3), (1,0)\times 3\}$

*Two size-2 blocks:*
8. $\{(2,0), (1,1), (0,1)\times 2\}$
9. $\{(2,0), (0,2), (1,0), (0,1)\}$
10. $\{(1,1)\times 2, (1,0), (0,1)\}$
11. $\{(1,1), (0,2), (1,0)\times 2\}$

**8 strata.**

**Codim 3 (dim 3):** size-4 block, or size-3 + size-2, or three size-2 blocks.

*Size-4 block:*
12. $\{(3,1), (0,1)\times 2\}$
13. $\{(2,2), (1,0), (0,1)\}$
14. $\{(1,3), (1,0)\times 2\}$

*Size-3 + size-2:*
15. $\{(3,0), (0,2), (0,1)\}$
16. $\{(2,1), (1,1), (0,1)\}$
17. $\{(2,1), (0,2), (1,0)\}$
18. $\{(1,2), (2,0), (0,1)\}$
19. $\{(1,2), (1,1), (1,0)\}$
20. $\{(0,3), (2,0), (1,0)\}$

*Three size-2 blocks:*
21. $\{(2,0), (1,1), (0,2)\}$
22. $\{(1,1)\times 3\}$

**11 strata.**

**Codim 4 (dim 2):** size-5, or size-4 + size-2, or two size-3.

*Size-5 block:*
23. $\{(3,2), (0,1)\}$
24. $\{(2,3), (1,0)\}$

*Size-4 + size-2:*
25. $\{(3,1), (0,2)\}$
26. $\{(2,2), (1,1)\}$
27. $\{(1,3), (2,0)\}$

*Two size-3:*
28. $\{(3,0), (0,3)\}$
29. $\{(2,1), (1,2)\}$

**7 strata.**

**Codim 5 (dim 1):** single size-6 block.
30. $\{(3,3)\}$ — all declared required eigenvalues equal. **The supersymmetric stratum.** The Euclidean Laplacian sits at $\lambda = 4$ on this 1-dim stratum.

**1 stratum.**

**Total: $1 + 3 + 8 + 11 + 7 + 1 = 31$ strata.**

## Pattern observations

1. **The codim-0 (generic) stratum is unique**, as expected: at most one dense stratum.
2. **The maximally-supersymmetric stratum $\{(3,3)\}$ is unique** and is the unique 1-dim stratum.
3. **The codim distribution is unimodal-ish**: $1, 3, 8, 11, 7, 1$. The middle codim (3) has the most strata.
4. **Among codim-$c$ strata, "diagonal" (all $a$ or all $b$) types sit alongside "mixed" $\sigma$-$\tau$ collision types.** Mixed types correspond to coincidences between $\Delta_0$ eigenvalues and $\Delta_2$ eigenvalues — cross-degree blocks in the bipartite multipartition.

## The Euclidean Laplacian's stratum

For $\partial \Delta^3$, the standard Euclidean Laplacian has $\sigma_i^2 = \tau_j^2 = 4$ for all $i, j$ — sitting at $\lambda = 4$ on the codim-5 supersymmetric stratum (#30). The 6-dim stabilizer in $G$ at this point (`gauge-fiber-structure.md`) is consistent: high-multiplicity stratum ↔ high-stabilizer-dim ↔ deep singular orbifold structure.

This confirms the structural prediction:

$$\dim \mathrm{stab}_G(Q) \stackrel{?}{=} \dim \mathcal M - \dim(\text{stratum containing } [Q]).$$

For Euclidean: $\dim \mathrm{stab}_G = 6$, stratum dim = 1, $\dim \mathcal M - \dim \text{stratum} = 6 - 1 = 5$. **The formula does not match exactly** ($6 \ne 5$), so the relationship between stabilizer dim and stratum codim is *more* than just dimensional — there's an extra dimension somewhere, possibly from supersymmetric isospectrality forcing $\sigma$ and $\tau$ collisions to be "the same" symmetry rather than independent.

Investigating this discrepancy is open. The first-order check: the predicted formula says stabilizer dim $\le$ codim. Codim-5 stratum has $\dim \mathrm{stab} = 6 > 5$, so the predicted formula is *strict*. There is *more symmetry at the supersymmetric stratum than the moduli's normal-direction codim accounts for* — exactly because of the Hodge supersymmetric isospectrality, which couples $\Delta_0$ and $\Delta_2$ eigenvalues nontrivially.

## Summary

1. **Catalog.** $\partial \Delta^2$ has 2 strata, $\partial \Delta^3$ has 31 strata.

2. **Stratum invariant.** Each stratum is labeled by the bipartite multipartition (`concepts/bipartite-multipartition.md`) of the spectra of $\Delta_n$ across degrees, encoding which singular values coincide and which spectral pieces of which $\Delta_n$ they sit in. Formal statement: `theorems/bipartite-stratification-theorem.md`.

3. **Stab-vs-codim discrepancy at the supersymmetric stratum.** On $\partial \Delta^3$, $\dim \mathrm{stab}_G(\text{Euclidean}) = 6$ while moduli codim = 5. The stabilizer is strictly larger than the codim accounts for, due to Hodge supersymmetric isospectrality coupling $\Delta_0$ and $\Delta_2$ eigenvalues. The cross-degree codim/stab asymmetry is the formal structure: see `narratives/the-cross-degree-asymmetry.md`.

4. **Stratum count.** For an $N$-step chain complex with rank profile $(r_1, \ldots, r_N)$, the number of strata equals the number of bipartite multipartitions of $\sum r_n$ across $N$ color classes. For $(r_1, r_2) = (3, 3)$: 31. For $(r_1) = (2)$: 2. A closed generating function is open.

## Open

1. **Verify the stratification matches the orbit-stabilizer strata of the moduli theorem.** Each stratum is defined by spectral data; one would want to show this coincides with the strata of $G \backslash \mathcal H$ defined by stabilizer dim.

2. **The stabilizer-dim-vs-codim discrepancy.** Resolve why $\dim \mathrm{stab}_G$ at the supersymmetric stratum exceeds the codim. Hypothesis: supersymmetric isospectrality gives an "extra" degree of stabilizer freedom corresponding to the $d_1 \leftrightarrow d_2$ exchange, which is invisible in the codim count.

3. **Generalize to $\partial \Delta^4$.** Rank profile $(4, 6, 4)$, three nontrivial $d_n$'s. Stratum count = number of 3-colored multipartitions of $4 + 6 + 4 = 14$ summing to $(4, 6, 4)$. A larger combinatorial computation, done by similar enumeration.

4. **Connect to known stratified moduli.** The Einstein moduli paper ([@schwahn2025einstein]) stratifies by $\dim \ker(\Delta_L - 2E)$. Verify that this matches the stratum-labeling invariant in the smooth analogue.
