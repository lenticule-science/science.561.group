---
name: "Lawvere-Tierney Topology"
description: "Let $mathcal{E}$ be an elementary topos with [subobject classifier](./subobject-classifier.md) $Omega$."
aliases:
  - "Lawvere-Tierney topology"
  - "Lawvere–Tierney topology"
  - "local operator"
date-created: 2026-03-02T00:00:00
tags: []
mathematical-object: topos
references:
  ref1:
    title: "Mac Lane & Moerdijk, Sheaves in Geometry and Logic, Springer, 1994"
---

Let $\mathcal{E}$ be an elementary topos with [subobject classifier](./subobject-classifier.md) $\Omega$.

**Definition.** A *Lawvere-Tierney topology* (or *local operator*) on $\mathcal{E}$ is a [morphism](./morphism.md) $j: \Omega \to \Omega$ satisfying:

1. $j \circ \mathrm{true} = \mathrm{true}$ (equivalently, $j(\top) = \top$),
2. $j \circ j = j$ (idempotence),
3. $j \circ \wedge = \wedge \circ (j \times j)$ (equivalently, $j(p \wedge q) = j(p) \wedge j(q)$ for all $p, q: 1 \to \Omega$).

**Proposition.** *A Lawvere-Tierney topology $j$ is equivalently a [closure operator](./closure-operator.md) on the internal [Heyting algebra](./heyting-algebra.md) $\Omega$ that preserves finite meets. In particular, $p \leq j(p)$ for all $p$ (inflation), which follows from axioms (1) and (3): since $p = p \wedge \top$, we have $j(p) = j(p) \wedge j(\top) = j(p) \wedge \top = j(p) \geq p$.*

**Proposition.** *There is a bijection between Lawvere-Tierney topologies on $\mathcal{E}$ and subtopoi of $\mathcal{E}$ (i.e., geometric embeddings $\mathrm{Sh}_j(\mathcal{E}) \hookrightarrow \mathcal{E}$). Given $j$, a $j$-sheaf is an object $F$ of $\mathcal{E}$ such that for every $j$-dense monomorphism $m: A \hookrightarrow B$ (i.e., $j \circ \chi_m = \top$), the restriction $\mathrm{Hom}(B, F) \to \mathrm{Hom}(A, F)$ is an isomorphism. The full subcategory $\mathrm{Sh}_j(\mathcal{E})$ of $j$-sheaves is a topos, and the inclusion has a left-exact left adjoint (sheafification).*

**Proposition.** *On a Grothendieck topos $\mathrm{Sh}(\mathcal{C}, \tau)$, Lawvere-Tierney topologies correspond bijectively to Grothendieck topologies $\tau'$ on $\mathcal{C}$ that are finer than $\tau$ (i.e., every $\tau$-covering sieve is a $\tau'$-covering sieve).*

**Examples.**

- *Trivial topologies:* On any topos $\mathcal{E}$, $j = \mathrm{id}_\Omega$ gives $\mathrm{Sh}_j(\mathcal{E}) = \mathcal{E}$, and the constant map $j = \top$ (sending everything to $\top$) gives $\mathrm{Sh}_j(\mathcal{E}) \simeq \mathbf{1}$ (the terminal topos).
- *Double-negation topology:* On any topos, $j = \neg\neg: \Omega \to \Omega$ is a Lawvere-Tierney topology. The $\neg\neg$-sheaves form a Boolean subtopos. For $\mathrm{Sh}(X)$ with $X$ a topological space, this corresponds to the sheaves on the smallest dense sublocale of $X$.
- *Spatial topologies:* On the topos $\mathrm{Sh}(X)$ for a topological space $X$, each Lawvere-Tierney topology corresponds to a sublocale of $X$.
