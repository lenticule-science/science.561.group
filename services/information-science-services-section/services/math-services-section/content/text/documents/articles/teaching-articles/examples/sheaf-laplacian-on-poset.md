---
type: example
status: draft
depends-on:
- hodge-laplacian
- finite-poset
- cellular-sheaf
instantiates:
- laplacianizability
references:
- key: ayzenberg2025sheaf
  type: article
  authors:
  - Ayzenberg, Anton
  - Gebhart, Thomas
  - Magai, German
  - Solomadin, Grigory
  year: 2025
  title: 'Sheaf theory: from deep geometry to deep learning'
  eprint: '2502.15476'
  eprinttype: arxiv
---

# Worked example: sheaf Laplacian on a finite poset

A concrete computation, end to end. Demonstrates the Hilbert-lift framework on the simplest nontrivial case.

## The poset

Let $P$ be the poset of cells of the boundary of a triangle, i.e. the face poset of the simplicial complex $\partial \Delta^2$. Elements: three vertices $v_1, v_2, v_3$, three edges $e_{12}, e_{13}, e_{23}$. Order: $v_i \le e_{ij}$ when $i \in \{$ endpoints of $e_{ij}\}$. So:

$$v_1, v_2, v_3 \;\;<\;\; e_{12}, e_{13}, e_{23}.$$

This is a 1-dimensional poset (all chains have length $\le 1$).

## The sheaf

Define a sheaf $\mathcal F: P \to \mathbf{Vec}_\mathbb{R}$ by:

- $\mathcal F(v_i) = \mathbb{R}^2$ for each vertex (some fixed 2-dim vector space, "the field at this vertex");
- $\mathcal F(e_{ij}) = \mathbb{R}$ for each edge ("the field at this edge");
- restriction map $\mathcal F(v_i) \to \mathcal F(e_{ij})$ given by the linear functional "evaluate the first coordinate" — say $r_{ij}^i: (x, y) \mapsto x$ — for both endpoints.

(This is a small toy sheaf chosen to keep arithmetic manageable.)

## The cochain complex

For a sheaf $\mathcal F$ on a finite poset $P$, the cellular cochain complex is

$$C^k(P, \mathcal F) := \bigoplus_{p_0 < p_1 < \cdots < p_k} \mathcal F(p_k)$$

with coboundary $\delta: C^k \to C^{k+1}$ given by the alternating sum of restriction maps along chain inclusions. For our 1-dim poset only $k = 0, 1$ contribute.

$C^0 = \mathcal F(v_1) \oplus \mathcal F(v_2) \oplus \mathcal F(v_3) \oplus \mathcal F(e_{12}) \oplus \mathcal F(e_{13}) \oplus \mathcal F(e_{23})$ — total dimension $2 + 2 + 2 + 1 + 1 + 1 = 9$.

$C^1 = \bigoplus_{v_i < e_{ij}} \mathcal F(e_{ij})$, indexed by the 6 valid pairs (each edge has 2 endpoints): $\mathbb R^6$.

The coboundary $\delta: C^0 \to C^1$ acts on the chain $(v_i < e_{ij})$ component as

$$\delta(\xi)(v_i < e_{ij}) = r_{ij}^i(\xi(v_i)) - \xi(e_{ij}).$$

## Inner products

Take the standard Euclidean inner product on each stalk and orthogonal-direct-sum on each $C^k$. So $\langle \cdot, \cdot \rangle_{C^0}$ is just the dot product on $\mathbb R^9$, and $\langle \cdot, \cdot \rangle_{C^1}$ on $\mathbb R^6$.

## The Laplacian

Compute $\delta^*: C^1 \to C^0$. For a basis vector $e_{(v_i < e_{ij})}^{(1)} \in C^1$ (the unit indicator of one chain), $\delta^* (e_{(v_i < e_{ij})}^{(1)}) = (r_{ij}^i)^* (1) \in \mathcal F(v_i) \subset C^0 \;-\; e_{ij}^{(0)} \in \mathcal F(e_{ij}) \subset C^0$, where $(r_{ij}^i)^*(1) = (1, 0) \in \mathbb R^2$ is the adjoint of "first coordinate."

