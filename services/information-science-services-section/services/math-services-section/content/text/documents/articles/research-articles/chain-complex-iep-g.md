---
type: theorem
status: proved
depends-on:
- bipartite-realizability
- bipartite-stratification-theorem
see-also:
- iep-g-multiplicity-partitions
- hilbert-degeneracy-stratification
- cellular-sheaf-cofinality
references:
- key: barrett2017inverse
  type: article
  authors:
  - Barrett, Wayne
  - Butler, Steve
  - Fallat, Shaun
  - Hall, H. Tracy
  - Hogben, Leslie
  - Lin, Jephian C.-H.
  - Shader, Bryan
  - Young, Michael
  year: 2017
  title: 'The inverse eigenvalue problem of a graph: Multiplicities and minors'
  eprint: '1708.00064'
  eprinttype: arxiv
---

# Chain-complex IEP-G — realizability under sparsity

The bipartite realizability theorem ([bipartite-realizability](bipartite-realizability.md)) says every multipartition is realized when inner products $Q_n$ are unconstrained in $\mathrm{Sym}^+(C_n)$. **With sparsity** — the natural cellular-sheaf setting where $Q_n$ is restricted to be diagonal in the cellular basis (one positive weight per cell) — realizability becomes substantive. Some bipartite multipartitions are *no longer realizable*, generalizing the classical IEP-G obstructions to chain complexes.

This entry sets up the chain-complex IEP-G program and proves a concrete first obstruction: the **path-complex $P_3$ does not realize its supersymmetric stratum with stalkwise weights**, generalizing the classical IEP-G result that $P_3$ (as a graph) does not realize the all-equal eigenvalue partition.

## Setup

A **cellular chain complex** $(C_\bullet, d)$ has $C_n = \mathbb R^{n_n}$ with a distinguished basis (the $n$-cells of an underlying CW complex). The **stalkwise diagonal cone** is

$$\mathcal H_{\mathrm{diag}} := \{Q \in \mathcal H : Q_n \text{ is diagonal in the cellular basis for every } n\} = \mathbb R_{>0}^{N_{\mathrm{cell}}},$$

where $N_{\mathrm{cell}} = \sum_n n_n$ is the total cell count. Each $Q_n = \mathrm{diag}(w_{1,n}, \ldots, w_{n_n, n})$ assigns a positive weight to each cell.

$\mathcal H_{\mathrm{diag}}$ is a sub-cone of $\mathcal H$ of dimension $N_{\mathrm{cell}}$ (each $Q_n$ has $n_n$ free parameters instead of $\binom{n_n+1}{2}$). The codimension of the embedding $\mathcal H_{\mathrm{diag}} \hookrightarrow \mathcal H$ is $\sum_n \binom{n_n}{2}$ — the off-diagonal entries that are killed.

The cellular automorphism group $G_{\mathrm{cell}} \subset G$ consists of chain automorphisms preserving the cellular basis (= cellular automorphisms of the underlying CW complex, acting by signed-permutation on each $C_n$). $G_{\mathrm{cell}}$ is *finite* in general, far smaller than $G$.

## Realizability question (chain-complex IEP-G)

For a fixed cellular chain complex $(C_\bullet, d)$ and bipartite multipartition $\Pi$:

> **Question.** Is there $Q \in \mathcal H_{\mathrm{diag}}$ such that the bipartite multipartition $\Pi(Q)$ of the squared singular values of the weighted boundary operators equals $\Pi$?

In contrast to the unconstrained case ([bipartite-realizability](bipartite-realizability.md)), the answer is *not* always yes.

## First obstruction: $P_3$

Consider the simplest non-trivial cellular chain complex: the **path** $P_3$ with 3 vertices $v_1, v_2, v_3$ and 2 edges $e_{12}, e_{23}$.

Univariate rank profile $(r_1) = (2)$, so multipartitions of $\{1, 2\}$:
- $\Pi_0 = \{\{1\}, \{2\}\}$ — generic, $\sigma_1^2 \neq \sigma_2^2$.
- $\Pi_T = \{\{1, 2\}\}$ — supersymmetric, $\sigma_1^2 = \sigma_2^2$.

Boundary operator $d_1: C_1 = \mathbb R^2 \to C_0 = \mathbb R^3$ in the cellular basis:
$$d_1 = \begin{pmatrix} -1 & 0 \\ 1 & -1 \\ 0 & 1 \end{pmatrix}, \qquad d_1^T = \begin{pmatrix} -1 & 1 & 0 \\ 0 & -1 & 1 \end{pmatrix}.$$

Stalkwise weights: $Q_0 = \mathrm{diag}(a_1, a_2, a_3)$, $Q_1 = \mathrm{diag}(b_1, b_2)$.

