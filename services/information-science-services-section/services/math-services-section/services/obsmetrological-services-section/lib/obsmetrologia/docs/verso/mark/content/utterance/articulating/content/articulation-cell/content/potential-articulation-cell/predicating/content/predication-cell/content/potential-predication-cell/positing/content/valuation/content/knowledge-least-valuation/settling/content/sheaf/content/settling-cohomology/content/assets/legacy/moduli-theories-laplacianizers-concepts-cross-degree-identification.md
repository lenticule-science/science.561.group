---
type: concept
class: structural-feature
depends-on:
- bipartite-multipartition
- hodge-laplacian
see-also:
- stab-codim-formula
- universal-vs-categorical-stratification
- bipartite-multipartition-lattice
references:
- key: barrett2017inverse
  type: article
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

# Cross-degree identification

A block $B$ of a [bipartite multipartition](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/bipartite-multipartition.md) $\Pi$ is **cross-degree** if its per-degree multiplicities $k_n^B$ are nonzero for at least two distinct $n$. Cross-degree identifications are the structural feature of the bipartite extension that has no analog in the univariate Arnold–Weinstein theory.

## Asymmetry: codim vs. stab

A within-$d_n$ block contributing $k_n^B = k$ identifications:
- Codim contribution: $k - 1$.
- Stab contribution: $\binom{k}{2}$ (rotation of the $k$-dim eigenspace inside $C_n$).

A cross-degree block with $k_n^B, k_{n+1}^B \ne 0$ contributing one cross-pair $(k_n^B, k_{n+1}^B) = (1, 1)$:
- Codim contribution: $1$ (one extra eigenvalue equality).
- **Stab contribution: $0$** — there is no within-$C_n$-versus-within-$C_{n+1}$ rotation, because chain automorphisms must preserve $d$, forcing block-diagonality between $C_n$ and $C_{n+1}$.

This asymmetry is the structural fingerprint distinguishing the bipartite case from the univariate.

## Geometric origin

The chain auto group $G = \{(g_n) \in \prod_n \mathrm{GL}(C_n) : g_{n-1} d_n = d_n g_n\}$ couples adjacent degrees through the constraint $g_{n-1} d_n = d_n g_n$. On a joint eigenspace $\mathcal E_B = \bigoplus_n \mathcal E_n^B$ where $\mathcal E_n^B \subseteq C_n$ has dim $k_n^B$, the chain constraint forces any element of $G$ that preserves $\mathcal E_B$ to act block-diagonally — independent rotations on each $C_n$ side.

Within-$d_n$ rotations remain free (the chain conditions don't constrain $\mathrm{GL}(\mathcal E_n^B)$ at all when $k_n^B \ge 2$). Cross-$d_n$ rotations between $\mathcal E_n^B$ and $\mathcal E_{n+1}^B$ would mix degrees and are forbidden by the chain conditions.

So: cross-degree identifications produce extra eigenvalue equalities (codim) but cannot produce extra eigenspace rotations (stab).

## Hodge supersymmetric isospectrality

Cross-degree identifications between adjacent operators are *forced* by the Hodge identity: nonzero eigenvalues of $\Delta_n = d_n^* d_n + d_{n+1} d_{n+1}^*$ in the $\mathrm{im}\,d_n^*$-piece coincide with nonzero eigenvalues of $\Delta_{n-1}$ in the $\mathrm{im}\,d_n$-piece. So among cross-degree blocks, the "forced" ones are those between adjacent degrees, and the "non-forced" ones are between non-adjacent degrees.

For chain complexes of length 2, all cross-degree identifications are between adjacent degrees and thus Hodge-forced. For chain complexes of length $\ge 3$, non-adjacent cross-degree identifications give genuinely new structural data not present in the univariate case.

## Combinatorial implication

The bipartite multipartition lattice is the partition lattice of $[N_*]$ subject to the chain rank constraint. The Hodge-forced identifications constrain which bipartite multipartitions are realized: the *minimum* multipartition $\Pi_{\min}$ (in the absence of any extra eigenvalue coincidences beyond Hodge) has cross-degree blocks $\{(n-1, i), (n, i)\}$ matching the Hodge pairings.

Higher strata refine $\Pi_{\min}$ by additional within-degree or cross-degree mergings.

## Distinct from within-degree degeneracy

In the [@barrett2017inverse] for graphs, the obstruction is to within-degree multiplicity (eigenvalues in a single chain space coinciding). The chain-complex IEP-G inherits these obstructions per-degree (via the [decomposition theorem](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/documents/articles/research-articles/chain-complex-iep-g-decomposition.md)).

But the cross-degree identifications are an *additional* structural object, separate from within-degree multiplicity. Whether they admit independent obstructions (analogous to IEP-G's path-tridiagonal obstruction) is the [cross-degree-realizability open question](questions/cross-degree-realizability.md).
