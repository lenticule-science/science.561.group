---
type: structure
status: active
depends-on:
  - k1.md
  - pca.md
see-also:
  - four.md
  - dial-eff.md
  - cgs.md
  - ../prose/learning/claims/eff-is-minimum-level.md
  - ../prose/learning/claims/k1-is-initial-turing-complete-pca.md
  - ../questions/what-is-the-theory-of-computing.md
references:
  - Hyland 1982
  - Carboni-Celia-Magno 1982
title: Eff — the effective topos
description: The effective topos $\mathbf{Eff} = RT(\mathcal{K}1)$ is the realizability topos over Kleene's first algebra $\mathcal{K}1$.
---

# Eff — the effective topos

The **effective topos** $\mathbf{Eff} = RT(\mathcal{K}_1)$ is the realizability topos over Kleene's first algebra $\mathcal{K}_1$. It is an elementary topos — not a Grothendieck topos — with Heyting-valued first-order internal logic.

## Construction

$\mathbf{Eff}$ is the exact completion of the assembly category $\mathbf{Asm}(\mathcal{K}_1)$:

$$\mathbf{Eff} = \mathrm{ex}(\mathbf{Asm}(\mathcal{K}_1))$$

The exact completion (Carboni-Celia Magno 1982) adjoins quotients of all equivalence relations to $\mathbf{Asm}(\mathcal{K}_1)$, producing a full elementary topos. The subobject classifier is:

$$\Omega_{\mathbf{Eff}} \cong \{\text{r.e. sets}\}/{\sim}$$

— equivalence classes of computably enumerable subsets of $\omega$ under realizability equivalence. The internal Heyting algebra structure on $\Omega_{\mathbf{Eff}}$ is: $P \wedge Q = P \cap Q$, $P \vee Q = P \cup Q$, $P \Rightarrow Q = \{n \mid \varphi_n \text{ maps each realizer of } P \text{ to a realizer of } Q\}$.

The objects of $\mathbf{Eff}$ are *assemblies* (sets $X$ with a realizability relation $\delta \subseteq X \times \omega$) quotiented by realizability equivalence. Morphisms are functions tracked by partial recursive functions.

## What Eff proves internally

$\mathbf{Eff}$ internally proves (as theorems, not axioms):
- **Church-Turing**: every total $\mathbb{N} \to \mathbb{N}$ function is partial recursive. (Internal to $\mathbf{Eff}$; the diagonal argument runs in its internal logic.)
- **Halting undecidability**: $\neg\exists d: \mathbb{N} \times \mathbb{N} \to \mathbf{2}.\; \forall e\, n.\; d(e,n) = \mathbf{1}_{[\mathrm{halt}(e,n)]}$.
- **Rice's theorem**: every non-trivial extensional property of partial recursive functions is undecidable.
- **Kleene's second recursion theorem** (used as an internal lemma in the above proofs).

This is the decisive reason $\mathbf{Eff}$ is the minimum required level: see [eff-is-minimum-level](../concepts/eff-is-minimum-level.md).

## The subtopos lattice

$\mathbf{Eff}$ has a lattice of subtoposes corresponding to Lawvere-Tierney nuclei on $\Omega_{\mathbf{Eff}}$ (Lee-van Oosten 2012). The boundary nuclei are:

- $j = \mathrm{id}$: the trivial topology; sheaves = all of $\mathbf{Eff}$.
- $j = \top$: the degenerate topology; sheaves = one-object topos.

Between them, the $\neg\neg$-nucleus is the smallest non-trivial nucleus forcing Boolean logic (decidable computation). The lattice of nuclei strictly between $\mathrm{id}$ and $\neg\neg$ is not computability-theoretically classified; complexity theory, oracle toposes, and alternative realizability notions are all excluded by structural arguments (see the corresponding claims).

## Relationship to other structures

- $\mathbf{Eff}$ embeds into $\mathbf{Dial}(\mathbf{Eff})$ as the Kleisli sub-CCC of the $!$ comonad: $\mathbf{Eff} \simeq \mathcal{Kl}(!_{\mathbf{Dial}(\mathbf{Eff})})$.
- Via $F^!$, $\mathbf{Eff}$ embeds into $\mathcal{Kl}(!_{\mathbf{CGS}})$ as the concurrent computable fragment of $\mathbf{CGS}$.
- The $\neg\neg$-subtopos of $\mathbf{Eff}$ is the classical (decidable) subtopos where internal logic is Boolean; it contains type theory (strongly normalizing typed calculi) as sub-CCCs.
- $\mathbf{FOUR} = \mathbf{2} \times \mathbf{2}$ is the image of $\Omega_{\mathbf{Eff}}$ under the double-negation nucleus.
