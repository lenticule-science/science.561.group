---
type: morphism
class: substrate-operation
status: sketch
depends-on: [predicated-knowledge-system, predication-fiber-algebra, knowledge-order]
see-also: [classify, federate, evidence-accumulation, assertion-monotonicity]
title: Assert
description: The substrate operation by which a community adds a predication to its predicated knowledge system.
---

# Assert

The substrate operation by which a community adds a predication to its [predicated knowledge system](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/objects/predicated-knowledge-system.md). Asserting the predication-cell $(s, p, o)$ with positive evidence value $\alpha \in \mathbf{L}$ from source $\sigma$ in scope $S$ produces a fiber-algebra update:

$$v_S \;\mapsto\; v_S \;\vee_k\; (\alpha, \mathbf{0})_{(s, p, o)}$$

— the knowledge-order join of the existing settling $v_S$ with a delta that places positive-evidence value $\alpha$ at cell $(s, p, o)$ and leaves all other cells unchanged. The dual operation, **deny**, places the delta at the negative-evidence coordinate, $(\mathbf{0}, \alpha)_{(s, p, o)}$.

## Operational signature

The substrate exposes assert with the signature:

$$\mathrm{assert}: E \times \mathcal{C} \times E \times \mathbf{L} \times \mathrm{Source} \times \Sigma \to (K^S \to K^S)$$

reading: given a subject, predicate, object, value, source, and scope, assert produces an *update on the scope's fiber algebra*. The substrate's [event log](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/engineering/theories/tech/theories/computing/theories/predicated-computing/objects/event-log.md) records every invocation as an `asserted-event` cell carrying the six arguments plus the substrate timestamp.

## Substrate-level structural facts

**Monotonicity.** Per [assertion-monotonicity](../concepts/assertion-monotonicity.md), assert is monotone in $\leq_k$ — assertion can only add information; it never retracts existing evidence. Two assertions of the same cell from different sources combine via $\vee_k$, accumulating evidence on the positive channel; an assertion of $(s, p, o)$ followed by a denial of the same cell takes the substrate from $t$ through to $\top$, recording the contestation rather than overwriting either claim.

**Idempotence.** The same source asserting the same cell with the same value multiple times is a no-op past the first invocation. The bilattice join is idempotent ($x \vee_k x = x$); the substrate's event log still records each invocation, but the settled state is unchanged.

**Source-attribution.** The substrate's [witness](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/engineering/theories/tech/theories/computing/theories/predicated-computing/concepts/witness.md) discipline records the asserter, the time, the cell, the value, and the scope. The assertion is not free-standing — it is itself a predication on the substrate (the witness entity participates in `asserted-cell`, `asserted-by`, `asserted-at-time` predications). Querying the substrate for "who asserted $c$?" reads the witness chain; querying for "what is the current value of $c$?" reads the settled state.

**Closure-decoupling.** Asserting a cell adds it to the substrate's increment sequence; the resulting closure under $\mathcal{S}$ is computed by the substrate's [closure-driven settling](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling.md) machinery as a *separate* operation. This decoupling lets the substrate (a) batch assertions before re-running closure, (b) replay a settling deterministically from the increment sequence and rule system per [closure-as-fitting-fixpoint](../concepts/closure-as-fitting-fixpoint.md), and (c) federate scopes per [federation-as-bilattice-colimit](../concepts/federation-as-bilattice-colimit.md) at the assertion level without re-computing closure on each side first.

**Commutativity.** Assertions commute: $\mathrm{assert}(c_1, \alpha_1) \circ \mathrm{assert}(c_2, \alpha_2) = \mathrm{assert}(c_2, \alpha_2) \circ \mathrm{assert}(c_1, \alpha_1)$ for any cells $c_1, c_2$ (by commutativity of bilattice join). The substrate's *settled state* depends only on the *set* of asserted-events, not their order. The substrate's *event log* preserves order for replayability and auditing.

**Source-pluralism.** Multiple sources asserting the same cell each contribute via $\vee_k$ on the positive channel; this is the [evidence-accumulation](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/archive/teaching/explanations/evidence-accumulation.md) discipline. The substrate carries each source's contribution as a separate witness; the cell's settled value is the join.

## Derived operations

Several substrate-level operations decompose into assert:

- **Classify** (per [classify](classify.md)) is assertion of the diagnostic predications that constitute membership in a stratum.
- **Specialise** (per [specialize](specialize.md)) is assertion of a predicate-category morphism (a meta-predication on the predicate category itself).
- **Federate** (per [federate](federate.md)) is assertion of cross-scope identity-predications plus the scope-union operation.

In this sense assert is the *fundamental write-side primitive* of the substrate; every other substrate write reduces to a (possibly meta-) assertion plus closure.

## Comparison to upstream

The substrate's assert is the bilattice generalisation of:

- **RDF triple-store insert.** RDF's `INSERT { ?s ?p ?o }` is assert restricted to $\mathbf{L} = \mathbf{2}$, single-source, no scope.
- **OWL axiom assertion.** OWL ontology axiom assertion is assert restricted to $\mathbf{2}$-valued, with the closure-rule system fixed by the OWL profile (DL, EL, RL, QL).
- **Datalog fact assertion.** Datalog `EDB +:= fact` is assert restricted to $\mathbf{2}$-valued with monotone Datalog closure.
- **Topic-Maps topic creation.** Per [topic-maps-as-degenerate-predication-system](../concepts/topic-maps-as-degenerate-predication-system.md), Topic-Map topic-and-association creation is assert restricted to $\mathbf{2}$-valued single-scope with subject-identifier closure.
- **Cyc microtheory `assert`.** Cyc's `assert` is closer in spirit (sourced, microtheory-scoped) but not bilattice-valued; the substrate's assert generalises it to $\mathbf{L}^\bowtie$.

In each upstream case, the substrate's assert is the operation under richer value-domains and explicit scope-and-source structure. Implementations targeting the substrate (e.g., [predicated-computing](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/engineering/theories/tech/theories/computing/theories/predicated-computing/_index.md)) inherit the upstream operational experience while adding the bilattice-and-scope discipline.