Generalized eigenvalue pencil for the squared singular values of $\widetilde d_1$:
$$\det(d_1^T Q_0 d_1 - \lambda Q_1) = 0.$$

Compute $d_1^T Q_0 d_1$:
$$d_1^T Q_0 d_1 = \begin{pmatrix} -1 & 1 & 0 \\ 0 & -1 & 1 \end{pmatrix} \begin{pmatrix} a_1 & 0 & 0 \\ 0 & a_2 & 0 \\ 0 & 0 & a_3 \end{pmatrix} \begin{pmatrix} -1 & 0 \\ 1 & -1 \\ 0 & 1 \end{pmatrix} = \begin{pmatrix} a_1 + a_2 & -a_2 \\ -a_2 & a_2 + a_3 \end{pmatrix}.$$

Pencil determinant:
$$\det\begin{pmatrix} (a_1+a_2) - \lambda b_1 & -a_2 \\ -a_2 & (a_2+a_3) - \lambda b_2 \end{pmatrix} = b_1 b_2 \lambda^2 - \big[(a_2+a_3) b_1 + (a_1+a_2) b_2\big] \lambda + \big[(a_1+a_2)(a_2+a_3) - a_2^2\big].$$

The two squared singular values are roots; they coincide iff the discriminant vanishes:
$$\mathrm{disc} = \big[(a_2+a_3) b_1 + (a_1+a_2) b_2\big]^2 - 4 b_1 b_2 \big[(a_1+a_2)(a_2+a_3) - a_2^2\big].$$

> **Theorem (P_3 obstruction).** For all $a_1, a_2, a_3, b_1, b_2 > 0$, $\mathrm{disc} > 0$. Equivalently, the supersymmetric stratum $\Pi_T$ is *not realizable* by stalkwise diagonal weights on the $P_3$ chain complex.

**Proof.** Set $\alpha = a_2 + a_3$, $\beta = a_1 + a_2$, $\gamma = (a_1+a_2)(a_2+a_3) - a_2^2$. Note all of $\alpha, \beta > 0$ (sums of positive reals) and $\gamma = \alpha \beta - a_2^2$. Also $\gamma > 0$ since $\alpha \beta = (a_1+a_2)(a_2+a_3) \ge a_2^2 + (\text{positive cross terms}) > a_2^2$.

The discriminant becomes
$$\mathrm{disc} = (\alpha b_1 + \beta b_2)^2 - 4 b_1 b_2 \gamma = \alpha^2 b_1^2 + 2 \alpha\beta b_1 b_2 + \beta^2 b_2^2 - 4 b_1 b_2 (\alpha\beta - a_2^2)$$
$$= \alpha^2 b_1^2 - 2 \alpha\beta b_1 b_2 + \beta^2 b_2^2 + 4 a_2^2 b_1 b_2 = (\alpha b_1 - \beta b_2)^2 + 4 a_2^2 b_1 b_2.$$

Both terms are non-negative for positive weights, and $4 a_2^2 b_1 b_2 > 0$ strictly (since $a_2, b_1, b_2 > 0$). So $\mathrm{disc} > 0$ strictly. The roots are always distinct. $\square$

Hence the supersymmetric stratum $\Pi_T = \{\{1,2\}\}$ is **never realized** by stalkwise diagonal weights on the $P_3$ chain complex. The only realizable multipartition is $\Pi_0$ (generic).

## Generalization to $P_n$

The $P_3$ obstruction extends to all paths $P_n$ (path with $n$ vertices, $n-1$ edges) via a classical structural fact about tridiagonal matrices.

**Setup for $P_n$.** Cells: vertices $v_1, \ldots, v_n$, edges $e_i = (v_i, v_{i+1})$ for $i = 1, \ldots, n-1$. Boundary $d_1: C_1 = \mathbb R^{n-1} \to C_0 = \mathbb R^n$ has matrix entries $d_1[v_j, e_i] = -\delta_{ij} + \delta_{i+1,j}$. With stalkwise weights $Q_0 = \mathrm{diag}(a_1, \ldots, a_n)$, $Q_1 = \mathrm{diag}(b_1, \ldots, b_{n-1})$:

$$d_1^T Q_0 d_1 = \begin{pmatrix} a_1 + a_2 & -a_2 & & & 0 \\ -a_2 & a_2 + a_3 & -a_3 & & \\ & -a_3 & a_3 + a_4 & \ddots & \\ & & \ddots & \ddots & -a_{n-1} \\ 0 & & & -a_{n-1} & a_{n-1} + a_n \end{pmatrix}$$

— a *tridiagonal* $(n-1) \times (n-1)$ symmetric matrix. The pencil $(d_1^T Q_0 d_1, Q_1)$ has generalized eigenvalues equal to the eigenvalues of $Q_1^{-1/2} (d_1^T Q_0 d_1) Q_1^{-1/2}$, which is also tridiagonal (conjugation by diagonal preserves tridiagonality), with off-diagonal entries $-a_{i+1}/\sqrt{b_i b_{i+1}} \ne 0$ for all $i$ (since $a, b > 0$).

