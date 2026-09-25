---
type: concept
class: property
symbol: Lap
status: draft
see-also:
- hodge-laplacian
- hodge-decomposition
- laplacianizer
references:
- key: ayzenberg2025sheaf
  type: article
  - Ayzenberg, Anton
  - Gebhart, Thomas
  - Magai, German
  - Solomadin, Grigory
  year: 2025
  title: 'Sheaf theory: from deep geometry to deep learning'
  eprint: '2502.15476'
  eprinttype: arxiv
- key: wei2023persistent
  type: article
  - Wei, Jian
  - Wei, Guo-Wei
  year: 2023
  title: Persistent Topological Laplacians -- a Survey
  eprint: '2312.07563'
  eprinttype: arxiv
- key: wolf2025generalized
  type: article
  - Wolf, Roman
  - Fan, Jiahui
  - Monod, Anthea
  year: 2025
  title: Generalized Persistent Laplacians and their Spectral Properties
  eprint: '2509.20220'
  eprinttype: arxiv
---

# Laplacianizability

## What a Laplacian is

Let $C_\bullet = (C_n)_{n \ge 0}$ be a graded Hilbert space — each $C_n$ a Hilbert space, with inner product $\langle \cdot, \cdot \rangle_n$ — and let $d_n: C_n \to C_{n-1}$ be a bounded operator with $d_{n-1} d_n = 0$. Write $d_n^*: C_{n-1} \to C_n$ for the Hilbert adjoint. The **Hodge Laplacian** in degree $n$ is

$$\Delta_n = d_{n+1} d_{n+1}^* + d_n^* d_n: C_n \to C_n.$$

$\Delta_n$ is positive semidefinite and self-adjoint by construction; the data of $\Delta_n$ is *fully determined* by $(C_\bullet, \langle \cdot, \cdot \rangle, d)$ — no extra choice is involved.

The **homology** of the chain complex is $H_n(C_\bullet) = \ker(d_n) / \mathrm{im}(d_{n+1})$. The **Hodge theorem** says that when each $d_n$ has closed range (in particular: when every $C_n$ is finite-dimensional),

$$C_n = \ker(\Delta_n) \oplus \mathrm{im}(d_{n+1}) \oplus \mathrm{im}(d_n^*), \qquad \ker(\Delta_n) \cong H_n(C_\bullet).$$

In particular, $\ker(\Delta_n)$ is a *canonical realization* of the homology: the harmonic representatives.

## What "Laplacianizable" should mean

The word "Laplacianizable" applied to an input structure $X$ is content-free unless tied to a target cohomology theory. Saying "$X$ has a Laplacian" reduces, by the paragraph above, to "$X$ has a Hilbert chain complex $C_\bullet(X)$" — which is trivial: take $C_\bullet(X) = 0$.

The non-trivial structure is the requirement that the chain complex *compute a pre-existing cohomology theory of $X$*. That's the content of every actual Laplacianization in the survey: simplicial cochains compute simplicial cohomology (Eckmann); sheaf cochains compute sheaf cohomology (Hansen–Ghrist); persistent cochains compute persistent homology (Wang–Wei); de Rham forms compute de Rham cohomology (Hodge).

So the working definition we adopt is:

> **Definition (Laplacianizability).** Let $\mathcal C$ be a category equipped with a *cohomology theory* $H^\bullet: \mathcal C \to \mathbf{grVect}_\Bbbk$ valued in graded $\Bbbk$-vector spaces. The pair $(\mathcal C, H^\bullet)$ is **Laplacianizable** if it admits a *Laplacianizer* — a triple $\mathfrak L = (F, d, \eta)$ where $F: \mathcal C \to \mathbf{Hilb}^{\mathbb Z}$ is a functor to graded Hilbert spaces, $d$ is a degree-$(-1)$ chain differential on $F$ with $d^2 = 0$, and $\eta: H^\bullet \xrightarrow{\sim} H_\bullet(F, d)$ is a natural isomorphism (on closed-range objects).

