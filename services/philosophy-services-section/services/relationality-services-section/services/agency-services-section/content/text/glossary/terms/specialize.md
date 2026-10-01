---
type: morphism
class: predicate-category-operation
status: sketch
depends-on: [predicate-category, predication-fibration, knowledge-fiber-algebra]
see-also: [classify, federate, predicate-category-stratification]
name: Specialize
description: "The predicate-category operation by which a more general predicate is refined to a more specific one along a category morphism $f: p{\\mathrm{specific}} \\to p{\\mathrm{general}}$ in $\\mathcal{C}$."
---

# Specialize

The predicate-category operation by which a more general predicate is refined to a more specific one along a category morphism $f: p_{\mathrm{specific}} \to p_{\mathrm{general}}$ in $\mathcal{C}$. The specialisation is *contravariant in fibers*: the substitution functor $f^*: K_{p_\mathrm{general}} \to K_{p_\mathrm{specific}}$ pulls a community's knowledge under the general predicate down to the specific one, restricted to the cells the specialisation admits.

## Operational signature

$$\mathrm{specialise}: \mathrm{Mor}(\mathcal{C}) \to (K_{p_\mathrm{general}} \to K_{p_\mathrm{specific}})$$

— given a predicate-category morphism $f$, specialise produces the *substitution functor* $f^*$ that pulls fiber content along $f$. The substrate exposes specialise as the operation of *running $f^*$* against a community's existing fiber state.

## Concrete examples

- A community asserting `cites(W, X)` and accepting the specialisation `cites-positively → cites` can derive `cites(W, X)` from `cites-positively(W, X)` (by the specialisation acting on the more-specific cell) but cannot derive `cites-positively(W, X)` from `cites(W, X)` alone — the substitution is one-directional.
- A community asserting `is-a(Whale, Mammal)` and accepting the specialisation `whale-is-a → is-a` can use the specialisation to populate fibers of `is-a` from `whale-is-a` content, while the converse direction requires *additional* discriminating evidence (a whale is not just any mammal).
- A community using BFO's `inheres-in(quality, bearer)` and the specialisation `colour-inheres-in → inheres-in` can use specialisation to project all colour-inherences into the general inhereship-fiber for cross-quality reasoning.

## Adjoint structure

The specialisation morphism in the predicate category gives the substrate's substitution functor $f^*$. The substitution functor has:

- **Left adjoint** $\exists_f: K_{p_\mathrm{specific}} \to K_{p_\mathrm{general}}$ — *existential closure under specialisation*: there exists a specialisation that produces the cell. Operationally: pushing specific-fiber evidence forward to the general fiber by claiming "if there's evidence at the specific predicate, there is evidence at the general predicate".

- **Right adjoint** $\forall_f: K_{p_\mathrm{specific}} \to K_{p_\mathrm{general}}$ — *universal closure under specialisation*: all specialisations of the general predicate are populated at the specific. Operationally: a fact at the general predicate that holds only when *every* specialisation holds at the corresponding cell.

The adjoint triple $\exists_f \dashv f^* \dashv \forall_f$ is the [Lawvere-Tierney quantifier structure](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/texts/predication-logic-through-knowledge-systems.md) on the predication-fibration; specialise *is* the substrate operation that runs this adjoint structure on a community's fiber content.

## Substrate-level structural facts

**Predicate-category morphism structure made operational.** Whatever upper ontology supplies the predicate-category schema also supplies its specialisation morphisms; the substrate runs whatever specialisation discipline the schema declares. Different upper ontologies (BFO, DOLCE, SUMO, Cyc) supply different morphism structures and therefore different specialisation operations on the same substrate.

**Bilattice structure preserved pointwise.** $f^*$ is a homomorphism of bilattice algebras: $f^*(v \wedge_k v') = f^*(v) \wedge_k f^*(v')$, $f^*(v \vee_k v') = f^*(v) \vee_k f^*(v')$, $f^*(\sim v) = \sim f^*(v)$. Specialisation does not lose evidence; it relocates evidence from the general predicate's fiber to the specific predicate's fiber. The bilattice-homomorphism property is what makes specialisation safe to compose with other substrate operations.

**Closure-regime interaction.** A predicate-category schema with deep specialisation chains produces closure rules whose firing depends on transitive specialisation closure; this can promote the system from Scott-continuous to transfinite-bounded regime when the chain is unbounded. The [four-group-register-as-regime](../concepts/four-group-register-as-regime.md) theorem's situating-stratum analysis records this as one of the two pathways (the other is lineage-traversal) by which situating-stratum closure reaches Scott-continuous-or-higher.

**Compositional specialisation.** Specialisation morphisms compose: $f: p_{\mathrm{spec}} \to p_{\mathrm{med}}$ and $g: p_{\mathrm{med}} \to p_{\mathrm{gen}}$ give $g \circ f: p_{\mathrm{spec}} \to p_{\mathrm{gen}}$, and $(g \circ f)^* = f^* \circ g^*$ as substrate operations. Chained specialisations are a single substrate operation.

**Functorial in fibers.** $f^*$ is a functor on the predicate-fiber-algebra category: it preserves identity ($\mathrm{id}^* = \mathrm{id}$) and composition. The substrate's settling under closure rules involving specialised predicates respects functoriality automatically.

## Relation to other morphisms

**Vs. classify.** Classify operates on entities, placing them in strata. Specialise operates on predicates, refining the predicate vocabulary itself. Together they are how the predicate-category schema becomes operational rather than just declared:

- The schema declares the strata and predicates.
- Classify places entities in strata.
- Specialise refines predicates along the schema's morphism structure.

The two operations interact via the [predicate-category-stratification](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/archive/teaching/explanations/predicate-category-stratification.md) discipline: classifying entities under one stratum's predicates, then specialising those predicates within the stratum, navigates the substrate's predicate-category structure under the stratification.

**Vs. assert.** Assert places content at a specific cell. Specialise is a meta-operation on the predicate-category structure that *propagates* content along morphisms. Asserting a specific-predicate cell automatically populates the general-predicate cell via $\exists_f$; asserting a general-predicate cell does *not* automatically populate any specific-predicate cell unless explicit discriminating evidence is added.

## Comparison to upstream

The substrate's specialise generalises:

- **OWL `rdfs:subPropertyOf`.** OWL's `subPropertyOf` is a special case of specialisation in a $\mathbf{2}$-valued substrate with the OWL closure-rule profile.
- **Description-logic role hierarchies.** DL role hierarchies (the $\mathcal{H}$ in $\mathcal{ALCH}$, $\mathcal{SHIQ}$, etc.) give specialisation morphisms in the role-category; the substrate's specialise generalises to bilattice value-domains.
- **Conceptual-graph type specialisation.** Sowa's conceptual-graph specialisation operation is structurally close; the substrate's specialise adds explicit adjoint structure ($\exists_f, \forall_f$) and bilattice compatibility.
- **Datalog rule specialisation.** Datalog has no native predicate-specialisation morphism; specialisation is encoded via auxiliary rules. The substrate's specialise lifts this to first-class predicate-category operation.
