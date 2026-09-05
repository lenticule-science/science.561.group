---
type: reference
key: barrett2017inverse
class: article
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
note: Plus Adm-Fallat-Meagher-Nasserasr-Plosker-Yang (2019, arXiv:1907.11328) on achievable multiplicity partitions, and Ahn-et-al
  (2017, arXiv:1708.02438) on ordered multiplicity for graphs on six vertices — the IEP-G multiplicity-partition program is
  across multiple papers.
anchor: true
status: anchor
---

# IEP-G — Inverse Eigenvalue Problem for Graphs (multiplicity partitions)

A line of work (mainly Barrett, Fallat, Adm, Hall, Hogben, and collaborators) on which **multiplicity partitions** are realizable for symmetric matrices with a prescribed off-diagonal sparsity pattern (a graph $G$). Anchor for the laplacianizers program. Representative papers:

- Inverse Eigenvalue Problem of a Graph: Multiplicities and Minors, arxiv:1708.00064.
- Achievable multiplicity partitions in the inverse eigenvalue problem of a graph, arxiv:1907.11328.
- Ordered multiplicity inverse eigenvalue problem for graphs on six vertices, arxiv:1708.02438.

## Why this is anchoring for laplacianizers

The IEP-G is structurally close to the laplacianizers stratum classification:

- **Setup.** Given a graph $G$ on $n$ vertices, the "matrices realizable on $G$" are real symmetric $n \times n$ matrices whose $(i, j)$-entry (for $i \ne j$) is nonzero iff $\{i, j\}$ is an edge of $G$.
- **Question.** Which **ordered multiplicity lists** (= eigenvalue partitions of $n$) are realizable for matrices in this class?
- **Answer (partial).** Various combinatorial conditions on $G$ control the answer. Tools: Strong Spectral Property (SSP), Strong Multiplicity Property (SMP), and minor-monotonicity arguments.

In the laplacianizers framing, the IEP-G is the **special case** of our stratification when:
- The chain complex is concentrated in a single degree (or two adjacent degrees).
- The relevant "automorphism" structure is the diagonal scaling that doesn't change the graph.

The IEP-G's *realizable* multiplicity partitions are exactly the partitions $\Pi$ for which the stratum $\Pi$ of $\mathcal M_{\mathrm{Lap}}$ is non-empty. Our stratification framework gives a uniform language for this question; the IEP-G provides decades of work on the special case.

## What IEP-G does that we should mimic

1. **Realizability characterization** — for a given chain complex (= graph + extra structure for IEP-G), enumerate which strata are populated. We have the *enumeration* of strata (by combinatorics of bipartite multipartitions); we don't yet have the realizability characterization.

2. **Strong Spectral Property** — a graph $G$ has SSP if there is a matrix on $G$ realizing the *generic* multiplicity partition $(1^n)$ such that small perturbations stay in the realizability class. This is a *transversality condition*, and there's a direct analog for our chain complexes: SSP-of-a-chain-complex would be the existence of a Hilbert structure with all distinct singular values plus transversality of small perturbations.

3. **Strong Multiplicity Property** — analog for multiplicity partition (= for non-generic strata). Direct extension to our framework.

4. **Minor monotonicity** — adding edges to $G$ extends the realizability class. For chain complexes, the analog is: refining the chain complex (adding cells / refining the cell structure) should extend the realizability class.

These are concrete theorems of the IEP-G literature that generalize cleanly to the laplacianizers multipartition framework.

## What's novel in laplacianizers relative to IEP-G

The IEP-G works with a **single matrix** patterned by a graph. The laplacianizers framework works with a **chain complex** of multiple boundary operators. The bipartite-multipartition structure of strata, with cross-$d_n$ identifications contributing differently from within-$d_n$ multiplicities, is specific to the chain-complex setup and is not in the IEP-G literature.

The chain automorphism group $G$ that we quotient by is also more general than the single-matrix automorphism group of IEP-G: it couples across degrees of the chain complex.

So our framework subsumes IEP-G as a single-degree special case while extending it to multi-degree chain complexes.

## Bridges

- To `theorems/cellular-sheaf-cofinality.md` — IEP-G's "graph patterns" become "cellular sheaves on posets" in our framework.
- To `theorems/moduli-of-laplacianizers.md` — IEP-G's realizability question is the per-stratum existence question.
- To Direction B — the SSP/SMP tools generalize to our setting and are the candidate technology.
