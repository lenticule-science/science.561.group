---

name: "Subtraction"
  - "subtraction"
  - "Heyting subtraction"
  - "semantic subtraction"
date-created: 2025-12-31
introduces: term
tags: []
---

Subtraction in the [Interactive Semioverse](../interactive-semioverse.md) is a disciplined operation for semiotic forgetting, built from the [Heyting implication](../../../../disciplines/logic/terms/heyting-implication.md). [Sign](../../../../../linguistics/topics/semiotics/terms/sign.md) systems do not only grow — they also forget. The Heyting pseudocomplement provides the right notion of removal in an intuitionistic setting: at the element level, $a \ominus b = a \wedge (b \Rightarrow \bot)$ — the [meet](../../../posets/terms/meet.md) of $a$ with the pseudo-complement of $b$. This is the largest element $c$ such that $c \le a$ and $c \wedge b \le \bot$.

At the [fragment](../../semiotic-universe/terms/fragment.md) level, fragment subtraction $F \ominus G$ is the least fragment containing $\{a \ominus s(G) : a \in F\}$, where $s(G) = \bigvee_{x \in G} x$ is the fragment's support (the [join](../../../posets/terms/join.md) of all its elements). At the state level, subtracting a [handle](./handle.md) $\tau$ from state $X$ removes the semantic support of $\tau$'s [handle fragment](./handle-fragment.md) from every element of the carrier, then re-fragments.

Subtraction is distinct from forgetting. Forgetting ($X \setminus \tau$) removes the handle's semantic seed and all operators mentioning the handle — a syntactic deletion. Subtraction ($X \ominus \tau$) removes semantic support but preserves operator vocabulary. Subtraction is always at least as conservative as forgetting: $\mathcal{S}(X \ominus \tau) \le \mathcal{S}(X \setminus \tau)$. Both operations are compiled into interaction operators via the interface algebra.
