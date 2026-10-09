---
type: question
class: substrate-discipline
status: open
asked-at: 2026-05-03
depends-on: [inconsistency-sheaf-record, audit-content-via-inconsistency-sheaf-cohomology, witness-lifecycle-trajectory-is-regime-conditional-federation-content, federation-trust-bilattice-graded]
math-depends-on: [repair-resolution-poset]
see-also: [acknowledged-resolution-preserves-top-cell-membership, query-inconsistency-cohomology, paraconsistency-as-substrate-discipline]
---

# Is the repair-resolution state substrate-content or engine-state?

The substrate's [repair-resolution poset](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/repair-resolution-poset.md) $W$ (with kind-labelled refinement $W^{\flat}$) records, per $\top$-cell witness, a four-state forward-only lifecycle with kind-labelled transition arrows. The substrate's `inconsistency-repair` discipline currently treats the *transitions* as substrate content (each transition appends a cell `(witness-id, repair-proposed, candidate-cell-id) = t` or similar) but the *current state* as a derived field on the witness, computed by reading the maximum transition recorded so far.

The question is whether the resolution-state field should also be **substrate-content** (a queryable predication-graph fact, with its own predicate name and its own cohomological standing) rather than engine-derived state.

## Why this matters

The cohomological consequence is sharp. Per [acknowledged-resolution-preserves-top-cell-membership](../theorems/acknowledged-resolution-preserves-top-cell-membership.md), the resolution-state field's value (specifically the kind label) determines whether a $\top$-cell remains a contradiction or has been cleared. If the field is engine-derived, then:

- **Federation peers compute the field independently** from the transition cells they receive. As long as both peers receive the same transitions, both compute the same state. This works under regime-conditional trajectory shipping per [witness-lifecycle-trajectory-is-regime-conditional-federation-content](witness-lifecycle-trajectory-is-regime-conditional-federation-content.md).
- **Audit clients re-derive the state on each query.** This costs a per-query scan over the witness's transition history; for a long-lived witness, the scan can be non-trivial.
- **The state is not directly indexable.** A query like "give me all witnesses currently in `proposed`" must scan-and-derive rather than look-up.

If the field is substrate-content (a predicate `repair-resolution-state` carrying a value in the four-element state-set), then:

- **The state participates in cohomology directly.** The $\top$-cell status of an acknowledged-resolved witness becomes a substrate-content fact about the witness, queryable through the inconsistency-sheaf's cohomology rather than re-derived by audit machinery.
- **Federation merge of resolution-state itself is a $\top$-resolution event.** Two peers with conflicting resolution-state assignments (one says the witness is `resolved` via `acknowledge`; another says `proposed` because it hasn't received the acknowledgement yet) produce a $\top$-cell at the resolution-state predicate. The substrate's normal `top-cell` discipline then applies to resolution-states themselves.
- **The state is a first-class predication and indexable.** Queries are reads-free per [cost-discipline-reads-free](../theorems/cost-discipline-reads-free.md) at the cost of one more predicate's worth of substrate data.

## Sub-questions to answer

1. **Federation-cohomology coherence.** Under regime-conditional federation, is the resolution-state's federation-content status the same as the underlying $\top$-cell's? Specifically: in the transfinite-bounded regime, does the resolution-state contribute to $H^1$ in its own right, or only via its effect on the underlying $\top$-cell's $H^1$-class?
2. **Recursion danger.** If resolution-state is substrate-content with its own `top-cell` discipline, can a contradiction over a *resolution-state* itself be acknowledged-but-not-cleared, producing a meta-acknowledgement on a meta-witness? Is there a stratification rule preventing infinite ascent?
3. **Query-cost trade-off.** What is the engineering break-even point between scan-on-query (engine-derived) and store-and-index (substrate-content)? The dev spec's expected access pattern (audit dashboards reading every witness's current state on every dashboard refresh) suggests substrate-content is the more economical choice, but no benchmark exists.
4. **Acknowledgement-by-third-party.** If resolution-state is substrate-content, can a peer in a federation acknowledge another peer's contradiction without that peer's local acknowledgement? The kind-label semantics ("recognised") are interpersonally meaningful; the engineering-state alternative makes acknowledgement a local-only phenomenon.

## Constraints any answer must respect

- The lifecycle's monotonicity (forward-only in $W$) per the [repair-resolution poset](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/repair-resolution-poset.md) is non-negotiable; both the engine-derived and substrate-content readings preserve it.
- The state's interaction with the underlying $\top$-cell membership per [acknowledged-resolution-preserves-top-cell-membership](../theorems/acknowledged-resolution-preserves-top-cell-membership.md) is non-negotiable; both readings produce the same answer for any one substrate.
- The state's federation-discipline must be coherent with [federation-trust-bilattice-graded](../theorems/federation-trust-bilattice-graded.md): cross-peer disagreements on a resolution-state must be representable as $\top$-cells if substrate-content, or as transition-history conflicts if engine-derived.

## Why this is not a research-target

This is an engineering-discipline question, not a theorem-research question. The math is settled (the [repair-resolution poset](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/repair-resolution-poset.md) and [acknowledged-resolution-preserves-top-cell-membership](../theorems/acknowledged-resolution-preserves-top-cell-membership.md) cover the structural content). The open question is whether the substrate's storage and federation discipline should treat resolution-state as a first-class predicated fact or as a derived field.

The answer drives a substrate-decision: the choice affects predicate-graph schema, audit-query interface, federation-handshake content, and substrate compaction policy. It does not require a new theorem.

## Suggested resolution path

The captain decides; the choice is recorded as a substrate decision (probably `decisions/repair-resolution-state-storage.md` on the dev-side). If the captain chooses substrate-content, sub-question 2 (recursion danger) requires a stratification rule, which would itself be a small substrate-discipline spec. If the captain chooses engine-derived, the audit-query interface gains a small derive-and-cache layer documented in `query_inconsistency_cohomology`.

This question is filed in the predicated-computing `questions/` directory rather than as a methodology question on the supporting-pypredcomp-development project, because the question is about the substrate's own discipline rather than about how the support project conducts its work.
