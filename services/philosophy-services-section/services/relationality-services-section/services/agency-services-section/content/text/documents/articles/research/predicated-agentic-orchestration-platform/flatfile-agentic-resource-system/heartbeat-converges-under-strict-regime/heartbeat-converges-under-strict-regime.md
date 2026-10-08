---
name: heartbeat-converges-under-strict-regime
description: "The heartbeat converges under a strict-regime rule system: the active frontier reaches fixed-point in finitely many ticks"
type: theorem
class: engineering-claim
status: proved
depends-on:
  - teaching/explanations/tick-as-iteration.md
  - teaching/explanations/four-layer-rule-architecture.md
  - ../morphisms/settle.md
  - ../morphisms/advance-tick.md
  - ../morphisms/heartbeat-cycle.md
  - ../objects/heartbeat-record.md
  - ../objects/closure-rule-record.md
  - ../objects/fiber.md
  - ../../../../../theorems/wavefront-termination.md
  - ../../../../../theorems/strict-regime-engineering-envelope.md
  - ../../../../teaching/explanations/closure-rule.md
  - ../../../../teaching/explanations/fuel-bound.md
  - rule-addition-is-substrate-local.md
  - instinct-confidence-is-closure-fixpoint-measure.md
  - ../../../../../../../../../../../../theories/computability/prose/learning/claims/theory-of-computability.md
  - ../../../../../../../../../../../../theories/predicated-computing/prose/learning/claims/theory-of-predicated-computing.md
see-also:
  - teaching/explanations/tick-as-iteration.md
  - teaching/explanations/consolidation-as-settlement.md
  - ../morphisms/consolidate.md
  - ../../../../theorems/settlement-path-cost-monotonicity.md
  - ../../../../theorems/promote-is-strictly-cost-reducing.md
title: heartbeat-converges-under-strict-regime
---

# The heartbeat converges under a strict-regime rule system: the active frontier reaches fixed-point in finitely many ticks

**Claim.** Let $\mathcal{H}$ be a FARS heartbeat operating over a finite entity set $E$ under a closure-rule system $\mathcal{S}$ that is *strict-regime* (finite antecedent chains, no cyclic dependencies that grow the fiber without bound).
Then:

1. **Finite convergence.** The heartbeat's *active frontier* — the set of registered entities $F_n \subseteq E$ at tick cycle $n$ — reaches the empty set in finitely many tick cycles: there exists $N < \omega$ such that $F_N = \emptyset$.

2. **Correct deregistration.** An entity $e$ is deregistered at tick cycle $n$ iff $e$'s fiber is at fixed-point under $\mathcal{S}$ at cycle $n$: no rule in $\mathcal{S}$ has a premise that matches $e$'s current fiber (or $e$'s fiber in context of its neighbor fibers within match-radius) that is not already recorded in $e$'s fiber as the rule's conclusion.

3. **Monotone frontier shrinkage in $\leq_k$.** At each tick cycle, the active frontier's aggregate knowledge-order content $\bigoplus_{e \in F_n} \mathcal{F}(e)$ (pointwise $\vee_k$ of all active entities' fibers) is $\leq_k$-weakly greater than at the previous cycle: the tick never loses $\leq_k$-information.
  The frontier shrinks as entities reach fixed-point; their information is retained in their (now settled) fibers, which remain in the substrate.

## Why the three claims hold

### Preliminary: strict-regime rule systems and the active frontier

A closure-rule system $\mathcal{S}$ is *strict-regime* (per [strict-regime-engineering-envelope](../../../../../theorems/strict-regime-engineering-envelope.md)) iff:

- Every rule's premise references finitely many cells.
- No chain of rules in $\mathcal{S}$ produces a conclusion that re-enables a premise earlier in the chain, except through cells that are themselves at fixed-point (no productive cycles).
- The four-bilattice's knowledge-order is well-founded: every $\leq_k$-ascending chain stabilizes in finitely many steps (which is true — per [theory-of-predicated-computing](../../../../../../../../../../../../theories/predicated-computing/prose/learning/claims/theory-of-predicated-computing.md), $\mathbf{FOUR}$ is the image of $\Omega_{\mathbf{Eff}}$ under the double-negation nucleus, a four-element bilattice with $\leq_k$-height 2; any ascending chain terminates in at most 2 steps per cell).

