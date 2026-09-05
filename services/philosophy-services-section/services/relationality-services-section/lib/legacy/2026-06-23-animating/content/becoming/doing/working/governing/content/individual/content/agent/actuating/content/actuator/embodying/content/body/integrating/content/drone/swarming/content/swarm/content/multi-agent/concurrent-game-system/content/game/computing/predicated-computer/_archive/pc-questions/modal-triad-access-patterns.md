---
type: question
status: resolved
resolved-by: [access-patterns-as-temporal-2-category-limit-colimit-triad]
explores: [snapshot, tick, validate-against-shape]
---

# Do the substrate's three access patterns (global colimit, per-step dynamics, constraint-as-limit) need a unified concept?

> **Resolution.** This question is resolved by [access-patterns-as-temporal-2-category-limit-colimit-triad](../theorems/access-patterns-as-temporal-2-category-limit-colimit-triad.md). The three access patterns are three well-defined projections of the [temporal 2-category](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/temporal-2-category.md)-indexed [predication settling](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling.md) in the $\leq_k$-complete [predication fiber algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md): Directed Shape = colimit projection ($\bigvee_k v_\tau$), Dynamics = atom read ($v_\tau(p)$ at one $T$-0-cell), Cosections = limit projection ($\bigwedge_k v_\tau$ — the constraint-satisfying admissible values). The triad is the substrate's conformant-query schema (well-defined by fiber-algebra completeness, committed-to by the witness contracts on snapshot / atom-read / validate-against-shape); compound queries like a snapshot-delta are colimit differences inside the schema, not a fourth pattern. The patterns are dual to the [three substrate acts](../theorems/three-acts-as-temporal-2-category-decomposition.md) on the temporal axis (acts produce diagrams, accesses consume them) and compose with the [bigraded modal structure](../theorems/substrate-operations-are-bigraded-modal.md): atom = bare value, Directed Shape = $\Box \sigma$, Cosections = $\Box \Delta$. Per-pattern cost classes (atom O(1), colimit O(region) with regime-classified materialization, limit polynomial-to-PSPACE per [governance-decision-modal-decidability](../theorems/governance-decision-modal-decidability.md)) and per-pattern cache discipline are direct consequences. A "delta" pattern between two snapshots is not a fourth pattern — it is a colimit difference — so the triad is closed under the access combinations the older specs anticipated.

The older specs frame the substrate as supporting three structurally distinct *access patterns* — three ways an external observer or an internal operator can engage with substrate content:

- **Directed Shape** (the colimit over the history category $T$). The "what has happened overall" view: substrate content collapsed to a single directed picture, with all histories merged into one shape. Operationally: a [snapshot](../objects/snapshot.md) of a region at a moment; an audit-trail summarizing a session.
- **Dynamics** (single atom $s$ at the middle position). The "one step at a time" view: a single substrate operation, one [closure-rule application](../morphisms/closure-rule-application.md), one [tick-advance](theories/agential-orchestration-platform/morphisms/tick-advance.md). The substrate's normal mode of operation.
- **Cosections** (the limit over $T$). The "all possible futures simultaneously" view: substrate content as a constraint-satisfaction problem, asking which global sections exist that are compatible with all observed local sections. Operationally: [validate-against-shape](../morphisms/validate-against-shape.md) at scale; substrate-coherence checks; soundness queries.

The three patterns are distinct: the global view aggregates; the dynamics view advances; the constraint view checks. They correspond, in math-program terms, to colimit, single-atom-section, limit — three categorical access modes.

The corpus currently covers each access pattern through individual operators:

- Directed Shape = snapshot, audit-export
- Dynamics = tick-advance, skill-invocation
- Cosections = validate-against-shape, governance-decision (constraint check)

But the corpus does *not* unify them as a triad: there is no concept declaring "these are the three structurally-distinct access patterns" or characterizing how an operator chooses among them. The question is whether engineering content is being lost.

Particular candidates for unified capture:

- **Pattern declaration on operations.** Each substrate operation declares its access pattern. Operations that mix patterns (e.g., a query that summarizes globally and then advances per-step) would surface the mixing explicitly.
- **Cost class per pattern.** Different patterns have different cost characteristics: snapshots are read-and-aggregate (typically cheap on indexed storage); dynamics is bounded-radius read+write (per locality discipline); cosections is global-constraint-check (potentially expensive).
- **Audit lens per pattern.** An auditor consulting the substrate may want different patterns for different questions: "what happened?" (Directed Shape), "what is happening right now?" (Dynamics), "what would be admissible if I proposed this?" (Cosections).

The set-aside framing: the three-pattern decomposition is math-program structure; spatiotemporal-knowledge has not articulated whether these three are exhaustive or whether other access patterns exist (e.g., a "delta" pattern between two snapshots). Until the math is firmer, the corpus carries the patterns implicitly via individual operators and leaves the triad open.

Source: `agential-relations-system.md`.
