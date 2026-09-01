---
type: reference
key: schwahn2025einstein
class: article
authors:
- Schwahn, Paul
- Semmelmann, Uwe
year: 2025
title: Einstein metrics, their moduli spaces and stability
eprint: '2507.18463'
eprinttype: arxiv
---

# Einstein metrics moduli space (2025)

arxiv:2507.18463 (July 2025, revised October 2025). 55 pp survey.

## Why this matters for laplacianizers

This is **the cleanest 2025 instance of stratified-moduli-of-Laplacian-like-operators** in the survey. The paper proves that the moduli space of Einstein metrics on a compact manifold is locally an orbifold, and that the stratification is governed by spectral data of the **Lichnerowicz Laplacian** $\Delta_L$ — a curved Hodge-type Laplacian acting on symmetric tensors.

Key facts as stated:

- "The connected component of $g$ in $\mathcal E$ is an orbifold, as $\mathcal D / \mathcal D^0$ is finite."
- The local structure is given by Ebin's Slice Theorem: $\mathcal S_g / \mathrm{Isom}(g)$ is homeomorphic to a neighborhood of $[g] \in \mathcal M_1 / \mathcal D$.
- "The infinitesimal Einstein deformations of $g$ are exactly the tt-eigentensors to the eigenvalue $2E$" (with $E$ the Einstein constant).
- "The space of IED, denoted $\epsilon(g) = \ker(\Delta_L - 2E)|_{S^2_{tt}(M)}$, determines both rigidity and deformability."
- $T_g \mathcal S_g \cap \ker E'_g = \epsilon(g)$ — the kernel of the linearized Einstein operator equals the IED space.
- Rigidity is exactly the condition $\epsilon(g) = 0$.

## Direct structural parallel to laplacianizers' finding

The program's worked computation on $\partial \Delta^3$ (`examples/gauge-fiber-structure.md`) found:

- The moduli of Laplacianizations on a fixed cellular cochain complex is locally an orbifold.
- Stratification is governed by the dimension of the unitary stabilizer in $G$ — equivalently, by eigenvalue-multiplicity patterns of $\Delta$.
- The fully-symmetric (Euclidean) point is rigid up to scaling (a 1-dim stratum) within a 6-codim stratum where the multiplicity-3 eigenvalue collapses.

Young's inner product Laplacian (`references/young-inner-product-laplacian-2025.md`) and the Einstein moduli paper here are doing the same structural thing in different categories:

- Young: moduli of inner product Laplacians on a graph; orbifold from gauge action; stratified by which named Laplacian a point realizes.
- Einstein moduli: moduli of Einstein metrics on a manifold; orbifold from $\mathrm{Isom}(g)$; stratified by IED dimension = $\dim \ker(\Delta_L - 2E)$.

Both are **stratified moduli of (the inputs that produce) Laplacian-like operators, with stratification controlled by an eigenspace dimension**.

## Why this is structural (not coincidental) evidence

The Einstein moduli case is far enough from the cellular cochain case that an accidental match is implausible. The pattern that recurs:

1. A category of structures (Riemannian metrics / graph inner products / cellular sheaves).
2. Each structure produces a Laplacian (Lichnerowicz / inner product / sheaf).
3. The category quotiented by an action of automorphisms gives a moduli space.
4. The moduli is locally an orbifold.
5. Strata are indexed by stabilizer dim or, equivalently, by eigenspace-multiplicity patterns of the associated Laplacian at that point.
6. The "most symmetric" / "fully degenerate" stratum has highest stabilizer dim and lowest moduli-stratum dim.

This is the **stratified universal property** laplacianizers named in `examples/gauge-fiber-structure.md` after the failure of clean-adjoint expectations. The Einstein paper validates the prediction: this is the right shape for moduli of Laplacianizations across categories.

## Bridges

- To `theorems/moduli-of-laplacianizations.md` — provides the structural pattern in a smooth-geometry category.
- To `examples/gauge-fiber-structure.md` — direct structural parallel.
- To `questions/universal-laplacianization.md` — replace "is there a clean adjoint" with "is there a uniform stratified-orbifold structure on the moduli of Hilbert lifts," and the answer in the smooth case is yes.
- To `concepts/laplacianizability.md` — extends the Hilbert-lift definition to smooth Riemannian inputs, where the "graded chain complex" is replaced by the de Rham complex (or its tensor-valued analogues), and the moduli is the moduli of Riemannian metrics.
