---
type: theorem
class: engineering-claim
status: proved
depends-on: [dispatch, dispatch-table, closure-rule-system, closure-rule, closure-operator, twist-product-fusion, predication-fiber-algebra]
see-also: [dispatch-composes-authorization, agentic-orchestration-platform]
title: Dispatch is a sub-rule-system of the substrate's closure-rule system
description: Claim.
---

# Dispatch is a sub-rule-system of the substrate's closure-rule system

**Claim.** The platform's [dispatch table](../dispatch-table/dispatch-table.md) $\mathcal{D}$ is structurally a *sub-rule-system* of the substrate's [closure-rule system](../../../objects/closure-rule-system.md) $\mathcal{S}$ — equivalently, a sub-[closure-rule-system](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule-system.md) of the math reformulation.
Dispatch decisions are [closure-rule applications](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-operator.md): the dispatch table's rules fire on work-arrival cells and produce agent-assignment cells via the substrate's closure operator.

Three consequences:

1. **Dispatch decisions are settling steps.** Each dispatch is a closure-rule application contributing an increment $u_\tau$ to the substrate's [increment sequence](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/increment-sequence.md), advancing the substrate's [predication settling](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling.md) by one step.
  The dispatch's witness is the same kind of substrate witness that any closure-rule application produces.

2. **Dispatch policy edits are rule-system edits.** Adding a new dispatch policy, removing one, or modifying an existing one is editing the closure-rule-system $\mathcal{S}$.
  The change produces a new rule-system version with a new version hash; replay against the prior version reproduces the prior dispatch behavior.
  Per [settlement-determinism](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/settlement-determinism.md), the substrate's dispatch behavior is fully determined by `(event log, rule-system version)`.

3. **Dispatch inherits the substrate's regime.** Per [regime-classification-for-substrate](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/regime-classification-for-substrate.md), the platform's substrate is in one of four regimes determined by its rule-language fragment.
  The dispatch table inherits this regime.
  A platform whose dispatch policies are quantifier-free is in the strict or Scott-continuous regime and can checkpoint dispatch state (per [scott-continuity-as-checkpointability](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/scott-continuity-as-checkpointability.md)).
  A platform whose dispatch policies admit $\forall$-blocks over infinite agent populations may enter non-Scott-continuous regimes — with the corresponding obligations on storage, replication, and audit.

## Why this holds

The dispatch table's match-policy is a closure rule with antecedent matching work-arrival predications and consequent producing agent-assignment predications.
Concretely:

$$\forall a \in \mathrm{Agents}.\; \mathrm{capability}(a) \odot \mathrm{required\_cap}(w) \geq_t \mathrm{threshold} \;\Longrightarrow\; \mathrm{assigned}(w, a^*) = \mathbf{t}$$

where $a^*$ is the agent maximizing the truth-order match value (per [dispatch-composes-authorization](../dispatch-composes-authorization/dispatch-composes-authorization.md)), $\odot$ is [twist-product fusion](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-fusion.md), and the threshold is a substrate-recorded policy parameter.

This rule satisfies the [closure-rule language](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule-language.md)'s structural constraints: - It's positive in the cell values (no negation in the antecedent — the $\odot$ composition produces a value, the comparison is against a threshold, both in $\leq_t$). - The antecedent has at most a single $\forall$-block over the agent set (which determines the dispatch's regime: finite agent set → strict regime; infinite agent set with quantifier-free predicates → Scott-continuous regime). - The consequent is a single cell-update $\geq_k \mathbf{t}$.

**Part 1: Dispatch generates a closure operator.** By [closure-rule-system](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule-system.md), the rules of $\mathcal{D}$ generate a closure operator $\mathrm{cl}^\mathcal{D}$ via the standard fixed-point construction.
This is a sub-operator of the substrate's overall $\mathrm{cl}^\mathcal{S}$ — applying $\mathrm{cl}^\mathcal{D}$ produces the dispatch effects within the substrate's wider closure.

**Part 2: Dispatch decisions are increments.** Each dispatch produces an `assigned` predication on a work-cell, contributing to the substrate's increment sequence.
The dispatch decision's witness is the closure-rule-application witness for the matching dispatch rule fire.

**Part 3: Regime inheritance.** $\mathcal{D}$ as a sub-rule-system inherits its regime from the rule-language fragment its rules use.
If $\mathcal{D}$'s rules are quantifier-free over a finite agent set, $\mathcal{D}$'s closure ordinal is finite (strict regime).
If $\mathcal{D}$'s rules use $\forall$-blocks over an infinite agent population, $\mathcal{D}$ may produce non-Scott-continuous firings (transfinite-bounded or aperiodic regime), and the dispatch decisions at those firings carry irreducible $H^1$ content per [scott-continuity-as-checkpointability](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/scott-continuity-as-checkpointability.md).

## Engineering consequence

The platform's dispatch is *not* a separate coordination mechanism layered on top of the substrate.
It is a sub-region of the substrate's program.
Several engineering consequences:

- **Dispatch is replayable.** Per [settlement-determinism](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/settlement-determinism.md), running the same event log under the same rule-system version (including dispatch rules) produces the same dispatch decisions.
  An auditor can replay any past dispatch and verify it.
- **Dispatch is observable without instrumentation.** Per [cost-discipline-reads-free](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/cost-discipline-reads-free.md), querying "what would the dispatch produce on this work?" is a free read.
  The platform's dispatcher does not need a separate query interface — the same closure-rule-application traversal that fires dispatch can be queried in dry-run mode.
- **Dispatch is federation-portable.** Per [federation-convergence](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/federation-convergence.md), two substrates sharing the same dispatch rule-system version produce the same dispatch decisions on the same work.
  Cross-substrate dispatch handoff is byte-identical: a federated work-cell admitted by a peer is dispatched by the peer's substrate-equivalent rules.
- **Dispatch evolution is auditable.** Each dispatch-policy change is a substrate edit producing a rule-system version transition.
  The audit can ask "when did this policy take effect?" and "what dispatches occurred under the prior policy?" by traversing the rule-system's `predecessor` chain.

## What the theorem rules out

- A dispatcher implemented as runtime code outside the substrate is not substrate content; per [self-representation](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md), this is a [driver-substrate-split](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/driver-substrate-split.md) violation.
  Such a dispatcher's decisions are not in the rule-system's audit chain, not federation-portable, not regime-classified.
- A dispatcher that uses a non-$\mathcal{C}$-natural rule (e.g., a rule that depends on the predicate-id symbol rather than on the predicate's structural position) is not generating a valid closure operator (axiom 4 of [closure-operator](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-operator.md)).
  Two substrates with the same dispatcher description may produce different dispatches if the rule is non-natural.
- A dispatcher that violates [settlement-determinism](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/settlement-determinism.md) — a "stochastic dispatch" branching on host time, network state, or random number generator — has stepped outside the closure-rule-system framework.
  The substrate's audit and federation guarantees fail for such dispatches.

## What the theorem requires

- The dispatch table $\mathcal{D}$ is a [closure-rule-system](../../../objects/closure-rule-system.md) sub-region of the platform's overall $\mathcal{S}$.
- The dispatch rules' antecedents are positive-$\Pi_1$ over the inherited signature on $(\mathbf{L}, \mathcal{C}, E, \lambda)$ per the closure-rule language.
- The dispatch operator $\odot$ is the substrate's [twist-product fusion](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-fusion.md) on the [predication fiber algebra](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md).
- The dispatch's regime matches the substrate's overall regime (or is a sub-regime); cross-regime dispatch in non-Scott-continuous substrates requires trajectory-aware federation.
