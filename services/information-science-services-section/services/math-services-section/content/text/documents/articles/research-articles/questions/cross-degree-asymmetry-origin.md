---
type: question
status: open
explores:
- cross-degree-identification
- stab-codim-formula
- universal-vs-categorical-stratification
references:
- key: aksoy2025reimagining
  type: article
  authors:
  - Aksoy, Sinan G.
  - Young, Stephen J.
  year: 2025
  title: Re-imagining Spectral Graph Theory
  eprint: '2504.10624'
  eprinttype: arxiv
title: Why is the cross-degree codim/stab asymmetry universal?
description: "The bipartite stratification theorem produces an asymmetry between within-degree and cross-degree blocks:"
---

# Why is the cross-degree codim/stab asymmetry universal?

The bipartite stratification theorem produces an asymmetry between within-degree and cross-degree blocks:

| Block type | Codim contribution | Stab contribution |
|---|---|---|
| Within-degree, $k_n^B = k$ | $k - 1$ | $\binom{k}{2}$ |
| Cross-degree pair, $k_{n}^B = k_{n+1}^B = 1$ | $1$ | $0$ |

Cross-degree blocks contribute to codim *but not to stab*. This is the structural fingerprint of the bipartite extension.

## Question

What's the deeper reason for this asymmetry? Is there a universal-categorical or representation-theoretic statement that explains it?

## Surface explanation

The chain auto group $G$ on a chain complex $(C_\bullet, d)$ satisfies $g_{n-1} d_n = d_n g_n$. On a joint eigenspace $\mathcal E_B = \bigoplus_n \mathcal E_n^B$ of a cross-degree block, an element of $G$ preserving $\mathcal E_B$ must act block-diagonally — independent rotation on each $\mathcal E_n^B \subseteq C_n$.

Within-degree rotations (inside a single $\mathcal E_n^B$) are free (full $O(k_n^B)$ on $C_n$ side, constrained only by the chain conditions on adjacent degrees, but those don't constrain rotations *within* a single eigenspace).

Cross-degree rotations (mixing $\mathcal E_n^B$ and $\mathcal E_{n+1}^B$) would mix degrees — forbidden by the chain conditions.

So: stab counts within-degree free rotations only.

Codim, on the other hand, counts independent eigenvalue equalities. Each cross-degree identification is an extra equality, hence contributes 1 to codim (regardless of degree).

## The deeper question

The surface explanation works for cellular chain complexes. But the same asymmetry appears in:

- **Smooth Riemannian case**: cross-degree blocks (of $\Delta_n$ vs. $\Delta_{n+1}$ on de Rham forms) contribute codim but not stab. Why?
- **Finite spectral triple case**: same asymmetry on Hochschild chains.
- **Parametric graph case** [@aksoy2025reimagining]: same asymmetry across vertex/edge inner-product degrees.

The asymmetry is *category-independent*. The chain-condition argument is *category-dependent*. So there must be a more fundamental statement.

## Candidate explanation: Hodge supersymmetric isospectrality

The Hodge identity $\Delta_n d^* = d^* \Delta_{n+1}$ on cocycles forces a *supersymmetric isospectrality*: the nonzero spectrum of $\Delta_n$ in $\mathrm{im}\,d_n^*$ equals the spectrum of $\Delta_{n+1}$ in $\mathrm{im}\,d_n$ as multisets. So *the same eigenvalue appears in both $\Delta_n$ and $\Delta_{n+1}$* — automatically, before any choice of inner product.

Cross-degree identification of an eigenvalue is, in this sense, *the default* for Hodge-paired eigenvalues. Forcing this default is what the cross-degree block of $\Pi_{\min}$ does — it just records the Hodge pairing, not an extra identification.

Beyond Hodge-forced cross-degree identifications, *additional* cross-degree blocks correspond to identifications between non-Hodge-paired eigenvalues across non-adjacent degrees, or between degree-$n$ eigenvalues in $\mathrm{harm}_n$ (the harmonic piece) and degree-$n'$ eigenvalues from elsewhere.

So: cross-degree identifications between adjacent operators are Hodge-forced (no extra codim, no extra stab). Cross-degree identifications between non-adjacent operators (or between harm and image pieces) cost codim 1 each. They cost no stab because Hodge supersymmetry doesn't intertwine adjacent degrees in a way that produces extra automorphisms.

## Reframed conjecture

> **Conjecture.** The cross-degree codim/stab asymmetry is the categorical expression of Hodge supersymmetric isospectrality: cross-degree identifications between Hodge-paired eigenvalues are *forced*, hence don't cost codim or stab; identifications beyond this are *extra equations* on spectral data, hence cost codim 1 but produce no new automorphism (since chain auto cannot mix degrees).

Verifying this on:
- Cellular case: ✓ (confirmed, the surface argument).
- Smooth Riemannian case: should hold via the de Rham Hodge identity. Verify on small Riemannian manifolds.
- Spectral triple case: should hold via the analog Hodge identity for Hochschild chains.

## Categorical formulation

A *Hodge-symmetric chain complex* is a chain complex with a Hilbert structure for which the supersymmetric isospectrality holds. The cross-degree asymmetry is then a property of moduli of Hodge-symmetric chain complex objects.

The category of Hodge-symmetric chain complex objects (with appropriate morphisms) might admit a *universal* statement: in any such category with appropriate moduli, the codim of a cross-degree identification is 1 and the stab contribution is 0.

This would be the "universal codim, categorical stab" theorem at full generality.

## Connection to derived categories

The Hodge identity is equivalent to the chain complex satisfying a *quasi-isomorphism* with its harmonic representatives; this is a derived-category statement. The cross-degree asymmetry might be a structural feature of the derived category of Hilbert chain complexes, not specific to any underlying category $\mathcal C$.

If true, this would explain why the asymmetry is universal across cellular, smooth, parametric, spectral-triple cases — they're all instances of "Hilbert lift of a derived category."
