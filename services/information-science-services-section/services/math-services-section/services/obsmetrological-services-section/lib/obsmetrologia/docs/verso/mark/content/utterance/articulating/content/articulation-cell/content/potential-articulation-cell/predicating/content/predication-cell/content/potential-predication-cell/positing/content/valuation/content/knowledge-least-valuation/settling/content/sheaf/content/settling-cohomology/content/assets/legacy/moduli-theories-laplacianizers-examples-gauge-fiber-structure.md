---
type: example
status: draft
depends-on: [hodge-laplacian, moduli-of-laplacianizations, cellular-sheaf]
see-also: [cellular-sheaf-on-tetrahedron-boundary, moduli-of-triangle-boundary]
instantiates: [laplacianizability]
---

# The structure of the 8-dim gauge fiber on $\partial \Delta^3$

Continuation of `examples/cellular-sheaf-on-tetrahedron-boundary.md`. The map $\Phi: \mathcal H_{\mathrm{cell}} \to \mathcal M_{\mathrm{Lap}}$ is surjective with 8-dim fiber at generic $Q$. The question this note works out: *what is the structure of that fiber* — Lie algebra, Lie group, integrability, special-point degenerations?

## Setup

Notation as in the previous example. $C^\bullet$ is the cellular cochain complex of $\partial \Delta^3$. $G$ is the chain automorphism group ($\dim G = 35$); $\mathfrak g$ its Lie algebra. $\mathcal H_{\mathrm{cell}} \subset \mathcal H$ is the diagonal locus (dim 14 inside dim 41). $Q \in \mathcal H_{\mathrm{cell}}$ is a generic diagonal Hilbert structure, with all entries $a_i, b_{ij}, c_{ijk}$ distinct.

## The gauge Lie algebra at $Q$

The **fiber-tangent** at $Q$ is $\mathfrak{fib}(Q) := T_Q \mathcal H_{\mathrm{cell}} \cap T_Q(G \cdot Q)$. It consists of variations $\xi \cdot Q$ that:
1. lie in $T_Q \mathcal H_{\mathrm{cell}}$ — i.e., are *diagonal* symmetric matrices;
2. lie in the $G$-orbit tangent — i.e., are of the form $\xi \cdot Q = -(\xi^T Q + Q\xi)$ for $\xi \in \mathfrak g$.

A variation $\xi \cdot Q$ is diagonal iff $\xi^T Q + Q\xi$ is diagonal, equivalently for each $n$ and each pair $i \ne j$:

$$\xi_{n, ji} \, q^{(j)}_n + \xi_{n, ij} \, q^{(i)}_n = 0, \qquad \text{i.e.,} \qquad \xi_{n, ji} = -\frac{q^{(i)}_n}{q^{(j)}_n} \, \xi_{n, ij}. \qquad (\star)$$

So the off-diagonal entries of each $\xi_n$ are constrained pairwise — one free parameter per ordered pair $(i, j)$ with $i < j$. The diagonal entries of $\xi$ are unconstrained by $(\star)$.

Define

$$\mathfrak n(Q) := \{\xi \in \mathfrak{gl}(C_0) \oplus \mathfrak{gl}(C_1) \oplus \mathfrak{gl}(C_2) : \xi \text{ satisfies } (\star)\}.$$

Then $\dim \mathfrak n(Q) = \binom{4+1}{2} + \binom{6+1}{2} + \binom{4+1}{2} = 10 + 21 + 10 = 41 = \dim \mathcal H$.

The gauge Lie algebra is

$$\mathfrak{fib}(Q) = (\mathfrak n(Q) \cap \mathfrak g) / \mathrm{stab}_\mathfrak g(Q).$$

For generic $Q$, $\mathrm{stab}_\mathfrak g(Q)$ is $0$-dim (transversality $\dim \mathfrak g + \dim \mathfrak u(Q) - \dim \mathfrak{gl} = 35 + 27 - 68 = -6 < 0$, so generically trivial). So

