---

title: "Possibility"
description: "Let $H$ be a [Heyting algebra](../../documents/articles/research/2026/07/teaching/explanations/heyting-algebra/index.md) equipped with a [closure operator](../../documents/articles/research/2026/07/teaching/explanations/closure-operator/index.md) $j colon H \to H$."
aliases:
  - "possibility"
  - "possible"
  - "diamond"
date-created: 2025-12-26
tags: []
mathematical-object: heyting-algebra
references:
  - id: ref1
    type: document
    title: Blackburn, de Rijke & Venema, Modal Logic, Cambridge University Press, 2001
---

Let $H$ be a [Heyting algebra](../../documents/articles/research/2026/07/teaching/explanations/heyting-algebra/index.md) equipped with a [closure operator](../../documents/articles/research/2026/07/teaching/explanations/closure-operator/index.md) $j \colon H \to H$.

**Definition.** The *possibility operator* (or *interior operator*) dual to $j$ is the map $\Diamond \colon H \to H$ defined by

$$\Diamond a \;=\; \bigvee \{c \in H^j : c \leq a\},$$

where $H^j = \{c \in H : j(c) = c\}$ is the set of $j$-closed elements. Equivalently, $\Diamond a$ is the largest $j$-closed element below $a$.

In a [Kripke model](../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/kripke-model.md) $(W, R, V)$, the semantic clause is:

$$M, w \models \Diamond\varphi \quad \text{iff} \quad \exists v\,(wRv \;\text{and}\; M, v \models \varphi).$$

**Proposition.** *$\Diamond$ is a co-closure (interior) operator: $\Diamond a \leq a$, $\Diamond$ is monotone, and $\Diamond\Diamond a = \Diamond a$.*

*Proof sketch.* $\Diamond a \leq a$ by definition. Monotonicity: $a \leq b$ implies every $j$-closed element below $a$ is below $b$, so $\Diamond a \leq \Diamond b$. Idempotence: $\Diamond a \in H^j$, so $\Diamond\Diamond a = \Diamond a$. $\square$

**Proposition.** *In classical [modal logic](../../documents/articles/research/2026/07/31/_index.md) (where $H$ is Boolean), $\Diamond a = \neg\Box\neg a$ and $\Box a = \neg\Diamond\neg a$.*

*Proof sketch.* In a Boolean algebra, $\neg$ is an order-reversing involution, so $\Diamond a = \neg j(\neg a)$. $\square$

**Proposition.** *In intuitionistic [modal logic](../../documents/articles/research/2026/07/31/_index.md), the classical interdefinability $\Diamond a = \neg\Box\neg a$ fails precisely when $H$ is non-Boolean. The operators $\Box$ and $\Diamond$ carry independent information.*

*Proof sketch.* In a non-Boolean Heyting algebra, $\neg$ is not an involution, so $\neg j(\neg a)$ equals the largest $j$-closed element below $a$ iff $H$ is Boolean; in a non-Boolean Heyting algebra, $\neg j(\neg a) < \bigvee\{c \in H^j : c \leq a\}$ is possible. $\square$

**Examples.**

- In a [Kripke frame](../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/kripke-frame.md) $(W, R)$, $\Diamond_R(S) = \{w \in W : \exists v\,(wRv \;\text{and}\; v \in S)\}$. This is the $R$-preimage operator on $\mathcal{P}(W)$.
- In S5, $\Diamond\varphi$ holds at $w$ iff $\varphi$ holds somewhere in $w$'s equivalence class under $R$.
- On the open-set [lattice](../../documents/articles/research/2026/07/order/objects/lattice.md) $\mathcal{O}(X)$ with $j = \mathrm{id}$, $\Diamond = \mathrm{id}$; every [proposition](../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/proposition.md) is already "possible." Nontrivial possibility operators arise from nontrivial Lawvere-Tierney topologies in topos theory.
