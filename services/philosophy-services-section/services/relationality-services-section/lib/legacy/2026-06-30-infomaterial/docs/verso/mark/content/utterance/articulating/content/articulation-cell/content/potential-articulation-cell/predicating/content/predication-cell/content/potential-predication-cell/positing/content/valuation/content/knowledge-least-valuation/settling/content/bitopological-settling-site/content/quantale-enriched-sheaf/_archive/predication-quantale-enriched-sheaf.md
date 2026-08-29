---
type: definition
class: sheaf
depends-on: [d-frame, bitopological-settling-site]
---

# Q-enriched sheaf on a Grothendieck site

A generalization of [@ghrist-et-al2025]'s quantale-enriched cellular sheaves on graphs to **Q-enriched sheaves on arbitrary Grothendieck sites**. This is the Layer-1 ingredient of the [cellular extension plan](prose/teaching/explanations/cellular-extension-plan.md): the generalization that lets the Lawvere Laplacian framework apply to the [bitopological settling site](bitopological-settling-site.md) and other non-graph Grothendieck sites.

## Quantales and Q-enriched categories

Following Ghrist–Lopez–North–Riess 2025, fix a **commutative unital quantale** $\mathsf{Q} = (Q, \cdot, 1, \preceq)$ — a complete lattice with associative-commutative-unital binary operation $\cdot$ that distributes over arbitrary suprema:

$$p \cdot \bigvee_{i \in I} q_i \;=\; \bigvee_{i \in I} (p \cdot q_i).$$

A **$\mathsf{Q}$-category** $\mathcal{C}$ is a Q-enriched category: objects $\mathrm{ob}(\mathcal{C})$ and homs $\mathrm{hom}_\mathcal{C}(x, y) \in Q$ satisfying

$$\mathrm{hom}_\mathcal{C}(x, x) \succeq 1, \qquad \mathrm{hom}_\mathcal{C}(x, y) \cdot \mathrm{hom}_\mathcal{C}(y, z) \;\preceq\; \mathrm{hom}_\mathcal{C}(x, z).$$

A $\mathsf{Q}$-functor $F : \mathcal{C} \to \mathcal{D}$ is a map of objects with $\mathrm{hom}_\mathcal{C}(x, y) \preceq \mathrm{hom}_\mathcal{D}(F x, F y)$.

A **complete weighted lattice** is a $\mathsf{Q}$-category admitting all weighted meets and joins (weighted meet/join defined at [@ghrist-et-al2025] Definition 2.6; the term "complete weighted lattice" is introduced in the surrounding text near Definition 2.9).

## Q-enriched presheaves on a small category

For a small category $\mathbf{T}$, a **$\mathsf{Q}$-enriched presheaf** is a functor

$$F \,:\, \mathbf{T}^{\mathrm{op}} \to \mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$$

from $\mathbf{T}^{\mathrm{op}}$ to the category of complete weighted lattices and $\mathsf{Q}$-functors. (For [@ghrist-et-al2025]'s graph-indexed setting, $\mathbf{T}$ is the incidence poset of vertices and edges; we relax to arbitrary $\mathbf{T}$.)

Each object $\sigma \in \mathbf{T}$ has an associated stalk $F(\sigma)$ — a complete weighted lattice. Each morphism $f : \sigma \to \tau$ in $\mathbf{T}$ has an associated $\mathsf{Q}$-functor $F(f) : F(\tau) \to F(\sigma)$ (contravariance).

## Sheaf condition on a Grothendieck site

Given a Grothendieck topology $J$ on $\mathbf{T}$, a **$\mathsf{Q}$-enriched sheaf** on $(\mathbf{T}, J)$ is a $\mathsf{Q}$-enriched presheaf $F$ satisfying the sheaf condition: for every covering family $\{f_i : U_i \to U\}_{i \in I} \in J$, the canonical $\mathsf{Q}$-functor

$$F(U) \,\longrightarrow\, \mathrm{Eq}\Bigl(\prod_i F(U_i) \rightrightarrows \prod_{i, j} F(U_i \times_U U_j)\Bigr)$$

is an *equivalence* of complete weighted lattices, where $\mathrm{Eq}$ is the equalizer in $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$.

Since $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$ has all (weighted) limits — including equalizers — the sheaf condition is well-defined. The **category of $\mathsf{Q}$-enriched sheaves** $\mathrm{Sh}(\mathbf{T}, J; \mathsf{Q})$ is the full subcategory of $\mathsf{Q}$-enriched presheaves satisfying this condition.

## The relationship to graph-indexed sheaves

In [@ghrist-et-al2025], the indexing category is the **incidence poset of a graph**: $\mathrm{ob}(\mathbf{T}) = V \sqcup E$ (vertices and edges), with morphisms $v \leq e$ when $v$ is incident to $e$. The Grothendieck topology is implicit (covers are simply edge-incidence). The cochain complex $C^\bullet F$ has $C^0 F = \prod_v F(v)$ (vertex-indexed product) and $C^1 F = \prod_e F(e)$ (edge-indexed product).

Our generalization replaces the graph incidence poset with an arbitrary site $\mathbf{T}$ and replaces the implicit edge-incidence covers with a general Grothendieck topology $J$. The cochain complex generalizes to $C^n F = \prod_{\sigma \text{ of dim } n} F(\sigma)$ where dimension is determined by the site's structure (typically a length of a cell decomposition or stratification).

## Specialization to the bitopological settling site

The [bitopological settling site](bitopological-settling-site.md) $(\mathbf{T}^*, J)$ is a Grothendieck site whose objects $(q, \tau, U)$ are predicate-stage-clopen triples. The d-frame value category — d-frames with d-frame morphisms, which form a $\mathsf{Q}$-category for $\mathsf{Q}$ the "underlying" frame structure — fits into this framework.

For each $(q, \tau, U)$, the d-frame value $\mathbb{F}_v(q, \tau, U)$ is a complete weighted lattice in the $\mathsf{Q}$-enriched sense (the lattice operations are weighted meets and joins; the consistency-totality relations are weighted hom-objects). The [d-frame-valued sheaf condition](../theorems/d-frame-valued-sheaf-condition.md) we proved is a special case of the general $\mathsf{Q}$-enriched sheaf condition above.

So d-frame-valued sheaves are an instance of the abstract framework — modulo the technical work of checking that d-frames really are weighted lattices in the right sense, which involves reading off the $\mathsf{Q}$-enrichment from the d-frame's pair-of-frames-with-relations structure.

## Status

Definitional infrastructure. The framework as stated is a direct generalization of [@ghrist-et-al2025]'s setup; the substantive question is whether the Lawvere Laplacian extends to this generalized setting, which is the content of [Lawvere Laplacian on Grothendieck sites](../theorems/lawvere-laplacian-grothendieck-sites.md).
