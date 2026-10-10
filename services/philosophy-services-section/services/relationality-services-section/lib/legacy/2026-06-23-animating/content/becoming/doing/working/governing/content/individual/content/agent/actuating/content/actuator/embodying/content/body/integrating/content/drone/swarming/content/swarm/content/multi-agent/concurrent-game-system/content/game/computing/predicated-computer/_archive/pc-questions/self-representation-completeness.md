---
type: question
status: open
explores:
  - teaching/explanations/self-representation.md
  - teaching/explanations/closure-rule.md
  - ../objects/closure-rule-system.md
  - ../objects/event-log.md
  - ../theorems/closure-rule-system-realizes-closure-2-monad.md
see-also:
  - teaching/explanations/composability-with-predication-categories.md
  - teaching/explanations/what-predicated-computing-inherits.md
  - ../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-hyperdoctrine.md
---

# At what depth is the substrate's self-representation complete, and what does each depth admit?

The substrate's [self-representation](teaching/explanations/self-representation.md) commitment names the discipline of treating substrate-internal artifacts (closure-rules, scopes, witnesses, federation bridges) as substrate cells in their own right — addressable, queryable, witnessable by the same operations the substrate offers for any other content. The commitment is *open over depth*: a substrate may commit to first-order self-representation (closure-rules are cells; rules-about-rules are not), to higher-order (rules-about-rules are also cells, and so on up to a chosen ordinal depth), or to fully-reflective (the substrate represents its own representation discipline as substrate content). Each depth admits different operations, different audit content, and different cost. The substrate has not committed to a depth, and the implementation in [pypredcomp](../../../../../../../../../../operations/engineering/tools/predication-computer/pypredcomp/) currently realises a partial first-order commitment with no principled extension path.

## Statement

> *What substrate-level structural fact fixes the depth of self-representation a predicated computer commits to, what operations does each depth admit, what cost does each depth carry, and what does the [closure-rule-system-realizes-closure-2-monad](../theorems/closure-rule-system-realizes-closure-2-monad.md) theorem actually guarantee at each depth?*

## Decomposition

### Sub-question A — Which substrate-internal artifacts are first-order substrate cells?

The candidate artifacts to admit as cells form a hierarchy by structural role:

- **Closure-rules.** The substrate's catalog of derivation schemata; admission as cells means rules can be queried, witnessed, and modified through the same operations as any other predication. The math reformulation already treats closure-rules as morphisms in the predication hyperdoctrine, so the engineering admission is structurally compatible.
- **Scope declarations.** The substrate's scope-bounded sublocales as recorded substrate content; admission as cells means scope membership is queryable and federation across scopes is auditable.
- **Witnesses.** The substrate's provenance-semiring records as cells; admission means witness chains are first-class queryable rather than opaque audit blobs.
- **Federation bridges.** The substrate's bridge configurations as cells; admission means federation topology is observable and reconfigurable through substrate operations.
- **Conformance test cases.** The substrate's [conformance-test-suite](../objects/conformance-test-suite.md) cases as cells; admission means conformance is checkable through substrate queries rather than through an external test runner.
- **The substrate's bilattice itself.** The chosen value-domain as substrate-resident metadata; admission means bilattice operations are inspectable and substrate operations are *parametric* in the bilattice rather than hard-coded.

The sub-question: does the substrate commit to admitting *all* of these, *some* (and which subset), or *none* (self-representation is purely structural, not first-order substrate content)? Each commitment has different audit, federation, and cost consequences.

### Sub-question B — At what depth does each admitted artifact terminate?

For each artifact admitted at first order, the higher-order question follows: are *rules about that artifact* also substrate cells? Three candidate disciplines:

- **First-order only.** Closure-rules are cells; closure-rules-about-closure-rules are not (they exist as engineering documentation or as math objects, but not as substrate content). The discipline is conservative; the cost is that meta-substrate operations (rule provenance, rule conflict detection, rule federation) cannot be expressed as substrate queries.
- **Bounded depth.** Higher-order rules admit up to a chosen depth $n$; rules at depth $> n$ exist outside the substrate. The depth is a substrate parameter (the [filesystem-backed-substrate example](../examples/filesystem-backed-substrate.md) implicitly commits to depth 1 — closure-rules are cells; rules about rules are configuration). The discipline scales but the choice of $n$ is unmotivated.
- **Fully reflective.** The substrate represents its own representation discipline; rules-about-rules-about-rules-… terminate via a fixpoint discipline (a substrate cell carrying *the rule that admits new closure-rules* is itself admissible by that rule). The discipline is mathematically clean but the cost is potentially unbounded under naive evaluation.

The sub-question: which depth-discipline does the substrate commit to, and how is the choice recorded in substrate-resident metadata so cross-deployment federation respects the depth?

### Sub-question C — What does the closure-2-monad theorem guarantee at each depth?

