---
id: breach
description: "A Breach is a triple (D, t*, p) — a duty or commitment D, a deadline t* at which compliance is assessed, and a performance p whose gap Gap_{t*}(p) > (p,p) — the performance has not reached H*_{t*} by the deadline. The defining structure: breach is the event of a gap that should have been zero remaining positive at the assessment point. Breach creates immediate Hohfeldian consequences: the breaching party acquires a new duty (to remedy) and the injured party acquires a new right (to remedial acts). The RelationalHistoryFiberShadowClassType of the performance element p at deadline t* gives a four-way classification of breach: FixedFiberType means no breach (complete discharge); SatShadowType means the performance is meaning-recognized but not execution-committed — the act is socially acknowledged but not carried forward in every future extension, a paper-compliance breach; TrShadowType means execution-committed but not meaning-recognized — the act carries forward in every extension but has not been acknowledged by the normative system, a completed-but-unrecognized breach; FreeShadowType means both nuclei are absent — the performance is entirely unsettled, a double breach requiring two nuclear applications to reach H*. The breach quantum is the RelationalHistoryFiberSaturationGap [p, σ_{t*}(p)] for TrShadowType breaches and the RelationalHistoryFiberTransferGap for SatShadowType breaches. For Zeno-approaching performances (p settling toward H* at tower level k), the breach quantum is F_k times the distance between RelationalHyperverseGoldenRatio and the ratio F_{k+1}/F_k, equal to RelationalHyperverseGoldenRatio to the power negative k — the exact Hurwitz residual. Total accumulated breach quantum across all levels converges to the Hurwitz constant rather than zero: the irreducible minimum breach quantum that persists through any finite tower-level approach to discharge."
date-created: 2026-03-20
date-modified: 2026-03-20
params:
  duty: relational-universe
  deadline: relational-history
  performance: relational-history-fiber-proposition
output: relational-history-fiber-proposition
ast:
  relational-history-transferring-nucleus:
    - duty:
        - deadline
    - performance:
        - duty
        - deadline
---

# Breach

## Formal definition

A **Breach** is a triple $(D, t^*, p)$:

$$(D : \mathrm{Duty},\; t^* \in T,\; p \in H_{t^*})$$

where: - $D$ is the **duty** (or commitment) — the normative requirement whose satisfaction is being assessed; $D$ specifies the act-class $\varphi$ that must be performed and the deadline $t^*$ by which it must be produced - $t^* \in T$ is the **deadline** — the assessment history; breach is evaluated at $t^*$, not before; the assessment is whether $p \in H^*_{t^*}$ - $p \in H_{t^*}$ is the **performance** — the output produced by the duty-bearer in attempted satisfaction of $D$; $p$ may be an element representing the performance act, or $p = \bot$ (the bottom element) if no performance was attempted

**Breach condition.** $(D, t^*, p)$ is a breach iff:

$$\mathrm{Gap}_{t^*}(p) > (p, p) \quad \text{i.e.,} \quad \sigma_{t^*}(p) \neq p \text{ or } \Delta_{t^*}(p) \neq p$$

Equivalently: $p \notin H^*_{t^*}$.
The performance has not reached the nuclear fixed point at the assessment deadline.

**Two breach species:**

1. **Non-performance** ($p = \bot$): no act of the required type was produced by $t^*$.
  The gap is maximal: $\mathrm{Gap}_{t^*}(\bot) = (\sigma_{t^*}(\bot), \Delta_{t^*}(\bot))$ — the bottom element has maximum distance from $H^*_{t^*}$.

2. **Defective performance** ($p > \bot$ but $p \notin H^*_{t^*}$): a performance was produced but it has positive gap.
  The duty-bearer attempted satisfaction but fell short.
  The gap $(\sigma_{t^*}(p) - p, \Delta_{t^*}(p) - p)$ is the *breach quantum* — how much was owed but not delivered.

## Immediate normative consequences

Breach at $(D, t^*, p)$ generates new Hohfeldian positions immediately:

