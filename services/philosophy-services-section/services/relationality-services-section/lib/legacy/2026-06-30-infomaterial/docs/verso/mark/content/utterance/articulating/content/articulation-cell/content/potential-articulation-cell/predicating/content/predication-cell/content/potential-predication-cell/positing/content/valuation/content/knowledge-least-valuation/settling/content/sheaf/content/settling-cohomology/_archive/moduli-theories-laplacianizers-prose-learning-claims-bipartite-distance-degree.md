---
type: observation
status: open
depends-on: [closure-poset-of-strata, bipartite-multipartition, hilbert-degeneracy-stratification]
see-also: [stab-codim-formula, edd-computation-on-2-1-chain, saturated-edd]
classical-anchor: [bik-draisma]
---

# Distance degree of $V(\Pi)$ on a chain complex

The Euclidean Distance Degree of the bipartite-multipartition variety $V(\Pi)$ in two ambients: the chain-complex ambient $\mathcal H = \prod_n \mathrm{Sym}^+(C_n)$ and the free-bipartite ambient $\prod_n \mathrm{Sym}_{r_n}$ (no chain coupling).

## Univariate (Bik–Draisma)

For $V(\lambda) \subset \mathrm{Sym}_n$ the variety of real symmetric matrices with eigenvalue partition $\lambda$,
$$\mathrm{EDD}(V(\lambda)) = \frac{n!}{\prod_i \lambda_i!}.$$

A clean multinomial.

## Bipartite, free ambient (conjecture)

> **Conjecture.** For the variety $V(\Pi) \subset \prod_n \mathrm{Sym}_{r_n}$ defined by a bipartite multipartition $\Pi$ in the free product (no chain coupling),
> $$\mathrm{EDD}(V(\Pi)) = \frac{\prod_n r_n!}{\prod_B \prod_n k_n^B!}.$$

The bipartite multinomial. Reduces to Bik–Draisma when only one $r_n$ is nonzero. Proof: should generalize the univariate proof — open.

## Bipartite, chain-complex ambient

The chain-complex variety $V(\Pi) \subset \mathcal H = \prod_n \mathrm{Sym}^+(C_n)$ is defined by the discriminant of the generalized eigenvalue pencil $\det(d_n^T Q_{n-1} d_n - \lambda Q_n) = 0$. The chain coupling between $Q_{n-1}$ and $Q_n$ via $d_n$, plus the SPD-cone boundary structure, produce a different EDD.

**Computed case** (`examples/edd-computation-on-2-1-chain.md`): chain dims $(2, 3, 1)$, rank profile $(2, 1)$, $\Pi_A$ = the multipartition with two coinciding squared singular values of $\widetilde d_1$:
$$\mathrm{EDD}(V(\Pi_A)) = 40 \quad \text{(computed in M2 via Lagrange-multiplier system)}.$$

The free-bipartite multinomial would predict 1 for this case.

## Decomposition by stratification

The 40 critical points distribute over the singular locus of $V(\Pi_A)$, which has 5 components:
- 1 component (codim 2 in $\mathbb A^9$, deg 7): pure Stratification I, conjecturally $V(\Pi_T)$.
- 4 components (codim 3 each, degs 1, 3, 5, 9): Stratification II at the SPD-cone boundary.

Conjectured decomposition:
$$\mathrm{EDD}_{\text{chain}}(V(\Pi)) = \mathrm{EDD}_{\text{interior}}(V(\Pi)) + \sum_S \mathrm{EDD}_S$$
with $S$ ranging over Stratification II strata that $V(\Pi)$ intersects, and $\mathrm{EDD}_{\text{interior}}$ matching the free-bipartite multinomial.

For the (2,1) case this would give $1 + 39$, with 39 distributed over the 4 boundary components. Verifying the decomposition requires computing the saturated EDD (`questions/saturated-edd.md`).

## Open

1. **Free bipartite Bik–Draisma**, proof (`questions/bipartite-bik-draisma.md` if separated). Generalize the univariate proof.

2. **Saturated EDD on (2,1)** (`questions/saturated-edd.md`). M2 saturation by $\det Q_0 \cdot \det Q_1$ did not terminate. Alternative: primary-decomposition of the ED ideal, identifying boundary primes by hand.

3. **Boundary-component degrees.** The 4 boundary components of $V(\Pi_A)$ have degrees $(1, 3, 5, 9)$. Whether these match Stratification II Pataki + Schubert codim/degree predictions for specific $(\mathbf r, \sigma)$ patterns is computable.

4. **Pattern across chain complexes.** Compute $\mathrm{EDD}_{\text{chain}}$ on small cases varying $(C_\bullet, d, \Pi)$ — e.g., $(2, 1)$ with rank profile $(1, 1)$, $(3, 2, 1)$, $\partial \Delta^k$ — and look for the boundary contribution as a function of the chain complex's invariants.

## Connection to Vassiliev cohomology

EDD is one numerical invariant of $V(\Pi)$. The structural generalization is the cohomology of $V(\Pi)$ via Vassiliev's resolution-of-discriminant machinery — the [bipartite Vassiliev / Shapiro–Vainshtein](bipartite-vassiliev-shapiro-vainshtein.md) entry. In the chain-complex ambient, Vassiliev cohomology mixes Stratification-I and Stratification-II contributions, so a full computation requires the [combined-stratification framework](questions/mixed-stratification-strata.md).
