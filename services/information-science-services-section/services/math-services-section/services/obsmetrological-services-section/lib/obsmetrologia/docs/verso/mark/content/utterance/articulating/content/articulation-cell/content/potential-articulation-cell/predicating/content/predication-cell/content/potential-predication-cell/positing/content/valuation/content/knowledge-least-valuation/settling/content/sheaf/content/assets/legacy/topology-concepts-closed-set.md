---

title: "Closed Set"
description: "Let $(X, \tau)$ be a [topological space](../objects/topological-space.md)."
aliases:
  - "closed set"
  - "closed sets"
date-created: 2025-12-26
tags: []
mathematical-object: topological-space
references:
  - id: ref1
    type: document
    title: Munkres, Topology, 2nd ed., Pearson, 2000
---

Let $(X, \tau)$ be a [topological space](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/topological-space.md).

**Definition.** A subset $C \subseteq X$ is a *closed set* if its complement $X \setminus C$ is an [open set](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/open-set.md), i.e., $X \setminus C \in \tau$.

**Proposition.** *The collection of closed subsets of $X$ is closed under arbitrary intersections and finite unions. Moreover, $\emptyset$ and $X$ are both closed.*

*Proof sketch.* By De Morgan's laws: the complement of an arbitrary intersection of closed sets is an arbitrary union of open sets (hence open), and the complement of a finite union of closed sets is a finite intersection of open sets (hence open). $\square$

**Definition.** The *closure* of a subset $A \subseteq X$ is $\mathrm{cl}(A) = \bigcap \{ C \subseteq X : A \subseteq C \text{ and } C \text{ is closed} \}$, the smallest closed set containing $A$.

**Proposition (Kuratowski axioms).** *The [closure operator](../../teaching/explanations/closure-operator/index.md) $\mathrm{cl} : \mathcal{P}(X) \to \mathcal{P}(X)$ satisfies:*
1. $\mathrm{cl}(\emptyset) = \emptyset$,
2. $A \subseteq \mathrm{cl}(A)$ for all $A \subseteq X$,
3. $\mathrm{cl}(\mathrm{cl}(A)) = \mathrm{cl}(A)$ (idempotence),
4. $\mathrm{cl}(A \cup B) = \mathrm{cl}(A) \cup \mathrm{cl}(B)$.

*Conversely, any operator $\mathrm{cl} : \mathcal{P}(X) \to \mathcal{P}(X)$ satisfying (1)--(4) determines a unique topology on $X$ whose closed sets are exactly the fixed points of $\mathrm{cl}$.*

**Proposition.** *A subset $C \subseteq X$ is closed if and only if it contains all its limit points: for every $x \in X$, if every open set containing $x$ meets $C$, then $x \in C$.*

*Proof sketch.* $x \in \mathrm{cl}(A)$ iff every open neighbourhood of $x$ intersects $A$. So $C = \mathrm{cl}(C)$ iff $C$ contains all such points. $\square$

**Examples.**

1. **$\mathbb{R}$ with the standard topology.** Closed intervals $[a, b]$ are closed. The set $\mathbb{Z}$ is closed (its complement is a union of open intervals).
2. **Discrete topology.** Every subset is both open and closed.
3. **Indiscrete topology.** The only closed sets are $\emptyset$ and $X$.
