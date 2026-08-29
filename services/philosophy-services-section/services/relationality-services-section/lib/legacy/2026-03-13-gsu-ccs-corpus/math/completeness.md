---
id: completeness
name: Completeness
description: "Completeness"
---

### Theorem — Completeness {#completeness}

Completeness is the converse of Soundness: every element of $H$ (equivalently, every
global section of $H \in R$) is denoted by some closed $\mathsf{Prop}$-term.

**Theorem — Completeness.** Let $a \in H_t$ be any element of a fiber. Then:

1. There exists a closed term $\vdash M : \mathsf{Prop}$ such that
   $\llbracket M \rrbracket_t = a$.

2. If $M, N$ are two such terms, then $\vdash M \equiv N : \mathsf{Prop}$ is derivable.

*Proof of (2).* If two terms denote the same element, Soundness (§soundness) identifies
their equational classes. $\square$

*Proof of (1) — gap.* The Lindenbaum–Tarski algebra
$H^{\mathrm{syn}}_t = \mathrm{Form}_t / {\equiv_t}$ (§syntactic-relational-universe)
maps to $H_t$ by Soundness. The initiality of $R_{\mathrm{syn}}$ (§initiality) gives
**existence and uniqueness** of a morphism $R_{\mathrm{syn}} \to R$ of relational
universes, and hence a Heyting algebra homomorphism $\varphi_t : H^{\mathrm{syn}}_t \to H_t$
at each fiber. However, initiality alone does not establish that $\varphi_t$ is surjective.
Surjectivity requires that $H_t$ is generated (as a Heyting algebra) by the images of
the atomic terms of FiberNuclearLanguage — equivalently, that every element of $H_t$ is
definable. This holds when the Axiom of Generative Basis (§generative-basis) guarantees
that the generators of $H_t^\ast$ lift to FiberNuclearLanguage-terms whose denotations
generate all of $H_t$ under the Heyting operations; but the precise argument connecting
the generative basis to the surjectivity of $\varphi_t$ has not been written out.

**Open step.** The surjectivity $H^{\mathrm{syn}}_t \twoheadrightarrow H_t$ is asserted
but not proved from the current axioms.

This theorem is placed here because its proof uses the initiality of $R_{\mathrm{syn}}$
(§initiality), which requires the ambient topos to be available.
