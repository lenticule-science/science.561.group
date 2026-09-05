---
type: theorem
class: engineering-claim
status: proved
depends-on: [rule-dependency-analysis, closure-rule-wire-format, event-causality-via-lorentzian-settling, lorentzian-causal-settling, closure-driven-settling-monotonicity]
see-also: [rule-index-soundness, wavefront-locality-via-cohomology-vanishing]
---

# Rule independence implies spacelike-separation: independent rules are safely parallelizable

**Claim.** For any closure-rule system $R$ and any two rules $r_1, r_2 \in R$, if [rule-dependency-analysis](teaching/explanations/rule-dependency-analysis.md) classifies them as *independent* — i.e., $(r_1, r_2) \notin \mathrm{Dep}$ — then for any pair of application instances $a_1$ of $r_1$ and $a_2$ of $r_2$ during settlement, $a_1$ and $a_2$ are spacelike-separated in the substrate's [Lorentzian causal settling](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/lorentzian-causal-settling.md). Per [event-causality-via-lorentzian-settling](event-causality-via-lorentzian-settling.md), spacelike-separated events admit any relative order — the substrate can apply $a_1$ and $a_2$ in parallel without coordination.

The static analysis is *sound*: independent classifications are always safe to parallelize.

## Why this holds

Two rule applications are *causally related* iff one's effect feeds the other's input — i.e., one's conclusion-cell matches the other's premise. Per [rule-dependency-analysis](teaching/explanations/rule-dependency-analysis.md), the dependency relation $\mathrm{Dep}$ is defined exactly to capture this: $(r_1, r_2) \in \mathrm{Dep}$ iff $r_1$'s conclusion-pattern intersects $r_2$'s premise-patterns (or vice versa).

If $(r_1, r_2) \notin \mathrm{Dep}$:

- $r_1$'s conclusion-pattern does not intersect $r_2$'s premise-patterns. So no cell that $r_1$ produces can match $r_2$'s premise — $r_2$'s applications cannot be triggered by $r_1$'s conclusions.
- $r_2$'s conclusion-pattern does not intersect $r_1$'s premise-patterns. Symmetrically, $r_1$'s applications cannot be triggered by $r_2$'s conclusions.

Therefore: any application instances $a_1$ of $r_1$ and $a_2$ of $r_2$ have disjoint causal cones — neither is in the other's apex cone. Per the [Lorentzian causal-settling](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/lorentzian-causal-settling.md) framing, $a_1$ and $a_2$ are *spacelike-separated*.

Per [event-causality-via-lorentzian-settling](event-causality-via-lorentzian-settling.md), spacelike-separated events admit any relative ordering — the substrate's replay produces the same fixed-point regardless of which is sequenced first. Per [closure-driven-settling-monotonicity](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-driven-settling-monotonicity.md), parallel application of $a_1$ and $a_2$ produces the $\vee_k$-join of their effects, which is well-defined and order-independent.

Therefore: parallelizing independent rule applications is safe — the substrate's settled state is unchanged by the parallelization choice.

## Engineering consequence

- **Static parallelism analysis is sound.** A substrate that uses [rule-dependency-analysis](teaching/explanations/rule-dependency-analysis.md) to dispatch independent rule groups to parallel workers is structurally guaranteed to produce the same settled state as a serial substrate.
- **No runtime conflict detection needed.** Per the static analysis, independent groups don't conflict — the substrate can dispatch them without runtime coordination overhead. Compare strongly-dependent groups, which require serialization.
- **Parallelism scales with rule independence.** A substrate with mostly-independent rules has near-linear parallel speedup; a substrate with densely-dependent rules has limited parallelism. Per the analysis, the substrate's parallel structure is determined at admission time.
- **Adding a rule may reduce parallelism.** If a new rule's premises and conclusions intersect with multiple existing rules' patterns, the dependency analysis updates and the parallel groups may merge. The substrate's runtime adjusts dispatch accordingly.
- **Removing a rule may increase parallelism.** If retiring a rule splits a previously-connected dependency component, the parallel groups may re-partition.

## Conservativeness

The dependency analysis is *sound* but not *complete*: some pairs $(r_1, r_2) \in \mathrm{Dep}$ might in fact be safely parallelizable (e.g., when their actual variable bindings would never overlap at runtime). The substrate's discipline favors safety: classifying as dependent and serializing is conservative — correct but possibly slower than necessary.

A more aggressive analysis could:
- Track value-constraint intersections precisely (a premise-conclusion overlap with disjoint value-sets is provably independent).
- Track variable-binding constraints (a premise that binds variable $X$ to entity $e_1$ and a conclusion that binds $X$ to $e_2$ with $e_1 \neq e_2$ are provably independent).
- Track temporal ordering (a rule that fires only after certain prior rules can be classified independent of pre-quiescent rules).

These optimizations preserve soundness; per the theorem, the conservative analysis is the floor for parallelism, not the ceiling.

## What the theorem rules out

- **Parallelizing strongly-dependent rules.** If $r_1$'s conclusion structurally feeds $r_2$'s premise, parallel application risks $r_2$ missing $r_1$'s newly-produced cell. Per the dependency analysis, the substrate serializes such pairs.
- **Static parallelism without dependency analysis.** A substrate that parallelizes rules without checking dependence is risking missed firings or duplicate effects. The substrate's discipline is to compute the dependency analysis before dispatching parallel work.
- **Speculative parallel execution that commits before dependency confirmation.** A substrate that runs strongly-dependent rules in parallel and rolls back on conflict is implementing a different (more expensive) computation. Per the theorem, the analysis admits the structurally-safe parallelism without speculation.

## What the theorem requires

- The closure-rule system uses the wire format per [closure-rule-wire-format](teaching/explanations/closure-rule-wire-format.md).
- The substrate's settlement is closure-driven and $\leq_k$-monotone (per [closure-driven-settling-monotonicity](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-driven-settling-monotonicity.md)).
- The Lorentzian causal-settling framework applies (per [event-causality-via-lorentzian-settling](event-causality-via-lorentzian-settling.md)).
- Pattern intersection is decidable in the wire-format grammar (true per [closure-rule-wire-format-canonicalization](closure-rule-wire-format-canonicalization.md)).

## Position

Together with [rule-index-soundness](rule-index-soundness.md), this theorem grounds the substrate's parallel runtime architecture in the predication-categories' Lorentzian framework. The substrate's runtime is structurally:

1. Per the rule index — fast lookup of candidate rules per cell change.
2. Per the dependency analysis — identification of independent rule groups.
3. Per [event-causality-via-lorentzian-settling](event-causality-via-lorentzian-settling.md) — spacelike-separated execution at runtime, dispatched per the dependency-analysis groups.

The substrate's claim to be *both fast and parallel* is a structural property of its rules and the predication-fibration's causal structure — not a runtime optimization the engine performs.