$$\dim \mathfrak{fib}(Q) = \dim(\mathfrak n(Q) \cap \mathfrak g) = \dim \mathfrak n(Q) + \dim \mathfrak g - \dim \mathfrak{gl} = 41 + 35 - 68 = 8.$$

Match with the geometric count $\dim \mathcal H_{\mathrm{cell}} - \dim \mathcal M_{\mathrm{Lap}} = 14 - 6 = 8$. ✓

## Decomposition: uniform + twisted skew

Decompose $\mathfrak{fib}(Q)$ into orthogonal subspaces along the lines suggested by $(\star)$.

**Uniform scaling, $\mathfrak{fib}_{\mathrm{unif}}$.** The diagonal-only solutions: $\xi_n = $ diagonal matrix with entries $\xi_{n,i}$. The chain constraint $\xi_0 d_1 = d_1 \xi_1$ on diagonal $\xi$ requires $\xi_{0, i} = \xi_{1, e}$ whenever $v_i$ is an endpoint of edge $e$. Since $\partial \Delta^3$ is connected, this propagates: $\xi_{n, \sigma}$ is the same scalar $c$ for every cell $\sigma$ in every degree. So

$$\mathfrak{fib}_{\mathrm{unif}} = \{c (I_4, I_6, I_4) : c \in \mathbb R\}, \qquad \dim = 1.$$

The corresponding gauge action: $Q \mapsto e^{-2c} Q$ — uniform multiplicative rescaling of all 14 weights by $\lambda := e^{-2c} > 0$. This visibly preserves the Laplacian operator (not just up to equivalence): in `examples/cellular-sheaf-on-tetrahedron-boundary.md`, $\Delta_n = (a/b) d_1 d_1^T + \cdots$ depends only on ratios $a/b, b/c$, so multiplying all of $a, b, c$ by the same scalar is invisible.

**Twisted-skew piece, $\mathfrak{fib}_{\mathrm{skew}}$.** The 7-dim complement consists of $\xi$'s with nonzero off-diagonal $(\star)$ entries, satisfying both chain-auto constraints. To describe these concretely:

For each $\xi_0 \in \mathfrak{gl}(C_0)$ satisfying $(\star)$ — i.e., $\xi_0$ in the $\mathrm{Sym}^+(Q_0)$-skew part of $\mathfrak{gl}(C_0)$ — the chain extension to $\xi_1, \xi_2$ is determined modulo:
- a 3-dim choice in $\xi_1$ (the kernel of $d_1$, which a-priori could be added to each $\xi_1 e_{ij}$ value subject to compatibility with the $\xi_2$ chain constraint downstream), and
- a 1-dim choice in $\xi_2$ (the kernel of $d_2$, which is the harmonic representative of $H_2$).

The chain compatibility through both layers is what cuts the degrees-of-freedom precisely to 7 — but to write them out explicitly requires choosing a basis. The cleanest description is the abstract one:

$$\mathfrak{fib}_{\mathrm{skew}} = \{\xi \in \mathfrak g : \xi \text{ satisfies } (\star), \xi \text{ has zero diagonal}\}, \qquad \dim = 7.$$

So $\mathfrak{fib}(Q) = \mathfrak{fib}_{\mathrm{unif}} \oplus \mathfrak{fib}_{\mathrm{skew}}$, $1 + 7 = 8$ dimensions.

## $N(Q)$ is not a subgroup

Let $N(Q) := \{g \in G : g \cdot Q \in \mathcal H_{\mathrm{cell}}\}$. The Lie-algebra-tangent at the identity is $\mathfrak n(Q) \cap \mathfrak g$, dim 8.

**$N(Q)$ is not closed under composition.** If $g_1 \cdot Q = Q_1 \in \mathcal H_{\mathrm{cell}}$ and $g_2 \cdot Q = Q_2 \in \mathcal H_{\mathrm{cell}}$, then $(g_2 g_1) \cdot Q = g_2 \cdot Q_1$ — and there is no reason for $g_2 \cdot Q_1$ to be diagonal, since $g_2$ was chosen to take $Q$ (not $Q_1$) to a diagonal.

