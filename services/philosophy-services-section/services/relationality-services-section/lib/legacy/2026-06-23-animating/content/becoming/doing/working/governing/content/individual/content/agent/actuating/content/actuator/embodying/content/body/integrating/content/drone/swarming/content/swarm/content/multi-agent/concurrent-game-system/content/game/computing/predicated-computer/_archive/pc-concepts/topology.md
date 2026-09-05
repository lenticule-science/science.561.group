---
type: concept
class: discipline
depends-on: [scope, self-representation]
see-also: [provenance, replication]
---

# Topology

The discipline that *placement and coverage constraints* on substrate entities are themselves substrate predications, not external configuration. Where an entity lives — which physical or logical region of the predicated computer's deployment — and what region must be covered by replicas, audit nodes, or policy enforcement is recorded as predications on the entity itself, queryable through the substrate's operators.

The discipline distinguishes two kinds of constraint:

- **Placement constraints** declare *where* an entity is. They name regions (geographic, organizational, security-tier, hardware-class) and which the entity admits or requires. An entity carrying a placement constraint that is not satisfied by its current substrate location is incorrectly placed; the substrate flags the violation.
- **Coverage constraints** declare *what regions must be covered* by the entity's replicas or auditors. A predication carrying a coverage constraint requires that the appropriate number of substrate-instances see the predication, possibly across a declared topology of regions; failure to satisfy the coverage triggers a [repair](repair.md) or marks the predication as under-covered.

Two engineering consequences:

- **Topology constraints are queryable.** A substrate operator can answer "where is this entity?" or "what coverage does this predication have?" by [traversal](../morphisms/traversal.md), without consulting an out-of-band placement-database. The substrate is its own placement record.
- **Topology violations are detectable internally.** A re-derivation of placement-and-coverage state from the substrate's predications can be compared against the runtime's actual placement; mismatches are coherence violations. The substrate has the same audit discipline for placement that it has for content.

Topology is closely related to [scope](scope.md) but is more specific. A scope is a logical sub-region (its predicate vocabulary, its closure rules); a topology constraint adds *physical* or *deployment* concerns to the scope: which substrate instances host the scope, what regions the scope's predications must be replicated across, what security boundary the scope sits inside. Two scopes can occupy different topology positions; the same scope may be partially distributed across multiple topology regions. Topology and scope together fully characterize "where, in every sense, this content lives."

The discipline is what makes a multi-instance, multi-region predicated computer self-describing about its own deployment. A predicated computer's deployment is itself part of its substrate; rebalancing replicas, migrating data, opening new regions are substrate-level operations recorded as events, not infrastructure-level operations external to the substrate.
