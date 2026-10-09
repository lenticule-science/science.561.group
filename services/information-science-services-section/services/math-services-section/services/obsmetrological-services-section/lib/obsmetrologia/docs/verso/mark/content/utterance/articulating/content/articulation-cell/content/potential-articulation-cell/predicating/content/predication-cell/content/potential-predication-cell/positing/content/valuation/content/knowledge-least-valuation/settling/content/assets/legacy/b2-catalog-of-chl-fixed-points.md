---
type: question
class: internal
status: open
explores: [closure-2-monad, closure-2-monad-lax-idempotence, closure-fixed-points-priestley-correspondence, verdier-duality-bitopological-site, four-bilattice, strong-mld-via-composed-duality, settling-cohomology-vanishes-above-degree-1, bigraded-realizability-refinement]
---

# Catalog of CHL fixed points in the corpus

The [CHL apex recursion narrative](../narratives/chl-apex-recursion.md) identifies three substantial fixed points of the meta-recursion: Verdier duality (mutual fixed point of sheaf-cosheaf cones), the bilattice apex $\top$ (self-recursive fixed point of value-category cone), and strong-MLD self-dual orbits (composed-recursion fixed points). The narrative also flags three more candidate fixed points without developing them.

Open: **what is the complete catalog of CHL fixed points in the corpus, and what structural information does each carry?**

A complete catalog matters because **fixed points are where predication categories' distinctive structural content lives**. Linear-recursion levels produce derivative content (each level depends on the prior); fixed points produce *self-referential* content that doesn't fit into the linear chain. Cataloging them is cataloging predication categories' structurally novel pieces — the parts that go beyond standard topos-theoretic frameworks.

## The three established (or strongly-conjectured) fixed points

From the [CHL apex recursion narrative](../narratives/chl-apex-recursion.md):

1. **Verdier duality** — mutual fixed point of sheaf-cohomology and cosheaf-homology cones. Established at draft level via Layers 1+2+3 of the cellular extension plan.

2. **Bilattice apex $\top$** — self-recursive fixed point of the value-category cone under negation. The closure operator producing $\top$ is the cone's own self-action $\mathbb{D}_{\mathrm{val}}$.

3. **Strong-MLD self-dual orbits** — meta-recursion fixed points of composed duality $\mathbb{D} = \mathbb{D}_{\mathrm{sp}} \circ \mathbb{D}_{\mathrm{val}}$. Settlings whose firings are all $\top$-firings AND whose Verdier-pairing is self-coherent.

## Six more candidate fixed points

Each of the following is a candidate fixed point — needs precise verification.

