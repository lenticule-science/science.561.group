---
type: reference
authors: [Jakl, Tomáš]
year: 2025
title: "Four Imprints of Belnap's Useful Four-Valued Logic in Computer Science"
venue: "arXiv:2503.20679"
kind: reference
description: T.
---

## Full citation

T. Jakl. "Four Imprints of Belnap's Useful Four-Valued Logic in Computer Science." arXiv:2503.20679, 2025. 21 pp.

## Status

Read locally; PDF at `sources/jakl2025.pdf`.

## Annotation

Surveys four areas of theoretical computer science where Belnap–Dunn logic surfaces:
1. **Linear logic** (Chu construction; the imprint our program uses)
2. **d-frames** (the only acknowledged inspiration in the literature)
3. **Blame Calculus**
4. **LVars**

The result that matters most for us is **Lemma 3.1**: for $H$ a Heyting algebra, the linear-logic connectives of $\mathrm{Chu}(H, 0)$ are term-definable from the bilattice structure of $H^\bowtie$. Specifically: the Chu tensor $\otimes$ corresponds to the twist-product fusion $\odot$, and the Chu linear implication $\multimap$ corresponds to the strong implication $\Rightarrow$.

Specialising to $H = \mathbf{2}$ gives $\mathbf{FOUR} \cong \mathrm{Chu}(\mathbf{2}, 0)$ as residuated structures. This identification is what licenses the linear-logical reading of our predication-fiber residuation: predicate-fiber multiplication is the Chu tensor, predicate-fiber implication is Chu's $\multimap$.

Notation in the source: $\bowtie$ for twist-product (we adopt this); $\wedge_t, \vee_t$ for truth meet/join (we adopt); $\sqcap, \sqcup$ for knowledge meet/join (we use $\wedge_k, \vee_k$); $\supset$ for weak implication; $\xrightarrow{\triangle}$ for strong implication.

§4.1 "Bilattices versus d-frames" gives an explicit comparison of the bilattice and d-frame frameworks — relevant if the bilattice-valued sheaf extensions in the cohomological layer are pursued.
