---
name: "Sheaf Condition"
description: "Let $(mathcal{C}, \tau)$ be a [site](./site.md) and let $F: mathcal{C}^{mathrm{op}} \to mathbf{Set}$ be a [presheaf](./presheaf.md)."
aliases:
  - "sheaf condition"
  - "descent condition"
date-created: 2025-12-26
tags: []
mathematical-object: site
references:
  ref1:
    title: "Mac Lane & Moerdijk, Sheaves in Geometry and Logic, Springer, 1994"
---

Let $(\mathcal{C}, \tau)$ be a [site](./site.md) and let $F: \mathcal{C}^{\mathrm{op}} \to \mathbf{Set}$ be a [presheaf](./presheaf.md).

**Definition.** The [presheaf](./presheaf.md) $F$ satisfies the *sheaf condition* (or *descent condition*) for a covering family $\{U_i \to U\}_{i \in I}$ in $\tau$ if the following diagram is an equalizer:

$$F(U) \xrightarrow{\;\prod_i \mathrm{res}_{U_i}\;} \prod_{i \in I} F(U_i) \rightrightarrows \prod_{i,j \in I} F(U_i \times_U U_j)$$

where the two parallel arrows send $(s_i)_i$ to the families $(\mathrm{res}(s_i))_{i,j}$ and $(\mathrm{res}(s_j))_{i,j}$ respectively. Concretely, this means:

1. *(Gluing/Existence.)* For every compatible family $(s_i \in F(U_i))_{i \in I}$ — meaning $s_i|_{U_i \times_U U_j} = s_j|_{U_i \times_U U_j}$ for all $i, j$ — there exists a section $s \in F(U)$ with $s|_{U_i} = s_i$ for all $i$.
2. *(Separation/Uniqueness.)* Such a section $s$ is unique: if $s, s' \in F(U)$ satisfy $s|_{U_i} = s'|_{U_i}$ for all $i$, then $s = s'$.

A *sheaf* on $(\mathcal{C}, \tau)$ is a presheaf satisfying the sheaf condition for every covering family in $\tau$. A presheaf satisfying only condition (2) is called *separated*.

**Proposition.** *The sheaf condition for $F$ with respect to a covering sieve $S \hookrightarrow \mathrm{Hom}(-, U)$ is equivalent to requiring that the induced map $\mathrm{Hom}(\mathrm{Hom}(-, U), F) \to \mathrm{Hom}(S, F)$ is an isomorphism (using the Yoneda embedding). That is, $F$ is a sheaf if and only if it is a local object with respect to all covering sieve inclusions.*

**Proposition.** *For [sheaves of spaces](./sheaf-of-spaces.md) in the $(\infty,1)$-categorical setting, the sheaf condition is strengthened to homotopy descent: $F(U)$ must be equivalent to the homotopy limit*

$$F(U) \xrightarrow{\;\sim\;} \mathrm{holim}\left(\prod_i F(U_i) \rightrightarrows \prod_{i,j} F(U_i \times_U U_j) \mathrel{\substack{\to \\ \to \\ \to}} \cdots \right)$$

*of the full Cech cosimplicial diagram. Uniqueness of gluing is replaced by contractibility of the space of gluings.*

**Examples.**

- *Topological sheaves:* On the site $\mathrm{Open}(X)$ of a topological space $X$ with the open-cover topology, the sheaf condition is the classical gluing axiom: sections that agree on overlaps glue uniquely.
- *Representable presheaves:* On any subcanonical site $(\mathcal{C}, \tau)$, every representable presheaf $\mathrm{Hom}(-, C)$ is a sheaf.
- *Non-example:* The presheaf of bounded functions on $\mathbb{R}$ (with the open-cover topology) is separated but not a sheaf: compatible bounded local sections glue to an unbounded global section when the local bounds grow without bound.
