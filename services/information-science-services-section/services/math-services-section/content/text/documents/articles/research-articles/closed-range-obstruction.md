---
type: theorem
status: known
depends-on:
- hodge-laplacian
references:
- key: bartmann2025hodge
  type: article
  authors:
  - Bartmann, Bobo
  - Keller, Matthias
  year: 2025
  title: On Hodge Laplacians on General Simplicial Complexes
  eprint: '2508.07761'
  eprinttype: arxiv
---

# Closed-range obstruction (known, made precise)

A precise statement of *the* technical condition controlling whether a Laplacianization is well-behaved.

## Statement

Let $(C_\bullet, d, \langle \cdot, \cdot \rangle)$ be a graded Hilbert chain complex (countable index set, possibly infinite-dimensional spaces, $d$ closed densely-defined with $d \circ d = 0$). The following are equivalent:

1. Each $d_n$ has closed range in $C_{n-1}$.
2. The Hodge decomposition $C_n = \ker(\Delta_n) \oplus \overline{\mathrm{im}(d_{n+1})} \oplus \overline{\mathrm{im}(d_n^*)}$ holds with the closures being equalities.
3. $0$ is an isolated point of the spectrum of $\Delta_n$ (or $\Delta_n$ has compact resolvent — a slightly stronger condition).
4. The natural map $\ker(\Delta_n) \to H_n^{\mathrm{red}}(C_\bullet) := \ker(d_n) / \overline{\mathrm{im}(d_{n+1})}$ is an isomorphism.

When (1)–(4) hold, the Hodge isomorphism $\ker(\Delta_n) \cong H_n^{\mathrm{red}}(C_\bullet)$ identifies harmonic representatives with reduced homology classes.

## Proof sketch

(1) ⇔ (2): Closed range of $d_{n+1}$ means $\mathrm{im}\, d_{n+1}$ is closed; orthogonality of $\mathrm{im}\, d_{n+1}$ and $\mathrm{im}\, d_n^*$ holds as in the finite-dim Hodge proof using $d \circ d = 0$ and adjointness; the orthogonal complement of $\mathrm{im}\, d_{n+1} + \mathrm{im}\, d_n^*$ is $\ker d_{n+1}^* \cap \ker d_n = \ker \Delta_n$.

(1) ⇔ (3): Standard spectral theory. Closed range of $d_n$ is equivalent to the bottom of the spectrum of $d_n^* d_n$ being either $0$ or an isolated point.

(2) ⇒ (4): Given the orthogonal decomposition, $\ker(d_n) = \ker(\Delta_n) \oplus \overline{\mathrm{im}(d_{n+1})}$ (kernels add inside the part orthogonal to $\mathrm{im}\, d_n^*$), so $\ker(d_n) / \overline{\mathrm{im}(d_{n+1})} \cong \ker(\Delta_n)$.

(4) ⇒ (1): Reverse the argument; details in any standard treatment of $L^2$-cohomology.

## Role in the framework

The closed-range condition is the technical core of [obstruction-to-laplacianization](questions/obstruction-to-laplacianization.md). A Hilbert lift $F: \mathcal C \to \mathbf{Ch}(\mathbf{Hilb})$ satisfies the Hodge isomorphism with the *unreduced* cohomology $H_n(F(X)) := \ker(d_n) / \mathrm{im}(d_{n+1})$ (without closure) only when each $d_n^{F(X)}$ has closed range. Otherwise, the Laplacian computes *reduced* cohomology — homology with the closure quotient, which can differ from algebraic homology.

This explains the difficulty of Laplacianizing infinite-dimensional cases:

- Non-locally-finite simplicial complexes ([@bartmann2025hodge]): closed range is non-trivial; the paper's contribution is to identify weight conditions under which $d_n$ has closed range.
- Non-compact Riemannian manifolds: closed range of the de Rham $d$ on $L^2$-forms can fail. $L^2$-cohomology and de Rham cohomology then differ — this is *the* classical case where the Laplacian computes a different invariant from the algebraic one.
- Quantum graphs, RCD spaces, persistence modules with continuous parameter: closed range is the technical condition the relevant 2025 papers all address (often implicitly).

## Status

Classical result; the closed-range characterization of Hodge in the unbounded case is standard $L^2$-cohomology (Cheeger, Anné, Bui Trong Vu, Lück). Included for the precise statement.

## See also

[obstruction-to-laplacianization](questions/obstruction-to-laplacianization.md) — closed range is the analytical obstruction to Laplacianization in infinite-dim. Automatic for combinatorial finite inputs; dominant for analytical inputs.
