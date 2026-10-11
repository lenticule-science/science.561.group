---
type: morphism
class: operator
realizes: [closure-rule]
depends-on: [closure-rule, predication-graph-store, traversal, insertion, closure-operator, predication-fiber-algebra]
see-also: [settle, wavefront]
---

# Closure-rule application

The operator that, given a [closure rule](teaching/explanations/closure-rule.md) and an entity at which the rule's premise might match, attempts the match, computes the conclusion if it succeeds, and inserts the conclusion into the [predication-graph store](../objects/predication-graph-store.md). Closure-rule application is the substrate-level instance of one rule firing inside the math [closure operator](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-operator.md) $\mathrm{cl}^{\mathcal{S}}$ — the unit at which the closure operator's $\mathcal{S}$-axioms are actually realized.

Formally:

$$
\mathrm{apply}(\mathrm{rule},\, e,\, G) \;=\; \begin{cases} \mathrm{insert}(G,\, \mathrm{conclusion}(\mathrm{rule}, e),\, v_{\mathrm{rule}}) & \text{if } \mathrm{match}(\mathrm{rule}, e, G) \\ G & \text{otherwise} \end{cases}
$$

The match step is a bounded-radius [traversal](traversal.md) reading the rule's premise pattern; the conclusion step constructs the conclusion cell in the [predication fiber algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) at the consequent's predicate; the insert step is the substrate's primitive [insertion](insertion.md).

Three engineering invariants:

- **Locality.** Per [closure-rule](teaching/explanations/closure-rule.md), the match step's read radius is finite and declared in the closure rule. A rule that requires unbounded traversal to match its premise is not admissible — it violates the locality contract that [wavefront-termination](../theorems/wavefront-termination.md) relies on.
- **Determinism in match.** Given the same predication-graph state and the same closure rule, the match either succeeds (with the same matched cells in the same order) or fails. Match is independent of host, scheduler, hash-table iteration order, and wall-clock time. This is what makes the substrate's closure-driven advance replayable per [settlement-determinism](../theorems/settlement-determinism.md).
- **Witness on success.** A successful application emits a [witness](../objects/witness.md) entry: the canonical hash of $G$, the rule identifier, the matched cells (by canonical hash), the conclusion cell, the resulting canonical hash. The entry is appended to the [event log](../objects/event-log.md). Matches that do not produce a state change emit no witness — they are pure observations.

The result of closure-rule application is monotone in $\leq_k$: per [closure-driven settling-monotonicity](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-driven-settling-monotonicity.md), the cell value either rises or stays the same. The conclusion's value is determined by the rule's $\geq_k V$ consequent threshold (per [closure-rule-language](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule-language.md)).

Closure-rule application is the *unit* of computation in the predicated-computing corpus. Composed operators ([settle](settle.md), [merge](merge.md), the platform's coherence repair) decompose into sequences of closure-rule applications and their interleaved bookkeeping; the bookkeeping (worklist, fuel, witness) is what makes the sequence terminate, replay, and audit.

Earlier predicated-computing literature called this "running the closure operator forward by one step at one entity" or named the same operation `respond(entity, message)`. The modern formulation factors out: the message is the rule's match-and-conclude pair; `respond` is the per-entity invocation; settle is the wavefront that schedules `respond` calls across the predication graph; the math reformulation in [closure-operator](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-operator.md) makes the structural axioms (monotonicity, inflationarity, idempotence, $\mathcal{C}$-naturality) explicit.
