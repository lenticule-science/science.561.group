---

title: "Sheaf of Spaces"
description: "Let $(mathcal{C}, \tau)$ be a [site](./site.md) and let $mathcal{S}$ denote the $(infty,1)$-category of spaces (Kan complexes)."
aliases:
  - "sheaf of spaces"
  - "sheaves of spaces"
  - "∞-sheaf"
date-created: 2025-12-26
tags: []
mathematical-object: site
references:
  - id: ref1
    type: document
    title: Lurie, Higher Topos Theory, Princeton University Press, 2009
---

Let $(\mathcal{C}, \tau)$ be a [site](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/site.md) and let $\mathcal{S}$ denote the $(\infty,1)$-category of spaces (Kan complexes).

**Definition.** A *sheaf of spaces* (or *$\infty$-sheaf*) on $(\mathcal{C}, \tau)$ is a [functor](../../categories/theories/ordinary-categories/morphisms/functor.md) $F: \mathcal{C}^{\mathrm{op}} \to \mathcal{S}$ satisfying the *homotopy [sheaf condition](teaching/explanations/sheaf-condition.md)* (descent): for every covering family $\{U_i \to U\}$ in $\tau$, the canonical map

$$F(U) \xrightarrow{\;\sim\;} \mathrm{holim}\left(\prod_i F(U_i) \rightrightarrows \prod_{i,j} F(U_i \times_U U_j) \mathrel{\substack{\to \\ \to \\ \to}} \cdots \right)$$

is an equivalence of spaces, where the right-hand side is the homotopy limit (totalization) of the Cech cosimplicial diagram associated to the cover.

Equivalently, $F$ is a [sheaf](./sheaf.md) of spaces if for every covering sieve $S \hookrightarrow \mathrm{Hom}(-, U)$ in $\tau$, the restriction map $\mathrm{Map}(\mathrm{Hom}(-, U), F) \to \mathrm{Map}(S, F)$ is an equivalence of spaces.

**Proposition.** *The $(\infty,1)$-category $\mathrm{Sh}(\mathcal{C}, \tau)$ of sheaves of spaces on $(\mathcal{C}, \tau)$ is a left-exact localization of the presheaf category $\mathrm{PSh}(\mathcal{C}) = \mathrm{Fun}(\mathcal{C}^{\mathrm{op}}, \mathcal{S})$. In particular, $\mathrm{Sh}(\mathcal{C}, \tau)$ is an [$(\infty,1)$-topos](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/infinity-1-topos.md).*

*Proof sketch.* The sheafification functor $L: \mathrm{PSh}(\mathcal{C}) \to \mathrm{Sh}(\mathcal{C}, \tau)$ is left adjoint to the inclusion and is left exact. Accessibility follows from the fact that covering sieves form a small set of conditions.

**Proposition.** *The full subcategory of $0$-truncated objects in $\mathrm{Sh}(\mathcal{C}, \tau)$ — those $F$ for which each $F(U)$ is a discrete space (a set) — is equivalent to the ordinary category $\mathrm{Sh}(\mathcal{C}, \tau; \mathbf{Set})$ of set-valued sheaves. The $0$-truncation recovers the classical Grothendieck topos.*

**Proposition.** *An ordinary sheaf of sets says "compatible local data glues to a unique global datum." A sheaf of spaces says "compatible local data glues, and the space of gluings is contractible." More precisely, the homotopy fibers of the descent map measure the failure of gluing, and the sheaf condition demands these fibers are contractible.*

**Examples.**

- *Constant sheaves:* For a fixed space $K \in \mathcal{S}$, the constant presheaf $U \mapsto K$ is generally not a sheaf, but its sheafification $\underline{K}$ is. This is the higher analogue of the constant sheaf of sets.
- *Classifying sheaves:* On a site $(\mathcal{C}, \tau)$, the sheaf $B G$ classifying principal $G$-bundles (for a sheaf of groups $G$) is naturally a sheaf of spaces whose values are classifying spaces.
- *Eilenberg-MacLane sheaves:* For an abelian sheaf $A$ on $(\mathcal{C}, \tau)$ and $n \geq 0$, the presheaf $U \mapsto K(A(U), n)$ sheafifies to a sheaf of spaces $K(A, n)$ whose homotopy groups recover sheaf cohomology: $\pi_0 \mathrm{Map}(\ast, K(A, n)) \cong H^n(\mathcal{C}; A)$.