The *active frontier* $F_n$ at tick cycle $n$ is the set of entities registered in the heartbeat-record for the next tick.
Per [tick-as-iteration](../tick-as-iteration/tick-as-iteration.md), `advance-tick` deregisters entity $e$ from $F_n$ when no rule in $\mathcal{S}$ fires on $e$'s current fiber (or $e$'s neighborhood within the rule's match-radius).
At cycle $n+1$, $F_{n+1} = F_n \setminus \{e \in F_n : e \text{ is at fixed-point under } \mathcal{S} \text{ at cycle } n\}$, plus any entities newly activated by the cycle $n$ tick (entities that entered the firing radius of a rule because a neighbor's fiber changed).

### Part 1: Finite convergence

**Step 1: Per-entity convergence.** For a single entity $e$ under a strict-regime system $\mathcal{S}$, the sequence of fiber values $\mathcal{F}_0(e), \mathcal{F}_1(e), \mathcal{F}_2(e), \ldots$ (the fiber at successive tick applications) is $\leq_k$-ascending: each tick's rule application adds information ($\bot \to t$, $\bot \to f$, or sustains the current value).
Since $\mathbf{FOUR}$ has height 2 in $\leq_k$ (per [theory-of-predicated-computing](../../../../../../../../../../../../theories/predicated-computing/prose/learning/claims/theory-of-predicated-computing.md): the chain $\bot <_k t/f <_k \top$ has length at most 2 per cell), and the entity has finitely many predicate cells, the fiber can undergo at most $2 \times |\mathrm{cells}(e)|$ knowledge-order increases before reaching a fixed value at every cell.
Each tick that fires a rule for $e$ produces at least one such increase.
Therefore, at most $2 \times |\mathrm{cells}(e)|$ ticks can fire rules for entity $e$ before $e$ reaches fixed-point.

**Step 2: No unbounded cascade.** When entity $e$ reaches fixed-point at cycle $n$, its fiber is stable.
Rules whose premises reference $e$'s cells now see stable values; they either already fired (their conclusions are already in $e$'s neighbors' fibers) or their premises are not satisfied by $e$'s final fiber.
The cascade from $e$'s settling is bounded by [rule-addition-is-substrate-local](../rule-addition-is-substrate-local/rule-addition-is-substrate-local.md) (read with rule *settling* in place of rule *addition*): changes at $e$ propagate only to entities within $e$'s rules' match-radii.
The propagation is a bounded wavefront per [wavefront-termination](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/wavefront-termination.md).

**Step 3: Global convergence.** The entity set $E$ is finite (FARS operates over a finite directory of files).
Each entity reaches fixed-point in finitely many ticks.
The frontier $F_n$ shrinks monotonically (new activations from propagation add entities already in $E$, which themselves have finitely many remaining tick steps).
The process terminates: there exists $N$ such that $F_N = \emptyset$.

**Fuel bound and convergence.** Per [`settle`](../code/transformers/settle.md) and [fuel-bound](../../../../teaching/explanations/fuel-bound.md), the heartbeat's tick operates under a fuel limit per cycle.
The fuel limit does not change the convergence ordinal — it bounds how much work happens per cycle, not whether the system converges.
Under strict-regime $\mathcal{S}$, a conservatively-set fuel $> 2 \times \max_e |\mathrm{cells}(e)| \times \mathrm{depth}(\mathcal{S})$ (where $\mathrm{depth}(\mathcal{S})$ is the maximum rule-chain length) guarantees convergence within a single pass over $F_n$ for each cycle.

### Part 2: Correct deregistration

`advance-tick` deregisters $e$ when no rule fires — when the match phase finds no premise matching $e$'s current fiber within the rules' match-radii.
An entity is deregistered iff, for every rule $r \in \mathcal{S}$:

- Either $r$'s premise does not match $e$'s fiber (nor $e$'s neighborhood), or
- $r$'s conclusion is already present in $e$'s fiber (the rule's effect is already recorded).

Both conditions are equivalent to "$e$ is at fixed-point under $\mathcal{S}$."
The deregistration is therefore sound (an entity is deregistered only when truly at fixed-point) and complete (an entity is NOT deregistered when there is still a rule to fire — the match phase would have found it).
Soundness and completeness follow from:

- **Sound**: the match phase finds no premise — so no rule fires — so no conclusion is added — so the fiber is unchanged.
  Fixed-point holds.
- **Complete**: if a rule's premise matches but the conclusion is not yet present, the match phase finds the match, the rule fires, the conclusion is added, and $e$ remains in the frontier.
  Not-yet-fixed-point entities are not deregistered.

### Part 3: Monotone frontier shrinkage in $\leq_k$

Each tick application of rule $r$ at entity $e$ produces a conclusion fiber composed into $e$'s fiber via $\odot$.
Per the closure operator's extensivity ($F \leq_k \mathrm{cl}(F)$), the composed result is $\geq_k$ the prior fiber at every cell.
The tick's composition is therefore a $\leq_k$-ascent: no cell loses knowledge-order value.
Across all entities in the frontier, the aggregate $\bigoplus_{e \in F_n} \mathcal{F}(e)$ (the join of all frontier fibers in $\leq_k$) is non-decreasing across cycles.

As entities deregister (reaching fixed-point), they exit the frontier $F_n$.
Their final fibers remain in the substrate — the information is not lost, merely settled.
The aggregate knowledge-order content of the *full substrate* $\bigoplus_{e \in E} \mathcal{F}(e)$ is weakly increasing across all cycles, even as $F_n$ shrinks.

## Engineering consequences

**Realizations can bound heartbeat cost.** For a FARS realization with a fixed substrate size $|E|$ and a strict-regime rule system $\mathcal{S}$ of depth $d$ and maximum match-radius $\rho$, the heartbeat's total convergence cost is bounded by $O(|E| \times d \times \rho^2)$: each entity ticks at most $d \times |\mathrm{cells}|$ times; each tick reads $O(\rho^2)$ entities.
This bound is a design-time computable parameter, not a runtime surprise.

**The heartbeat is a cost-monotone operator.** Per [settlement-path-cost-monotonicity](../../settlement/settlement-path/settlement-path-cost-monotonicity/settlement-path-cost-monotonicity.md), the settlement path is weakly cost-decreasing.
The heartbeat's convergence is the operational realization of this: as entities settle into higher formality layers (F1 → F2 → F3), their tick cost decreases (fewer rules fire; match phase finds fixed-point sooner).
A mature substrate converges faster than a new one.

**Consolidation terminates within the heartbeat.** Per [consolidation-as-settlement](../settlement/consolidation-as-settlement/consolidation-as-settlement.md), `consolidate` is a `settle` on the learning-channel rule subsystem.
By the finite-convergence claim, consolidation terminates in finitely many settle layers under a strict-regime learning-channel rule system.
The consolidation's fuel bound is correctly set when it is at least the depth of the learning-channel rule system times the maximum cell count of the observation fiber — a design-time computable bound.

**The heartbeat is not needed after full convergence.** After the heartbeat's active frontier reaches $\emptyset$, the substrate is at global fixed-point under $\mathcal{S}$.
No further tick cycles produce any change.
A FARS realization MAY pause the heartbeat at this point and resume it only when a substrate edit (via `apply-edit`) re-activates an entity — re-registering it in the frontier.
Per [rule-addition-is-substrate-local](../rule-addition-is-substrate-local/rule-addition-is-substrate-local.md), a substrate edit's re-activation is bounded by the triggering entity's neighborhood; the heartbeat need not re-scan the full $E$.

**Governance-heavy substrates converge in more ticks but still terminate.** A substrate with a rich governance rule system (many guard-channel rules firing on every mutation) has a larger $\mathcal{S}$ and potentially a larger $d$.
The finite-convergence bound still holds — the system is still strict-regime if the governance rules have finite antecedent chains and the bilattice's height-2 structure in $\leq_k$ applies.
The cost is higher, but the termination is guaranteed.

## What happens under non-strict-regime rule systems

Under non-strict-regime rule systems (cycles that grow the fiber without bound, or rules that produce $\leq_k$-non-ascending outputs), the convergence guarantee does not hold in general:

- **Cyclic rules with unbounded growth:** A rule $A \to B$ paired with a rule $B \to A'$ where $A'$ strictly extends $A$ in $\leq_k$ produces an infinite ascending chain.
  The four-bilattice's height-2 $\leq_k$ structure means such a chain terminates at $\top$ in at most 2 steps — so unbounded growth in $\leq_k$ is not possible for finite fibers.
  Any apparent cycle terminates at the $\top$-cell.
  The fuel bound catches this; the witness records the fuel exhaustion.
- **Rules that produce $\leq_k$-non-ascending outputs:** A rule whose conclusion has a lower $\leq_k$ value than the current fiber value at some cell is not a closure rule in the platform's sense (closure rules are extensive).
  Such a "rule" is not a `ClosureRuleRecord`; it is something else.
  The heartbeat convergence theorem applies only to closure-rule systems (extensive, monotone, idempotent under iteration) as defined in the parent theory.

## What the theorem requires

- The entity set $E$ is finite (true for any concrete FARS deployment over a finite filesystem).
- The closure-rule system $\mathcal{S}$ is strict-regime: finite antecedent chains, no productive cycles, well-founded $\leq_k$ per the four-bilattice.
- `advance-tick`'s deregistration is correct: the match phase is exhaustive (it checks all rules and all cells within match-radius before deciding no-match).

## What the theorem does not claim

- **That convergence is fast.** The bound $O(|E| \times d \times \rho^2)$ may be large for large substrates with deep rule systems.
  The theorem guarantees termination; it does not guarantee practical speed.
- **That the substrate remains quiescent.** After reaching $F_N = \emptyset$, a new `apply-edit` may re-activate entities.
  The heartbeat is not permanently done; it is quiescent until the next substrate event.
  The theorem establishes per-epoch convergence (each "epoch" starts at a substrate edit and ends at $F_n = \emptyset$).
- **That non-strict-regime systems diverge.** The four-bilattice's finite height in $\leq_k$ means that even without the strict-regime constraint, the fiber cannot ascend infinitely — it terminates at $\top$.
  A non-strict-regime system may produce pathological $\top$-saturated substrates, but it does not diverge in the sense of running forever.
  The strict-regime constraint is needed for the stronger claim that the system converges to a *useful* fixed-point rather than a $\top$-saturated one.
