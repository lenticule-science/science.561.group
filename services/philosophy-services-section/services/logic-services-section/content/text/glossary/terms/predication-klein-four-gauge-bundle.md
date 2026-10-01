---
type: definition
class: equivariant-sheaf
symbol: "\\mathcal{G}_{v}"
depends-on: [settling-associated-sheaf, bitopological-settling-site, four-bilattice, internal-z2-gauge, negation, predication-settling]
see-also: [equivariant-cohomology-decomposition, internal-z2-gauge, strong-mld-via-composed-duality, jung-rivieccio-duality]
name: Klein-four gauge bundle
description: The Klein-four gauge bundle of a predication settling is the $(\mathbb{Z}/2 \times \mathbb{Z}/2)$-equivariant sheaf on the bitopological settling site arising from the four bilattice involutions acting fiberwise.
---

# Klein-four gauge bundle

The **Klein-four gauge bundle** of a predication settling is the $(\mathbb{Z}/2 \times \mathbb{Z}/2)$-equivariant sheaf on the bitopological settling site arising from the four bilattice involutions acting fiberwise. It extends the [internal $\mathbb{Z}/2$ gauge](../../documents/articles/research/2026/07/31/lenticule-import/from-predicate-category/teaching/explanations/internal-z2-gauge.md) — the negation action — to the full symmetry group of $\mathbf{FOUR}$.

## The Klein-four symmetry group of FOUR

The bilattice $\mathbf{FOUR} = \{\bot, \mathbf{f}, \mathbf{t}, \top\}$ has exactly four involutive automorphisms, forming the **Klein-four group** $K_4 = \mathbb{Z}/2 \times \mathbb{Z}/2$:

| Element | Symbol | Action |
|---|---|---|
| Identity | $\mathrm{id}$ | Fixes all four values |
| Negation | ${\sim}$ | Swaps $\mathbf{t} \leftrightarrow \mathbf{f}$; fixes $\bot, \top$ |
| Conflation | $-$ | Swaps $\top \leftrightarrow \bot$; fixes $\mathbf{t}, \mathbf{f}$ |
| Combined | ${\sim} \circ (-)$ | Swaps $\mathbf{t} \leftrightarrow \mathbf{f}$ and $\top \leftrightarrow \bot$ simultaneously |

The knowledge order $\leq_k$ (where $\bot \leq_k \mathbf{t}, \mathbf{f} \leq_k \top$) is preserved by negation and reversed by conflation. The truth order $\leq_t$ (where $\mathbf{f} \leq_t \bot, \top \leq_t \mathbf{t}$) is reversed by negation and preserved by conflation. The combined involution reverses both orders.

Under [Jung–Rivieccio duality](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/references/jung-rivieccio-duality.md), the $K_4$ action on $\mathbf{FOUR}$ dualizes to a $K_4$ action on the [paired Priestley space](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/paired-priestley-space.md): negation corresponds to the truth-order Priestley swap, conflation corresponds to the knowledge-order Priestley swap.

## Definition of the Klein-four gauge bundle

Let $v$ be a predication settling on the bitopological settling site $\mathbf{T}^*_\mathrm{site}$ with settling-associated sheaf $\mathcal{F}_v$. The **Klein-four gauge bundle** $\mathcal{G}_v$ is the $K_4$-equivariant sheaf:

$$\mathcal{G}_v \;:=\; \mathcal{F}_v \;+\; K_4\text{-equivariant structure},$$

where the $K_4$-equivariant structure is the data of natural transformations $\rho_g : \mathcal{F}_v \to g^*\mathcal{F}_v$ for each $g \in K_4$, satisfying:
- $\rho_\mathrm{id} = \mathrm{id}$,
- $\rho_{gh} = \rho_h \circ \rho_g$ (cocycle condition),
- Each $\rho_g$ is an isomorphism of sheaves.

**Construction.** The four $K_4$ elements act on the settling-associated sheaf by:

- **$\mathrm{id}$**: $(\mathcal{F}_v)_{(q,\tau,U)} \to (\mathcal{F}_v)_{(q,\tau,U)}$ by identity.
- **Negation ${\sim}$**: at each site point $(q, \tau, U)$, the action swaps the truth-designated cells and falsity-designated cells — it sends a section counting cells entering the truth-designated apex to the corresponding section counting cells entering the falsity-designated apex. Concretely, $\rho_\sim$ exchanges $\Delta^{+,t}_\tau(q)$ (truth-side firings) with $\Delta^{+,f}_\tau(q)$ (falsity-side firings).
- **Conflation $-$**: swaps the $\top$-valued firings with $\bot$-valued configurations — it exchanges $\Delta^{+,\top}_\tau(q)$ with $\Delta^{+,\bot}_\tau(q)$.
- **Combined ${\sim} \circ (-)$**: the composition of negation and conflation.

The cocycle conditions are satisfied because ${\sim}$ and $-$ are bilattice automorphisms, so $\rho_{\sim \circ (-)} = \rho_- \circ \rho_\sim$.

## The four isotypic components

Since $K_4 = \mathbb{Z}/2 \times \mathbb{Z}/2$ is abelian, its irreducible representations are the four characters:

$$\widehat{K_4} \;=\; \{\chi_\mathrm{id},\; \chi_\sim,\; \chi_-,\; \chi_{\sim\circ-}\},$$

each a group homomorphism $K_4 \to \{+1, -1\}$:

