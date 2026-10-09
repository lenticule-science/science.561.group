---
type: theorem
status: sketch
depends-on: [predicated-knowledge-system, identity-by-relations, scope, n-ary-predication]
see-also: [aboutness, federate, federation-as-bilattice-colimit]
title: Topic Maps as degenerate predication system (sketch)
description: Claim (sketch).
---

# Topic Maps as degenerate predication system (sketch)

**Claim** (sketch). An ISO/IEC 13250 Topic Map is a predicated knowledge system $\mathcal{K} = (\mathbf{2}, \mathcal{C}_{\mathrm{TM}}, E_{\mathrm{TM}}, \mathcal{S}_{\mathrm{TM}}, \Sigma_{\mathrm{TM}})$ under the value-domain restriction to $\mathbf{L} = \mathbf{2}$ (no separate negative-evidence channel) and a fixed Topic-Maps-derived closure-rule system encoding subject-identity merge, association arity, and occurrence linkage. Topic-Map merge under shared subject identifiers corresponds *exactly* to the substrate's [federate](../terms/federate.md) operation under explicit identity predications.

## Setup

A Topic Map (per ISO/IEC 13250:2003) is a structure $\mathcal{T} = (T, A, O, I, \mathrm{type}, \mathrm{role}, \mathrm{scope})$ where:

- $T$ is a set of *topics*.
- $A$ is a set of *associations*, each carrying a finite role-multiset of topics and an association *type* in $T$.
- $O$ is a set of *occurrences*, each linking a topic to a resource (typically an IRI) and carrying an occurrence *type* in $T$.
- $I: T \to \mathcal{P}(\mathrm{IRI})$ assigns each topic a set of *subject identifiers*.
- $\mathrm{type}, \mathrm{role}, \mathrm{scope}$ are the three labelling functions on associations and occurrences.

The merge of two Topic Maps $\mathcal{T}_1, \mathcal{T}_2$ is performed under the *Topic Naming Constraint* and *Subject Identifier Constraint*: two topics are identified iff they share at least one subject identifier or at least one base name in the same scope (TMDM §6).

## Encoding

Define the predicate category $\mathcal{C}_{\mathrm{TM}}$ as the free predicate category on:
- A predicate `instance-of` for the topic-typing relation.
- A predicate `subject-identifier` for the topic → IRI relation.
- A predicate `occurrence-of` (typed by occurrence-type) for the topic → resource relation.
- One predicate per association type, with arity matching the association-type's role-multiset.
- The predicate-category morphisms supplied by topic-map type-instance hierarchies.

Define $E_{\mathrm{TM}} := T \cup \{\text{occurrence resources}\}$ (topics and the resources their occurrences point to are both substrate entities).

Define $\mathcal{S}_{\mathrm{TM}}$ as the closure-rule system containing:
- **(M)** *Subject-identifier merge*: $\mathrm{subject\text{-}identifier}(t_1, i) \wedge \mathrm{subject\text{-}identifier}(t_2, i) \Rightarrow \mathrm{identity}(t_1, t_2)$
- **(N)** *Topic-name merge in scope*: $\mathrm{base\text{-}name}(t_1, n)\big|_S \wedge \mathrm{base\text{-}name}(t_2, n)\big|_S \Rightarrow \mathrm{identity}(t_1, t_2)$
- **(I)** *Identity propagation*: $\mathrm{identity}(t_1, t_2) \wedge p(t_1, x) \Rightarrow p(t_2, x)$ for every $p \in \mathcal{C}_{\mathrm{TM}}$
- **(A)** *Association arity*: each association predicate fires only on tuples of declared arity.
- **(F)** *Fact recording*: associations and occurrences asserted in the Topic Map are exactly the cells with $t$-value at the corresponding fiber.

Define $\Sigma_{\mathrm{TM}} := \{S_0\}$ a single trivial scope, plus optionally one sub-scope per Topic-Map `scope` qualifier when topic-map scope is exposed.

This is the **Topic Maps encoding** $\mathcal{E}_{\mathrm{TM}}: \mathrm{TopicMaps} \to \mathrm{PredicatedKS}$.

## Statement

**Theorem (sketch).** Let $\mathcal{T}_1, \mathcal{T}_2$ be Topic Maps and $\mathcal{T}_{12}$ their TMDM-standard merge. Let $\mathcal{K}_i := \mathcal{E}_{\mathrm{TM}}(\mathcal{T}_i)$ for $i \in \{1, 2, 12\}$. Then $\mathcal{K}_{12}$ is the substrate-level federation $\mathcal{K}_1 \,\#\, \mathcal{K}_2$ per [federate](../terms/federate.md), under the identity-mapping induced by shared subject identifiers and shared base names in scope.