4. **The closure-fixed-point Priestley correspondence.** The [theorem](../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/closure-operator/references/closure-fixed-points-priestley-correspondence.md) states: closure-fixed-points on the algebra side correspond to closed subspaces on the dual side. Iterating the correspondence — closure on closed-subspaces gives back the same closed-subspaces (since they're already closed) — is a stabilization. **Conjecture: this is a fixed point of the Priestley-duality recursion**, and naming it as such would clarify why the closure-fixed-point structure is preserved across the duality.

5. **The closure 2-monad's lax-idempotence.** The [theorem](../theorems/closure-2-monad-lax-idempotence.md) states $\mathrm{Cl}^2 = \mathrm{Cl}$ up to canonical 2-cell. This is structurally a fixed point: $\mathrm{Cl}$ is its own canonical closure as a 2-monad. Different from the apex recursion's fixed points (it's *internal* to the 2-monad, not external to the apex tower). **Conjecture: the lax-idempotence is predication categories' first instance of an *internal CHL fixed point*** — a fixed point of the structure-on-itself rather than the apex-of-cone.

6. **Vanishing-above-degree-1 as cohomological stabilization.** The [theorem](../../sheaf/content/settling-cohomology/references/settling-cohomology-vanishes-above-degree-1.md) gives $H^{\geq 2} = 0$ — cohomology stabilizes at degree 1. Past this degree, the cohomology recursion is *trivially* fixed (everything is zero). **Is this a fixed point of the "compute next degree" recursion, or just a vanishing?** If the former, predication categories' cohomology is structurally truncated — finite-dimensional in the recursion-level sense, not just degree-bounded.

7. **Bigraded refinement decomposition.** The [bigraded cohomology](../../sheaf/content/settling-cohomology/content/bigraded-settling-cohomology/bigraded-settling-cohomology.md) decomposes $H^1 = H^1_t \oplus H^1_\top$. **Each summand is a fixed point of the corresponding projection.** The decomposition is a fixed-point structure of the bigraded-projection recursion — the truth-side and inconsistency-side as orthogonal fixed points.

8. **The four-regime dichotomy as a stratification fixed point.** Each regime is a *stable stratum* under closure-iteration — a settling in regime $R$ stays in regime $R$ throughout closure. **The four regimes are fixed points of the regime-classification recursion.** Different from the apex-tower fixed points (it's a *stratification* fixed point, not a *value* fixed point).

9. **Anderson-Putnam direct-limit as a recursion fixed point.** The aperiodic classifying invariant is $\bigoplus_\mu \mathbb{Z}$ — a direct-limit construction. The directed colimit IS the fixed point of "extend the diagram by one stage" (Lambek's lemma in the chain-colimit setting). **The Anderson-Putnam template is the canonical example of a directed-colimit fixed point in the corpus.**

## Sub-questions

1. **Verify each candidate.** For each of (4)–(9), verify it is genuinely a CHL fixed point in the precise sense (apex of some cone equals LFP of some closure derived from it). Some may collapse on closer inspection; others may turn out to be more subtle than stated here.

2. **Classification of fixed-point types.** The fixed points come in distinct categorical flavors:
   - *Mutual fixed points* (Verdier, sheaf-cosheaf pair).
   - *Self-recursive fixed points* ($\top$ under negation, lax-idempotent 2-monad).
   - *Stratification fixed points* (four regimes, bigraded decomposition).
   - *Vanishing fixed points* ($H^{\geq 2} = 0$, where the recursion goes trivially fixed).
   
   Whether these flavors are structurally related — whether they all reduce to a more uniform notion of CHL fixed point — is a meta-question about predication categories' structural unity.

3. **Connection to the strong-MLD orbit-type stratification.** The strong-MLD classification has three orbit types: self-dual (fixed under $\mathbb{D}$), exchange-paired (size-2 orbit), mixed. The fixed-point stratum *is* the self-dual orbit type. **The strong-MLD classification is structurally a fixed-point-vs-non-fixed-point stratification of the moduli.** Whether other CHL fixed points have similar orbit-type stratifications is open.

4. **The Hyperdoctrine layer's fixed points.** The hyperdoctrine has substantial categorical structure (quantifier adjoints, Beck-Chevalley, Frobenius for $\wedge_k, \wedge_t$). Are there CHL fixed points specific to the hyperdoctrine layer that haven't been articulated? Candidates: the [two-internal-logics theorem](../theorems/two-internal-logics.md) (each logic as a fixed point of the corresponding internal-logic projection), Lawvere's diagonal-$\Sigma$ giving two parallel equality predicates (fixed under symmetry).

## Connection to other questions

This catalog connects to:

- [CHL recursion meta-stabilization](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/learning-articles/questions/chl-recursion-meta-stabilization.md) — fixed points are the active points of the recursion; the catalog is the inventory of where stability occurs.
- [Meta-classifier moduli of moduli](meta-classifier-moduli-of-moduli.md) — a meta-classifier might be a fixed point of the moduli-of-moduli recursion.
- [Failure-event moduli stack](failure-event-moduli-stack.md) — failure-events as a structural object whose fixed-point classifier might emerge.
- [Strong-MLD via composed duality](../theorems/strong-mld-via-composed-duality.md) — the established fixed-point stratification.

## Position in predication categories

This is the *cataloging* question — corpus-internal, asking what the corpus already has rather than what new content is needed. Answering it would produce a clearer picture of predication categories' structural backbone: where the linearity ends and the self-reference begins.

Concrete entry point: take the six candidate fixed points and verify each one explicitly. The verification is mostly checking whether the structural conditions (apex of cone = LFP of closure derived from it) actually hold. Some will be cleanly fixed points; others will need refinement of the definition.

The catalog's value isn't in answering a "deep" question but in surfacing predication categories' structural-novelty inventory cleanly. Each fixed point, once verified, is a piece of the corpus that explains why the framework is genuinely *more* than topos-theoretic semantics for paraconsistent logic — fixed points are where predication categories' structural specificity lives.