> **Classical fact (Sturm / Sylvester).** Symmetric tridiagonal matrices with all off-diagonal entries nonzero (= *irreducible tridiagonal*) have all eigenvalues distinct.

(Proof: the principal-minor sequence forms a Sturm sequence, and Sturm's theorem gives interlacing of eigenvalues at adjacent sizes, which forces simplicity.)

> **Theorem ($P_n$ obstruction).** For the cellular chain complex of $P_n$ ($n \ge 2$), with stalkwise positive weights, the squared singular values of $\widetilde d_1$ are always all distinct. Hence the only realizable bipartite multipartition is the *generic* one $\{(1), (1), \ldots, (1)\}$ — every multipartition with at least one block of size $\ge 2$ is unrealizable.

This is the chain-complex analog of the classical IEP-G result: paths realize only the all-distinct multiplicity partition.

## Contrast: cycles realize supersymmetric

Paths obstruct supersymmetric. **Cycles do not.** This shows the chain-complex IEP-G obstructions are not just about the chain complex's algebraic data, but about the *combinatorial topology* of the underlying CW complex.

**$C_3$ example.** The cycle on 3 vertices, 3 edges. $C_0 = \mathbb R^3, C_1 = \mathbb R^3$, $r_1 = 2$ (with $H_0 = H_1 = \mathbb R$).

Boundary $d_1$ in cellular basis: column $i$ is $-e_i + e_{i+1 \mod 3}$. With uniform stalkwise weights $a_1 = a_2 = a_3 = a$, $b_1 = b_2 = b_3 = b$:

$$d_1^T Q_0 d_1 = a \begin{pmatrix} 2 & -1 & -1 \\ -1 & 2 & -1 \\ -1 & -1 & 2 \end{pmatrix} = a (3I - J)$$

(where $J$ is all-ones $3 \times 3$). With $Q_1 = bI$, the pencil reduces to $\det(M - \lambda b I) = b^3 \det((a/b)(3I - J) - \lambda I)$. The matrix $3I - J$ has eigenvalues $0, 3, 3$ (the $0$-eigenvector is $(1,1,1)$; the $3$-eigenspace is 2-dim, namely $\mathbf{1}^\perp$). So the squared singular values are $\sigma_1^2 = \sigma_2^2 = 3a/b$ — **the supersymmetric stratum is realized** at uniform weights.

The structural reason: the cycle has a $\mathbb Z_3$-rotational symmetry that paths lack. The 3-fold symmetry of $C_3$ forces the irrep-decomposition of $\Delta_0|_{\mathbf{1}^\perp}$ into a 2-dim irrep that acts as a scalar — giving the multiplicity-2 nonzero eigenvalue.

So **graph topology (path vs. cycle vs. tree vs. ...) controls which multipartitions are realizable**. This is the substantive content of chain-complex IEP-G beyond the unconstrained baseline.

**General prediction.** A cellular chain complex realizes more multipartitions when its CW complex admits more *symmetry*. The full classification (which CW topologies realize which multipartitions) generalizes the classical IEP-G theory — Barrett–Fallat-style realizability for graphs — to chain complexes. Open.

## Connection to univariate IEP-G

The classical IEP-G ([@barrett2017inverse]) studies symmetric matrices $A$ with off-diagonal sparsity matching a graph $G$, asking which multiplicity partitions of the eigenvalues of $A$ are realized.

For $G = P_3$, the matrices have form
$$A = \begin{pmatrix} a_1 & d_{12} & 0 \\ d_{12} & a_2 & d_{23} \\ 0 & d_{23} & a_3 \end{pmatrix}$$
(tridiagonal). The classical result is that $A$'s eigenvalues are always *all distinct*: the eigenvalue partition $(1,1,1)$ is the only realizable one for $P_3$. The all-equal partition $(3)$ is *not* realized (would require $A = \lambda I$, impossible with off-diagonal $d_{ij} \neq 0$, which $P_3$'s pattern requires as edges).

**Translation to chain-complex IEP-G.** For the cellular chain complex of $P_3$, the Laplacian $\Delta_0 = d_1 d_1^*$ on $C_0 = \mathbb R^3$ has spectrum $\{0, \sigma_1^2, \sigma_2^2\}$. The chain-complex multipartition is on the *nonzero* spectrum $\{\sigma_1^2, \sigma_2^2\}$ (= squared singular values of $\widetilde d_1$).

