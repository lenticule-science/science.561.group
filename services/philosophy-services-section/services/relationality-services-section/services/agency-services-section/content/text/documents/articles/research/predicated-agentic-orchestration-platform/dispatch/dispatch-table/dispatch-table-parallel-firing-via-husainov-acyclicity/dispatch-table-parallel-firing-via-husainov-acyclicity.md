---
type: theorem
class: engineering-claim
status: sketch
depends-on: [dispatch, dispatch-table, dispatch-as-closure-rule-system, husainov-acyclicity, settling-cohomology-vanishing-via-husainov-cech, alexandrov-topology, closure-rule-system, settlement-determinism, independence-implies-confluence]
see-also: [dispatch-composes-authorization, graded-dispatch-via-q-enriched-fusion, heartbeat-quiescence-as-cohomological-calm, federation-handshake-as-replica-cover-gluing]
title: Dispatch-table parallel firing is sound iff the antecedent-conflict poset is Husainov-acyclic
description: Claim.
---

# Dispatch-table parallel firing is sound iff the antecedent-conflict poset is Husainov-acyclic

**Claim.** Let $\mathcal{D}$ be a [dispatch-table](../dispatch-table.md) with closure rules $r_1, \ldots, r_n$ over a set $W$ of work-arrival cells.
Form the **antecedent-conflict poset** $P_\mathcal{D}$ whose elements are the rules' antecedent-witness sets and whose order is set inclusion of the witness-cells those antecedents bind.
Then a parallel firing schedule for $\mathcal{D}$ — one that fires multiple rules in the same heartbeat cycle — is **sound** (its closure equals the sequential closure $\mathrm{cl}^\mathcal{D}$) iff $P_\mathcal{D}$ satisfies [Husainov acyclicity](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/husainov-acyclicity.md): every Dedekind–MacNeille cut of $P_\mathcal{D}$ is cohomologically acyclic.

Under Husainov acyclicity, the [Čech-derived comparison](../../../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/settling-cohomology-vanishing-via-husainov-cech.md) on the cover by per-rule firing-domains commutes with the dispatch's closure operator, so the parallel-fire result equals the sequential-fire result on the nose, with the same canonical-form hash and the same dispatch-witness chain.

## Why this holds

The argument has three parts: (i) the antecedent-conflict poset is the [Alexandrov-topology](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/alexandrov-topology.md) base whose Čech cohomology computes the parallel-firing obstruction, (ii) Husainov acyclicity makes Čech computation agree with derived-functor cohomology, (iii) under that agreement, parallel firings commute with the dispatch's closure operator.

**Part 1: Antecedent-conflict as an Alexandrov poset.** Per [dispatch-as-closure-rule-system](../../dispatch-as-closure-rule-system/dispatch-as-closure-rule-system.md), each dispatch rule $r_i$ is a closure rule whose antecedent binds a subset $A_i \subseteq W$ of work-arrival cells (the cells it reads to compute its match-strength).
Two rules $r_i, r_j$ *conflict* on a parallel firing iff their consequents both update the same `assigned`-cell — equivalently, iff their antecedent-witness sets share a work-arrival cell whose match-target is the same agent.

The poset $P_\mathcal{D}$ has $\{A_1, \ldots, A_n\}$ as elements with order $A_i \leq A_j \Leftrightarrow A_i \subseteq A_j$.
Per the Alexandrov-topology construction on a poset, $P_\mathcal{D}$ inherits the Alexandrov topology where opens are up-sets.
The covers in this topology are exactly the parallel-firing schedules: a cover $\{A_{i_1}, \ldots, A_{i_k}\}$ of $A$ is the schedule that fires rules $r_{i_1}, \ldots, r_{i_k}$ in one cycle on a work-arrival cell-set $A$.

**Part 2: Husainov acyclicity makes Čech equal derived.** Per [settling-cohomology-vanishing-via-husainov-cech](../../../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/settling-cohomology-vanishing-via-husainov-cech.md), Čech cohomology on an Alexandrov poset agrees with derived-functor cohomology of the sheafification iff the poset's Dedekind–MacNeille cut sub-posets are cohomologically acyclic.
When $P_\mathcal{D}$ satisfies this, the Čech complex on a parallel-firing cover computes the same obstruction class as the substrate's derived dispatch-cohomology.

**Part 3: Acyclic Čech ⇒ parallel = sequential.** The dispatch's closure operator $\mathrm{cl}^\mathcal{D}$ on a work-arrival cell-set $A$ is the join over rules $r_i$ with $A_i \subseteq A$ of the consequent updates.
The parallel firing on a cover $\{A_{i_1}, \ldots, A_{i_k}\}$ computes the cellwise join of the per-rule consequents.
The difference between parallel and sequential is precisely the Čech 1-cocycle on the cover: the alternating-sum disagreement between pairwise consequent-restrictions on the cover overlaps.

When $P_\mathcal{D}$ is Husainov-acyclic, the Čech 1-cohomology vanishes on every cover (per the proof of [settling-cohomology-vanishing-via-husainov-cech](../../../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/settling-cohomology-vanishing-via-husainov-cech.md), the cover-restricted complex of a discrete-supported sheaf has cohomology concentrated in degree 0).
Hence the alternating-sum disagreement is a coboundary and equals zero in the substrate's value-domain.
Parallel and sequential firing produce the same `assigned`-cell increment.