The degree-$0$ Laplacian $\Delta_0 = \delta^* \delta: C^0 \to C^0$ is then a $9 \times 9$ matrix. On the vertex part: each vertex $v_i$ contributes to two chains (one per incident edge), and $\Delta_0|_{\mathcal F(v_i)}$ sums two rank-one operators $(r_{ij}^i)^* r_{ij}^i = E_{11}$ (the projection onto the first coordinate). So $\Delta_0|_{\mathcal F(v_i)} = 2 E_{11}$ — a diagonal matrix $\mathrm{diag}(2, 0)$ on $\mathbb R^2$.

On the edge part: each edge $e_{ij}$ contributes to two chains (one per incident vertex), and $\Delta_0|_{\mathcal F(e_{ij})} = 2 \cdot \mathrm{Id}_{\mathbb R}$.

Cross-terms (vertex × edge): $\Delta_0$ has off-diagonal entries from $\delta^* \delta$ between $\mathcal F(v_i)$ and $\mathcal F(e_{ij})$ when $v_i < e_{ij}$. The entry on $\mathcal F(v_i) \to \mathcal F(e_{ij})$ is $-r_{ij}^i$ (i.e. $-(1,0)^T$ as a column vector), and on $\mathcal F(e_{ij}) \to \mathcal F(v_i)$ it is $-(r_{ij}^i)^* = -(1, 0)$.

Putting it together, $\Delta_0$ has block structure: $9 \times 9$, with on-diagonal blocks $\mathrm{diag}(2, 0)$ for each vertex stalk and $2$ for each edge stalk, and off-diagonal $-(1,0)$ couplings.

## Hodge isomorphism check

$\ker \Delta_0$ should equal $H^0(P, \mathcal F)$. Compute $H^0$ directly: a $0$-cocycle is $\xi \in C^0$ with $\delta \xi = 0$, i.e. $r_{ij}^i(\xi(v_i)) = \xi(e_{ij})$ for every $v_i < e_{ij}$. Constraint per edge: the first coordinates of the two adjacent vertices must agree, and equal $\xi(e_{ij})$.

Solutions: pick the first coordinate of all three vertices to a common value $c$ ($1$ degree of freedom), the second coordinates freely ($3$ degrees), and edge stalks determined ($\xi(e_{ij}) = c$ for all). Total: $1 + 3 = 4$ dimensions. So $H^0(P, \mathcal F) = \mathbb R^4$.

Check $\ker \Delta_0 = $ kernel of the matrix above. By Hodge, $\ker \Delta_0 = \ker \delta$ (since $\delta$ has closed range — we are finite-dimensional). $\ker \delta$ is exactly the $0$-cocycles, which we computed is $\mathbb R^4$. Hodge holds.

## What this example illustrates

1. **The chain complex is the input data.** The recipe — sheaf, stalks, restrictions, inner products — produces $(C^\bullet, \delta, \langle \cdot, \cdot \rangle)$. The Laplacian $\Delta = \delta\delta^* + \delta^*\delta$ is determined.
2. **The Hodge isomorphism is automatic** in this finite-dimensional case; what's non-trivial is that $H^\bullet(C^\bullet, \delta)$ matches sheaf cohomology of $\mathcal F$ on $P$. (For cellular sheaves this is the definition; for non-cellular posets one needs to check.)
3. **Different Hilbert structures change $\Delta$ but not its kernel dimension.** Replacing the Euclidean inner product on each stalk by another positive-definite form changes $\Delta_0$ as a matrix but not $\dim \ker \Delta_0 = \dim H^0$. This is the moduli-of-Hilbert-structures non-canonicity referred to in [laplacianizability](../../../../glossary/terms/laplacianizability.md).
4. **The recipe extends.** Replace $P$ with any finite poset, $\mathcal F$ with any Hilbert-valued sheaf — the construction goes through. This is the content of [@ayzenberg2025sheaf].
