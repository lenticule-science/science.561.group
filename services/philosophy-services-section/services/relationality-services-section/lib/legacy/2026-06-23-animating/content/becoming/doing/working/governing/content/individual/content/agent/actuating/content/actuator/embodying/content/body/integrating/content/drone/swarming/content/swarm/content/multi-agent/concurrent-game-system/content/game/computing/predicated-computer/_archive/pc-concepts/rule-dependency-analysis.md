---
type: concept
class: runtime-discipline
depends-on: [closure-rule, closure-rule-wire-format, event-causality-via-lorentzian-settling, lorentzian-causal-settling, wavefront]
see-also: [rule-index, rule-dependency-soundness, settle]
---

# Rule dependency analysis

The substrate's *static analysis of which closure-rule applications can run in parallel* — the runtime data that lets the substrate's settlement schedule independent rule applications concurrently. In the substrate's hyperdoctrine setting, rule-dependency analysis is *the compile-time form of the [Lorentzian causal-settling](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/lorentzian-causal-settling.md) spacelike-separation property* applied to rule shapes rather than to event instances. Per [rule-dependency-soundness](../theorems/rule-dependency-soundness.md), if two rules' static dependency analysis classifies them as *independent*, then any pair of their application instances is structurally guaranteed to be spacelike-separated (per [event-causality-via-lorentzian-settling](../theorems/event-causality-via-lorentzian-settling.md)) — the substrate can run them in parallel without coordination.

## Why this concept exists

Per [event-causality-via-lorentzian-settling](../theorems/event-causality-via-lorentzian-settling.md), the substrate admits parallel replay of spacelike-separated events. But during settlement, the events haven't been recorded yet — the substrate needs to *predict* spacelike-separation from the rules being applied. Without static dependency analysis, the substrate must serialize all rule applications (slow) or use runtime conflict detection (complex). With static analysis, the substrate can dispatch independent rule applications to parallel workers at no runtime cost.

PredComp has the runtime causal framework but no concept for the *compile-time* derivation of rule independence. This concept fills the gap.

## Hyperdoctrinal grounding

Per [event-causality-via-lorentzian-settling](../theorems/event-causality-via-lorentzian-settling.md), two events are *spacelike-separated* when neither is in the other's apex cone — i.e., when their effects don't intersect. For rule applications:

- Rule $r_1$'s application produces a conclusion cell at some pattern (subject, predicate, object).
- Rule $r_2$'s application reads cells matching its premise patterns.

Two rule applications are *spacelike-separated* if $r_1$'s conclusion-cell shape doesn't structurally intersect $r_2$'s premise-cell shapes (and vice versa) — i.e., $r_2$'s premises can never match a cell $r_1$ produces, and $r_1$'s premises can never match a cell $r_2$ produces.

This is computable from the rules' wire formats alone — no runtime data needed.

## The dependency relation

For a closure-rule system $R$, the *dependency relation* $\mathrm{Dep} \subseteq R \times R$ is defined:

$(r_1, r_2) \in \mathrm{Dep}$ iff:
- $r_1$'s conclusion pattern *intersects* $r_2$'s premise patterns, OR
- $r_2$'s conclusion pattern intersects $r_1$'s premise patterns.

Two patterns *intersect* when they could match the same cell shape — e.g., $r_1$'s conclusion has predicate `parent_of_h`, and $r_2$'s premise has predicate `parent_of_h` (with possibly different variable bindings).

Per [rule-dependency-soundness](../theorems/rule-dependency-soundness.md), if $(r_1, r_2) \notin \mathrm{Dep}$, then any pair of their application instances is spacelike-separated — they can be applied in parallel without coordination.

The dependency relation is symmetric (intersection is symmetric) and reflexive (every rule depends on itself, in the trivial "applying $r$ produces a cell that $r$ might re-trigger on" sense, modulo monotonicity bounding re-firing). For partition-into-parallel-groups purposes, the substrate computes the *transitive closure* of $\mathrm{Dep}$ and partitions rules into connected components — each component is a serial group; different components run in parallel.

