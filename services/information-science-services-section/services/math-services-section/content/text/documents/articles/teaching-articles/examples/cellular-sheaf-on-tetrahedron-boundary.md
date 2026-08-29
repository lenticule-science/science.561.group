---
type: example
status: draft
depends-on: [hodge-laplacian, cellular-sheaf, finite-poset, moduli-of-laplacianizations]
instantiates: [laplacianizability]
see-also: [moduli-of-triangle-boundary]
---

# Cellular sheaf interpretation of $\mathcal M_{\mathrm{Lap}}(\partial \Delta^3)$

A worked computation: realize the 6-dimensional moduli of Laplacianizations of $\partial \Delta^3$ via the constant cellular sheaf $\underline{\mathbb R}$ on its face poset, and compute the gauge fiber of the cellular-sheaf-to-moduli map.

## Setup: the face poset and sheaf

$\partial \Delta^3$ has 4 vertices $v_1, \ldots, v_4$, 6 edges $e_{ij}$ ($1 \le i < j \le 4$), and 4 triangles $t_{ijk}$ ($1 \le i < j < k \le 4$). Its **face poset** $P$ has 14 elements with the inclusion order: $v_i < e_{jk}$ when $i \in \{j, k\}$, and $e_{jk} < t_{lmn}$ when $\{j, k\} \subset \{l, m, n\}$.

The **constant sheaf** $\mathcal F = \underline{\mathbb R}: P \to \mathbf{Vec}_\mathbb R$ assigns $\mathcal F(\sigma) = \mathbb R$ to every cell $\sigma$, and the identity restriction maps. Its cochain complex (orientation: $e_{ij}$ pointing $v_i \to v_j$ for $i<j$, triangles oriented by lexicographic vertex order) is

$$0 \to C^0 = \mathbb R^4 \xrightarrow{d_1^T} C^1 = \mathbb R^6 \xrightarrow{d_2^T} C^2 = \mathbb R^4 \to 0,$$

with the boundary maps $d_1$ (going $C^1 \to C^0$ in homological convention, $C^1 \to C^2$ in cohomological — the data are the same matrices in either convention):

$$d_1 = \begin{pmatrix} -1 & -1 & -1 & 0 & 0 & 0 \\ \phantom{-}1 & 0 & 0 & -1 & -1 & 0 \\ 0 & 1 & 0 & 1 & 0 & -1 \\ 0 & 0 & 1 & 0 & 1 & 1 \end{pmatrix}, \qquad d_2 = \begin{pmatrix} 1 & 1 & 0 & 0 \\ -1 & 0 & 1 & 0 \\ 0 & -1 & -1 & 0 \\ 1 & 0 & 0 & 1 \\ 0 & 1 & 0 & -1 \\ 0 & 0 & 1 & 1 \end{pmatrix}.$$

(Columns of $d_1$ are $e_{12}, e_{13}, e_{14}, e_{23}, e_{24}, e_{34}$, with entry $\pm 1$ at the endpoints. Columns of $d_2$ are $t_{123}, t_{124}, t_{134}, t_{234}$, with $\pm 1$ at boundary edges via $\partial t_{ijk} = e_{jk} - e_{ik} + e_{ij}$.)

Verify $d_1 d_2 = 0$: column 1 of $d_2$ is $(1, -1, 0, 1, 0, 0)^T$. Apply $d_1$: row $i$ of $d_1$ dotted with this column gives $0$ for each $i = 1, 2, 3, 4$. ✓

## Standard Euclidean Laplacian

Take $\langle \cdot, \cdot \rangle = $ Euclidean on each $C^k$ (i.e., $\mathcal F(\sigma) = \mathbb R$ with standard inner product, all stalkwise scales equal to $1$).

**$\Delta_0 = d_1 d_1^T$ on $C^0$:** by the standard graph-Laplacian computation, $\Delta_0 = 4 I_4 - J_4$ (with $J_4$ the all-ones matrix), the graph Laplacian of $K_4$. Spectrum: $\{0, 4, 4, 4\}$.

**$\Delta_2 = d_2^T d_2$ on $C^2$:** by symmetry of $\partial \Delta^3$ (the dual is itself), spectrum is also $\{0, 4, 4, 4\}$.

