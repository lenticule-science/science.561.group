---
type: definition
class: algebra
status: sketch
symbol: K_p
depends-on: [predication-fiber-algebra, scope, predicated-knowledge-system]
realizes: [knowing-as-settling]
name: Knowledge fiber algebra
description: For a predicated knowledge system $\mathcal{K} = (\mathbf{L}, \mathcal{C}, E, \mathcal{S}, \Sigma)$ and a predicate $p \in \mathcal{C}$, the knowledge fiber algebra at $p$ $Kp$ is the predication fiber algebra at $p$, restricted to the…
---


For a [predicated knowledge system](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/archive/predicated-knowledge-system.md) $\mathcal{K} = (\mathbf{L}, \mathcal{C}, E, \mathcal{S}, \Sigma)$ and a predicate $p \in \mathcal{C}$, the **knowledge fiber algebra at $p$** $K_p$ is the [predication fiber algebra](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) at $p$, restricted to the system's settled state under $\mathcal{S}$ within a chosen scope.

Concretely, fixing a scope $S \in \Sigma$ and a settled state $v_S$:

$$K_p^{S} := \{ v_S(s, o) \in \mathbf{L}^\bowtie : (s, p, o) \text{ is a cell admitted in scope } S \}$$

with the bilattice operations $\wedge_t, \vee_t, \wedge_k, \vee_k, \sim$ inherited pointwise. $K_p^S$ is a sub-algebra of the predication fiber algebra $A_p$ — the part of the fiber that the scope $S$ has actually settled, in contrast to the part the scope has not yet observed.

## What the object is for

The knowledge fiber algebra is what a community's *knowledge about predicate $p$* concretely is. The community's $t$-valued cells in $K_p^S$ are its asserted facts under $p$; its $f$-valued cells are its denied facts; its $\bot$-valued cells are its silences (the cells admitted by the scope but not yet settled to a non-trivial value); its $\top$-valued cells are its contestations.

The algebra's structure under the bilattice operations gives the community's *inferential calculus* on $p$: $K_p^S$ inherits the residuation $\odot \dashv \Rightarrow$ (Busaniche & Cignoli 2014) that lets the community reason about which evidence-states under $p$ entail which others. The substrate's [predication-categories](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/humanities/theories/math/theories/categories/theories/predication-categories/_index.md) machinery — the predication-fibration, the closure-driven settling, the four-regime classification — applies pointwise to $K_p^S$.

## Functoriality across the predicate category

For a morphism $f: p \to q$ in $\mathcal{C}$ (e.g., $p$ specialises $q$, or $p$ is the inverse of $q$), the predication-fibration's substitution-functor structure (per the [predication-fibration](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md) object and its specialisation, converse, and projection morphisms — [predicate-specialization](../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/predicate-specialization.md), [predicate-converse](../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/predicate-converse.md), [predicate-subject-projection](../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/predicate-subject-projection.md), [predicate-object-projection](../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/predicate-object-projection.md)) gives a map $f^*: K_q^S \to K_p^S$ that pulls back knowledge under $q$ to knowledge under $p$. For the specialisation case (every $p$-cell is a $q$-cell), $f^*$ is the identity on shared cells; for the inversion case ($p = q^{-1}$), $f^*$ permutes subject and object coordinates; for composition cases ($p = q_1 \circ q_2$), $f^*$ composes the underlying cells.

The substitution functor's left and right adjoints $\exists_f, \forall_f$ give the community's existential and universal closure under predicate-category morphisms — the community's ability to derive "there exists an entity standing in relation $p$ to $e$" and "for all entities $e'$ standing in relation $p$ to $e$, ...". These are Lawvere's adjoint quantifiers, instantiated on the bilattice value-domain.

## Cross-scope structure

For two scopes $S_1, S_2$ with $S_1 \subseteq S_2$ (i.e., $S_1$ is a sub-scope of $S_2$ — same predicate vocabulary, narrower entity set or stricter rules), there is a restriction map $K_p^{S_2} \twoheadrightarrow K_p^{S_1}$ that drops cells outside $S_1$'s admission. The cross-scope relationship is governed by the substrate's [federation convergence](../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/federation-convergence.md) when the scopes share underlying entities and predicates with consistent identification.
