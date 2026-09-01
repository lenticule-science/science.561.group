---
type: concept
class: query-discipline
depends-on: [predication-hyperdoctrine, two-internal-logics, knowledge-order, truth-order]
see-also: [query-language, query]
---

# Query logic choice

The substrate's *first-class engineering decision* about which of the [predication hyperdoctrine](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-hyperdoctrine.md)'s two internal logics a query operates in. Per [two-internal-logics](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/two-internal-logics.md), every predication hyperdoctrine carries:

- **$T_t$ (classical / truth-order)** — a classical first-order theory with two-valued [classical equality](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/classical-equality.md) and the $\{p : \psi\}_\mathbf{t}$ comprehension. Sentences are true ($\mathbf{t}$) or false ($\mathbf{f}$); excluded middle holds; classical entailment.

- **$T_k$ (paraconsistent / knowledge-order)** — a paraconsistent first-order theory with [paraconsistent equality](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/paraconsistent-equality.md) and the $\{p : \psi\}_\top$ comprehension. Sentences carry $\bot$ (uninformed), $\mathbf{t}$ (told true), $\mathbf{f}$ (told false), or $\top$ (told both); contradictions don't trivialize.

Every substrate query implicitly picks one. The substrate's discipline: **make the choice explicit at the query site.**

## When to use which

**Use $T_t$ (classical) for:**
- **Database-style queries.** "List all users where status = active." Two-valued predicates.
- **Authorization checks.** "Does this agent hold the write capability?" Boolean-clean.
- **Form validation.** "Is this email well-formed?" Two-valued.
- **Single-source-of-truth reads.** When the cell's value is stable and known.

**Use $T_k$ (paraconsistent) for:**
- **Distributed / CRDT reasoning.** "What does the federation collectively know about this cell?" $\top$-witnesses are valuable signal, not errors.
- **Multi-observer consensus.** Per [agent-community-consensus](theories/agential-orchestration-platform/theorems/agent-community-consensus.md), agent disagreement produces $\top$; the query should preserve it.
- **Partial-information queries.** "What does each peer assert about $X$?" Per-peer assertions may include $\bot$ (no opinion) and $\top$ (peer holds contradictory views internally).
- **Auditing for inconsistency.** Find cells at $\top$ — substrate-level inconsistencies that need [repair](teaching/explanations/repair.md).

## Engineering consequences

The two logics give *different* answers to the same syntactic query in cases where the underlying valuation has $\bot$ or $\top$ cells:

- **$T_t$-query** treating $\bot$ as $\mathbf{f}$ (closed-world assumption) excludes uninformed cells.
- **$T_t$-query** treating $\bot$ as failure (three-valued) returns "unknown."
- **$T_k$-query** returns the cell's bilattice value directly; the caller interprets.

Per [settlement-determinism](../theorems/settlement-determinism.md), each query is deterministic given its logic choice. Per [conformance-implies-substrate-properties](../theorems/conformance-implies-substrate-properties.md), the choice is conformance-checkable.

The substrate's [query-language](query-language.md) syntax should make the choice explicit (e.g., a flag, a separate query head, a typed query category). Implicit defaults invite confusion when query authors and consumers disagree on logic.

## Position in the substrate

Query logic choice is the substrate's *engineering operationalization of the two-internal-logics theorem*. Per [predication-hyperdoctrine](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-hyperdoctrine.md), both logics live on the same fibration; engineering picks per query.
