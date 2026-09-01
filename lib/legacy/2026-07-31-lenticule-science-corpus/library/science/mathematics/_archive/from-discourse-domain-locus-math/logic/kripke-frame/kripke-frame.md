---

title: "Kripke Frame"
aliases:
  - "kripke frame"
  - "Kripke frame"
  - "frame"
date-created: 2025-12-26
tags: []
mathematical-object: set
references:
  - id: ref1
    type: document
    title: Blackburn, de Rijke & Venema, Modal Logic, Cambridge University Press, 2001
---

Let $W$ be a nonempty set.

**Definition.** A *Kripke frame* is a pair $\mathcal{F} = (W, R)$, where $W$ is a set of [possible worlds](teaching/explanations/possible-world.md) and $R \subseteq W \times W$ is an [accessibility relation](../morphisms/accessibility-relation.md) on $W$.

A frame carries no information about which propositions hold at which worlds. Adding a valuation $V \colon \mathrm{Prop} \to \mathcal{P}(W)$ yields a [Kripke model](./kripke-model.md) $(W, R, V)$.

**Definition.** A modal formula $\varphi$ is *valid on the frame* $\mathcal{F}$, written $\mathcal{F} \models \varphi$, if for every valuation $V$ and every $w \in W$, $(W, R, V), w \models \varphi$.

**Proposition (Frame correspondence).** *A frame $(W, R)$ validates $\Box\varphi \to \varphi$ for all $\varphi$ if and only if $R$ is reflexive. It validates $\Box\varphi \to \Box\Box\varphi$ for all $\varphi$ if and only if $R$ is transitive.*

*Proof sketch.* The forward directions are direct semantic arguments. The reverse directions use the freedom to choose a valuation $V$ that isolates the required structural property of $R$. $\square$

**Proposition (Complex algebra).** *The complex algebra of $\mathcal{F}$ is the Boolean algebra $\mathcal{P}(W)$ equipped with the operator $\Box_R \colon \mathcal{P}(W) \to \mathcal{P}(W)$ defined by $\Box_R(S) = \{w \in W : \forall v\, (wRv \Rightarrow v \in S)\}$. This is a modal algebra, and the map $\mathcal{F} \mapsto (\mathcal{P}(W), \Box_R)$ embeds frames into modal algebras.*

*Proof sketch.* $\Box_R$ preserves finite meets and sends $W$ to $W$, so $(\mathcal{P}(W), \Box_R)$ is a normal modal algebra. $\square$

**Examples.**

- $(W, W \times W)$: every world accesses every other. Validates S5. The complex algebra collapses $\Box_R(S)$ to either $\emptyset$ or $W$.
- $(W, \leq)$ for a partial order $\leq$: validates S4. When $W$ is finite and $\leq$ is a tree, these are the frames for intuitionistic propositional logic.
- The standard [modal systems](./modal-system.md) K, T, S4, S5 are each sound and complete for the class of all frames, reflexive frames, preorders, and equivalence relations, respectively.

Algebraically, when $R$ is a preorder, the upward-closed subsets of $(W, R)$ form a [Heyting algebra](../../teaching/explanations/heyting-algebra/index.md), connecting Kripke semantics to algebraic semantics.