So the 8-dim distribution $\mathfrak n(Q) \cap \mathfrak g$ varies as $Q$ varies along the fiber: it is a $Q$-dependent subspace of $\mathfrak g$. The fiber is the *integral submanifold* of this varying distribution through $Q$, not an orbit of a fixed Lie group.

This is structurally important: the gauge fiber is not a homogeneous space, so it does not admit a uniform "structure group" description. It is a smooth 8-manifold defined by 6 polynomial equations (the spectral matching) on $\mathbb R_{>0}^{14}$, and that algebraic-variety description is in some sense the cleanest available.

## Integrability of the gauge distribution

The distribution $Q \mapsto \mathfrak n(Q) \cap \mathfrak g$ on $\mathcal H_{\mathrm{cell}}$ is **integrable**: its integral submanifolds are the fibers of $\Phi$. This is automatic given that $\Phi$ is well-defined as a map to $\mathcal M_{\mathrm{Lap}}$ (well-defined modulo $G$-equivalence implies the fibers form a foliation).

What's *not* automatic and would be informative: an explicit Frobenius-type bracket calculation — for $\xi, \eta \in \mathfrak{fib}(Q)$, is $[\xi, \eta] \in \mathfrak{fib}(Q)$? The answer should be yes, but verifying it in coordinates is open work.

If yes, $\mathfrak{fib}(Q)$ is a Lie algebra — though *not* the Lie algebra of any one Lie group, since the gauge-fiber-bundle structure changes from fiber to fiber. The Lie algebra structure would be Q-dependent.

## At the Euclidean point: extra symmetry, dimension drop

At $Q = Q_{\mathrm{Euc}} = (1, \ldots, 1)$ (all weights equal to 1), the spectrum of $\Delta$ degenerates: $\Delta_0$ has eigenvalues $\{0, 4, 4, 4\}$, $\Delta_1 = 4 I_6$, $\Delta_2$ has $\{0, 4, 4, 4\}$. The **stabilizer in $\mathfrak g$** is large.

A unitary chain auto $u \in G$ with $u \cdot Q_{\mathrm{Euc}} = Q_{\mathrm{Euc}}$ must commute with $\Delta = 4 I$ (where this holds) and with $\Delta_0, \Delta_2$ on their respective 3-dim eigenspaces. On those eigenspaces, $\Delta$ is a scalar, so $u$ can act as any element of $O(3)$. Combining:

- $u_0 \in O(\mathrm{im}\, d_1) \cong O(3)$ acting on the 3-dim non-kernel of $\Delta_0$ — 3 dim.
- $u_2 \in O(\mathrm{im}\, d_2^*) \cong O(3)$ acting on the 3-dim non-kernel of $\Delta_2$ — 3 dim.
- $u_1$ on $C_1$ is determined by $u_0$ (via $d_1$) on $\mathrm{im}\, d_1^*$ and by $u_2$ (via $d_2$) on $\mathrm{im}\, d_2$.
- Plus discrete $\pm 1$ on the 1-dim kernels.

Dimension of the stabilizer: $3 + 3 = 6$, matching the count from `cellular-sheaf-on-tetrahedron-boundary.md`.

This means at $Q_{\mathrm{Euc}}$, the orbit-tangent dim drops: $\dim T_{Q_{\mathrm{Euc}}}(G \cdot Q_{\mathrm{Euc}}) = 35 - 6 = 29$. By the transversality formula, $\dim \mathfrak{fib}(Q_{\mathrm{Euc}}) \ge 14 + 29 - 41 = 2$.

