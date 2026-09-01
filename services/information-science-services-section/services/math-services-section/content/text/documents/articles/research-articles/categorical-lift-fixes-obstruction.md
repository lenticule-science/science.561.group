---
type: conjecture
status: sketch
depends-on:
- laplacianizability
- hodge-laplacian
- hypergraph
- symmetric-simplicial-set
references:
- key: choi2024cellular
  type: article
  authors:
  - Choi, Eunho
  - Park, Hee Rhang
  year: 2024
  title: Cellular sheaf Laplacians on the set of simplices of symmetric simplicial set induced by hypergraph
  eprint: '2411.08458'
  eprinttype: arxiv
- key: choi2025hypergraph
  type: article
  authors:
  - Choi, Seonghyun
  - Kim, Junhyeok
  - Oh, Sangwoo
  year: 2025
  title: 'Hypergraph Neural Sheaf Diffusion: A Symmetric Simplicial Set Framework for Higher-Order Learning'
  eprint: '2505.05702'
  eprinttype: arxiv
- key: mugnolo2025heat
  type: article
  authors:
  - Mugnolo, Delio
  year: 2025
  title: Non-Markovian heat flows on directed hypergraphs
  eprint: '2510.17497'
  eprinttype: arxiv
---

# Categorical-lift theorem (precise version)

## Setup: when a "naive" cohomology theory fails to be functorial

Let $\mathcal C$ be a category. A graded-vector-space-valued assignment $H^\bullet: \mathrm{Obj}(\mathcal C) \to \mathbf{grVect}_\Bbbk$ may fail to extend to a functor for definable reasons — typically because computing $H^\bullet(X)$ requires a non-canonical choice (an order on vertices, a sign convention on edges, an orientation of cells).

The hypergraph case is canonical:

- **Object level.** Given a hypergraph $X = (V, E)$, define $C^k(X) := \Bbbk^{\binom{|V|}{k+1}}$ (functions on $(k+1)$-element subsets of $V$, regardless of whether they are hyperedges) and $\delta: C^k \to C^{k+1}$ by an alternating-sum-of-restrictions formula — this requires *picking a total order on $V$*. Different orders give different chain complexes; all give the same cohomology, but the cohomology assignment is not a functor of hypergraphs without picking orders coherently.
- **The lift.** Define a category $\widetilde{\mathcal C}$ whose objects are *ordered* hypergraphs (or, more invariantly, **symmetric simplicial sets**: presheaves on $\mathbf{FinSet}_{\mathrm{nonempty}}$). There is a forgetful $U: \widetilde{\mathcal C} \to \mathcal C$ that drops the ordering / takes the underlying hypergraph.
- The cohomology $\widetilde H^\bullet$ on $\widetilde{\mathcal C}$ *is* functorial.

The conjecture is that this kind of lift exists generally and that the Hilbert lift on $\widetilde{\mathcal C}$ "descends" along $U$ to a structure-preserving Laplacianization on $\mathcal C$ — even though $H^\bullet$ on $\mathcal C$ alone is not a functor.

## Conjectural statement

> **Conjecture (categorical-lift).** Let $\mathcal C$ be a category and $H^\bullet$ a graded-vector-space assignment on objects of $\mathcal C$ that fails to be a functor in the precise sense that there is a category $\widetilde{\mathcal C}$, a faithful and surjective-on-objects forgetful functor $U: \widetilde{\mathcal C} \to \mathcal C$, and a graded-vector-space-valued *functor* $\widetilde H^\bullet: \widetilde{\mathcal C} \to \mathbf{grVect}_\Bbbk$, such that $\widetilde H^\bullet(\widetilde X) \cong H^\bullet(U(\widetilde X))$ canonically (independent of which lift $\widetilde X$ of $X = U(\widetilde X)$ is chosen).
>
> If $\widetilde H^\bullet$ admits a Hilbert lift $\widetilde F: \widetilde{\mathcal C} \to \mathbf{Ch}(\mathbf{Hilb}_\Bbbk)$, then there is a Hilbert lift $F$ of $H^\bullet$ on $\mathcal C$ — defined on objects only, but with a functorial Laplacian assignment $\Delta_X: F(X) \to F(X)$ — given by $\Delta_X = \Delta_{\widetilde F(\widetilde X)}$ for any lift $\widetilde X$ of $X$.

## What "structure-preserving" means