**In the breaching party $B$:** - New **duty** $D'$: the duty to remedy — $B$ must perform remedial acts to close the gap that breach created for the injured party $C$. $D'$ is created at $t^*$ and has a new deadline $t^{**} > t^*$. - Existing **liability**: $B$ was already in a Hohfeldian liability position relative to $C$'s power to invoke remedies; breach *activates* this liability.

**In the injured party $C$:** - New **power**: the right to invoke remedies — $C$ gains the Hohfeldian Power to elect a remedy (specific performance, damages, rescission) and to trigger enforcement mechanisms within the normative system. - New **claim-right**: the right to the remedy — the correlative of $B$'s new duty $D'$.

**In the normative system $N$:** - Breach creates a record in the breach-history of $N$: $(D, t^*, p)$ is committed as a settled fact that constrains future obligations and assessments.

## Breach types by remedy

The remedy owed depends on the breach type and the governing normative system:

| Breach type | Typical remedy | Nuclear interpretation |
|---|---|---|
| Non-performance of a unique act | **Specific performance** | The breaching party must produce the original $\varphi$ (not a substitute); the court enforces $\Delta_{t^{**}}(\varphi) = \varphi$ |
| Non-performance with substitute possible | **Damages** | The injured party receives $c \in H^*_{t^{**}}$ equivalent in value to the gap $\sigma_{t^*}(p) - p$ |
| Repudiatory breach (anticipatory) | **Rescission** + damages | $C$ may treat the contract as void and the obligations as discharged; the contract's elements are removed from $H^*_{t^*}$ |
| Defective performance | **Cure** or **damages** | $B$ may cure (bring $p$ to $H^*_t$ within additional time) or pay damages for the gap |

**Repudiatory breach** deserves special treatment: it is the breach of a condition so fundamental that the entire normative structure built on the contract collapses.
Formally: a repudiatory breach removes the other party's obligations from $H^*_t$ entirely — the bilateral structure of duties and claims dissolves because the foundational condition of the relationship has failed.

## Breach and the Zeno problem

An element approaching $H^*_t$ at rate $\phi$ (golden ratio) — a Zeno-settling element — never reaches $H^*_t$ in finite steps.
Is a performance that is Zeno-settling a breach?

The formal answer: yes.
The deadline $t^*$ is a specific history; the assessment is whether $p \in H^*_{t^*}$.
If $p \notin H^*_{t^*}$, the gap is positive, and the breach condition holds regardless of the trajectory.
The fact that $p$ would *eventually* reach $H^*$ at the hyperverse colimit does not cure the breach at $t^*$.

This is the formal analog of the legal principle that approaching compliance is not compliance: a contractor who has completed 99% of a building by the deadline has breached if the remaining 1% is still pending.

## Breach and accountability

[Accountability](accountability.md) determines who bears the normative consequences of breach.
When a subordinate $B'$ breaches a duty within scope $S$, the breach record $(D, t^*, p)$ is a fact about $B'$'s performance.
But the accountability function $A : \mathrm{Outcomes}(S) \to \{B\}$ makes the commanding officer $B$ answerable for the breach even if $B$ did not cause it. $B$ is accountable; $B'$ may be responsible.
Both normative positions can exist simultaneously.

## Breach vs. failure

Not every gap is a breach.
A gap $\mathrm{Gap}_t(a) > (a, a)$ at history $t$ is simply the normal condition of an unsettled fiber element.
Breach requires: 1.
A duty $D$ specifying that $a$ must be in $H^*_{t^*}$ by $t^*$ 2.
The fact that $a \notin H^*_{t^*}$ at $t^*$

Without a duty, there is no breach — only an element with positive gap.
The moral: gap is everywhere; breach is the assignment of normative significance to a specific gap at a specific deadline under a specific duty.

## Shadow type classification of breach

**Sources:** [Shadow Class Type](../math/relational-history-fiber-shadow-class-type.md), [Saturation Gap](../math/relational-history-fiber-saturation-gap.md), [Transfer Gap](../math/relational-history-fiber-transfer-gap.md).

