---
type: theorem
status: sketch
depends-on: [dependent-type-theory, empty-type, normalization, strong-normalization-stlc]
title: Consistency of Martin-Löf type theory
description: "The predicative core of dependent-type-theory (MLTT without impredicative universes, without classical axioms beyond the bare typing rules) is consistent: there is no closed term inhabiting the empty-type, $\\not\\vdash \\;{\\cdot}\\; :…"
---

# Consistency of Martin-Löf type theory

The predicative core of [dependent-type-theory](../terms/dependent-type-theory.md) (MLTT without impredicative universes, without classical axioms beyond the bare typing rules) is *consistent*: there is no closed term inhabiting the [empty-type](../terms/empty-type.md), $\not\vdash \;{\cdot}\; : \mathbf{0}$.

## Proof sketch

The standard route is *via strong normalization*. Generalising the reducibility-candidate technique of [strong-normalization-stlc](../../documents/articles/research-articles/strong-normalization-stlc.md) to the dependent setting:

1. Define reducibility candidates $\mathrm{SN}_A$ for every type $A$, by induction on the formation of $A$. The dependent cases — Π, Σ, identity — require interpreting types as candidates indexed by their domain candidates.
2. Show every well-typed closed term $\vdash M : A$ satisfies $\mathrm{SN}_A(M)$, hence is strongly normalizing.
3. Apply to a hypothetical $\vdash M : \mathbf{0}$: $M$ has a normal form $M'$ of type $\mathbf{0}$, so $M'$ is a *closed value* of type $\mathbf{0}$. Inspect the canonical-forms lemma for $\mathbf{0}$: there are no introduction rules, so no closed value of type $\mathbf{0}$ exists. Contradiction. $\square$

The full argument is delicate (the candidate definition for [universes](../terms/universe.md) requires careful stratification by [universe-level](../../documents/articles/research/2026/07/31/lenticule-import/_archive/teaching/explanations/universe-level.md) to avoid impredicativity loops); a complete textbook treatment fills a chapter.

## Status: sketch

The above is the standard outline. The full proof — handling all type formers, universes, identity types, and η — is given in detail by [Martin-Löf 1984](../../documents/articles/bibliographies/martin-lof1984.md) and modernised in [Univalent Foundations Program 2013](../../documents/articles/bibliographies/univalent-foundations2013.md) Appendix A. Mechanised proofs of consistency for variants of MLTT exist in mathlib-adjacent Lean projects and in Agda.

## Remarks

Consistency of MLTT is the ultimate type-theoretic guarantee: the proof assistant cannot derive false statements. Adding axioms (excluded middle, choice, propositional extensionality, [univalence](../terms/univalence-axiom.md)) requires *separate* consistency arguments — usually by exhibiting a model in some classical metatheory. The consistency of MLTT + univalence was established by the *cubical* and *simplicial* models. Reference: [Martin-Löf 1984](../../documents/articles/bibliographies/martin-lof1984.md), [Univalent Foundations Program 2013](../../documents/articles/bibliographies/univalent-foundations2013.md) §A.3.