The non-trivial content of the conjecture is that the Laplacian $\Delta_X$ does not depend on the choice of $\widetilde X \in U^{-1}(X)$. This requires that for any two lifts $\widetilde X_1, \widetilde X_2$ of the same $X$, the chain complexes $\widetilde F(\widetilde X_1)$ and $\widetilde F(\widetilde X_2)$ are related by a *unitary* isomorphism that intertwines the coboundaries. Then the Laplacians, being defined via $\Delta = dd^* + d^*d$, are conjugate by the same unitary, so their kernel and spectrum agree.

For ordered-hypergraphs / symmetric simplicial sets, the unitary is the symmetric-group action on cochains: reordering vertices acts on $C^k$ by a signed permutation, which is unitary for the Euclidean inner product. So $\Delta$ on $X$ is well-defined as an operator (unique up to unitary, hence its spectrum and kernel are canonical). Cohomology is recovered: $\ker \Delta_X \cong H^\bullet(X)$.

## Verified cases

1. **Hypergraphs ↦ symmetric simplicial sets.** Discussed above. Verified in [@choi2024cellular] and [@choi2025hypergraph]. The unitary group is the symmetric group acting on vertices.

2. **Signed graphs ↦ Hermitian / magnetic Laplacian.** Take $\mathcal C = $ signed graphs (graphs with $\pm 1$ edge weights), $\widetilde{\mathcal C} = $ graphs with $U(1)$-gauge data on edges, $U$ the forgetful map. Computing the Laplacian on a $U(1)$-gauge graph gives a Hermitian positive-semidefinite operator that, restricted to the $\pm 1$-gauge subcategory (signed graphs), is the signed Laplacian. Different gauge choices on the same underlying signed graph differ by a unitary $\mathrm{diag}(e^{i\theta_v})$ — independent on each vertex — and the Laplacian transforms covariantly. (Anchor: MSGNN line of work.)

3. **Directed hypergraphs ↦ enlarged operator class.** Here the lift is more delicate because the result is a non-self-adjoint operator ([@mugnolo2025heat]). The conjecture's hypotheses need adjusting: the target category is not $\mathbf{Ch}(\mathbf{Hilb})$ but something like $\mathbf{Ch}^{\mathrm{sect}}(\mathbf{Hilb})$ — bounded complexes with sectorial coboundaries. The Hodge theorem then becomes the bi-orthogonal decomposition for sectorial $\Delta$. This is a real generalization, not an instance of the conjecture as stated.

## What's needed for a proof in case (1)

For the hypergraph / symmetric-simplicial-set instance, the proof program is:

1. Show that for any two orderings $\sigma, \tau$ of the vertices of $X$, the resulting cochain complexes $C^\bullet_\sigma(X)$ and $C^\bullet_\tau(X)$ are related by a graded chain isomorphism $\Phi_{\sigma\tau}: C^\bullet_\sigma \to C^\bullet_\tau$ that is **unitary** for the standard inner product. Concretely $\Phi_{\sigma\tau}$ is the signed-permutation action of $\tau \sigma^{-1}$ on $C^k$.
2. Show $\Phi_{\sigma\tau}$ intertwines the coboundaries: $\delta_\tau \Phi_{\sigma\tau} = \Phi_{\sigma\tau} \delta_\sigma$. (This is the cocycle property of cellular cochains under reordering.)
3. Conclude $\Delta_\sigma$ and $\Delta_\tau$ are unitarily conjugate, hence $\ker$ and spectrum are independent of the ordering.

(1) and (2) are direct calculations; (3) is then automatic. The proof is uncontroversial; what is missing in the literature is the *categorical statement* that this construction is a Hilbert lift in the formal sense of [laplacianizability](../../../glossary/terms/laplacianizability.md).

## What's open

- Does the conjecture hold when the lift category $\widetilde{\mathcal C}$ has *non-discrete* unitary action (e.g. $U(1)$-gauge for signed graphs)? Probably yes, by the same template — but the proof needs the action to be by genuine Hilbert-space unitaries and to intertwine $d$.
- Can the framework be extended to non-self-adjoint cases (case 3 above) by relaxing "unitary" to "isometric for an indefinite inner product" or to "intertwiner of sectorial operators"?
- Is there a *minimal* lift category $\widetilde{\mathcal C}$ for a given $\mathcal C$ — a universal choice in some 2-categorical sense?
