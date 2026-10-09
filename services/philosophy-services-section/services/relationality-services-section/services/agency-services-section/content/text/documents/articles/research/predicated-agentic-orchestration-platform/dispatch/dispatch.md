---
type: concept
class: pattern
depends-on:
  - agent
  - skill
  - dispatch-table
  - closure-rule-system
  - twist-product-fusion
  - predication-fiber-algebra
  - bilattice
see-also:
  - tick
  - inbox
  - dispatch-as-closure-rule-system
  - dispatch-composes-authorization
  - dispatch-table-parallel-firing-via-husainov-acyclicity
  - governance-as-modal-restriction
title: Dispatch
description: The platform's pattern for matching incoming work — typically a message arriving at an inbox — to the agent and skill that should handle it.
---

# Dispatch

The platform's pattern for matching incoming work — typically a message arriving at an [inbox](inbox.md) — to the [agent](agent.md) and [skill](skill.md) that should handle it.
Dispatch reads the message's predications, the candidate agents' capability predications, and the candidate skills' precondition predications, and selects the agent-skill pair whose match-strength is highest.

Per [dispatch-as-closure-rule-system](dispatch-as-closure-rule-system/dispatch-as-closure-rule-system.md) (proved), the [dispatch table](dispatch-table/dispatch-table.md) $\mathcal{D}$ is structurally a *sub-rule-system* of the substrate's [closure-rule system](../../../objects/closure-rule-system.md) $\mathcal{S}$.
Dispatch decisions are [closure-rule applications](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-operator.md): the dispatch table's rules fire on work-arrival cells and produce agent-assignment cells via the substrate's closure operator.
The dispatch rule itself is

$$\forall a \in \mathrm{Agents}.\; \mathrm{capability}(a) \odot \mathrm{required\_cap}(w) \geq_t \mathrm{threshold} \;\Longrightarrow\; \mathrm{assigned}(w, a^*) = \mathbf{t}$$

— a positive-$\Pi_1$ closure rule on $(\mathbf{L}, \mathcal{C}, E, \lambda)$ where $\odot$ is [twist-product fusion](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-fusion.md), the $\geq_t$ comparison is in the truth-order of the [predication fiber algebra](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md), and $a^*$ is the agent maximizing the match.

## Operations as closure-rule fragments

Dispatch's three structural properties each correspond to a constraint on the closure-rule:

- **Local ↔ at most a single $\forall$-block over the candidate set.** Dispatch reads only the message and the candidate agents' predications, not the global predication graph.
  The candidate set is bounded by the message's required-capability predications — only agents carrying matching capability predications are considered.
  Per the theorem, this single $\forall$-block over the agent set is the dispatch rule's only quantifier; that determines the rule's regime (finite candidate set → strict regime; infinite candidate population with quantifier-free predicates → Scott-continuous regime).
- **Match-strength is a value, not a Boolean ↔ $\odot$ on the bilattice.** An agent may be a partial match — possessing some but not all of the required capabilities.
  The dispatch operator returns the [bilattice](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bilattice.md)-valued match-strength produced by $\mathrm{capability}(a) \odot \mathrm{required\_cap}(w)$, not a yes/no decision.
  Partial matches can be composed across agents when no single agent fully satisfies the work.
  The choice of value-domain (multi-valued, weighted, full bilattice for paraconsistent reasoning) is the choice of $\mathbf{L}$ in $(\mathbf{L}, \mathcal{C}, E, \lambda)$.
- **Witness-recorded ↔ closure-rule-application witness.** Every dispatch produces a [witness](../../teaching/explanations/witness.md): the message identity, the candidate set, the chosen agent-skill pair (or partial composition), the match-strength.
  The witness is the same kind of substrate witness that any closure-rule application produces, appended to the [event log](../../../objects/event-log.md), so dispatch decisions are replayable and auditable per [settlement-determinism](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/settlement-determinism.md).