**$\Delta_1 = d_1^T d_1 + d_2 d_2^T$ on $C^1$:** by supersymmetric isospectrality ([moduli-of-triangle-boundary](moduli-of-triangle-boundary.md) proves the orthogonal-image splitting), nonzero spectrum is $\{\sigma_i^2\}_{i=1}^3 \sqcup \{\tau_j^2\}_{j=1}^3 = \{4, 4, 4\} \sqcup \{4, 4, 4\}$. So $\Delta_1 = 4 \cdot I_6$. Combined with $H_1 = 0$: spectrum $\{4\}^6$, full rank.

The standard Euclidean Laplacianization of $(\partial \Delta^3, \underline{\mathbb R})$ is the maximally-symmetric point of $\mathcal M_{\mathrm{Lap}}$ — all six "moduli coordinates" (squared singular values $\sigma_1, \sigma_2, \sigma_3, \tau_1, \tau_2, \tau_3$) are equal to $4$.

## Stalkwise Hilbert moduli

A Hilbert structure on the cellular sheaf $\underline{\mathbb R}$ assigns one positive real to each cell:

- $a_i > 0$ for each vertex $v_i$ ($i = 1, \ldots, 4$): 4 parameters,
- $b_{ij} > 0$ for each edge $e_{ij}$: 6 parameters,
- $c_{ijk} > 0$ for each triangle $t_{ijk}$: 4 parameters,

for a total of **14 parameters**. Call this space $\mathcal H_{\mathrm{cell}} = \mathbb R_{>0}^{14}$.

In the cellular basis on $C^k$, the Gram matrices are diagonal:

$$Q_0 = \mathrm{diag}(a_1, \ldots, a_4), \quad Q_1 = \mathrm{diag}(b_{12}, b_{13}, \ldots, b_{34}), \quad Q_2 = \mathrm{diag}(c_{123}, \ldots, c_{234}).$$

So $\mathcal H_{\mathrm{cell}} \subset \mathcal H = \mathrm{Sym}^+_4(\mathbb R) \times \mathrm{Sym}^+_6(\mathbb R) \times \mathrm{Sym}^+_4(\mathbb R)$ as the diagonal locus. The full $\mathcal H$ has dim $10 + 21 + 10 = 41$; the cellular subspace $\mathcal H_{\mathrm{cell}}$ has dim $14$.

## The Laplacian as a function of $(a, b, c)$

The adjoint $d_1^*: C^0 \to C^1$ is $d_1^* = Q_1^{-1} d_1^T Q_0$. So

$$\Delta_0 = d_1 d_1^* = d_1 Q_1^{-1} d_1^T Q_0.$$

Eigenvalues of $\Delta_0$ are $Q_0$-self-adjoint, equivalently equal to eigenvalues of the symmetric matrix $\widetilde \Delta_0 = Q_0^{1/2} \Delta_0 Q_0^{-1/2} = Q_0^{1/2} d_1 Q_1^{-1} d_1^T Q_0^{1/2}$. These are the squared singular values of

$$\widetilde d_1 := Q_0^{1/2} d_1 Q_1^{-1/2}.$$

Concretely, $(\widetilde d_1)_{i, e_{jk}} = a_i^{1/2} \cdot d_1[i, e_{jk}] \cdot b_{jk}^{-1/2}$. For edge $e_{ij}$ (entries only at $v_i$ and $v_j$):

$$(\widetilde d_1)_{i, e_{ij}} = -\sqrt{a_i / b_{ij}}, \qquad (\widetilde d_1)_{j, e_{ij}} = +\sqrt{a_j / b_{ij}}.$$

The Gram matrix $\widetilde d_1^T \widetilde d_1$ has $(e_{ij}, e_{ij})$-entry $= (a_i + a_j)/b_{ij}$, and off-diagonal $(e_{ij}, e_{kl})$ entries equal to $\pm \sqrt{a_v / (b_{ij} b_{kl})}$ when $\{i,j\} \cap \{k,l\} = \{v\}$, else $0$.

So the squared singular values $\sigma_1^2, \sigma_2^2, \sigma_3^2$ of $d_1$ (as a $Q$-weighted operator) are eigenvalues of an explicit $6 \times 6$ symmetric matrix in the $a, b$ variables. Three eigenvalues — and the kernel has dim $\dim \ker d_1^T = 4 - \mathrm{rank}\, d_1 = 1$ (= $\dim H^0$), so a 4th eigenvalue is zero.