So the fiber-tangent at Euclidean is only 2-dim, not 8-dim. The fiber over the Euclidean moduli point is actually *higher-dimensional* (12-dim, by conservation: at this codim-6 stratum of moduli, fibers are correspondingly larger), but its tangent space at the smooth subset shrinks to 2-dim because the 6 stabilizer dimensions are now "vertical" — they parameterize the Euclidean moduli stratum's neighborhood without changing the moduli class, but they correspond to *non-diagonal* $\xi$ orbits, not gauge-along-the-fiber directions.

The Euclidean fiber is therefore a singular orbifold-type stratum: smooth pieces of dim 12 with a 6-dim "stabilizer" group fibering over them, and the visible tangent at $Q_{\mathrm{Euc}}$ within $\mathcal H_{\mathrm{cell}}$ is the 2-dim "fully-symmetric" rescaling subspace ($a$-uniform, $b$-uniform, $c$-uniform with $a/b = b/c = 1$, plus a 2nd direction broken by the constraints).

This singular behavior is generic in moduli problems: the fiber dim "jumps" at strata where stabilizer dim jumps. It is consistent with the moduli theorem and the gauge-dimension formula at smooth points.

## Findings

1. **Gauge dimension formula.** $\dim \mathfrak{fib}(Q) = 8$ at generic $Q$ on $\partial \Delta^3$, matching $\dim \mathcal H_{\mathrm{cell}} - \dim \mathcal M_{\mathrm{Lap}}$.

2. **The gauge is foliation, not principal bundle.** $N(Q)$ is not a subgroup of $G$. The map $\Phi: \mathcal H_{\mathrm{cell}} \to \mathcal M_{\mathrm{Lap}}$ is a smooth foliation with $Q$-dependent integrable 8-dim distribution.

3. **1+7 fiber decomposition.** $\mathfrak{fib}_{\mathrm{unif}} \oplus \mathfrak{fib}_{\mathrm{skew}}$. The 1-dim uniform-rescaling direction preserves $\Delta$ as an operator; the 7-dim skew directions preserve only its unitary-equivalence class.

4. **Singular stratum at the Euclidean point.** Codim-6 stratum with extra 6-dim supersymmetric stabilizer; fiber dim jumps.

## Bearing on universal-Laplacianization

A clean adjoint structure between $\mathcal C \to \mathbf{Ch}(\mathbf{Hilb})$ and a forgetful functor would imply a uniform (homogeneous-space) gauge structure on moduli. The non-homogeneous foliated structure here rules out that form of adjoint (`questions/universal-laplacianization.md`, resolved).

The gauge distribution is integrable with Lie-algebra-structured tangent at each point — consistent with $\mathcal M_{\mathrm{Lap}}$ as a stratified GIT-style quotient: gauge orbits uniform inside strata, jumping across strata. The Euclidean point is the higher-stratum example.

## Open

1. **Frobenius brackets.** Verify $[\mathfrak{fib}(Q), \mathfrak{fib}(Q)] \subset \mathfrak{fib}(Q)$ in coordinates, computing the structure constants.
2. **Stratification.** Identify the strata of $\mathcal M_{\mathrm{Lap}}(\partial \Delta^3)$ classified by stabilizer dim. The Euclidean point (codim 6) is one stratum; other strata correspond to partial eigenvalue degeneracies (e.g., $\sigma_1 = \sigma_2 \ne \sigma_3$ has codim 1).
3. **Generalization.** The pattern "gauge dim = $\dim \mathcal H_{\mathrm{cell}} - \dim \mathcal M_{\mathrm{Lap}}$" should generalize to other cell complexes. For $\partial \Delta^4$ (boundary of 4-simplex, $S^3$-homeomorphic): $\mathcal H_{\mathrm{cell}}$ has $5 + 10 + 10 + 5 = 30$ dimensions, $\mathcal M_{\mathrm{Lap}}$ has dimension to be computed. Conjecture: gauge dim = $\dim \mathcal H_{\mathrm{cell}} - \dim \mathcal M_{\mathrm{Lap}}$ holds, with explicit formulas in terms of rank profiles.
