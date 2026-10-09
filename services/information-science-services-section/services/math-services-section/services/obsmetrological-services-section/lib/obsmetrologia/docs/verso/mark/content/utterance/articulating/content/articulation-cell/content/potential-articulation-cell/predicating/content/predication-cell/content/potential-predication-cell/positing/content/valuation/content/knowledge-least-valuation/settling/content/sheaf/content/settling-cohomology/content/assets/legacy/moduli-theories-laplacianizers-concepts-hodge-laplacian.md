---
type: concept
class: operator
symbol: \Delta
status: draft
depends-on:
- laplacianizability
references:
- key: bartmann2025hodge
  type: article
  - Bartmann, Bobo
  - Keller, Matthias
  year: 2025
  title: On Hodge Laplacians on General Simplicial Complexes
  eprint: '2508.07761'
  eprinttype: arxiv
---

# The Hodge Laplacian

Pinned definitions and theorems used throughout laplacianizers.

## Definition

A **graded Hilbert chain complex** is a sequence of Hilbert spaces $C_n$ ($n \ge 0$, possibly only finitely many nonzero) and bounded linear maps $d_n: C_n \to C_{n-1}$ with $d_{n-1} d_n = 0$. Write $d_n^*: C_{n-1} \to C_n$ for the Hilbert adjoint of $d_n$.

The **Hodge Laplacian** in degree $n$ is

$$\Delta_n := d_{n+1} d_{n+1}^* + d_n^* d_n: C_n \to C_n.$$

Properties immediate from the definition:

1. $\Delta_n$ is self-adjoint and positive semidefinite: $\langle \Delta_n x, x \rangle = \|d_{n+1}^* x\|^2 + \|d_n x\|^2 \ge 0$.
2. $\ker \Delta_n = \ker d_n \cap \ker d_{n+1}^*$. Proof: $\Delta_n x = 0 \Leftrightarrow \langle \Delta_n x, x \rangle = 0 \Leftrightarrow d_n x = 0 \text{ and } d_{n+1}^* x = 0$.
3. $\Delta$ commutes with $d$: $\Delta_{n-1} d_n = d_n \Delta_n$. (Direct expansion using $d^2 = 0$.)

## Hodge decomposition

**Theorem (Hodge, finite-dimensional case).** If each $C_n$ is finite-dimensional, then

$$C_n = \ker(\Delta_n) \oplus \mathrm{im}(d_{n+1}) \oplus \mathrm{im}(d_n^*).$$

The summands are mutually orthogonal. Moreover the inclusion $\ker(\Delta_n) \hookrightarrow \ker(d_n)$ induces an isomorphism

$$\ker(\Delta_n) \xrightarrow{\sim} H_n(C_\bullet), \qquad H_n(C_\bullet) := \ker(d_n) / \mathrm{im}(d_{n+1}).$$

*Proof sketch.* Orthogonality: for $x \in \ker \Delta_n$, $y = d_{n+1} z$, $\langle x, y \rangle = \langle x, d_{n+1} z\rangle = \langle d_{n+1}^* x, z \rangle = 0$ since $d_{n+1}^* x = 0$ by (2) above. Similarly $\ker \Delta_n \perp \mathrm{im}\, d_n^*$, and $\mathrm{im}\, d_{n+1} \perp \mathrm{im}\, d_n^*$ because for $y = d_{n+1} z$, $w = d_n^* u$, we have $\langle y, w \rangle = \langle d_{n+1} z, d_n^* u \rangle = \langle d_n d_{n+1} z, u \rangle = 0$. Spanning: take $x \in C_n$, decompose using the orthogonal complement of $\mathrm{im}\, d_{n+1} + \mathrm{im}\, d_n^*$, which is finite-dimensional; show the orthogonal complement equals $\ker \Delta_n$.

Hodge isomorphism: every class in $H_n(C_\bullet)$ has a unique representative in $\ker \Delta_n$, namely the orthogonal projection of any cycle onto $\ker \Delta_n$.

**Theorem (Hodge, closed-range case).** If each $d_n$ has closed range (equivalently: $\Delta_n$ has $0$ as an isolated point of its spectrum, or has compact resolvent), the same statement holds with the same proof.

## Why this matters for laplacianizers

The Hodge isomorphism $\ker \Delta_n \cong H_n(C_\bullet)$ is the *single fact* that makes "$X$ has a Laplacian" non-trivial. Without it, the operator $\Delta$ is just an arbitrary positive operator one can attach to any inner-product space. With it, $\Delta$ is a *spectral realization of the cohomology* — the bottom of the spectrum, by dimension, equals the rank of $H_\bullet$, and the harmonic representatives are canonical cohomology classes.

Every "Laplacianization" in the 2025 survey is, structurally, an instance of this: produce $(C_\bullet(X), d, \langle \cdot, \cdot \rangle)$ from the input $X$ in such a way that $H_\bullet(C_\bullet(X))$ matches a known cohomology theory of $X$. The Laplacian is then *automatic*; the work is in the chain complex.

## Failure modes

If $d$ does not have closed range (typical for unbounded operators on infinite-dimensional spaces), $\Delta$ may have continuous spectrum near $0$, and $\ker \Delta$ may be smaller than $H_\bullet$. Standard examples:

- $\Delta$ on non-compact Riemannian manifolds: $L^2$-cohomology can differ from de Rham cohomology.
- $\Delta$ on infinite simplicial complexes that are not locally finite ([@bartmann2025hodge] does the work to recover Hodge in this case).

The closed-range condition is therefore one of the technical invariants of "well-behaved" Laplacianization — and one of the conditions a clean general theorem would have to handle.
