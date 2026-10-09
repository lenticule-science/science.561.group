---
title: Predication Hyperdoctrine
description: "The categorical-logic structure that supplies the spine's first-order quantifier theory — a predication-fibration that additionally satisfies Lawvere's hyperdoctrine conditions in BOTH the knowledge and the truth order: quantifier adjoints, Frobenius reciprocity, Beck–Chevalley coherence, and comprehension. Property-like, and it carries a closure 2-monad, so it sits at the settling level where all its dependencies are established."
date-created: 2026-06-19
date-modified: 2026-06-19
keywords: ["predication-hyperdoctrine", "predication-fibration", "hyperdoctrine", "lawvere", "quantifier-adjoint", "frobenius-reciprocity", "beck-chevalley", "comprehension", "closure-2-monad", "knowledge-order", "truth-order"]
---

## What this node is and where it sits

A **predication hyperdoctrine** is a predication-fibration — the fiber of
bilattice-valued [fiber algebras](../../pre-bilattice/content/bilattice/bilattice.md) over the
[predicate-category](../../../../../../../../../../../predicate-category/predicate-category.md)
base — that additionally satisfies the conditions of Lawvere's hyperdoctrine
notion (Lawvere 1969, *Adjointness in Foundations*). It is the categorical logic
structure that supplies the spine's **first-order quantifier theory**.

It is placed here, at the **settling** level, by minimal proof support: its
definition draws on the predicate-category's reindexing (upstream at predicating),
the two orders and the fiber algebras (upstream at positing's bilattice), **and a
closure 2-monad** (the structure settling iterates). The deepest node at which all
of those already exist is here, below settling — so this is the lowest place the
hyperdoctrine can be stated with everything it depends on in scope.

## The conditions, in both orders

For every $f : q \to p$ in the predicate category, reindexing $f^*$ has adjoints,
in **both** enrichments:

- **(B1k/B1t) quantifier adjoints** — $\exists_f \dashv f^* \dashv \forall_f$ in
  the knowledge order *and* in the truth order;
- **(B2k/B2t) Frobenius reciprocity** — $\exists_f(f^*\alpha \sqcap \phi) \cong
  \alpha \sqcap \exists_f\phi$ for both meets $\sqcap_k$ and $\sqcap_t$;
- **(B3) Beck–Chevalley** — the canonical map is an iso over every pullback in
  $\mathcal{C}$, for both adjoint systems;
- **(B4) comprehension** — the extension functor has a right adjoint $\{p:-\}$,
  for both orders, yielding two derived equality predicates (classical and
  paraconsistent).

## Property-like, with two parallel adjoint systems

Conditions (B1)–(B4) are **properties** of the underlying fibration, not extra
data: a predication-fibration either verifies them — becoming a hyperdoctrine — or
fails to. What is structurally distinctive is that **both** the knowledge and the
truth order carry full hyperdoctrinal adjoint structure, giving the two
comprehensions and the two equalities. One caveat the corpus records: $\leq_k$-
**Frobenius for the fusion $\odot$ fails** for three of the four generator
classes, because $\odot$ is non-integral — its absorber $\mathbf f$ is not the
knowledge-bottom $\bot$ the extension fills by, so the alignment Frobenius demands
is absent.

## Orientation

The base is the predication-fibration over the
[bilattice](../../pre-bilattice/content/bilattice/bilattice.md) fiber and the predicate-category;
the closure 2-monad it carries is the one [settling](../../settling.md) iterates;
and it is a post-settling structure beside the
[bigraded-diamond](../bigraded-diamond/bigraded-diamond.md). Its quantifier and
comprehension theory is what the spine's richer objects — agents, systems,
computers — will draw on, deeper still.