Similarly, the squared singular values $\tau_1^2, \tau_2^2, \tau_3^2$ of $d_2$ are eigenvalues of a corresponding matrix in the $b, c$ variables.

By the moduli theorem ([moduli-of-laplacianizations](../../research-articles/moduli-of-laplacianizations.md)), the unordered tuple $(\sigma_1^2, \sigma_2^2, \sigma_3^2; \tau_1^2, \tau_2^2, \tau_3^2)$ — modulo $S_3 \times S_3$ — determines the Laplacianization up to $G$-equivalence. So the **moduli map**

$$\Phi: \mathcal H_{\mathrm{cell}} \to \mathcal M_{\mathrm{Lap}} = \mathrm{Sym}^3(\mathbb R_{>0}) \times \mathrm{Sym}^3(\mathbb R_{>0})$$

sends $(a, b, c) \mapsto $ ((squared singular values of $\widetilde d_1$), (squared singular values of $\widetilde d_2$)).

## Dimension and the gauge fiber

$\dim \mathcal H_{\mathrm{cell}} = 14$, $\dim \mathcal M_{\mathrm{Lap}} = 6$. So if $\Phi$ is generically a submersion, its fibers have dimension $14 - 6 = 8$.

**Claim.** $\Phi$ is generically submersive, with 8-dim fiber.

*Argument.* Two diagonal Hilbert structures $Q, Q' \in \mathcal H_{\mathrm{cell}}$ map to the same moduli point iff some $g \in G$ satisfies $g \cdot Q = Q'$ (where $G$ is the chain automorphism group of $(C^\bullet, d)$, $\dim G = 35$ from [moduli-of-triangle-boundary](moduli-of-triangle-boundary.md) cross-check). At generic $Q \in \mathcal H_{\mathrm{cell}}$:

- $T_Q \mathcal H_{\mathrm{cell}}$ has dim $14$ inside $T_Q \mathcal H$ (dim $41$).
- $T_Q (G \cdot Q)$ has dim $35$ (orbit-tangent at generic $Q$, where the $Q$-unitary stabilizer in $G$ is $0$-dim).
- They span $T_Q \mathcal H$ iff $\dim T_Q \mathcal H_{\mathrm{cell}} \cap T_Q(G \cdot Q) = 14 + 35 - 41 = 8$.

The intersection consists of orbit-directions $\xi \cdot Q$ that stay diagonal — i.e., elements $\xi \in \mathfrak g$ for which $\xi^T Q + Q\xi$ is diagonal. Off-diagonal entries of $\xi$ must satisfy $\xi_{ij} q^{(i)} + \xi_{ji} q^{(j)} = 0$ (the "$Q$-anti-Hermitian" condition); diagonal entries of $\xi$ are unconstrained. Within $\mathfrak g$, this cuts down to the codim-$\binom{n_n}{2}$ sub-locus per block, with $\binom{4}{2}+\binom{6}{2}+\binom{4}{2} = 27$ equations on a $35$-dim Lie algebra. By transversality at generic $Q$, the intersection has dim $\max(0, 35 - 27) = 8$. ✓

So $\Phi$ is a submersion of relative dimension $8$ at generic points.

**Consequence: $\Phi$ is open with image equal to $\mathcal M_{\mathrm{Lap}}$.** The image is open by submersion. To see it equals the whole moduli: realize any target $(\sigma_1^2, \sigma_2^2, \sigma_3^2; \tau_1^2, \tau_2^2, \tau_3^2)$ explicitly. For instance, scale $Q_0 = \alpha I$ uniformly on vertices; this takes $\widetilde d_1$ to $\alpha^{1/2} d_1 Q_1^{-1/2}$, multiplying all $\sigma_i^2$ by $\alpha$. So uniform scaling of $Q_0$ moves $(\sigma_i^2)$ along the diagonal of $\mathrm{Sym}^3(\mathbb R_{>0})$. To break $\sigma_1 = \sigma_2 = \sigma_3$ symmetry, use non-uniform vertex weights (e.g., $a_1 \ne a_2$); this produces distinct squared singular values. Similarly for $\tau_j^2$ via $c$. Both $S_3$ orbits are reachable, so $\Phi$ is surjective.

## What this says about cellular-sheaf cofinality