- Univariate IEP-G partition $(1,1,1)$ ↔ chain-complex multipartition $\{\{1\},\{2\}\}$ (generic, on the 2 nonzero eigenvalues).
- Univariate IEP-G partition $(2,1)$ — two equal nonzero eigenvalues, one different — ↔ chain-complex multipartition $\{\{1,2\}\}$ (supersymmetric, $\sigma_1 = \sigma_2$).
- Univariate IEP-G partition $(3)$ — all three eigenvalues equal — would require $\Delta_0 = \lambda I$, but $\ker \Delta_0 \ni \mathbf{1}$ is fixed, so $\lambda = 0$, contradiction (no positive $\lambda$). Not relevant in the chain-complex framework.

The classical IEP-G result that $P_3$ doesn't realize $(3)$ corresponds to: *and* it doesn't realize $(2,1)$, because both nonzero eigenvalues equal would require the discriminant of the pencil to vanish, which the proof above shows is impossible.

So the chain-complex IEP-G obstruction we proved (no $\Pi_T$ for $P_3$ chain complex) is *consistent with and refines* the univariate IEP-G: in the chain-complex-with-stalkwise-weights framework, the obstruction is sharper because the form of $A = d_1 \widetilde d_1^*$ has further structure beyond mere tridiagonality.

## What this establishes

1. **Chain-complex IEP-G is non-vacuous.** The realizability question with sparsity has substantive content: not all multipartitions are realizable. The P_3 example demonstrates a concrete obstruction.

2. **The unconstrained realizability theorem ([bipartite-realizability](bipartite-realizability.md)) is necessary.** Without that result, we wouldn't know that the *abstract* multipartition lattice is fully populated — the obstructions seen here come specifically from the sparsity constraint, not from the chain complex's intrinsic structure.

3. **The closure poset structure ([closure-poset-of-strata](closure-poset-of-strata.md)) refines IEP-G's notion of "realizable."** Each realizable multipartition has a non-empty stratum in moduli; non-realizable ones have empty strata. This gives a stratified perspective on IEP-G's combinatorial question.

## The chain-complex IEP-G program

A full chain-complex IEP-G program would address:

- **Chain-complex SSP and SMP.** The classical Strong Spectral Property and Strong Multiplicity Property in IEP-G are tools for proving realizability under sparsity. The chain-complex analogs would involve transversality of the stalkwise-weight map $\mathcal H_{\mathrm{diag}} \to (\text{spectral data})$.

- **Minor monotonicity.** A *cellular sub-complex* $X' \subset X$ (e.g., removing a cell) has its own chain-complex IEP-G. Realizability should be monotone under sub-complex relations: if $X'$ realizes $\Pi$, does $X$ realize an "extension" of $\Pi$?

- **Cellular automorphism action.** $G_{\mathrm{cell}}$ acts on $\mathcal H_{\mathrm{diag}}$. The realizability question modulo this action is the natural one, since it's invariant under relabeling cells.

- **Closed-form characterization for small complexes.** For $\partial \Delta^n$ (regular polytope boundaries), $K_n$ (complete graphs), $P_n$ (paths), etc., explicitly determine which bipartite multipartitions are realizable.

These directions parallel the classical IEP-G program (Barrett, Fallat, Adm, Hall, Hogben, et al.) translated to the chain-complex setting.

## Open

1. **$P_n$ realizability.** Generalize the $P_3$ obstruction to longer paths: which multipartitions are realizable for $P_n$'s cellular chain complex?

2. **Cycle complex $C_n$.** A cycle (closed loop) has $C_0 = \mathbb R^n, C_1 = \mathbb R^n$ with $d_1$ rank $n-1$ ($H_0 = \mathbb R$). What multipartitions are realizable?

3. **2-dim complexes.** The first genuinely bipartite case: a 2-complex with $C_0, C_1, C_2$ all nonzero. The bipartite multipartition lattice is now non-trivial. Realizability picks up cross-$d$ structure.

4. **Realizability and cellular-sheaf cofinality** ([cellular-sheaf-cofinality](cellular-sheaf-cofinality.md)). The cellular-sheaf framework says all combinatorial Laplacianizations factor through sheaves on posets. If realizability obstructions are intrinsic to the cellular setup, they should reflect the sheaf-on-poset structure as well.

## Synthesis with realizability and stratification

Combined with [bipartite-stratification-theorem](bipartite-stratification-theorem.md) and [bipartite-realizability](bipartite-realizability.md):

> Given a cellular chain complex $(C_\bullet, d)$ over $\mathbb R$, $\mathcal M_{\mathrm{Lap}}$ is a real-algebraic orbifold stratified by bipartite multipartitions. The unconstrained moduli has every multipartition realized. The stalkwise-diagonal moduli has realizability constraints that decompose per-degree to univariate IEP-G on the boundary-operator graphs ([chain-complex-iep-g-decomposition](chain-complex-iep-g-decomposition.md)). The univariate case recovers Arnold–Shapiro–Vainshtein–Weinstein and classical Barrett–Fallat IEP-G.