Two structural moves on incoming work compose into the matching machinery: an agent may *extend* the work (advancing it toward completion by adding output predications) or *restrict* the work (constraining it by filtering out predications the agent's scope does not admit).
Particular platform realizations may decompose dispatch into these primitives explicitly; the corpus's claim is that *both* directions are admissible and both are sub-rules of the same closure-rule system.

## Dispatch is composition, not restriction

A subtle but load-bearing distinction in dispatch ranking: when comparing how strongly an agent matches a message, the substrate must use the *composition* of capability and requirement predications — the [twist-product fusion](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-fusion.md) of their values — rather than a *restriction* (the [twist-product right residual](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-right-residual.md)) that keeps only what the agent already concluded.
The two are different at the value-domain level: compositions surface mismatch as an explicit value (one side has the capability, the other does not — the result records the gap), while restrictions normalize mismatches toward "consistent with no opinion," washing out the information dispatch needs.

Dispatch ranking that uses restriction loses the engineering signal.
Dispatch ranking that uses composition preserves it: agreement on a required capability, disagreement (one side asserts the capability, the other denies it), absence (the requirement is asserted but the agent is silent — $\bot$), and contradiction each produce distinct values that the dispatch operator can rank.
The four-bilattice's structure is exactly the value-domain dispatch needs; per [dispatch-composes-authorization](dispatch-composes-authorization/dispatch-composes-authorization.md), $\mathbf{f}$ is absorbing for $\odot$, so any required-capability the agent denies suffices to refuse the match.

## Composition with authorization and governance

Per [dispatch-composes-authorization](dispatch-composes-authorization/dispatch-composes-authorization.md), the same $\odot$ that fuses capability with requirement also fuses in the agent's authorization.
Per [governance-as-modal-restriction](../governance/governance-as-modal-restriction/governance-as-modal-restriction.md) (status: sketch), the authorization presented to dispatch is read as the modally-restricted $(\Box_R u_a)_w$ rather than the agent's raw $u_a$ — the capability that survives the [governance](governance.md) graph's accessibility constraints at the dispatch world $w$.
The full match is therefore

$$\mathrm{match}(w, a) \;=\; \mathrm{required}(w) \,\odot\, (\Box_R u_a)_w$$

— a single $\odot$ application that simultaneously enforces capability-match and governance-restriction.
Dispatch does not separately "check authorization after matching"; the authorization is *part of* the value being fused.

## Parallel dispatch via Husainov acyclicity

Per [dispatch-table-parallel-firing-via-husainov-acyclicity](dispatch-table/dispatch-table-parallel-firing-via-husainov-acyclicity/dispatch-table-parallel-firing-via-husainov-acyclicity.md) (status: sketch), the dispatch table's rules are conjectured to fire safely in parallel on independent work-cells when the rule-application dependency graph is Husainov-acyclic — an acyclicity condition on the closure operator's natural-transformation structure.
The substrate-side observable is that a tick can dispatch many work-arrivals simultaneously without serializing through a global dispatch lock; the math precondition is that the dispatched cells lie in disjoint scope-fibers in the closure-operator's dependency structure.

## Engineering invariants

- **Replayable.** Per [settlement-determinism](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/settlement-determinism.md), running the same event log under the same rule-system version (including dispatch rules) produces the same dispatch decisions.
  An auditor can replay any past dispatch and verify it.
- **Observable without instrumentation.** Per [cost-discipline-reads-free](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/cost-discipline-reads-free.md), querying "what would the dispatch produce on this work?" is a free read.
  The platform's dispatcher does not need a separate query interface — the same closure-rule-application traversal that fires dispatch can be queried in dry-run mode.
- **Federation-portable.** Per [federation-convergence](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/federation-convergence.md), two substrates sharing the same dispatch rule-system version produce the same dispatch decisions on the same work.
  Cross-substrate dispatch handoff is byte-identical.
- **Regime-classified.** Per the theorem's third consequence, the dispatch table inherits its regime from the substrate's overall regime (or is a sub-regime).
  Quantifier-free dispatch over a finite agent set is in the strict regime and can checkpoint dispatch state per [scott-continuity-as-checkpointability](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/scott-continuity-as-checkpointability.md). $\forall$-block dispatch over an infinite agent population may enter non-Scott-continuous regimes, with the corresponding obligations on storage, replication, and audit.
- **Auditable evolution.** Each dispatch-policy change is a substrate edit producing a rule-system version transition.
  The audit can ask "when did this policy take effect?" and "what dispatches occurred under the prior policy?" by traversing the rule-system's `predecessor` chain.

## Dispatch by predicates, not by categories

A consensus across well-engineered dispatch in adjacent systems: dispatch should compute from the *predicates* an entity carries, not from declared *categories* or matched *keywords*.
An agent's capability is the set of predications it carries about what work-types it can handle; matching a message to an agent is composing the message's required-capability predications with the agent's offered-capability predications.
There is no "agent type" classification interposed between the two: the agent *is* what its predications say, and the match *is* what their composition produces.

This is the [identity-by-relations](../../teaching/explanations/identity-by-relations.md) discipline applied to dispatch.
Structurally it is what makes the closure-rule formulation work: the rule's antecedent inspects predication values directly, with no symbolic classification step that would break $\mathcal{C}$-naturality.
It is also what makes dispatch behavior tunable through substrate edits rather than through compiler changes: adding a new capability predication to an agent makes it eligible for new work-types on the next dispatch cycle.

## Relevance through dependency structure

When multiple agents are eligible matches, the substrate may rank them by *dependency-derived relevance*: an agent connected to many entities via the substrate's dependency edges (the predicates carrying causal or compositional dependency, e.g., `depends-on`, `serves`, `contains`) has higher relevance than an agent connected to few.
The computation is a graph-structure measurement on the substrate; it is local to the candidate set's neighborhood, not a global graph computation, and so does not break the dispatch rule's at-most-single-$\forall$-block discipline.

The pattern is the substrate-level analog of PageRank over a dependency graph: an agent's relevance for a message is amplified by the dependency-weight of the entities it is connected to.
Particular platform realizations may use this signal as one input to dispatch ranking; the structural claim is that the signal is computable from the substrate without external heuristics, and that its incorporation preserves the closure-rule formulation.

## What the discipline refuses

- **Off-substrate dispatchers.** Per the theorem's first rule-out, a dispatcher implemented as runtime code outside the substrate is not substrate content; per [self-representation](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md), this is a [driver-substrate-split](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/driver-substrate-split.md) violation.
  Such a dispatcher's decisions are not in the rule-system's audit chain, not federation-portable, not regime-classified.
- **Non-natural dispatch rules.** Per the theorem's second rule-out, a dispatcher that uses a non-$\mathcal{C}$-natural rule (e.g., a rule that depends on the predicate-id symbol rather than on the predicate's structural position) is not generating a valid closure operator.
  Two substrates with the same dispatcher description may produce different dispatches if the rule is non-natural.
- **Stochastic dispatch.** Per the theorem's third rule-out, a dispatcher that violates settlement-determinism — branching on host time, network state, or random-number generator without recording the entropy — has stepped outside the closure-rule-system framework.
  The substrate's audit and federation guarantees fail for such dispatches.
- **Restriction-based ranking.** As discussed above, ranking by twist-product right residual rather than by composition collapses the four-bilattice's distinguishing values and loses the engineering signal dispatch depends on.

## Position in the platform

Dispatch is the agential-orchestration platform's *work-to-agent matching surface* — the closure-rule sub-region of the substrate that converts work-arrival cells to agent-assignment cells.
Together with [governance](governance.md) (the modal restriction on the authorization side of the fusion), [skill](skill.md) (the capability the agent contributes), [tick](tick.md) (the firing scheduler), and [inbox](inbox.md) (the work-arrival surface), dispatch closes the platform's path from work-receipt to agent-engagement.
The substrate-side observable of every dispatched message is a single $\odot$ application on the predication-fiber algebra producing an `assigned` cell; everything else — locality, partial matching, witness recording, parallel firing, federation portability, regime classification — falls out of dispatch's status as a sub-closure-rule-system rather than as an external coordinator.
