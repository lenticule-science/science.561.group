---
title: "Breach"
description: "A Breach is a triple (D, t*, p) — a duty D, an assessment deadline t*, and a performance p whose performance-and-recognition predicates have not jointly reached affirming settlement at t*. Breach is the event of a gap that should have been zero remaining positive at the assessment point. It creates immediate Hohfeldian consequences: the breaching party acquires a new duty (to remedy) and the injured party acquires new rights (to remedial acts). The settlement position of p at t* gives a four-way classification of breach by which predicate(s) failed to settle."
defines: Breach
related: Duty, Commitment, Contract, Gap, Accountability, Sanction, Discharge, HohfeldianPosition, Record, Act
date-created: 2026-03-20
date-modified: 2026-04-28
---

## Formal definition

A **Breach** is a triple $(D, t^*, p)$:

$$(D : \mathrm{Duty},\; t^* \in T,\; p)$$

where:
- $D$ is the **duty** (or commitment) — the normative requirement whose satisfaction is being assessed; $D$ specifies the act-class $\varphi$ that must be performed and the deadline $t^*$ by which it must be produced
- $t^* \in T$ is the **deadline** — the assessment history; breach is evaluated at $t^*$, not before
- $p$ is the **performance** — the act produced by the duty-bearer in attempted satisfaction of $D$; $p$ may be an actual performance act, or $\varnothing$ if no performance was attempted

**Breach condition.** $(D, t^*, p)$ is a breach iff the joint condition required by [discharge](./discharge.md) — that both the *performance* predicate and the *recognition* predicate over $p$ have reached affirming [settlement](../../../../../../math/theories/voidmath/terms/settlement.md) at $t^*$ — fails. That is, at least one of the two predication cells $(p, p_{\mathrm{perform}}, D)$ and $(p, p_{\mathrm{recognize}}, D)$ has not reached the truth-only corner $\mathbf{t}$ by the deadline.

**Two breach species:**

1. **Non-performance** ($p = \varnothing$): no act of the required type was produced by $t^*$. Both predicates remain in the absurd corner — no [witnessing](../../../../../../philosophy/theories/relationality/terms/witnessing.md) of either has occurred.

2. **Defective performance** ($p$ exists but settlement is incomplete): a performance was produced but at least one of the two predicates has not reached affirming settlement. The duty-bearer attempted satisfaction but fell short. The unsettled predicate's distance from the affirming corner is the *breach quantum* — how much was owed but not delivered.

## Immediate normative consequences

Breach at $(D, t^*, p)$ generates new Hohfeldian positions immediately:

**In the breaching party $B$:**
- New **duty** $D'$: the duty to remedy — $B$ must perform remedial acts to close the gap that breach created for the injured party $C$. $D'$ is created at $t^*$ and has a new deadline $t^{**} > t^*$.
- Existing **liability**: $B$ was already in a Hohfeldian liability position relative to $C$'s power to invoke remedies; breach *activates* this liability.

**In the injured party $C$:**
- New **power**: the right to invoke remedies — $C$ gains the Hohfeldian Power to elect a remedy (specific performance, damages, rescission) and to trigger enforcement mechanisms within the normative system.
- New **claim-right**: the right to the remedy — the correlative of $B$'s new duty $D'$.

**In the normative system $N$:**
- Breach creates a record in the breach-history of $N$: $(D, t^*, p)$ is committed as a settled fact that constrains future obligations and assessments.

## Breach types by remedy

The remedy owed depends on the breach type and the governing normative system:

| Breach type | Typical remedy | Settlement reading |
|---|---|---|
| Non-performance of a unique act | **Specific performance** | The breaching party must produce the original $\varphi$ (not a substitute); the court enforces affirming settlement of both performance and recognition predicates at the new deadline |
| Non-performance with substitute possible | **Damages** | The injured party receives compensation equivalent in value to the breach quantum |
| Repudiatory breach (anticipatory) | **Rescission** + damages | $C$ may treat the contract as void and the obligations as discharged; the contract's predicates are removed from the potential settlement structure |
| Defective performance | **Cure** or **damages** | $B$ may cure (bring the unsettled predicate to affirming settlement within additional time) or pay damages for the gap |

**Repudiatory breach** deserves special treatment: it is the breach of a condition so fundamental that the entire normative structure built on the contract collapses. Formally: a repudiatory breach removes the other party's obligations from the potential settlement entirely — the bilateral structure of duties and claims dissolves because the foundational condition of the relationship has failed.

## The four-corner classification of breach

The [settlement](../../../../../../math/theories/voidmath/terms/settlement.md) position of the performance $p$ across the two predicates (performance and recognition) at deadline $t^*$ classifies every breach instance into one of four structurally distinct types. The classification corresponds to the four corners of joint settlement on the two predicates:

