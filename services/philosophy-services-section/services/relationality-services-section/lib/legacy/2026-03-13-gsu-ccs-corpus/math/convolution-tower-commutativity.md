---
id: convolution-tower-commutativity
name: ConvolutionTowerCommutativity
description: "the history convolution ⊛^(n) at tower level n and ⊛^(n+1) at level n+1 satisfy an interchange law, forcing progressive commutativity of the tower stratification — a tower-level diamond."
---

### Conjecture — Convolution Tower Commutativity {#convolution-tower-commutativity}

#### Setup {#ctc-setup}

The hyperverse tower (§hyperverse-tower) produces a sequence of universes
$R^{(0)}, R^{(1)}, \ldots$ with $R^{(n+1)} = U_{\mathcal{H}}(R^{(n)})$. Each level
carries a history convolution $\bowtie^{(n)}$ on its fiber algebras — the tensor
product-like operation recording how histories compose (§history-convolution). As the
tower ascends, these operations are not independent: $\bowtie^{(n+1)}$ is built from
the fiber structure settled at level $n$.

#### The Conjecture {#ctc-conjecture}

**Conjecture (Convolution Tower Commutativity).** For tower levels $n < m$, the
convolutions $\bowtie^{(n)}$ and $\bowtie^{(m)}$ satisfy an interchange law: for
appropriate fiber elements $a, b, c, d$,
$$
(a \bowtie^{(n)} b) \bowtie^{(m)} (c \bowtie^{(n)} d)
\;=\;
(a \bowtie^{(m)} c) \bowtie^{(n)} (b \bowtie^{(m)} d).
$$

The consecutive case $m = n+1$ is the primary claim: consecutive tower levels
satisfy this interchange. This forces the convolution sequence to become
progressively more commutative as the tower ascends — a phenomenon whose colimit
is the full commutativity of the hyperverse $\mathcal{H} = \varinjlim_n R^{(n)}$.

#### The Tower-Level Diamond {#ctc-diamond}

The interchange law is the content of a diamond at the tower level. Just as the
history monoid $\mathbb{M}(\Sigma, I)$ has the diamond property ([history-monoid](history-monoid.md))
— any two independent one-step rewrites from a common element reach a common
descendant — the tower stratification has an analogous diamond: any two convolution
operations at adjacent levels applied in either order reach the same element.

This is not the history-monoid diamond (which lives within a fixed universe) but a
diamond across tower levels. It asserts that the tower is itself a coherent
rewriting system, with the interchange law as its diamond property.

#### Connection to Emergent Commutativity {#ctc-emergent}

§emergent-commutativity (§emergent-commutativity) describes how the colimit
$E_\infty = \varinjlim_n E_n$ acquires higher commutativity. If the interchange law
holds at every consecutive pair $(n, n+1)$, the colimit inherits full commutativity
by the universal property of the colimit — each step contributes one dimension of
commutativity, and the limit collects all of them.

The conjecture reframes emergent commutativity as a consequence of the tower-level
diamond rather than as an independent phenomenon: the tower is a coherent structure
precisely because it has this interchange property.

#### What Remains to Prove {#ctc-open}

- **Interchange at level (n, n+1)**: a formal proof that consecutive convolutions
  interchange. The proof strategy would express $\bowtie^{(n+1)}$ as a left Kan
  extension of $\bowtie^{(n)}$ along the inclusion $R^{(n)} \hookrightarrow R^{(n+1)}$,
  then use the universal property.
- **Colimit commutativity**: that the interchange at all finite levels implies
  commutativity of $\bowtie^{\mathcal{H}}$ in the colimit $\mathcal{H}$.
- **Strictness**: whether the commutativity at level $n$ is strictly weaker than at
  level $n+1$ — whether the tower-level diamond is a strict hierarchy — or whether
  commutativity stabilizes at some finite level.
