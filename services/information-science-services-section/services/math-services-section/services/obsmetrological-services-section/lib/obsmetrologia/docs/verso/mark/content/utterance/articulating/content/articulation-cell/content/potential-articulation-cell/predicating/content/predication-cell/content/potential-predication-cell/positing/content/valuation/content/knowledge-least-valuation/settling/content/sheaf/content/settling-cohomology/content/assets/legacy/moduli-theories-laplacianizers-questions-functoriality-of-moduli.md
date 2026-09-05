---
type: question
status: open
explores: [moduli-of-laplacianizations, moduli-of-laplacianizers, chain-auto-action]
---

# Functoriality of moduli under chain maps

For a chain map $f: (C_\bullet, d) \to (C'_\bullet, d')$, what is the induced map on moduli? Specifically, the relationship between $\mathcal M_{\mathrm{Lap}}(C, d)$ and $\mathcal M_{\mathrm{Lap}}(C', d')$ as $f$ varies.

## Question

Define a functorial assignment $(C_\bullet, d) \mapsto \mathcal M_{\mathrm{Lap}}(C_\bullet, d)$ such that chain maps induce well-defined maps of moduli. Determine the form (covariant / contravariant / pulldown / pushdown) and the structure (preserves strata? preserves closure poset? respects bipartite multipartition combinatorics?).

## Three candidate definitions

**(a) Pullback of inner products.** A chain map $f: C \to C'$ pulls back inner products: $f^* Q' \in \mathcal H(C, d)$ defined by $(f^* Q'_n)(c, c'') = Q'_n(f c, f c'')$. This is positive-semidefinite (= positive-definite iff $f$ is injective).

So $f^*: \mathcal H(C', d') \to \overline{\mathcal H(C, d)}$ — into the *closure*, with image possibly degenerate at the boundary. Quotient maps don't generally descend cleanly to moduli.

**(b) Pushforward.** A chain map $f$ pushes forward inner products: $f_* Q$ defined on $f(C) \subseteq C'$ by $(f_* Q)(f c, f c'') = Q(c, c'')$, then extended (zero?) to all of $C'$. This is partial — only defined on the image of $f$.

If $f$ is *surjective*, $f_*: \mathcal H(C, d) \to \mathcal H(C', d')$ is well-defined (via descent through the kernel quotient), and induces a map of moduli.

**(c) Span of moduli.** For an arbitrary chain map $f$, neither pullback nor pushforward gives a clean map of moduli. The right object might be a *correspondence* between $\mathcal M_{\mathrm{Lap}}(C)$ and $\mathcal M_{\mathrm{Lap}}(C')$ — a sub-variety of the product encoding "compatible Hilbert structures."

## What's at stake

Functoriality determines:
- How the cellular Laplacian moduli relates to that of subcomplexes / quotient complexes.
- How the moduli for a chain complex relates to that of its persistence-filtered version.
- What the "categorical moduli of Laplacianizers" $\mathcal M_{\mathrm{Lap}}(\mathcal C, H^\bullet)$ looks like as a single object — fibered over $\mathcal C$.

Without a clean functoriality, the cross-category framework remains object-by-object: each chain complex has its moduli, but morphisms between chain complexes don't translate to morphisms of moduli.

## Concrete sub-cases

**Inclusion of subcomplexes.** $f: C \hookrightarrow C'$ injective. Pullback $f^*: \mathcal H(C') \to \mathcal H(C)$ well-defined as a map of cones (no degeneracy issues); descends to moduli. Bipartite multipartition: a $\Pi'$-stratum of $C'$ pulls back to a stratum of $C$ — but which one?

The squared singular values of $\widetilde d_n: C_n \to C_{n-1}$ are not generally the same as those of $\widetilde{d_n'}|_{f(C_n)}: f(C_n) \to f(C_{n-1})$. The pullback of a $\Pi'$-stratum is a sub-locus of $\mathcal M_{\mathrm{Lap}}(C)$ where $\widetilde d|_C$ has spectrum compatible with restriction of $\widetilde{d'}$. Generally a complicated condition.

**Quasi-isomorphisms.** $f: C \to C'$ induces an isomorphism on homology. Does it induce a map of moduli? The moduli depends on the *full* chain complex, not just homology — so quasi-isomorphic complexes can have different moduli. But there should be a *Morita-like* equivalence: same homology + compatible Hodge structures → equivalent moduli at the level of harmonics.

This is the natural categorical question: in what sense is moduli of Laplacianizers an invariant of the *derived category*?

**Chain homotopies.** Two chain maps $f, g: C \to C'$ that are chain-homotopic — induce different but related maps on moduli. The relationship encodes the homotopy.

## Categorical moduli object

If functoriality works out, the "moduli of Laplacianizers $\mathcal M_{\mathrm{Lap}}(\mathcal C, H^\bullet)$" of a category $\mathcal C$ + cohomology theory $H^\bullet$ is a single object (categorical, not per-input), with:
- Per-object fiber $\mathcal M_{\mathrm{Lap}}(X)$ for $X \in \mathcal C$.
- Morphism-induced maps relating fibers.

The whole thing is a *fibered orbifold* over $\mathcal C$, generalizing the per-object construction. This is the meaning of [moduli of Laplacianizers](../theorems/moduli-of-laplacianizers.md) at the categorical level — currently sketched.

## Connection to derived category

The right ambient might be the derived category $D^b(\mathbf{Hilb}^\mathbb Z)$ of bounded Hilbert chain complexes. Quasi-isomorphic complexes are isomorphic in $D^b$, so moduli should be a derived-category invariant. Functoriality would then come for free from derived-functor formalism.

This sets up a substantial categorical project — formalizing $\mathcal M_{\mathrm{Lap}}$ as a derived-category object — that laplacianizers has identified but not pursued.
