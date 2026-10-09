---
type: theorem
status: known
depends-on:
- laplacianizability
- metric-measure-space
references:
- key: honda2025almost
  type: article
  authors:
  - Honda, Shouhei
  - Sun, Xiang
  year: 2025
  title: From almost smooth spaces to RCD spaces
  eprint: '2502.20998'
  eprinttype: arxiv
- key: violo2025overview
  type: article
  authors:
  - Violo, Ivan Yuri
  year: 2025
  title: An overview of regularity results for the Laplacian and p-Laplacian in metric spaces
  eprint: '2502.00825'
  eprinttype: arxiv
title: Agreement of Cheeger-energy and Bakry–Émery Laplacians on RCD spaces
description: Statement.
---

# Agreement of Cheeger-energy and Bakry–Émery Laplacians on RCD spaces

**Statement.** On an $\mathrm{RCD}(K, \infty)$ metric measure space $(X, d, m)$, the Laplacian obtained as the generator of the Cheeger-energy gradient flow agrees with the generator obtained from the Bakry–Émery iterated carré du champ.

A known result in synthetic geometry, established for the synthetic Ricci-curvature class.

## In the Laplacianizer language

Two candidate Hilbert lift functors on the category of RCD spaces — Cheeger-energy and Bakry–Émery — produce naturally isomorphic Laplacians on this sub-category of inputs. Neither is trivially derived from the other; the agreement is a non-trivial coincidence of two different functorial constructions.

This is the structural shape that motivates the universal-Laplacianization question ([universal-laplacianization](questions/universal-laplacianization.md)): when two structurally distinct routes produce the same Laplacian on overlapping inputs, the agreement is candidate evidence for a universal-property statement.

## See also

- [@honda2025almost] — Bakry–Émery / RCD parallel framings.
- [@violo2025overview] — regularity survey in both pictures.
- Other instances of the same shape (open): hypergraph clique- vs sheaf-on-poset Laplacians, persistent vs de Rham Laplacians.