## Three categories of dependence

The dependency analysis classifies pairs into three categories:

- **Strong dependence.** $r_1$'s conclusion is in $r_2$'s premise's exact pattern shape (same predicate, overlapping value-set). Per [rule-dependency-soundness](../theorems/rule-dependency-soundness.md), serializing strongly-dependent rules is *required* — running in parallel would risk missing rule firings.
- **Weak dependence.** Patterns overlap structurally (same predicate, possibly different value-sets) but the value-set intersection is empty. Per the value-set partition, the rules can't actually trigger each other — but the substrate may serialize anyway as a safety margin (depending on its parallelism aggressiveness).
- **Independence.** Patterns don't structurally intersect. Per the theorem, the rules can be parallelized without coordination.

A substrate with mostly-independent rules has high parallelism; a substrate with densely-dependent rules has low parallelism. Per [cost-composition-via-lawvere-quantale](../theorems/cost-composition-via-lawvere-quantale.md), the substrate's parallel cost composition uses the quantale's join (typically $\max$ for parallel-completion cost) on independent groups.

## Dependency analysis as substrate content

Per [self-representation](teaching/explanations/self-representation.md), the dependency analysis is substrate content — the substrate stores the dependency relation as predications on the closure-rule entities. Per [snapshot-replay-fidelity](../theorems/snapshot-replay-fidelity.md), the analysis can be reconstructed from the closure-rule-system on demand.

When a new rule is admitted, the dependency analysis updates:
1. Compute the new rule's premise and conclusion patterns.
2. For each existing rule, check pattern intersections.
3. Add new $\mathrm{Dep}$ entries; recompute the transitive closure if needed.
4. Re-partition rules into parallel groups.

When a rule is retired:
1. Remove its dependency entries.
2. Recompute the transitive closure.
3. Possibly merge or split parallel groups.

## What the analysis enables at the runtime

- **Parallel wavefront workers.** Independent rules in different parallel groups dispatch to different worker threads. Per the dependency analysis, no coordination is needed within a wavefront layer.
- **Group-level fuel accounting.** Per [cost-composition-via-lawvere-quantale](../theorems/cost-composition-via-lawvere-quantale.md), parallel groups' fuel composes via the quantale's join — the substrate's fuel-bound discipline applies per-group, not globally.
- **Streaming admission.** A new admission's effects can be analyzed against the dependency relation to predict which rule groups will activate; the substrate can pre-warm those workers.

## What the analysis rules out

- **Parallelizing strongly-dependent rules.** Per [rule-dependency-soundness](../theorems/rule-dependency-soundness.md), running strongly-dependent rules in parallel risks missing rule firings — the parallel applications might not see each other's conclusions in time.
- **Static independence claims for runtime-data-dependent rules.** A rule whose premises depend on runtime values not captured in the wire format isn't admissible per [closure-rule-wire-format-canonicalization](../theorems/closure-rule-wire-format-canonicalization.md). The dependency analysis only handles wire-format-expressible rules.
- **Speculative parallel execution that commits before dependency confirmation.** A substrate that runs strongly-dependent rules in parallel and rolls back on conflict is implementing a different (more expensive) computation. Per the analysis, the substrate's discipline is to serialize strongly-dependent groups.

## Position

Together with [rule-index](rule-index.md), this concept defines the substrate's runtime architecture: the rule index says *which rules to try* against a given cell; the dependency analysis says *which rule applications can run in parallel*. Per [wavefront-locality-via-cohomology-vanishing](../theorems/wavefront-locality-via-cohomology-vanishing.md), the substrate's per-cell cost is bounded; per the dependency analysis, the substrate's parallelism is structurally maximized.

Per [rule-dependency-soundness](../theorems/rule-dependency-soundness.md), the analysis is sound — independent classifications are always safe; per the explicit statement, the analysis is conservative — some rules classified as dependent might in fact be safely parallelizable, but the substrate's discipline favors safety.
