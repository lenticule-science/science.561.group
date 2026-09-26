---
type: theorem
status: sketch
depends-on: [operations-settling, dispatch, witness-as-increment, closure-driven-coordination, crdt-convergence, cohomological-calm, distributed-settling-system, settling-calm-corollary]
realizes: [coordination, distributed-work]
title: Multi-agent work converges as a CRDT, with cohomological CALM
description: When a working community operates as multiple agents writing concurrently to a shared operations settling, the substrate's own structure — not a coordination protocol layered on top — is what makes the resulting work-state converge.
---

# Multi-agent work converges as a CRDT, with cohomological CALM

When a working community operates as multiple agents writing concurrently to a shared [operations settling](../../../../../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/glossary/terms/operations-settling.md), the substrate's own structure — not a coordination protocol layered on top — is what makes the resulting work-state converge.
Concretely: a multi-agent work configuration is a [distributed settling system](distributed-settling-system.md), so [CRDT convergence](../../../../../../../../../logic-services-section/content/text/glossary/concepts/crdt-convergence.md) applies directly; coordination-freeness for a sub-collection of work-units is exactly the [cohomological CALM](../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/cohomological-calm.md) condition $\delta^n = 0$ on its restricted sheaf.

## Statement

**Theorem.** *Let a working community comprise agents $\{A_i\}_{i \in I}$ each maintaining a per-agent valuation $v^{(i)}_\tau$ on the operations base $B_{\mathrm{op}}$, with each $A_i$ applying the shared closure operator $\mathrm{cl}^{\mathcal{S}_{\mathrm{op}}}$ after each [witness-as-increment](../../../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/services/predicated-work-services-section/content/glossary/terms/witness-as-increment.md) write, and with every write eventually visible to every agent.
Then:*

(a) *(Convergence.)
All agents' valuations converge in finitely many merge-and-close steps to the common limit $v^\infty = \mathrm{cl}^{\mathcal{S}_{\mathrm{op}}}(\bigvee_k U)$, where $U$ is the eventually-finite multiset of all writes.
No coordination protocol — no dispatcher, no leader-election, no consensus round — is needed for this convergence.*

(b) *(CALM characterization.)
A subset $W \subseteq T_{\mathrm{op}}$ of work-units is* coordination-free *— i.e., no agent in $W$ ever needs to wait on, ask permission of, or synchronize with another agent in $W$ to make progress — if and only if all Mayer–Vietoris connecting morphisms $\delta^n$ vanish for $W$'s restricted [settling-associated sheaf](../../../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/apps/agent-organization-engine/lib/relating/docs/settling-associated-sheaf.md), $n \geq 0$.*

(c) *(Coordination-cost localization.)
When $W$ is* not *coordination-free, the obstruction lies in the first non-vanishing $\delta^n$.
The cells contributing to that obstruction class are exactly the cells the working community must coordinate on; cells outside the obstruction class can be freely concurrently edited.*

## Sketch

**(a)** Identify each agent $A_i$'s local valuation $v^{(i)}$ with a replica in the [distributed settling system](distributed-settling-system.md) sense.
Each write a $A_i$ records is an [increment](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/humanities/theories/math/theories/categories/theories/predication-categories/objects/increment-sequence.md) $u \in U$; each agent applies $\mathrm{cl}^{\mathcal{S}_{\mathrm{op}}}$ after merging in any peer's writes.
By [CRDT convergence](../../../../../../../../../logic-services-section/content/text/glossary/concepts/crdt-convergence.md), all replicas reach $v^\infty = \mathrm{cl}^{\mathcal{S}_{\mathrm{op}}}(\bigvee_k U)$ after every write has propagated.
The closure-merge commutation lemma in that proof is what gives convergence regardless of merge order — i.e., regardless of which agent saw which write when, including the case where two agents concurrently write conflicting cells (the $\vee_k$-join in the bilattice handles the conflict by lifting toward $\top$, then closure resolves or records the inconsistency).