| Character | $\chi(\mathrm{id})$ | $\chi({\sim})$ | $\chi(-)$ | $\chi({\sim} \circ -)$ |
|---|---|---|---|---|
| $\chi_\mathrm{id}$ (trivial) | $+1$ | $+1$ | $+1$ | $+1$ |
| $\chi_\sim$ | $+1$ | $-1$ | $+1$ | $-1$ |
| $\chi_-$ | $+1$ | $+1$ | $-1$ | $-1$ |
| $\chi_{\sim\circ-}$ | $+1$ | $-1$ | $-1$ | $+1$ |

The **$\chi$-isotypic component** of $\mathcal{G}_v$ is:
$$\mathcal{G}_v^\chi \;:=\; \{s \in \mathcal{G}_v : g \cdot s = \chi(g) \cdot s \text{ for all } g \in K_4\}.$$

The four isotypic components of $\mathcal{G}_v$ are:
- $\mathcal{G}_v^\mathrm{id}$: the "symmetric" component — sections invariant under all $K_4$ actions. In bilattice terms: the $\bot$-content (consistent and undesignated on both sides, invariant under both negation and conflation).
- $\mathcal{G}_v^{\chi_\sim}$: the "negation-antisymmetric" component — sections that flip sign under negation. In bilattice terms: the truth-versus-falsity content (the $\mathbf{t}/\mathbf{f}$ distinction, antisymmetric under ${\sim}$, symmetric under conflation).
- $\mathcal{G}_v^{\chi_-}$: the "conflation-antisymmetric" component — sections that flip under conflation. In bilattice terms: the $\top$-versus-$\bot$ content (the consistency distinction, symmetric under negation, antisymmetric under conflation).
- $\mathcal{G}_v^{\chi_{\sim\circ-}}$: the "doubly-antisymmetric" component — sections that flip under both ${\sim}$ and $-$. In bilattice terms: the mixed truth-and-consistency content.

## Connection to the strong-MLD orbit types

The NSC firing orbit types in [strong-MLD via composed-duality](../../documents/articles/research/2026/07/31/lenticule-import/theorems/strong-mld-via-composed-duality.md) are exactly the isotypic components:

| Orbit type | Isotypic component |
|---|---|
| Truth-only firings | $\mathcal{G}_v^{\chi_\sim}$ (truth-antisymmetric) |
| Falsity-only firings | $\mathcal{G}_v^{\chi_\sim}$ (same component — falsity is the negation-image of truth) |
| $\top$-firings | $\mathcal{G}_v^{\chi_-}$ (conflation-antisymmetric) |
| $\bot$-firings | $\mathcal{G}_v^\mathrm{id}$ (symmetric — $\bot$ is fixed by $K_4$) |

Wait: more precisely, truth-only and falsity-only firings are related by the negation ${\sim}$, so they lie in the same $K_4$-orbit — they contribute to the *same* isotypic component (the component where ${\sim}$ acts non-trivially). The $K_4$-equivariant structure refines the strong-MLD classification by separating the truth and falsity contributions within the negation-antisymmetric component.

The full refinement:

| Orbit type | Isotypic decomposition |
|---|---|
| Truth-side firings | $(\mathcal{G}_v^{\chi_\sim})^+$ (positive eigenspace of ${\sim}$ restricted to truth-side) |
| Falsity-side firings | $(\mathcal{G}_v^{\chi_\sim})^-$ (negative eigenspace — the ${\sim}$-image of truth-side) |
| $\top$ (consistency failure) | $\mathcal{G}_v^{\chi_-}$ |
| $\bot$ (stable inconsistency) | $\mathcal{G}_v^\mathrm{id}$ |

The equivariant cohomology (see [equivariant-cohomology-decomposition](../../documents/articles/research/2026/07/31/lenticule-import/theorems/equivariant-cohomology-decomposition.md)) decomposes $H^1$ along these four isotypic sectors, giving a gauge-theoretic refinement of the existing firing-type classification.

## Position in predication categories

The Klein-four gauge bundle makes explicit the gauge-theoretic structure implicit in the bilattice's $K_4$ symmetry. Every predication settling carries this bundle — it is not an additional structure but an inherent feature of the $\mathbf{FOUR}$-valued cell structure.

The bundle is the corpus's first genuine gauge-theory object: a sheaf with a non-trivial symmetry group acting fiberwise, whose equivariant cohomology captures gauge-orbit structure in the settling dynamics. It opens the [equivariant cohomology decomposition theorem](../../documents/articles/research/2026/07/31/lenticule-import/theorems/equivariant-cohomology-decomposition.md) immediately.

**Open downstream:**
- *Gauge connection on the predication hyperdoctrine.* A gauge connection is an assignment of $K_4$ group elements to the hyperdoctrine's reindexing morphisms (subject-projection, object-projection, converse, specialization), compatible with the Beck-Chevalley conditions. Flat gauge connections (where the $K_4$ element is the identity on all reindexings) correspond to gauge-invariant settlings; non-flat connections produce gauge-twisted cohomology.
- *Gauge symmetry enhancement.* For quantale-enriched settlings (replacing $\mathbf{FOUR}$ by a Lawvere quantale $Q$), the gauge group is $\mathrm{Aut}(Q)$. For MV-algebras, $\mathrm{Aut}$ is a continuous group, giving a Lie-group-valued gauge theory. The question of whether the $K_4$ gauge structure extends to a larger group is the corpus's first step toward Yang-Mills-type gauge theory.
