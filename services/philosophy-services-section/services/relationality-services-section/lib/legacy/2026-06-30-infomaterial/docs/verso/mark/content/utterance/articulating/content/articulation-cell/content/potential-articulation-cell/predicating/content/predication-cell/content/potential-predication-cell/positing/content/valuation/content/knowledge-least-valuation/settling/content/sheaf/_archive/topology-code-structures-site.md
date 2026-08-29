---

title: "Site"
description: "Let $mathcal{C}$ be a small [category](../../categories/theories/ordinary-categories/objects/category.md)."
aliases:
  - "site"
  - "Grothendieck site"
date-created: 2025-12-26
tags: []
mathematical-object: category
references:
  - id: ref1
    type: document
    title: Mac Lane & Moerdijk, Sheaves in Geometry and Logic, Springer, 1994
defines:
  - "Site"
  - "Grothendieck site"
---

Let $\mathcal{C}$ be a small [category](../../categories/theories/ordinary-categories/objects/category.md).

**Definition.** A *Grothendieck topology* $\tau$ on $\mathcal{C}$ assigns to each object $U \in \mathcal{C}$ a collection $\tau(U)$ of *covering sieves* — subfunctors $S \hookrightarrow \mathrm{Hom}(-, U)$ — satisfying:

1. *(Maximal sieve.)* The maximal sieve $\mathrm{Hom}(-, U)$ is in $\tau(U)$.
2. *(Stability.)* If $S \in \tau(U)$ and $f: V \to U$ is any [morphism](../../categories/theories/ordinary-categories/morphisms/morphism.md), then the pullback sieve $f^*S = \{g: W \to V \mid f \circ g \in S\}$ is in $\tau(V)$.
3. *(Transitivity.)* If $S \in \tau(U)$ and $R$ is a sieve on $U$ such that $f^*R \in \tau(V)$ for every $f: V \to U$ in $S$, then $R \in \tau(U)$.

A *site* is a pair $(\mathcal{C}, \tau)$ of a small category equipped with a Grothendieck topology.

Equivalently (and more concretely), a Grothendieck *pretopology* on $\mathcal{C}$ specifies covering families $\{U_i \to U\}_{i \in I}$ satisfying: (i) [isomorphisms](../../categories/theories/ordinary-categories/morphisms/isomorphism.md) cover; (ii) covering families are stable under pullback: if $\{U_i \to U\}$ covers $U$ and $V \to U$ is any [morphism](../../categories/theories/ordinary-categories/morphisms/morphism.md), then $\{U_i \times_U V \to V\}$ covers $V$; (iii) coverings compose: if $\{U_i \to U\}$ covers $U$ and each $\{V_{ij} \to U_i\}_j$ covers $U_i$, then $\{V_{ij} \to U\}_{i,j}$ covers $U$. Every pretopology generates a unique Grothendieck topology.

**Proposition.** *A [presheaf](./presheaf.md) $F: \mathcal{C}^{\mathrm{op}} \to \mathbf{Set}$ is a sheaf for $(\mathcal{C}, \tau)$ if and only if for every covering sieve $S \in \tau(U)$, the canonical map $\mathrm{Hom}(\mathrm{Hom}(-, U), F) \to \mathrm{Hom}(S, F)$ is a bijection. The full subcategory $\mathrm{Sh}(\mathcal{C}, \tau) \hookrightarrow \mathrm{PSh}(\mathcal{C})$ of sheaves is a Grothendieck topos.*

**Proposition.** *A site $(\mathcal{C}, \tau)$ is called subcanonical if every representable presheaf $\mathrm{Hom}(-, C)$ is a sheaf for $\tau$. This holds if and only if every covering sieve is an effective-epimorphic family.*

**Proposition.** *Two sites $(\mathcal{C}, \tau)$ and $(\mathcal{D}, \sigma)$ can give rise to equivalent categories of sheaves: $\mathrm{Sh}(\mathcal{C}, \tau) \simeq \mathrm{Sh}(\mathcal{D}, \sigma)$. A Grothendieck topos determines a unique locale of subterminal objects, while distinct sites produce equivalent sheaf categories when they share the same sheafification.*

**Examples.**

- *Topological spaces:* For a topological space $X$, the site $\mathrm{Open}(X)$ has open subsets as objects, inclusions as [morphisms](../../categories/theories/ordinary-categories/morphisms/morphism.md), and open covers as covering families.
- *Zariski site:* For a scheme $X$, objects are Zariski-open subschemes with covering families given by Zariski-open covers.
- *Etale site:* For a scheme $X$, objects are etale [morphisms](../../categories/theories/ordinary-categories/morphisms/morphism.md) $U \to X$, and covering families are jointly surjective families of etale maps. This topology is finer than the Zariski topology and gives rise to etale cohomology.
- *Canonical topology:* On any category $\mathcal{C}$, the finest subcanonical topology. Its covering sieves are exactly the effective-epimorphic sieves.
