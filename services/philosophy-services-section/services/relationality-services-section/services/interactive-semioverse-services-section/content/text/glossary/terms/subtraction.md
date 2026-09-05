---
name: "Subtraction"
aliases:
  - "subtraction"
  - "Heyting subtraction"
  - "semantic subtraction"
date-created: 2025-12-31
tags: []
---

Subtraction in the [Interactive Semioverse](../../documents/articles/notes/interactive-semioverse.md) is a disciplined operation for semiotic forgetting, built from the [Heyting implication](../../../../../../../../../information-science-services-section/services/math-services-section/services/logic-services-section/content/text/glossary/terms/heyting-implication.md). [Sign](../../../../../../../../../information-science-services-section/services/communication-science-services-section/services/linguistics-services-section/services/semiotics-services-section/content/text/glossary/terms/sign.md) systems do not only grow — they also forget. The Heyting pseudocomplement provides the right notion of removal in an intuitionistic setting: at the element level, $a \ominus b = a \wedge (b \Rightarrow \bot)$ — the [meet](../../../../../../../../../information-science-services-section/services/math-services-section/services/order-services-section/content/text/glossary/terms/meet.md) of $a$ with the pseudo-complement of $b$. This is the largest element $c$ such that $c \le a$ and $c \wedge b \le \bot$.

At the [fragment](../../../../../../content/text/glossary/terms/fragment.md) level, fragment subtraction $F \ominus G$ is the least fragment containing $\{a \ominus s(G) : a \in F\}$, where $s(G) = \bigvee_{x \in G} x$ is the fragment's support (the [join](../../../../../../../../../information-science-services-section/services/math-services-section/services/order-services-section/content/text/glossary/terms/join.md) of all its elements). At the state level, subtracting a [handle](./handle.md) $\tau$ from state $X$ removes the semantic support of $\tau$'s [handle fragment](./handle-fragment.md) from every element of the carrier, then re-fragments.

Subtraction is distinct from forgetting. Forgetting ($X \setminus \tau$) removes the handle's semantic seed and all operators mentioning the handle — a syntactic deletion. Subtraction ($X \ominus \tau$) removes semantic support but preserves operator vocabulary. Subtraction is always at least as conservative as forgetting: $\mathcal{S}(X \ominus \tau) \le \mathcal{S}(X \setminus \tau)$. Both operations are compiled into interaction operators via the interface algebra.
