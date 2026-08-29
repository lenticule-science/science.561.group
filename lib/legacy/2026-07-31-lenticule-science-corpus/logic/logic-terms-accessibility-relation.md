---
title: "Accessibility Relation"
aliases:
  - "accessibility relation"
  - "accessibility relations"
date-created: 2025-12-26
type: term
tags: []
mathematical-object: set
references:
  - "Blackburn, de Rijke & Venema, Modal Logic, Cambridge University Press, 2001"
defines:
  - "Accessibility Relation"
  - "accessibility relations"
---

Let $W$ be a set (of [possible worlds](./possible-world.md)).

**Definition.** An *accessibility relation* on $W$ is a binary relation $R \subseteq W \times W$. We write $wRv$ to mean $(w, v) \in R$, read as "$v$ is accessible from $w$."

The accessibility relation determines the semantics of the [modal operators](./modal-operator.md). In a [Kripke model](./kripke-model.md) $(W, R, V)$:

- [Necessity](./necessity.md): $\Box\varphi$ holds at $w$ iff $\varphi$ holds at every $v$ with $wRv$.
- [Possibility](./possibility.md): $\Diamond\varphi$ holds at $w$ iff $\varphi$ holds at some $v$ with $wRv$.

**Proposition (Frame correspondence).** *The properties of $R$ determine which [modal system](./modal-system.md) the [Kripke frame](./kripke-frame.md) $(W, R)$ validates:*

| Property of $R$ | Axiom validated |
|---|---|
| Reflexive ($\forall w.\, wRw$) | **T**: $\Box\varphi \to \varphi$ |
| Transitive ($wRv \wedge vRu \Rightarrow wRu$) | **4**: $\Box\varphi \to \Box\Box\varphi$ |
| Symmetric ($wRv \Rightarrow vRw$) | **B**: $\varphi \to \Box\Diamond\varphi$ |
| Euclidean ($wRv \wedge wRu \Rightarrow vRu$) | **5**: $\Diamond\varphi \to \Box\Diamond\varphi$ |

*Proof sketch.* Each direction is a direct semantic argument. For example, if $R$ is reflexive and $\Box\varphi$ holds at $w$, then $wRw$ gives $\varphi$ at $w$. Conversely, if $R$ fails reflexivity at some $w$ (i.e. $\neg wRw$), choose $V$ making $\varphi$ true everywhere except $w$ to falsify **T** at $w$. $\square$

**Proposition.** *Combining properties gives the standard systems: reflexive + transitive (preorder) gives S4; equivalence relation gives S5.*

**Examples.**

- The total relation $R = W \times W$ makes every world accessible from every other; the resulting frame validates S5.
- The identity relation $R = \{(w, w) : w \in W\}$ collapses $\Box\varphi$ to $\varphi$; the resulting [modal logic](../index.md) is non-modal.
- A strict partial order (irreflexive, transitive) models temporal "earlier-than" in tense logic.