| Joint settlement of $(p_{\mathrm{perform}}, p_{\mathrm{recognize}})$ | Breach type | Normative content |
|---|---|---|
| Both affirmingly settled | **No breach** | Complete [discharge](./discharge.md) — both predicates at $\mathbf{t}$ |
| Recognition settled, performance not | **Paper-compliance breach** | Acknowledged but not actually performed — the act has been recognized as falling within the duty's scope but the performance itself has not reached affirming settlement |
| Performance settled, recognition not | **Completed-but-unrecognized breach** | The act has been performed (and its performance carries forward) but the normative system has not yet acknowledged it as satisfying the duty |
| Neither settled | **Double breach** | Both predicates remain in the absurd corner — entirely unsettled, the maximal breach |

**Paper-compliance breach.** The recognition predicate has reached affirming settlement (the normative system acknowledges this act-type as satisfying the duty), but the performance predicate has not (the act has not actually been carried out, or has been carried out only formally). The duty-bearer has produced something that passes the evaluative test at $t^*$ but is designed to be temporary, reversible, or otherwise not actually durable. Legal analog: a performance that complies with the letter of the obligation but not its spirit.

**Completed-but-unrecognized breach.** The performance predicate has reached affirming settlement (the act has been done and is forward-active), but the recognition predicate has not (the normative system has not yet accepted it as satisfying the duty). The duty-bearer has delivered something durable, but formal acceptance is pending. Legal analog: substantial performance — the work is done and will stand, but formal acceptance is pending.

**Double breach.** Both predicates remain in the absurd corner — the performance is neither performed nor recognized at the deadline. This is the maximum breach. Legal analog: non-performance that is not merely incomplete but structurally inadequate in every measurable respect.

**Diagnostic remedy mapping.** The four-corner classification doubles as a diagnostic of which remedy applies:

- **Paper-compliance breach** → remedy targets performance: the duty-bearer must produce a durable, actually-performed version of the act.
- **Completed-but-unrecognized breach** → remedy targets recognition: the normative system must register the already-completed performance as satisfying the duty.
- **Double breach** → remedy targets both: full remedy is required to bring both predicates to affirming settlement.

## Approaching compliance is not compliance

A performance that approaches affirming settlement asymptotically — moving toward but never reaching the truth-only corner in finite witnessings — does not cure breach at the deadline. The deadline $t^*$ is a specific history; the assessment is whether both predicates have reached affirming settlement at $t^*$. If either has not, the breach condition holds regardless of trajectory. The fact that the predicates *would* eventually settle does not cure the breach at $t^*$.

This is the formal analog of the legal principle that approaching compliance is not compliance: a contractor who has completed 99% of a building by the deadline has breached if the remaining 1% is still pending.

## Breach and accountability

[Accountability](./accountability.md) determines who bears the normative consequences of breach. When a subordinate $B'$ breaches a duty within scope $S$, the breach record $(D, t^*, p)$ is a fact about $B'$'s performance. But the accountability function makes the commanding officer $B$ answerable for the breach even if $B$ did not cause it. $B$ is accountable; $B'$ may be responsible. Both normative positions can exist simultaneously.

## Breach vs. failure

Not every unsettled predicate is a breach. A predicate that has not reached affirming settlement at history $t$ is simply the normal condition of an active inquiry. Breach requires:

1. A duty $D$ specifying that both performance and recognition predicates over the required act must reach affirming settlement by $t^*$
2. The fact that at least one predicate has not reached affirming settlement at $t^*$

Without a duty, there is no breach — only an act with unsettled predicates. The moral: unsettled is everywhere; breach is the assignment of normative significance to specific unsettled predicates at a specific deadline under a specific duty.

## Open questions

- Whether defective performance triggers the same Hohfeldian consequences as non-performance, or whether there is a graduated structure where small gaps generate only cure-rights while large gaps generate full remedy-rights.
- Whether breach of a duty that is itself a consequence of a prior breach (a contrary-to-duty obligation) generates its own breach record, and whether the breach-history can have cyclic structure or must remain a DAG.
- Whether the assessment point $t^*$ must be stipulated by the duty $D$ or whether it can be determined by the normative system $N$ based on default rules (e.g., reasonable time), and whether a duty with no explicit deadline is unbreachable or has an implied deadline.
- Whether the four-corner classification of breach is exhaustive in the same sense as the bilattice's four corners — whether every breach instance occupies exactly one of the four positions, or whether interior settlements (partial witnessing on both predicates) constitute their own intermediate breach types.
