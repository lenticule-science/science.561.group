---
type: reference
authors: [Hansen, Jakob, Ghrist, Robert]
year: 2019
title: "Toward a Spectral Theory of Cellular Sheaves"
venue: "Journal of Applied and Computational Topology 3, 315–358; arXiv:1808.01513"
---

## Full citation

J. Hansen, R. Ghrist. "Toward a spectral theory of cellular sheaves." *Journal of Applied and Computational Topology* 3, 315–358, 2019. arXiv:1808.01513. 37 pp.

## Status

PDF at `sources/hansen-ghrist2019.pdf`. Abstract verified.

## Annotation

Develops a Hodge Laplacian on cellular sheaves, building a spectral theory that parallels classical graph Laplacian theory but for sheaf-valued data on cell complexes. The central content for corpus-purposes (per the [Hansen–Ghrist spectral engagement question](questions/hansen-ghrist-spectral-engagement.md), Pass 1):

- **Cellular sheaf** $F : P_X \to \mathbf{Vect}_k$ on a regular cell complex $X$ (Def 2.4); a **weighted sheaf** carries a Hilbert-space inner product on each stalk (Def 3.5).
- **Coboundary** $\delta^k : C^k \to C^{k+1}$ as $\delta^k|_{F(\sigma)} = \sum_{\dim \tau = k+1,\ \sigma \lhd \tau} [\tau:\sigma] F_{\sigma \lhd \tau}$.
- **Hodge Laplacian** $\Delta_F^k = (\delta^k)^* \delta^k + \delta^{k-1}(\delta^{k-1})^*$, with adjoint $(\delta^k)^*$ defined via the inner product. The degree-0 case $L_F = (\delta^0)^* \delta^0$ is the **sheaf Laplacian** generalizing the graph Laplacian.
- **Discrete Hodge theorem (Theorem 3.1):** $\ker \Delta_F^k = H^k(X; F)$ — harmonic cochains = cohomology. At $k = 0$: $\ker L_F = H^0(X; F) = \Gamma(X; F)$.
- **Spectral consensus (Proposition 8.1):** the dynamical system $\dot x = -\Delta_F^k x$ converges exponentially to the orthogonal projection onto $\ker \Delta_F^k$, with rate set by the smallest nonzero eigenvalue.
- **Recovery of classical graph Laplacian:** when $F$ is the constant sheaf $\underline{\mathbb R}$ with identity restrictions, $L_F$ equals the standard graph Laplacian.

**Relationship to corpus's machinery (per [the Hansen–Ghrist spectral engagement question](questions/hansen-ghrist-spectral-engagement.md), Passes 1–2).** The corpus and Hansen–Ghrist *agree on what consensus is* — the corpus's [network-sheaf consensus on agent graphs theorem](../theorems/network-sheaf-consensus-on-agent-graphs.md) gives $H^0(\hat G; \mathcal F_{V_G}) = \lim V_G = \Gamma(\hat G; F)$, matching $\ker L_F$ via Hodge. They *diverge in characterization*: Hansen–Ghrist gives spectral gap, convergence rate, Hodge orthogonal decomposition; the corpus gives Mayer–Vietoris obstruction-vanishing $\delta^0 = 0$ uniformly across all replica covers, with bilattice / d-frame extensibility.

The frameworks are **complementary, not competing**. Hansen–Ghrist's spectral apparatus is structurally Hilbert-analytic (requires inner product on stalks); it does not extend to the corpus's bilattice / d-frame value categories — there is no canonical inner product on the bilattice $\mathbf B$, no canonical adjoint of d-frame morphisms, no $\Delta_F$-style operator combining the heterogeneous $L_+, L_-, \mathrm{con}, \mathrm{tot}$ components. The corpus's [bilattice network-sheaf consensus theorem](../theorems/bilattice-network-sheaf-consensus.md) handles consensus on d-frame-valued sheaves via componentwise reduction to $\mathbf{Ab}$-shadows plus relational inheritance — *not* via spectrum, by genuine structural obstruction.

Conversely, the corpus's [Lopez 2024 fuzzy-adjoint](lopez2024.md) and [Ghrist–Riess](ghrist-riess2022.md) / [Ghrist et al. Lawvere Laplacian](ghrist-et-al2025.md) frameworks are the corpus's closest substitutes for spectral content in the d-frame setting — quantale-graded fixed-point theory rather than spectrum theory. The Hansen–Ghrist spectral engagement question's Passes 3–4 investigate these as the bilattice-flavored analogs.

The reference is **methodologically secondary** for the corpus's bilattice-extension purposes (because of the structural obstruction), but **structurally primary** as the standard against which the corpus's network-sheaf-on-agent-graphs theorems situate themselves.