When $P_\mathcal{D}$ is *not* Husainov-acyclic — there exists a Dedekind–MacNeille cut whose order complex has non-trivial $H^1$ — the corresponding cover supports a non-trivial 1-cocycle.
A parallel firing schedule that uses that cover produces a `assigned`-cell increment that differs from the sequential closure by exactly the 1-cocycle's bilattice-restricted contribution.
The parallel firing is unsound; an auditor replaying the same `(event log, rule-system version)` under sequential and parallel schedules sees different dispatch decisions, contradicting [settlement-determinism](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/settlement-determinism.md). $\square$

## Relationship to existing dispatch theorems

This theorem refines [dispatch-as-closure-rule-system](../../dispatch-as-closure-rule-system/dispatch-as-closure-rule-system.md) in the parallelization direction.
That theorem establishes that dispatch decisions *are* closure-rule applications; the present theorem characterizes *when* multiple dispatch decisions can be safely scheduled in the same heartbeat cycle.
The two together close the gap between sequential dispatch correctness and parallel dispatch soundness.

It also strengthens [independence-implies-confluence](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/independence-implies-confluence.md) for the dispatch-table case.
That parent theorem requires the [port](../../../../../../../../../../../../../../engineering-science-services-section/services/computer-science-services-section/content/text/glossary/terms/port.md)'s independence relation $I$ to declare safe-pair message orderings; the present theorem provides a *constructive cohomological certificate* for which dispatch-rule pairs the substrate can declare independent.
Husainov-acyclicity of the antecedent-conflict poset is the engineering input that justifies populating $I$ with the corresponding rule-pair entries.

## Engineering consequence

The platform's role in dispatch parallelization is **substrate-acyclic, not lock-engineering**.
Several engineering consequences:

- **Parallel dispatch admissibility is statically computable.** Given a dispatch-table $\mathcal{D}$, the substrate can compute $P_\mathcal{D}$ from the rule definitions and check Husainov-acyclicity by enumerating Dedekind–MacNeille cuts (algorithmically computable for finite posets, per [husainov-acyclicity](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/husainov-acyclicity.md)).
  A platform can offer "is parallel firing of these rules sound?" as a static-check operation, without runtime profiling or empirical race-detection.

- **Parallel-fire eligibility is per-cover, not per-rule-pair.** The theorem's condition is on the *poset's cuts*, not on individual rule pairs.
  A dispatch-table may admit parallel firing on some covers and not on others — the substrate can publish the maximal-acyclic cover-family per rule-system version.

- **Failed acyclicity surfaces as a structural cocycle.** When parallel firing is unsound, the substrate can present the offending Čech 1-cocycle to [governance](teaching/explanations/governance.md): "this rule-pair's parallel firing produced disagreement on this cover" with a witness identifying the work-arrival cells and consequents involved.
  The auditor's repair candidates (re-order the rules, split the rules, refactor the antecedent witnesses) are guided by the cocycle's structure.

- **Acyclicity-preserving rule edits are auditable.** Each dispatch-policy edit produces a new $P_\mathcal{D}$.
  The substrate can validate at edit-time that the new poset preserves Husainov-acyclicity (and thus parallel-firing soundness), refusing edits that would silently introduce race conditions in the parallel scheduler.

## What the theorem rules out

- A parallel dispatch scheduler that relies on runtime locks or transaction-rollback to resolve dispatch conflicts is not exploiting the substrate's acyclicity content.
  Per [independence-implies-confluence](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/independence-implies-confluence.md), the substrate-correct parallelization is structural, not interventional.

- A dispatch-table whose rules carry $\forall$-blocks over the agent population in a non-Husainov-acyclic pattern cannot be safely parallel-fired in any policy.
  Per [dispatch-as-closure-rule-system](../../dispatch-as-closure-rule-system/dispatch-as-closure-rule-system.md)'s regime classification, such dispatch-tables fall into the transfinite-bounded or aperiodic regime, and parallelization there requires trajectory-aware federation rather than per-cycle parallel firing.

- A scheduler that fires "almost-parallel" — overlapping rule executions whose consequent-emission is sequenced post-hoc — is structurally equivalent to a sequential schedule for the purposes of this theorem.
  The theorem's content is about *true parallel* commit: simultaneous closure-rule applications that are committed to the substrate as a single increment.

## What the theorem requires

- The dispatch-table $\mathcal{D}$ is a [closure-rule-system](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule-system.md) per [dispatch-as-closure-rule-system](../../dispatch-as-closure-rule-system/dispatch-as-closure-rule-system.md).
- Each rule $r_i$ has a finite antecedent-witness set $A_i \subseteq W$, so $P_\mathcal{D}$ is a finite poset and Husainov-acyclicity is algorithmically decidable.
- The substrate's value-domain supports the Čech alternating-sum construction — equivalently, the [predication fiber algebra](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) is bilattice-valued (not merely Boolean), so the cocycle's contribution is a value, not a runtime exception.
- The substrate is in the strict regime over the dispatch sub-fibration; transfinite-bounded or aperiodic dispatch-regimes require the trajectory-federation refinement noted above.
