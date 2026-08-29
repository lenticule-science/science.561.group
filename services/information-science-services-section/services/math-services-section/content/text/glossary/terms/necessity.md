---
title: "Necessity"
aliases:
  - "necessity"
  - "necessary"
  - "box"
date-created: 2025-12-26
tags: []
mathematical-object: heyting-algebra
references:
  ref1:
    title: "Blackburn, de Rijke & Venema, Modal Logic, Cambridge University Press, 2001"
defines:
  - "Necessity"
  - "necessary"
  - "requires"
  - "box"
type: term
---

Necessity is the modality of what must be the case — what holds not just as things happen to be, but in every relevant way things could be. "2 + 2 = 4" is necessarily true: there is no [possible world](./possible-world.md) in which it fails. "It is raining in London" is contingently true (or false): it depends on circumstances that could have been otherwise. The concept of necessity, and its dual [possibility](./possibility.md), are the central subjects of modal logic.

Aristotle discussed necessity and contingency in *De Interpretatione*, most famously in the sea-battle problem: is it necessarily true or necessarily false *now* that there will be a sea battle tomorrow? Aristotle argued that future contingents are neither, raising questions about the scope of necessity that philosophers have debated ever since. The modern formal treatment begins with Clarence Irving Lewis, who introduced the strict conditional and the hierarchy of modal systems S1 through S5 in *Symbolic Logic* (1932, with Cooper Harold Langford). But Lewis's systems lacked a clear semantics — you could prove things in them without knowing exactly what the symbols meant. Saul Aaron Kripke provided that semantics in 1963.

In a [Kripke model](./kripke-model.md) $(W, R, V)$, necessity has a precise definition: $\Box\varphi$ (read "necessarily $\varphi$") holds at a world $w$ if and only if $\varphi$ holds at every world accessible from $w$:

$$M, w \models \Box\varphi \quad \text{iff} \quad \forall v\,(wRv \Rightarrow M, v \models \varphi).$$

The [accessibility relation](./accessibility-relation.md) $R$ determines what "every relevant alternative" means. If $R$ is reflexive, then $\Box\varphi \to \varphi$ holds (the T axiom): if something is necessary, it is actually true, because the current world is among the accessible ones. In the system S5, where $R$ is an equivalence relation, $\Box\varphi$ holds at $w$ if and only if $\varphi$ holds throughout $w$'s entire equivalence class — necessity is absolute within each cluster of worlds.

Necessity and possibility are duals: $\Box\varphi = \neg\Diamond\neg\varphi$. A proposition is necessary if and only if its negation is not possible. This duality mirrors the relationship between universal and existential quantification — $\Box$ is "for all accessible worlds" and $\Diamond$ is "there exists an accessible world."

In the algebraic setting, necessity corresponds to a [closure operator](./closure-operator.md) $j: H \to H$ on a [Heyting algebra](./heyting-algebra.md) $H$ (extensive, monotone, and idempotent). A [proposition](./proposition.md) $a$ is necessary when $j(a) = a$ — it is already $j$-closed and necessitation adds nothing to it. The set of necessary elements $H^j = \{a \in H : j(a) = a\}$ is closed under conjunction and contains $\top$. When $j$ is a nucleus (meaning $j(a \wedge b) = j(a) \wedge j(b)$), the necessary elements themselves form a Heyting algebra with implication $a \Rightarrow_j b = j(a \to b)$.

This algebraic perspective connects modal logic to topology. On the open-set lattice $\mathcal{O}(X)$ of a topological space, a Lawvere-Tierney topology $j$ defines a nontrivial [modal system](./modal-system.md) on the [subobject classifier](./subobject-classifier.md) — the necessity operator becomes a topological closure operation, and the necessary propositions are those that survive closure.

## Additional material from the Google Drive library

Let $H$ be a [Heyting algebra](./heyting-algebra.md) equipped with a [closure operator](./closure-operator.md) $j \colon H \to H$ (i.e., $j$ is extensive, monotone, and idempotent).

**Definition.** The *necessity operator* on $H$ is the map $\Box = j$. An element $a \in H$ is *necessary* if $j(a) = a$ (i.e., $a$ is $j$-closed). For any [proposition](./proposition.md) $a \in H$, the element $j(a)$ is the *necessitation* of $a$ — the least necessary element above $a$.

In a [Kripke model](./kripke-model.md) $(W, R, V)$, the semantic clause is:

$$M, w \models \Box\varphi \quad \text{iff} \quad \forall v\,(wRv \Rightarrow M, v \models \varphi).$$

**Proposition.** *The set of necessary elements $H^j = \{a \in H : j(a) = a\}$ is closed under $\wedge$ and contains $\top$.*

*Proof sketch.* $j(\top) = \top$ by extensiveness and $\top$ being greatest. For $a, b \in H^j$: $j(a \wedge b) \leq j(a) \wedge j(b) = a \wedge b$ by monotonicity and the closure of $a, b$; the reverse follows from extensiveness. $\square$

**Proposition.** *In classical modal logic (where $H$ is Boolean), $\Box a = \neg\Diamond\neg a$, where $\Diamond$ is the [possibility](./possibility.md) operator. That is, $a$ is necessary iff $\neg a$ is not possible.*

**Proposition.** *If $j$ is additionally a nucleus (i.e., $j(a \wedge b) = j(a) \wedge j(b)$), then $H^j$ is a [Heyting algebra](./heyting-algebra.md) with implication $a \Rightarrow_j b = j(a \to b)$.*

*Proof sketch.* For $a, b, c \in H^j$: $c \leq j(a \to b)$ iff $c \leq a \to b$ (since $c$ is $j$-closed and $j$ is a nucleus) iff $a \wedge c \leq b$. $\square$

**Examples.**

- In a [Kripke frame](./kripke-frame.md) $(W, R)$ where $R$ is reflexive, $\Box\varphi \to \varphi$ is valid (the **T** axiom): truth at all accessible [worlds](./possible-world.md) includes the current world.
- In S5, where $R$ is an equivalence relation, $\Box\varphi$ holds at $w$ iff $\varphi$ holds throughout $w$'s equivalence class.
- On $\mathcal{O}(X)$ for a topological space, the identity is a trivial nucleus; every open set is "necessary." A nontrivial Lawvere-Tierney topology $j$ on a topos gives a nontrivial [modal system](./modal-system.md) on the [subobject classifier](./subobject-classifier.md).