See `concepts/laplacianizer.md` for the Laplacianizer object itself. Laplacianizability is the *property* of admitting one; the Laplacianizer is the *object* whose moduli laplacianizers studies.

The Laplacian is a derived invariant of the Laplacianizer: $\Delta_n^X := \Delta_n^{F(X)}$ is well-defined, and Hodge gives $\ker(\Delta_n^X) \cong H^n(X)$ via $\eta$.

This definition is doing real work. Three things become statements rather than gestures:

1. **Existence.** Does $H^\bullet$ admit a Laplacianizer at all? Many cohomology theories don't naturally land in finite-dimensional or even reflexive Banach spaces, so there is something to prove.
2. **Uniqueness.** Given two Laplacianizers $\mathfrak L, \mathfrak L'$ of the same $(\mathcal C, H^\bullet)$, are they naturally isomorphic? In general, no — the inner products differ — but they produce isomorphic *kernels* of Laplacians (because both compute $H^\bullet$). The non-canonical part is exactly the *moduli of Laplacianizers* (`theorems/moduli-of-laplacianizers.md`).
3. **Universal property.** Among all Laplacianizers, is there one that is initial / terminal in the appropriate sense? This is sharper than (2): not just existence and equivalence on cohomology, but a canonical preferred Laplacianizer. The answer (`questions/universal-laplacianization.md`, resolved): no canonical Laplacianizer in general; the universal property is structural — the moduli of Laplacianizers has a uniform orbifold-stratified shape (`theorems/main-theorem-synthesis.md`), not a unique element.

## Where the 2025 papers sit

Each 2025 paper in `references/` constructs a Hilbert lift for some $(\mathcal C, H^\bullet)$:

- $(\mathcal C, H^\bullet) = $ (cellular sheaves on regular CW complexes, sheaf cohomology) — Hansen–Ghrist, extended to sheaves on finite posets in [@ayzenberg2025sheaf].
- $(\mathcal C, H^\bullet) = $ (persistence modules, persistent homology) — [@wei2023persistent], [@wolf2025generalized].
- $(\mathcal C, H^\bullet) = $ (hypergraphs, hypergraph cohomology) — multiple non-equivalent lifts, exposing that the *cohomology theory* is itself disputed for hypergraphs.
- $(\mathcal C, H^\bullet) = $ (RCD spaces, Cheeger cohomology in degree 0) — Hilbert lift exists in degree 0 only; higher-degree analogs are obstructed because the cohomology theory itself is not classical above degree 0.

The hypergraph row exposes a sharp fact: *part of what 2025 is doing is choosing $H^\bullet$ for $\mathcal C$, not just lifting it*. A "new hypergraph Laplacian" often comes with an implicit "new hypergraph cohomology theory" — clique-cohomology vs. sheaf-on-poset cohomology vs. symmetric-simplicial-set cohomology. The Hilbert-lift framework makes this hidden choice visible.

## What Laplacianizability is *not*

- It is not a property of an input $X$ alone. It is a property of a pair $(\mathcal C, H^\bullet)$ — a category and a cohomology theory on it.
- It is not the existence of an operator. The operator is automatic. The non-trivial part is that the operator's kernel computes the *right* cohomology.
- It is not equivalent to "fits into the de Rham–Hodge template." It is equivalent to admitting a Hilbert lift of a *given* cohomology theory; the de Rham–Hodge case is one instance.

## Open questions, restated in this language

- (`questions/what-is-laplacianizability.md`) — Is the right Hilbert lift functor unique up to natural iso? When?
- (`questions/obstruction-to-laplacianization.md`) — Which $(\mathcal C, H^\bullet)$ admit no Hilbert lift, and why?
- (`questions/universal-laplacianization.md`) — When the Hilbert lift exists, is there a universal one (initial / terminal in the category of Hilbert lifts)?

These three are now mathematical questions, not vibes. Each has a yes/no answer in any specific case, and partial answers exist in the literature for the cases the survey covers.