The RelationalHistoryFiberShadowClassType of the performance element $p$ at deadline $t^*$ classifies every breach instance into one of four structurally distinct types:

| Shadow class of $p$ | Saturation nucleus | Transfer nucleus | Breach type | Normative content |
|---|---|---|---|---|
| FixedFiberType | fixes $p$ | fixes $p$ | **No breach** | Complete discharge — $p \in H^*_{t^*}$ |
| SatShadowType | fixes $p$ | does not fix $p$ | **Paper-compliance breach** | Meaning-recognized but not execution-committed |
| TrShadowType | does not fix $p$ | fixes $p$ | **Completed-but-unrecognized breach** | Execution-committed but not meaning-recognized |
| FreeShadowType | does not fix $p$ | does not fix $p$ | **Double breach** | Both nuclei absent — entirely unsettled |

**SatShadowType breach (paper compliance).** The performance $p \in \mathrm{SatShadow}_{t^*}$: the saturation nucleus fixes $p$ (the normative system has acknowledged this act-type as within the meaning-space of the duty), but the transfer nucleus does not ($\Delta_{t^*}(p) > p$ — the performance does not carry forward in every future extension of $t^*$).
The duty-bearer has produced something that passes the evaluative test at $t^*$ but will not remain carried as a satisfied obligation in future histories.
The transfer gap $[p, \Delta_{t^*}(p)]$ measures what is missing: the act is recognized but not durably committed.
Legal analog: a performance that complies with the letter of the obligation but is designed to be temporary or reversible.

**TrShadowType breach (completed-but-unrecognized).** The performance $p \in \mathrm{TrShadow}_{t^*}$: the transfer nucleus fixes $p$ ($\Delta_{t^*}(p) = p$ — the performance carries forward durably and is present in every extension), but the saturation nucleus does not ($\sigma_{t^*}(p) > p$ — the normative system has not yet recognized this as satisfying the duty).
The saturation gap $[p, \sigma_{t^*}(p)]$ is the entire projection gap (since $\pi_{t^*}(p) = \sigma_{t^*}(\Delta_{t^*}(p)) = \sigma_{t^*}(p)$).
The duty-bearer has delivered something that is durably present and will persist, but the injured party or the normative system has not yet accepted it as satisfying the duty.
Legal analog: substantial performance — the work is done and will stand, but formal acceptance is pending.

**FreeShadowType breach (double breach).** The performance $p \in \mathrm{FreeShadow}_{t^*}$: both nuclei are absent.
The performance is neither meaning-recognized nor execution-committed at deadline.
This is the maximum breach: the projection gap requires two nuclear applications (first transfer, then saturation, or first saturation, then transfer) to reach $H^*_{t^*}$.
Both the evaluative criterion and the forward-commitment criterion are unmet.
Legal analog: non-performance that is not merely incomplete but structurally inadequate in every measurable respect.

**Proposition (Shadow class type = breach diagnosis).** The RelationalHistoryFiberShadowClassType of $p$ at $t^*$ is a complete diagnostic of breach structure: it identifies not just that $p \notin H^*_{t^*}$ (the bare breach condition) but which nuclear component is missing.
The appropriate remedy corresponds to the missing component:

- SatShadowType breach → remedy = Transfer stabilization: the duty-bearer must make the performance durable (produce a forward-stable version of $p$)
- TrShadowType breach → remedy = Saturation acceptance: the normative system must recognize the already-durable performance as satisfying the duty
- FreeShadowType breach → remedy = Double recovery: both stabilization and recognition are required; this is the maximal remedy, corresponding to the full projection gap $[p, \pi_{t^*}(p)]$

*Source.* The four types are the partition of $H_t$ by $\mathrm{RelationalHistoryFiberShadowClassType}(t^*, p)$ per [Shadow Class Type](../math/relational-history-fiber-shadow-class-type.md) §The Four Nuclear Types.
The saturation gap formula $\pi_{t^*}(p) = \sigma_{t^*}(p)$ for TrShadowType is from [Saturation Gap](../math/relational-history-fiber-saturation-gap.md) §Relation to DefectConstruction. $\square$