The current [closure-rule-system-realizes-closure-2-monad](../theorems/closure-rule-system-realizes-closure-2-monad.md) theorem guarantees that the substrate's closure-rule system carries the closure 2-monad's unit, multiplication, and lax-idempotence data at the *first-order* level. At higher orders the theorem is sketch — the proof carries through if the higher-order rules respect the same monad structure, but the proof has not been written. The sub-question is to rephrase the theorem as *parametric in the self-representation depth*:

- Under **first-order only**: the theorem holds unconditionally for first-order closure-rules; meta-substrate operations are outside the theorem's scope.
- Under **bounded depth $n$**: the theorem holds at each depth $\leq n$, with the higher-order monad structure obtained by lifting the first-order structure along the substrate's *closure-rule-application* operator iterated $n$ times.
- Under **fully reflective**: the theorem requires a fixpoint argument — the closure 2-monad is the substrate's own self-representation, and the theorem becomes a self-referential commitment that the substrate's closure operator preserves the substrate's closure-rule structure.

The theorem's `status` would change from `proved` to `proved-modulo-depth-choice`, and the depth choice would become a declared parameter of the substrate.

### Sub-question D — What does the cost discipline say at each depth?

The substrate's [cost-discipline](teaching/explanations/cost-discipline.md) bounds substrate operations by their closure-operator regime; at first order the bound is per-rule and well-understood. At higher orders the cost discipline must extend:

- **At first-order**: cost is per-rule-application, summed over the rule's premises, bounded by the regime classification.
- **At bounded depth $n$**: cost is per-rule-application at each depth, summed across depths, bounded by the *depth-product* of regime classifications. The bound exists but may be impractical without locality discipline.
- **At fully reflective**: cost is per-rule-application at each depth, where the depth itself is determined dynamically by fixpoint convergence. The bound exists in principle (per the regime classification at the meta-level) but is engineering-impractical without strong locality.

The sub-question is whether the substrate commits to a *uniform* cost discipline across depths or a *per-depth-tier* discipline (e.g., first-order operations are cheap, second-order operations are quadratic in first-order, fully-reflective operations are exponential).

## What is established

- The substrate's first-order self-representation of closure-rules is *operationally* working in [pypredcomp](../../../../../../../../../../operations/engineering/tools/predication-computer/pypredcomp/): closure-rules are stored as substrate cells, queryable, and modifiable through the same admission operations.
- The math reformulation in [predication-categories](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/_index.md) admits higher-order content structurally — the predication hyperdoctrine has objects-of-objects, morphisms-of-morphisms, and so on — so the upstream apparatus does not constrain the engineering's depth choice.
- The composability bridge to predication-categories (Bridge 2 of [composability-with-predication-categories](teaching/explanations/composability-with-predication-categories.md)) is proved at first order and noted as sketch at higher orders.
- The [hyperversal-meta-operators](hyperversal-meta-operators.md) open question is structurally adjacent: it asks what *meta-operators* are admissible on the substrate, which is the operational counterpart of the depth question — meta-operators are higher-order substrate operations, and admitting them as substrate cells is the higher-order self-representation commitment.

## What remains open

- Which of sub-question A's six candidate artifacts the substrate admits as first-order cells, and on what structural ground.
- Which of sub-question B's three depth-disciplines (first-order / bounded / fully-reflective) the substrate commits to, and how the choice is recorded.
- The parametric statement of the closure-2-monad theorem under the chosen discipline (sub-question C).
- The cost-discipline composition law across depths (sub-question D).
- Whether different sub-substrates within a federation may commit to different depths, and how cross-depth federation reconciles when one substrate has higher-order content the other cannot represent.
- The relationship between self-representation depth and the substrate's [conformance](teaching/explanations/conformance.md) discipline: is conformance evaluated separately at each depth, or is conformance a property only of the substrate's first-order content?

## Why it matters

Resolving this question would settle four downstream commitments the substrate depends on:

1. **The strength of [self-representation](teaching/explanations/self-representation.md) as an engineering claim.** As written, the commitment is structural; without a depth choice, the corpus cannot say whether a given deployment satisfies it or only approaches it.
2. **The faithfulness of Bridge 2 in [composability-with-predication-categories](teaching/explanations/composability-with-predication-categories.md) at higher orders.** The bridge is proved at first order; resolving the depth question would let the bridge be proved or sketched explicitly at the chosen depth.
3. **The portability of substrate content across deployments with different self-representation depths.** Without a depth-discipline, federation across heterogeneously-deep substrates risks silent loss of higher-order content.
4. **The cost predictability of substrate operations at higher orders.** Resolving sub-question D would let engineers predict cost from substrate structure even for meta-operations.

A tractable next step is to write a worked-example self-representation discipline at each of the three depths (first-order, bounded depth-2, fully-reflective), with the closure-2-monad theorem statement and the cost discipline made explicit at each depth; the partial answers in the existing references would become candidate theorems.
