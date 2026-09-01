---
kind: theorem
status: proved
depends-on: [settling-associated-sheaf, paraconsistent-settling-associated-sheaf, inconsistency-sheaf, settling-cohomology]
---

# Long exact sequence for truth- and knowledge-order cohomologies

The short exact sequence of sheaves

$$0 \,\to\, \mathcal{F}_U^{(t)} \,\xrightarrow{\iota}\, \mathcal{F}_U^{(k)} \,\xrightarrow{\pi}\, \mathcal{F}_U^{(\top)} \,\to\, 0$$

— with $\mathcal{F}_U^{(t)}$ the [settling-associated sheaf](../objects/settling-associated-sheaf.md), $\mathcal{F}_U^{(k)}$ the [paraconsistent settling-associated sheaf](../objects/paraconsistent-settling-associated-sheaf.md), and $\mathcal{F}_U^{(\top)}$ the [inconsistency sheaf](../objects/inconsistency-sheaf.md) — induces the long exact sequence

$$\cdots \to H^{n-1}(\mathbf{T}^*, \mathcal{F}_U^{(\top)}) \xrightarrow{\partial^{n-1}} H^n_t(\mathbf{T}^*, \mathcal{F}_U^{(t)}) \xrightarrow{\iota^n} H^n_k(\mathbf{T}^*, \mathcal{F}_U^{(k)}) \xrightarrow{\pi^n} H^n(\mathbf{T}^*, \mathcal{F}_U^{(\top)}) \xrightarrow{\partial^n} \cdots$$

where the **comparison morphism** $\iota^n$ on cohomology is induced by the inclusion $\iota$ and $\pi^n$ by the projection $\pi$.

## Proof

The decomposition $\mathcal{F}_U^{(k)} \cong \mathcal{F}_U^{(t)} \oplus \mathcal{F}_U^{(\top)}$ gives a short exact sequence of sheaves; applying $R^n \Gamma$ produces the long exact sequence by standard homological algebra ([@kashiwara-schapira2006] Theorem 13.3.7). $\square$

## Notational convention

The notation is abusive in that $H^n_t$ and $H^n_k$ are the *same* functor $R^n \Gamma$ applied to *different* sheaves; the subscript indicates which designation the input sheaf uses:

- $H^n_t := H^n(\mathbf{T}^*, \mathcal{F}_U^{(t)})$ — truth-order cohomology, $\mathbf{t}$-designated.
- $H^n_k := H^n(\mathbf{T}^*, \mathcal{F}_U^{(k)})$ — knowledge-order cohomology, $\{\mathbf{t}, \top\}$-designated.

## Consistent settling case

For a *consistent* knowledge presheaf — one whose settling never produces $\top$-valued cells — the inconsistency sheaf vanishes: $\mathcal{F}_U^{(\top)} = 0$.
The long exact sequence then collapses to give $\iota^n : H^n_t \xrightarrow{\sim} H^n_k$ for all $n$: the truth-order and knowledge-order cohomologies coincide.

## Inconsistent settling case

For a knowledge presheaf that produces $\top$-valued cells, the two cohomologies genuinely differ.
The cohomology $H^n(\mathbf{T}^*, \mathcal{F}_U^{(\top)})$ measures the paraconsistent-evidence-structure of the settling independent of the $\mathbf{t}$-only classical content.
Belnap's original "the community is inconsistent on this claim" interpretation of $\top$ acquires a cohomological projection: $\top$-cohomology counts and classifies such inconsistencies.
