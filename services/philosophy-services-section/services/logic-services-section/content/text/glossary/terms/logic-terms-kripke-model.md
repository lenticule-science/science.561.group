---
name: "Kripke Model"
aliases:
  - "kripke model"
  - "Kripke model"
date-created: 2025-12-26
type: term
tags: []
mathematical-object: kripke-frame
references:
  - "Blackburn, de Rijke & Venema, Modal Logic, Cambridge University Press, 2001"
description: Let $\mathcal{F} = (W, R)$ be a Kripke frame.
---

Let $\mathcal{F} = (W, R)$ be a [Kripke frame](../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/kripke-frame.md).

**Definition.** A *Kripke model* on $\mathcal{F}$ is a triple $M = (W, R, V)$, where $V \colon \mathrm{Prop} \to \mathcal{P}(W)$ is a *valuation* assigning to each atomic proposition $p$ the set of [worlds](../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/possible-world.md) at which $p$ is true.

**Definition.** The *satisfaction relation* $M, w \models \varphi$ (read "$\varphi$ is true at $w$ in $M$") is defined recursively on modal formulas:

- $M, w \models p$ iff $w \in V(p)$.
- $M, w \models \varphi \wedge \psi$ iff $M, w \models \varphi$ and $M, w \models \psi$.
- $M, w \models \varphi \vee \psi$ iff $M, w \models \varphi$ or $M, w \models \psi$.
- $M, w \models \neg\varphi$ iff $M, w \not\models \varphi$.
- $M, w \models \varphi \to \psi$ iff $M, w \not\models \varphi$ or $M, w \models \psi$.
- $M, w \models \Box\varphi$ iff for all $v$ with $wRv$, $M, v \models \varphi$. ([Necessity](../../documents/articles/research/2026/07/31/lenticule-import/necessity.md) requires truth at all accessible worlds.)
- $M, w \models \Diamond\varphi$ iff there exists $v$ with $wRv$ such that $M, v \models \varphi$. ([Possibility](../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/possibility.md) requires truth at some accessible world.)

A formula $\varphi$ is *satisfiable* if $M, w \models \varphi$ for some $M$ and some $w$. It is *valid* if $M, w \models \varphi$ for every $M$ and every $w$.

**Proposition.** *For each [modal system](../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/modal-system.md) $\Lambda$ and its corresponding class of frames $\mathcal{C}$, a formula is a theorem of $\Lambda$ if and only if it is valid on every frame in $\mathcal{C}$.*

*Proof sketch.* Soundness follows by induction on derivations. Completeness is proved by the canonical model construction: take $W$ to be the set of maximal $\Lambda$-consistent sets, define $R$ and $V$ canonically, and verify the truth lemma by induction on formula complexity. $\square$

**Proposition (Intuitionistic Kripke models).** *For [intuitionistic logic](../../../../../../../information-science-services-section/services/math-services-section/content/text/documents/articles/teaching-articles/explanations/intuitionistic-logic.md), a Kripke model is a triple $(W, \leq, V)$ where $\leq$ is a [partial order](../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/partial-order.md) and $V$ satisfies the persistence condition: if $w \in V(p)$ and $w \leq v$, then $v \in V(p)$. The satisfaction clause for $\to$ becomes: $M, w \models \varphi \to \psi$ iff for all $v \geq w$, $M, v \models \varphi$ implies $M, v \models \psi$.*

**Examples.**

- A single reflexive world with $V(p) = \{w\}$: the model collapses to classical propositional logic, with $\Box\varphi \leftrightarrow \varphi$.
- $W = \{w_0, w_1\}$, $R = \{(w_0, w_1)\}$, $V(p) = \{w_1\}$: then $M, w_0 \models \Diamond p$ but $M, w_0 \not\models p$.
- The canonical model of S5 has $W$ the set of all maximal consistent sets and $R = W \times W$.
