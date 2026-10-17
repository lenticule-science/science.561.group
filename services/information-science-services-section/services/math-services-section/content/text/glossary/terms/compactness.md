---
name: "Compactness"
aliases:
  - "compactness"
  - "compact"
  - "compact space"
date-created: 2025-12-26
tags: []
mathematical-object: topological-space
references:
  ref1:
    title: "Munkres, Topology, 2nd ed., Pearson, 2000"
---

Compactness is a topological property that captures the idea of a space being "finite-like" even when it contains infinitely many points. A compact space is one where you cannot escape to infinity — no matter how you try to cover it with open sets, finitely many of them always suffice. This seemingly simple condition has remarkably powerful consequences, making compactness one of the most important concepts in all of topology and analysis.

Formally, an open [cover](./cover.md) of a [topological space](./topological-space.md) $X$ is a collection of [open sets](./open-set.md) $\{U_i\}_{i \in I}$ whose union is all of $X$. A subcover is a subcollection that still covers $X$. The space $X$ is compact if every open cover has a finite subcover — no matter how you cover $X$ with open sets (even uncountably many), you can always throw away all but finitely many and still cover everything.

Consider the closed interval $[0, 1]$. However you cover it with open intervals, finitely many will do. This is the content of the Heine-Borel theorem: a subset of $\mathbb{R}^n$ is compact if and only if it is closed and bounded. The theorem is named for Eduard Heine, who used finite-subcover arguments in 1872, and Émile Borel, who proved the countable case in *Sur quelques points de la théorie des fonctions* (1895). Henri Lebesgue extended the result to arbitrary covers.

Now contrast $[0, 1]$ with the real line $\mathbb{R}$, which is not compact. The cover $\{(-n, n)\}_{n \in \mathbb{N}}$ — open intervals of increasing size — has no finite subcover, because any finite collection of these intervals has a largest one, and points beyond it are uncovered. The real line lets you "escape to infinity," and compactness is exactly the condition that prevents this.

Why does compactness matter? Because it lets you pass from local information to global conclusions — a passage that normally fails in infinite settings. The extreme value theorem is a prime example: if $X$ is compact and $f: X \to \mathbb{R}$ is [continuous](./continuous-map.md), then $f$ actually attains its maximum and minimum values. Without compactness, this can fail — the function $f(x) = x$ on the open interval $(0, 1)$ gets arbitrarily close to 0 and 1 but never reaches either. Compactness also forces continuous maps to behave well: a continuous map from a compact space to a Hausdorff space is automatically a closed map, and a continuous bijection from a compact space to a Hausdorff space is automatically a [homeomorphism](./homeomorphism.md).

The concept was generalized beyond metric spaces by Maurice René Fréchet (who introduced sequential compactness in his 1906 thesis) and given its modern open-cover definition for arbitrary topological spaces by Pavel Alexandroff and Pavel Urysohn in *Mémoire sur les espaces topologiques compacts* (1929).

The deepest result about compactness is Tychonoff's theorem: the product $\prod_{i \in I} X_i$ (with the product topology) is compact if and only if each factor $X_i$ is compact. This holds even for infinite — even uncountable — products, but the proof requires the axiom of choice. Tychonoff's theorem is the reason compactness is so pervasive in functional analysis, where function spaces are naturally infinite products.

## Additional material from the Google Drive library

Let $(X, \tau)$ be a [topological space](./topological-space.md).

**Definition.** An *open [cover](./cover.md)* of $X$ is a collection $\{U_i\}_{i \in I}$ of [open sets](./open-set.md) with $\bigcup_{i \in I} U_i = X$. A *subcover* is a subcollection that still covers $X$. The space $X$ is *compact* if every open cover of $X$ has a finite subcover.

**Proposition (Heine-Borel).** *A subset of $\mathbb{R}^n$ is compact (in the standard topology) if and only if it is closed and bounded.*

**Proposition (Extreme value theorem).** *If $X$ is compact and $f : X \to \mathbb{R}$ is [continuous](./continuous-map.md), then $f$ attains its supremum and infimum.*

*Proof sketch.* $f(X)$ is compact in $\mathbb{R}$ (continuous image of a compact space is compact), hence closed and bounded by Heine-Borel. A closed bounded subset of $\mathbb{R}$ contains its supremum and infimum. $\square$

**Proposition.** *A [continuous map](./continuous-map.md) from a compact space to a Hausdorff space is a closed map. In particular, a continuous bijection from a compact space to a Hausdorff space is a [homeomorphism](./homeomorphism.md).*

**Theorem (Tychonoff).** *The product $\prod_{i \in I} X_i$ (with the product topology) is compact if and only if each $X_i$ is compact. (The forward direction requires the axiom of choice.)*

**Examples.**

1. **$[0,1]$.** Compact (Heine-Borel, or directly by the nested interval property).
2. **$\mathbb{R}$.** Not compact: the cover $\{(-n, n)\}_{n \in \mathbb{N}}$ has no finite subcover.
3. **Cantor set.** Compact (closed and bounded subset of $\mathbb{R}$), despite being uncountable and nowhere dense.
4. **Finite spaces.** Every finite topological space is compact.
