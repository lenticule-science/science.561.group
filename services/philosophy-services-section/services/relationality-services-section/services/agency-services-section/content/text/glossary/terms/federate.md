---
type: morphism
class: substrate-operation
status: sketch
depends-on: [predicated-knowledge-system, scope, discourse-community-as-fiber]
see-also: [assert, federation-as-bilattice-colimit]
title: Federate
description: The substrate operation by which two predicated knowledge systems' scopes are joined into a single substrate region while preserving each scope's local closure-rule subset, predicate vocabulary, entity identity, and consistency commitments.
---

# Federate

The substrate operation by which two predicated knowledge systems' scopes are joined into a single substrate region while preserving each scope's local closure-rule subset, predicate vocabulary, entity identity, and consistency commitments.

## Operational signature

$$\mathrm{federate}: \mathbf{Scope}_{\mathcal{K}_1} \times \mathbf{Scope}_{\mathcal{K}_2} \times \mathrm{IdMap} \to \mathbf{Scope}_{\mathcal{K}_{12}}$$

— given two scopes and an *identity-mapping* (a sub-bilattice embedding $\iota: K^{S_1 \cap S_2}_\iota \hookrightarrow K^{S_1}, K^{S_2}$ asserting which entities and cells are identified across the two scopes), federate produces a new scope on a federated knowledge system.

## Construction

Federating scopes $S_1 \in \Sigma_1$ and $S_2 \in \Sigma_2$ under identity-mapping $\iota$ produces a federated scope $S_{12}$ whose:

- **Predicate vocabulary** $\mathcal{C}_{S_{12}} := \mathcal{C}_{S_1} \cup \mathcal{C}_{S_2}$, with cross-scope morphisms in the predicate category supplied by $\iota$ (or empty if the two vocabularies are disjoint).
- **Closure-rule subset** $\mathcal{S}_{S_{12}} := \mathcal{S}_{S_1} \cup \mathcal{S}_{S_2}$, with cross-scope rule conflicts noted as substrate-level $\top$-valued meta-predications about the federation.
- **Entity set** $E_{S_{12}} := E_{S_1} \cup_\iota E_{S_2}$, with cross-scope entity identifications supplied by $\iota$ (Topic Maps' subject-identifier merge gives one such discipline; see [topic-maps-as-degenerate-predication-system](../concepts/topic-maps-as-degenerate-predication-system.md)).
- **Settled state** $v_{S_{12}} := v_{S_1} \vee_k v_{S_2}$ on the union, with $\top$-valued cells marking conflicts.

## Substrate-level structural facts

**Colimit characterisation.** Per [federation-as-bilattice-colimit](../concepts/federation-as-bilattice-colimit.md), the federated fiber algebra $K^{S_{12}}$ is the pushout in the bilattice-algebra category of $K^{S_1} \leftarrow K^{S_1 \cap S_2}_\iota \to K^{S_2}$. Federation is therefore not an ad-hoc engineering construction but the categorical operation of *colimit over an identity-mapping*; standard colimit properties (associativity, universal property, well-definedness up to canonical isomorphism) follow.

**Monotonicity in $\leq_k$.** No information is destroyed by federation; conflicting evidence becomes $\top$, not silence. The federation never decreases either source scope's settled state restricted to its sub-fiber.

**Explicit identification required.** The substrate cannot guess that $S_1$'s entity $e$ and $S_2$'s entity $e'$ refer to the same thing; an explicit `identifies(e, e')` predication (in the meta-scope governing the federation, or supplied by $\iota$) is required. Without it, the federated scope treats them as distinct. This is the substrate's *explicit-cross-scope-identity* discipline; it forces communities federating their work to make their identification commitments first-class substrate content rather than implicit.

**Per-source regime preservation.** $S_1$'s closure regime applies to $S_1$'s sub-fiber within the federation; $S_2$'s applies to $S_2$'s; the federated regime is the join in the regime lattice (which can promote, never demote). A federation of two Scott-continuous scopes is at most Scott-continuous; a federation of a Scott-continuous and a transfinite-bounded scope is transfinite-bounded.

**Convergence under the predicated-computing discipline.** Per [federation-convergence](../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/federation-convergence.md), federation of conformant predicated knowledge systems produces a system that is itself conformant under the federated parameterisation. The engineering-side convergence is the operational realisation of the colimit characterisation above.

**Associativity.** Federation is associative under coherent identity-mappings: $(S_1 \,\#_{\iota_{12}}\, S_2) \,\#_{\iota_{(12)3}}\, S_3 \cong S_1 \,\#_{\iota_{1(23)}}\, (S_2 \,\#_{\iota_{23}}\, S_3)$ when the identity-mappings extend each other consistently. This makes federation suitable for *chained-community knowledge synthesis* — the order in which multiple communities are federated does not affect the final substrate, given consistent identification commitments.

**Asymmetry under partial identity-mappings.** When $\iota$ identifies cells in $S_1$'s sub-fiber with cells in $S_2$'s but not vice versa (e.g., $S_2$'s vocabulary subsumes $S_1$'s), the federation is asymmetric: $S_1$'s content lifts into $S_2$'s vocabulary, but not the converse. The substrate handles this by treating $\iota$ as a partial function and recording un-identified cells per-source.

## Operational consequences

**(O1) Cross-community work composition.** Per [discourse-community-as-fiber](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/archive/teaching/explanations/discourse-community-as-fiber.md), each community is a scope; federation is the substrate operation by which cross-community work *composes*. Hjorland's discourse-community pluralism (per [knowledge-organization-survey](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/texts/knowledge-organization-survey.md) §2) becomes substrate-native: different communities run on the substrate in their own scopes, and federation across scopes is a substrate operation rather than a separate engineering project.

**(O2) Audit trail of cross-community claims.** Because federation requires explicit identity-mappings, the substrate's witness chain records *who claimed what cross-community identifications*. This supports queries like "on what basis are these two scopes treated as referring to the same entities?"

**(O3) Contestation-as-substrate-state across communities.** When two communities disagree on a cell — one $t$-asserting, one $f$-asserting — federation produces $\top$ at the cell. The substrate carries the cross-community disagreement as a fact rather than silently picking a winner.

**(O4) Federation is reversible by projection.** The two source scopes' content remains identifiable within the federated scope (by the witness chain). Projecting the federation back to either source gives the original; federation is *non-destructive*.

## Comparison to upstream

The substrate's federate is the bilattice-and-scope generalisation of:

- **Topic-Maps merge** (ISO/IEC 13250). Per [topic-maps-as-degenerate-predication-system](../concepts/topic-maps-as-degenerate-predication-system.md), Topic-Maps merge under shared subject identifiers is exactly federate restricted to $\mathbf{2}$-valued, single-scope, identity-by-shared-IRI.
- **OWL ontology import** (`owl:imports`). OWL import is federate restricted to $\mathbf{2}$-valued, with the importing ontology's vocabulary inheriting the imported's; the substrate's federate is more symmetric and scope-explicit.
- **RDF dataset union.** RDF dataset union is federate restricted to $\mathbf{2}$-valued without identity discipline; the substrate's federate adds explicit identity-mappings and the bilattice contestation channel.
- **Cyc microtheory composition.** Cyc microtheory composition is closer (sourced, scoped) but lacks the bilattice contestation discipline; the substrate's federate generalises it.