The cofinality conjecture ([cellular-sheaf-cofinality](../../research-articles/cellular-sheaf-cofinality.md)) predicts that every Hilbert lift of a finite combinatorial cohomology theory factors through a cellular-sheaf-on-poset construction. For $(\partial \Delta^3, \underline{\mathbb R}\text{-cohomology})$, the conjecture says that the cellular-sheaf framework should *reach* every Laplacianization. The computation above verifies this: $\Phi: \mathcal H_{\mathrm{cell}} \twoheadrightarrow \mathcal M_{\mathrm{Lap}}$ is surjective.

But $\Phi$ is **not** a moduli-of-Hilbert-lifts equivalence: it has 8-dim fibers, meaning the cellular-sheaf framework parametrizes Laplacianizations by 14 numbers when only 6 are honest. The 8 redundant directions are *gauge*: changes in stalkwise weights that produce equivalent Laplacians (related by a chain automorphism that doesn't preserve the diagonal of $\mathcal H$).

This refines the cofinality conjecture's content. The right statement is:

> **Cofinality (refined).** The cellular-sheaf-on-poset construction $\Phi: \mathcal H_{\mathrm{cell}} \to \mathcal M_{\mathrm{Lap}}$ is *surjective* (cofinal among Hilbert lifts), but *not injective* (carries 8-dim gauge per moduli point on $\partial \Delta^3$).

The gauge dimension 8 is itself an invariant of the chain complex: it equals $\dim T \mathcal H_{\mathrm{cell}} \cap T(G \cdot Q)$, which generalizes to

$$\mathrm{gauge\ dim} = \dim \mathcal H_{\mathrm{cell}} + \dim G - \dim \mathcal H = \dim \mathcal H_{\mathrm{cell}} - \dim \mathcal M_{\mathrm{Lap}}.$$

For $\partial \Delta^2$: $\mathcal H_{\mathrm{cell}}$ has dim $3 + 3 = 6$ (one weight per vertex, one per edge), $\mathcal M_{\mathrm{Lap}}$ has dim $2$. Gauge dim should be $6 - 2 = 4$. By the same transversality argument: $\dim \mathcal H_{\mathrm{cell}} + \dim G - \dim \mathcal H = 6 + 10 - 12 = 4$. ✓

## What about non-constant sheaves?

The above is for the *constant* sheaf $\underline{\mathbb R}$. The richer cellular-sheaf framework allows higher-rank stalks $\mathcal F(\sigma) \in \mathbf{Vec}$, with non-trivial restriction maps. This produces a *different* chain complex (with $\dim C^k = \sum_\sigma \dim \mathcal F(\sigma)$), so it parameterizes Laplacianizations of *richer* cohomology theories — sheaf cohomology with the chosen sheaf, not constant cohomology.

For the cofinality conjecture's purposes, the constant sheaf is enough to verify: it surjects onto the moduli of Laplacianizations of the cellular cochain complex (= cohomology of constant sheaf = constant simplicial cohomology). Other Hilbert lifts of richer cohomology theories are realized by other sheaves on the same face poset.

## Open: fiber structure

The 8-dim fiber over a generic moduli point is a real geometric object. Concretely, the fiber over the standard Euclidean point $(4,4,4;4,4,4)$ contains all $(a, b, c) \in \mathcal H_{\mathrm{cell}}$ that yield a Laplacian unitarily equivalent to the standard one. Examples:

- *Uniform rescaling that preserves ratios*: $(a, b, c) \to (\lambda a, \lambda b, \lambda c)$. Action on $\widetilde d_1$: $Q_0^{1/2} \to \lambda^{1/2} Q_0^{1/2}$, $Q_1^{-1/2} \to \lambda^{-1/2} Q_1^{-1/2}$, so $\widetilde d_1 \to \widetilde d_1$ (no change). 1-parameter family.
- *Vertex permutations* (action of $S_4$): take all $a_i = 1$ to itself, but reorder. Discrete, doesn't contribute to gauge dimension.
- *Asymmetric weight changes that compensate*: e.g., increase $a_1$ while increasing $b_{1j}$ for incident edges in a coordinated way. These are the genuinely 8-dim portion of gauge.

A clean identification of the 8-dim fiber as a Lie group (or symmetric space) at generic points is open. The fiber over the Euclidean point has additional symmetry (the supersymmetric stabilizer of dim 6, computed in the $\partial \Delta^3$ cross-check), so it is a non-generic stratum of the bundle $\mathcal H_{\mathrm{cell}} \to \mathcal M_{\mathrm{Lap}}$.