That is:
$$\mathcal{E}_{\mathrm{TM}}(\mathcal{T}_1 \cup_{\mathrm{TMDM}} \mathcal{T}_2) \;=\; \mathcal{E}_{\mathrm{TM}}(\mathcal{T}_1) \,\#_{\mathrm{id}}\, \mathcal{E}_{\mathrm{TM}}(\mathcal{T}_2)$$
where $\#_{\mathrm{id}}$ is federation under the identity-mapping derived from rules **(M)** and **(N)** applied to the union of the two Topic Maps.

## Proof sketch

**Topic identification correspondence.** Rule **(M)** in $\mathcal{S}_{\mathrm{TM}}$ derives an identity-predication exactly when the TMDM Subject-Identifier Constraint identifies two topics. Rule **(N)** in $\mathcal{S}_{\mathrm{TM}}$ likewise mirrors the Topic Naming Constraint. The substrate's [identity-by-relations](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/engineering/theories/tech/theories/computing/theories/predicated-computing/concepts/identity-by-relations.md) discipline then identifies the two substrate entities — exactly as TMDM merges the two topics.

**Association/occurrence transfer.** Rule **(I)** propagates every cell carrying $t_1$ to a cell carrying $t_2$ once $\mathrm{identity}(t_1, t_2)$ is derived. This is exactly TMDM's specification that all properties (associations, occurrences, base names, subject indicators) of merged topics are merged.

**Federation correspondence.** The substrate's federation per [federate](../terms/federate.md) takes the union $E_{\mathcal{K}_1} \cup E_{\mathcal{K}_2}$ and runs the cross-scope identity-mapping. Under the encoding, this union is exactly $T_1 \sqcup T_2 \sqcup \{\text{occurrence resources}\}$, and the cross-scope identity-mapping is exactly the rule-derived identifications above.

**Closure under federated rules.** $\mathcal{S}_{\mathrm{TM}}^{(12)}$ is the union $\mathcal{S}_{\mathrm{TM}}^{(1)} \cup \mathcal{S}_{\mathrm{TM}}^{(2)}$, which equals the rules of $\mathcal{S}_{\mathrm{TM}}$ evaluated over the federated entity-set; the cells settled by the federated closure equal the cells TMDM declares as belonging to the merged Topic Map.

The four points compose into the equality of the two encodings.

## What the degeneration loses

Beyond the merge correspondence, the Topic-Map-as-substrate reading drops:

- **Bilattice value-domain.** Topic Maps are $\mathbf{2}$-valued: an association either exists or does not. Conflicting associations from different maps merge by union without a contestation marker, where the substrate would have produced $\top$. *Substrate gain over Topic Maps:* explicit contestation as substrate state.
- **Closure-regime classification.** Topic Maps' closure rules are strict by construction (no transfinite or aperiodic rules are admitted). *Substrate gain:* extends Topic-Maps-style merge discipline to communities whose inferential closure goes beyond the strict regime.
- **Community-relative scope discipline.** Topic Maps' merge is global; community-bounded views require external scoping mechanisms. The substrate's scope discipline is native. *Substrate gain:* scope as substrate primitive.

## What the degeneration preserves

The encoding *preserves*:

- **Identity-by-relations.** Topic Maps' subject-identifier merge is identity-by-relations restricted to one identity predicate.
- **Predicate-as-entity.** Topic Maps' association types are first-class topics; substrate predicates are first-class entities; the encoding aligns them directly.
- **N-ary predication.** Topic Maps' associations admit any arity; the substrate's [n-ary-predication](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/humanities/theories/math/theories/categories/theories/predication-categories/objects/n-ary-predication.md) absorbs this.
- **Aboutness.** Topic Maps' "topic for subject $s$" is the substrate's aboutness predication on $s$, per the [aboutness](aboutness.md) concept.

## Status: sketch

`status: sketch` because:

- The exact substrate encoding of Topic-Maps `scope` (the optional `scope` parameter on associations and occurrences) is admitted only in the trivial-scope reading; a richer translation would map Topic-Map scope to substrate scope, which requires a careful analysis of which substrate scope-discipline matches Topic-Maps semantics. The candidate `Σ_TM` enriched with one sub-scope per Topic-Map scope-qualifier is plausible but not verified.
- The proof sketch presumes the TMDM standard merge is exactly subject-identifier merge plus topic-naming-in-scope merge plus property-propagation. Edge cases of the standard (e.g., variant names, reified associations) require additional encoding clauses; whether they all reduce cleanly to the substrate is unverified.
- The encoding $\mathcal{E}_{\mathrm{TM}}$ is sketched as a function on Topic Maps; whether it is a *functor* on a suitable category of Topic Maps (with TMDM-merge as morphisms) is a separate structural claim worth proving.
