---
type: question
status: open
explores: [resolvent-intertwiner, infinite-spectral-triple-laplacianizability, finite-spectral-triple-laplacianizability]
---

# Cyclic-complex variant of the Hochschild–Hilbert lift

The [resolvent intertwiner](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/resolvent-intertwiner.md) defines a Hilbert structure on the *Hochschild* complex $C_\bullet(\mathcal A)$. For commutative $\mathcal A$, the Hochschild Laplacian collapses on HKR representatives — the genuinely-non-trivial differential is Connes' $B$ on the *cyclic* complex.

## Statement of the construction

The cyclic complex $\mathrm{HC}_\bullet(\mathcal A)$ is the cohomology of the bicomplex $(C_\bullet, b, B)$ at total degree, with boundary $b - B$. Equivalently, it's the quotient of $C_\bullet(\mathcal A)$ by cyclic permutation, with differential $b - B$.

The cyclic Hochschild–Hilbert lift uses the same resolvent inner product $\langle \cdot, \cdot \rangle_D$, restricted to cyclic-invariant chains:
$$\langle \cdot, \cdot \rangle_D^{\mathrm{cyc}}: \mathrm{HC}_n(\mathcal A) \otimes \mathrm{HC}_n(\mathcal A) \to \mathbb C.$$

The cyclic Laplacian is
$$\Delta_n^{\lambda} := (b - B)(b - B)^* + (b - B)^*(b - B).$$

## Question

Is $\Delta_n^\lambda$ the right object? Specifically:

1. Is the cyclic Hodge isomorphism $\ker \Delta_n^\lambda \cong \mathrm{HC}_n(\mathcal A)$ provable under the same regularity assumptions as the Hochschild case?

2. Does the cyclic Laplacian generate a stratified moduli on the moduli of spectral triples (varying $D$, fixed $\mathcal A, \mathcal H$) — analogous to the Hochschild case but indexed by *cyclic* multipartitions?

3. For commutative $\mathcal A = C^\infty(M)$, does $\Delta_n^\lambda$ correspond exactly to the de Rham Laplacian on $\Omega^n(M)$ under HKR + Connes 1985?

## Status

Sketched in the [infinite-spectral-triple entry](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/documents/articles/research-articles/infinite-spectral-triple-laplacianizability.md). The reduction to smooth Riemannian via HKR + Connes' Reconstruction Theorem is structurally clear; details unwritten.

## Why cyclic, not Hochschild

For commutative $\mathcal A$: Hochschild homology $\mathrm{HH}_n(C^\infty(M)) \cong \Omega^n(M)$ as graded vector spaces, with *zero* Hochschild differential on HKR representatives. So the Hochschild Laplacian $\Delta_n^{(D)}$ for the canonical spin-manifold spectral triple is just $b b^*$ + $b^* b$ where $b = 0$ on HKR rep — degenerate.

The cyclic differential $B$ is non-trivial: under HKR, $B$ corresponds to the de Rham differential $d$. So the cyclic Laplacian $\Delta^\lambda = (b - B)(b - B)^* + (b - B)^*(b - B)$ is the right object whose kernel is harmonic forms.

For noncommutative $\mathcal A$: both $b$ and $B$ are non-trivial. The cyclic Laplacian $\Delta^\lambda$ combines them; the Hochschild Laplacian uses only $b$.

## Approach

**Step 1.** Formal definition of $\langle \cdot, \cdot \rangle_D^{\mathrm{cyc}}$ on cyclic chains, with explicit handling of the cyclic-invariance constraint.

**Step 2.** Verify $b - B$ has closed range under the cyclic inner product (analog of [closed-range question](closed-range-in-our-framework.md)).

**Step 3.** Verify Hodge isomorphism $\ker \Delta^\lambda \cong \mathrm{HC}_\bullet(\mathcal A)$.

**Step 4.** Test on $\mathcal A = \mathbb C[\mathbb Z/n]$ (group algebra), where $\mathrm{HC}_\bullet$ has rich finite-dim structure. Does the bipartite multipartition framework apply? Are cross-degree identifications between cyclic chain degrees realized?

**Step 5.** Test on $\mathcal A = C^\infty(M)$ for $M$ a small compact manifold (e.g., $S^1$, $T^2$). Verify $\Delta^\lambda$ matches de Rham Laplacian under HKR.

## Periodic cyclic variant

The *periodic* cyclic complex $\mathrm{HP}_\bullet$ is 2-periodic (graded only by parity), with the same differential $b - B$ but on a different chain space. For the smooth case, $\mathrm{HP}_\bullet(C^\infty(M)) = H^{\mathrm{even}}_{\mathrm{dR}}(M) \oplus H^{\mathrm{odd}}_{\mathrm{dR}}(M)$.

The periodic cyclic Hodge Laplacian would give a 2-periodic Hodge structure — a potentially different object than the standard de Rham case (where the grading is by individual form degree, not parity).

Whether periodic-cyclic Laplacianizability is structurally meaningful, or just a reformulation, is part of the open question.

## Connection to negative cyclic homology

Negative cyclic homology $\mathrm{HN}_\bullet$ sits between Hochschild and periodic cyclic. The Hilbert lift could be defined on $\mathrm{HN}_\bullet$ as well, giving a third variant. The relationships between Hochschild, cyclic, and negative cyclic Laplacianizers are open.

## Implications

A clean cyclic Hochschild–Hilbert lift would:
- Make the noncommutative case a genuine extension of the smooth Riemannian case via HKR.
- Produce bipartite multipartitions on cyclic chain spectra — first noncommutative bipartite content beyond the Hochschild case.
- Connect to Connes' index theory more directly (the local index formula uses cyclic cocycles).
