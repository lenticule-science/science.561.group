---
type: question
status: resolved
explores:
- laplacianizability
- laplacianizer
resolution: Laplacianizable = admits a Laplacianizer (concepts/laplacianizer.md).
references:
- key: andreotti2025generalizing
  type: article
  authors:
  - Andreotti, Eleonora
  year: 2025
  title: 'Generalizing Lattice Structures to Hypergraphs: Spectra of Clique and Hyperedge-based Laplacians'
  eprint: '2511.11138'
  eprinttype: arxiv
---

# What is the right definition of Laplacianizability?

## Resolution

This question was originally posed as a choice between three candidate forms of the definition (Form A: concrete graded Hilbert chain complex; Form B: operator-theoretic with $d^2 = 0$ and self-adjoint $\Delta$; Form C: categorical functor $\mathcal C \to \mathbf{HilbCh}$). The "Forms A/B/C" framing was abandoned. The current definition is in `concepts/laplacianizability.md`:

> $(\mathcal C, H^\bullet)$ is **Laplacianizable** iff it admits a *Laplacianizer* — a triple $\mathfrak L = (F, d, \eta)$ where $F: \mathcal C \to \mathbf{Hilb}^\mathbb{Z}$, $d^2 = 0$, and $\eta: H^\bullet \xrightarrow{\sim} H_\bullet(F, d)$ is a natural iso (`concepts/laplacianizer.md`).

This is essentially the old Form C, made into the primary object of study rather than one option among three.

## What replaces this question

The active questions in this region of laplacianizers are now:

- **What is the right ambient?** The Hilbert lift $F$ takes values in graded Hilbert chain complexes. But the moduli of Laplacianizers ($\mathcal M_{\mathrm{Lap}}$) has natural extensions: its closure in $\overline{\mathcal H}$ adds Stratification II at the SPD-cone boundary (`theorems/hilbert-degeneracy-stratification.md`). What's the "right" ambient for moduli — SPD interior, algebraic closure, or a smarter compactification?

- **What is the right notion of equivalence?** Two Laplacianizers are equivalent if there's a natural iso between them; this descends to the orbit equivalence on $\mathcal H$ under the chain auto group $G$. But the orbit-equivalence might be too fine for some applications (e.g., we may want to remember spectral data only). Coarser equivalences would give different moduli — open which is "right."

- **What is the right cohomology theory $H^\bullet$?** The hypergraph case ([@andreotti2025generalizing]) shows multiple inequivalent cohomology theories on the same input category. The choice of $H^\bullet$ is part of the data, and not always unique.

These are sharper questions than "which Form A/B/C," and they have answers in specific cases (worked out in `theorems/closure-poset-of-strata.md`, `theorems/moduli-of-laplacianizers.md`).