**(b)** Restrict the [settling-associated sheaf](../../../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/apps/agent-organization-engine/lib/relating/docs/settling-associated-sheaf.md) $\mathcal{F}_U$ to the cells touched by the work-units in $W$.
Coordination-freeness in the work-vocabulary sense — "for any cover of $W$'s cells by per-agent contributions, the joint state is the same as if computed on each cover-piece independently and then merged" — is exactly the *gluing axiom* for the restricted sheaf with no obstruction.
By [cohomological CALM](../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/cohomological-calm.md), this is equivalent to all $\delta^n$ vanishing.

**(c)** When some $\delta^n \neq 0$, its non-trivial classes pick out specific cocycle representatives — pairs (or higher tuples) of cells whose joint update on a cover does *not* glue from individual updates.
Operationally: those are the cells where two agents writing concurrently produce a different result than would obtain if they coordinated.
Cells outside the obstruction class glue freely.
The obstruction localizes the coordination requirement to a specific cell-set rather than imposing it globally.

(Both (b) and (c) are direct corollaries of [cohomological CALM](../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/cohomological-calm.md) restricted to $W$'s cells; (a) is direct from CRDT convergence.) $\square$

## What this answers

The [closure-driven-coordination concept](../../../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/concepts/closure-driven-coordination.md) names the principle: coordination is closure rules in the operations settling.
This theorem upgrades the principle to a structural claim: *which* coordination is needed, *how much* is needed, and *where* it bites are all determined by sheaf cohomology on the operations settling.
Specifically:

- **Why distributed work works at all.** Convergence is automatic from the substrate, not from a coordination layer.
  Every claim in the work-vocabulary that distributed teams can make progress without permission corresponds to a CALM-compatible restriction of the operations settling.

- **What "needs coordination" precisely means.** A work-unit needs coordination iff its cells contribute to a non-zero $\delta^n$ for the relevant cover.
  This is testable, not heuristic.

- **Why some workflows scale and others don't.** Workflows whose cell-flows lie entirely in a CALM-compatible (cohomologically vanishing) sub-sheaf scale to arbitrary numbers of agents without coordination.
  Workflows whose cell-flows touch non-vanishing cohomology require explicit coordination at the obstruction cells, regardless of agent count or organizational design.

## Relation to dispatch and the operations loop

[Dispatch](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/working/content/work/dispatching/morphisms/dispatch.md) is the local closure rule that records an agent's claim on a task.
The CRDT result says dispatch is *eventually consistent* across all agents seeing the same write set — no central scheduler is needed for the dispatch state itself to converge.
The question of whether *concurrent dispatch* of the same task by different agents needs to coordinate is the CALM question of (b), restricted to the dispatch-cell sub-sheaf: it's CALM iff dispatch's coordination-with-completion structure has vanishing first cohomology, which is the substrate's diagnostic for "is this work-unit dispatch-safe for concurrent claim by multiple agents."

## Relation to the plan and recurrent practice

The same theorem, restricted to a [plan](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/working/content/work/dispatching/objects/plan.md)'s task graph, says the plan is concurrently executable iff its restricted sheaf is CALM-compatible — equivalently, iff its dependency graph admits the cell-flow factorization that [closure-driven-coordination](../../../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/concepts/closure-driven-coordination.md) describes without obstruction.
Restricted to a [recurrent practice](../../../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/services/predicated-work-services-section/content/glossary/terms/recurrent-practice.md), it says cycles can run concurrently iff the cross-cycle obstruction class vanishes (with the [cadence-as-modal-frame](../../../../../../../../../../../social-science-services-section/services/social-theory-science-services-section/content/text/glossary/concepts/cadence-as-modal-frame.md) view: this is the obstruction to commuting $\Box_{R^{\mathrm{cad}}_1}$ and $\Box_{R^{\mathrm{cad}}_2}$ for two cadence frames).