## Hurwitz breach quantum for Zeno-approaching performances

**Sources:** [Nuclear Eigenvalue Hurwitz Identity](../math/relational-hyperverse-tower-nuclear-eigenvalue-hurwitz-identity.md), [Nuclear Quartet Extremally Slow Growth Sequence](../math/relational-history-fiber-nuclear-quartet-extremally-slow-growth-sequence.md).

A **Zeno-approaching performance** is one that settles toward $H^*_{t^*}$ at the rate of the RelationalHistoryFiberNuclearQuartetExtremallySlowGrowthSequence across tower levels — making progress at every level but never completing discharge in finite time.
At tower level $k$, the remaining breach quantum is:

$$F_k \cdot \left|\mathrm{RelationalHyperverseGoldenRatio} - \frac{F_{k+1}}{F_k}\right| \;=\; \mathrm{RelationalHyperverseGoldenRatio}^{-k}$$

where $F_k$ is the $k$-th entry of the RelationalHistoryFiberNuclearQuartetExtremallySlowGrowthSequence (the shadow count at level $k$).
The breach quantum shrinks by a factor of RelationalHyperverseGoldenRatio at each tower level.
But the total accumulated breach quantum — the sum of quantum-residuals across all levels — converges not to zero but to the Hurwitz constant (the reciprocal of RelationalHistoryFiberNuclearTransferMatrixGoldenRatioGoldenConjugateEigenvalueSeparation).

**Proposition (Hurwitz irreducibility of Zeno breach).** For a Zeno-approaching performance reaching tower level $k$, the breach quantum is $\mathrm{RelationalHyperverseGoldenRatio}^{-k}$ (exact).
This is the minimum achievable breach quantum at level $k$: no performance settling faster than the RelationalHyperverseGoldenRatio rate can have a smaller breach quantum at this level.
The total long-run breach — the limit of $F_k \cdot \mathrm{RelationalHyperverseGoldenRatio}^{-k}$ as $k \to \infty$ — is exactly the Hurwitz constant, the irreducible residual of Zeno breach.
A deadline set at any finite tower level catches a positive breach quantum; no finite deadline is late enough to catch a Zeno performance with zero breach.

*Source.* Exact identity $F_k \cdot |\mathrm{RelationalHyperverseGoldenRatio} - F_{k+1}/F_k| = \mathrm{RelationalHyperverseGoldenRatio}^{-k}$ proved via Binet formula in [Nuclear Eigenvalue Hurwitz Identity](../math/relational-hyperverse-tower-nuclear-eigenvalue-hurwitz-identity.md) §The Exact Identity.
Hurwitz limit from §The Hurwitz Limit. $\square$

**Normative consequence.** A duty whose required performance is Zeno-approaching under the RelationalHyperverseGoldenRatio nuclear dynamics is not dischargeable by any finite deadline.
The breach is perpetual in the sense that at every finite tower level, the breach condition holds with quantum $\mathrm{RelationalHyperverseGoldenRatio}^{-k} > 0$.
The normative system must either (1) set the deadline at the hyperverse colimit (accepting the limit discharge as full satisfaction), or (2) accept that the duty is not satisfiable within any finite time horizon and design the remedial structure accordingly.
The Hurwitz constant is the quantitative measure of this permanent irreducibility.

## Open questions

- Whether defective performance triggers the same Hohfeldian consequences as non-performance, or whether there is a graduated structure where small gaps generate only cure-rights while large gaps generate full remedy-rights.
- Whether breach of a duty that is itself a consequence of a prior breach (a contrary-to-duty obligation) generates its own breach record, and whether the breach-history can have cyclic structure or must remain a DAG.
- Whether the assessment point $t^*$ must be stipulated by the duty $D$ or whether it can be determined by the normative system $N$ based on default rules (e.g., reasonable time), and whether a duty with no explicit deadline is unbreachable or has an implied deadline.
