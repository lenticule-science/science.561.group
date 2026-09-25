---
id: waiver
description: "A Waiver is a triple (Q, C, ω) — a right-holder Q, a Hohfeldian claim or immunity C held by Q in H*_{t*}, and a waiver act ω that drives C from H*_{t*} to ⊥_{t*}. The defining structure: waiver is unilateral relinquishment of a right by the right-holder — Q alone can waive Q's own right; the correlative obligor's consent is not required and the obligor cannot prevent it. After ω, C is extinguished: the correlative duty that had burdened the obligor is discharged. Formally: waiver is the retraction of C's section from H*_{t*} to ⊥ via the transferring nucleus Δ_{t*} applied in the dissolving direction — the right that had transferred into the doubly-settled layer is driven back to the bottom element."
date-created: 2026-03-20
date-modified: 2026-03-20
params:
  right-holder: person
  claim: relational-universe-fiber-proposition
  waiver-act: relational-history-restriction-map
output: relational-history-fiber-proposition
ast:
  nucleus-retraction:
    - waiver-act:
        - right-holder
        - claim
    - claim:
        - right-holder
aliases:
  - Waiver
---

# Waiver

## Formal definition

A **Waiver** is a triple $\mathcal{W} = (Q, C, \omega)$:

$$\mathcal{W} = (Q : \mathrm{RightHolder},\; C \in H^*_{t^*},\; \omega : H^*_{t^*} \to \bot_{t^*})$$

where: - $Q$ is the **right-holder** — the party whose Hohfeldian claim or immunity $C$ is being relinquished; $Q$ must be the current holder of $C$ in $H^*_{t^*}$ - $C \in H^*_{t^*}$ is the **claim or immunity** — the Hohfeldian position being waived; it is doubly settled: $\sigma_{t^*}(C) = C$ and $\Delta_{t^*}(C) = C$; the right exists and has transferred into the settled layer - $\omega$ is the **waiver act** — the formal event (written release, explicit verbal relinquishment, or course of conduct clearly manifesting intent to waive) that drives $C$ from $H^*_{t^*}$ to $\bot_{t^*}$; after $\omega$, $C$ is extinguished and the correlative duty on the obligor lapses

**Three invariants.** $\mathcal{W}$ is a valid waiver iff:

1. **Right-holder exclusivity**: only $Q$ can waive $C$.
  The correlative obligor cannot extinguish the right unilaterally; the obligor can only perform (discharging the duty by satisfaction) or breach (failing to perform, triggering remedial duties).
  Waiver is $Q$'s unilateral act.
  The reason: $C$ is a Hohfeldian claim — a normative position held by $Q$ against the obligor; it belongs to $Q$'s normative domain.

2. **Existence of the right**: $C \in H^*_{t^*}$ — the right must be currently settled before it can be waived.
  Waiving a non-existent right is void ($C \notin H^*_{t^*}$ means there is nothing at $C$'s position to drive to $\bot$).
  A right that has already lapsed (discharged by performance, or previously waived) cannot be waived again.

3. **Intentionality**: $\omega$ must manifest an intent to relinquish $C$.
  Waiver requires knowledge of the right and voluntary choice to give it up.
  Inadvertent waiver (not knowing one had the right) is contested — courts vary on whether an unknowing waiver is effective, but the institutional structure requires that $\omega$ be an act attributable to $Q$'s intentional agency, not an accident.

## Express waiver vs. implied waiver

**Express waiver**: $Q$ explicitly declares relinquishment — a written release, a formal statement "I waive my right to X."
This is the clear case: $\omega$ is a discrete, documented act with identifiable moment of effect.
In the formal framework: $\omega$ applies $\Delta_{t^*}$ in the dissolving direction at the moment of declaration.

**Implied waiver**: $Q$'s conduct unambiguously manifests intent to waive without an explicit declaration.
Classic example: a party who proceeds with a contract despite knowing of a breach impliedly waives the breach.
In the formal framework: the implied waiver is a sequence of acts whose propositional content, viewed as a whole, satisfies $\omega(C) = \bot$ — no single act is the waiver, but the combined section of $Q$'s behavior drives $C$ to $\bot$ by course of conduct.

Implied waiver creates a proof-of-intent problem: whether $Q$'s conduct amounts to waiver is a factual question resolved by the forum ([Standing](standing.md)) that adjudicates the dispute.
Formal implied waiver requires the forum's σ-settlement of the "waived" proposition — the forum's nucleus determines whether the conduct counts as a waiver act.

## Waiver and estoppel

Waiver and equitable estoppel ([Estoppel](../../../../services/sociology-science-services-section/services/work-science-services-section/services/predicated-work-services-section/services/predicated-governance-services-section/content/glossary/terms/estoppel.md), if specified) both result in a party being unable to assert a right.
The distinction:

- **Waiver**: $Q$ voluntarily relinquishes $C$; $C$ is extinguished; the right is gone.
- **Estoppel**: $Q$ is prevented by the forum from asserting $C$ because of prior conduct that led another party to rely to their detriment; $C$ may still exist but $Q$ cannot exercise it in this context.

In the formal framework: waiver drives $C$ to $\bot_{t^*}$ (the right is gone from the fiber).
Estoppel blocks the path from $C \in H_{t^*}$ to $H^*_{t^*}$ — the σ-nucleus refuses to settle $C$ for $Q$ in this forum — but $C$ may remain accessible elsewhere.

## Waiver of procedural vs. substantive rights

**Procedural rights** (right to trial by jury, right to object to evidence, right to receive notice) are generally waivable by conduct.
Failure to timely assert a procedural right typically constitutes waiver: missing the deadline for objection drives the right to $\bot$ for purposes of that proceeding.
In formal terms: the forum's site topology $J$ specifies the temporal window for the procedural right; outside that window, $J$-coverage is no longer available for the right's assertion.

**Substantive rights** (property rights, fundamental constitutional rights, rights under mandatory law) may be subject to non-waiver rules — some rights cannot be waived even by the holder.
These are rights where the legislature has determined that the right-holder's consent to waiver is not sufficient: the right is held not just for $Q$ but for a class of persons, and individual waiver would undermine the collective protection.
In formal terms: non-waivable rights are rights where the waiver-retraction $\omega$ is blocked by a higher-level nucleus — the culture or normative system's topology $J$ will not allow the right to be driven to $\bot$ regardless of $Q$'s intent.

## Math grounding

Waiver is the retraction of $C$'s section from the doubly-settled layer $H^*_{t^*} = \mathrm{Fix}(\sigma_{t^*}) \cap \mathrm{Fix}(\Delta_{t^*})$.
The transferring nucleus $\Delta_{t^*}$ placed $C$ in $H^*_{t^*}$ by transfer from a lower level ([Passage](../math/passage.md), forward pole — the carrier direction placed $C$ in the settled layer).
Waiver reverses this: $\omega$ applies $\Delta_{t^*}$ in the retraction direction, driving $C$ back to $\bot$.

In [Section](../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/section/section.md) terms: $C$ was a global section of the right-fibration over $Q$'s authority domain.
Waiver retracts this section: the right inverse $s_C : \{C\} \to H^*_{t^*}$ is collapsed to the zero section $s_C \mapsto \bot_{t^*}$.

The distinction between waiver (unilateral, right-holder) and revocation (unilateral, grantor) is that waiver retracts from the right side of the Hohfeldian relation — the claim — while revocation retracts from the power side — the grant.
Both use the section retraction structure; they differ in which Hohfeldian position is being retracted.

## Open questions

- Whether a waiver of a waiver is possible — whether after $\omega$ drives $C$ to $\bot_{t^*}$, a subsequent act $\omega^{-1}$ can re-establish $C$ in $H^*_{t^*}$ — and whether this depends on whether the waiver was express or implied and whether there was reliance by the obligor.
- Whether the non-waivable right rule (some rights cannot be driven to $\bot$ regardless of the holder's consent) has a formal expression as a nucleus constraint: whether a right $C$ is non-waivable iff $\sigma_{t^*}(C) = C$ and the cultural topology $J$ contains no covering sieve that would certify $\omega(C) = \bot$ — i.e., no $J$-covering makes the retraction locally valid.
- Whether implied waiver (accumulated conduct) is the colimit of the sequence of partial-waiver acts in the category of section retractions, and whether the colimit exists iff the sequence of acts is cofinal in the $\sigma_{t^*}$-retraction order.

---

## Supplementary formulation

```yaml
---

name: "Waiver"
description: "A Waiver is a triple (Q, C, ω) — a right-holder Q, a Hohfeldian claim or immunity C held by Q in H*_{t*}, and a waiver act ω that drives C from H*_{t*} to ⊥_{t*}. The defining structure: waiver is unilateral relinquishment of a right by the right-holder — Q alone can waive Q's own right; the correlative obligor's consent is not required and the obligor cannot prevent it. After ω, C is extinguished: the correlative duty that had burdened the obligor is discharged. Formally: waiver is the retraction of C's section from H*_{t*} to ⊥ via the transferring nucleus Δ_{t*} applied in the dissolving direction — the right that had transferred into the doubly-settled layer is driven back to the bottom element."
date-created: 2026-03-20
---
```

## Formal definition

A **Waiver** is a triple $\mathcal{W} = (Q, C, \omega)$:

$$\mathcal{W} = (Q : \mathrm{RightHolder},\; C \in H^*_{t^*},\; \omega : H^*_{t^*} \to \bot_{t^*})$$

where: - $Q$ is the **right-holder** — the party whose Hohfeldian claim or immunity $C$ is being relinquished; $Q$ must be the current holder of $C$ in $H^*_{t^*}$ - $C \in H^*_{t^*}$ is the **claim or immunity** — the Hohfeldian position being waived; it is doubly settled: $\sigma_{t^*}(C) = C$ and $\Delta_{t^*}(C) = C$; the right exists and has transferred into the settled layer - $\omega$ is the **waiver act** — the formal event (written release, explicit verbal relinquishment, or course of conduct clearly manifesting intent to waive) that drives $C$ from $H^*_{t^*}$ to $\bot_{t^*}$; after $\omega$, $C$ is extinguished and the correlative duty on the obligor lapses

**Three invariants.** $\mathcal{W}$ is a valid waiver iff:

1. **Right-holder exclusivity**: only $Q$ can waive $C$.
  The correlative obligor cannot extinguish the right unilaterally; the obligor can only perform (discharging the duty by satisfaction) or breach (failing to perform, triggering remedial duties).
  Waiver is $Q$'s unilateral act.
  The reason: $C$ is a Hohfeldian claim — a normative position held by $Q$ against the obligor; it belongs to $Q$'s normative domain.

2. **Existence of the right**: $C \in H^*_{t^*}$ — the right must be currently settled before it can be waived.
  Waiving a non-existent right is void ($C \notin H^*_{t^*}$ means there is nothing at $C$'s position to drive to $\bot$).
  A right that has already lapsed (discharged by performance, or previously waived) cannot be waived again.

3. **Intentionality**: $\omega$ must manifest an intent to relinquish $C$.
  Waiver requires knowledge of the right and voluntary choice to give it up.
  Inadvertent waiver (not knowing one had the right) is contested — courts vary on whether an unknowing waiver is effective, but the institutional structure requires that $\omega$ be an act attributable to $Q$'s intentional agency, not an accident.

## Express waiver vs. implied waiver

**Express waiver**: $Q$ explicitly declares relinquishment — a written release, a formal statement "I waive my right to X."
This is the clear case: $\omega$ is a discrete, documented act with identifiable moment of effect.
In the formal framework: $\omega$ applies $\Delta_{t^*}$ in the dissolving direction at the moment of declaration.

**Implied waiver**: $Q$'s conduct unambiguously manifests intent to waive without an explicit declaration.
Classic example: a party who proceeds with a contract despite knowing of a breach impliedly waives the breach.
In the formal framework: the implied waiver is a sequence of acts whose propositional content, viewed as a whole, satisfies $\omega(C) = \bot$ — no single act is the waiver, but the combined section of $Q$'s behavior drives $C$ to $\bot$ by course of conduct.

Implied waiver creates a proof-of-intent problem: whether $Q$'s conduct amounts to waiver is a factual question resolved by the forum ([Standing](standing.md)) that adjudicates the dispute.
Formal implied waiver requires the forum's σ-settlement of the "waived" proposition — the forum's nucleus determines whether the conduct counts as a waiver act.

## Waiver and estoppel

Waiver and equitable estoppel ([Estoppel](../../../../services/sociology-science-services-section/services/work-science-services-section/services/predicated-work-services-section/services/predicated-governance-services-section/content/glossary/terms/estoppel.md), if specified) both result in a party being unable to assert a right.
The distinction:

- **Waiver**: $Q$ voluntarily relinquishes $C$; $C$ is extinguished; the right is gone.
- **Estoppel**: $Q$ is prevented by the forum from asserting $C$ because of prior conduct that led another party to rely to their detriment; $C$ may still exist but $Q$ cannot exercise it in this context.

In the formal framework: waiver drives $C$ to $\bot_{t^*}$ (the right is gone from the fiber).
Estoppel blocks the path from $C \in H_{t^*}$ to $H^*_{t^*}$ — the σ-nucleus refuses to settle $C$ for $Q$ in this forum — but $C$ may remain accessible elsewhere.

## Waiver of procedural vs. substantive rights

**Procedural rights** (right to trial by jury, right to object to evidence, right to receive notice) are generally waivable by conduct.
Failure to timely assert a procedural right typically constitutes waiver: missing the deadline for objection drives the right to $\bot$ for purposes of that proceeding.
In formal terms: the forum's site topology $J$ specifies the temporal window for the procedural right; outside that window, $J$-coverage is no longer available for the right's assertion.

**Substantive rights** (property rights, fundamental constitutional rights, rights under mandatory law) may be subject to non-waiver rules — some rights cannot be waived even by the holder.
These are rights where the legislature has determined that the right-holder's consent to waiver is not sufficient: the right is held not just for $Q$ but for a class of persons, and individual waiver would undermine the collective protection.
In formal terms: non-waivable rights are rights where the waiver-retraction $\omega$ is blocked by a higher-level nucleus — the culture or normative system's topology $J$ will not allow the right to be driven to $\bot$ regardless of $Q$'s intent.

## Math grounding

Waiver is the retraction of $C$'s section from the doubly-settled layer $H^*_{t^*} = \mathrm{Fix}(\sigma_{t^*}) \cap \mathrm{Fix}(\Delta_{t^*})$.
The transferring nucleus $\Delta_{t^*}$ placed $C$ in $H^*_{t^*}$ by transfer from a lower level ([Passage](../../humanities/theories/math/passage.md), forward pole — the carrier direction placed $C$ in the settled layer).
Waiver reverses this: $\omega$ applies $\Delta_{t^*}$ in the retraction direction, driving $C$ back to $\bot$.

In [Section](../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/section/section.md) terms: $C$ was a global section of the right-fibration over $Q$'s authority domain.
Waiver retracts this section: the right inverse $s_C : \{C\} \to H^*_{t^*}$ is collapsed to the zero section $s_C \mapsto \bot_{t^*}$.

The distinction between waiver (unilateral, right-holder) and revocation (unilateral, grantor) is that waiver retracts from the right side of the Hohfeldian relation — the claim — while revocation retracts from the power side — the grant.
Both use the section retraction structure; they differ in which Hohfeldian position is being retracted.

## Open questions

- Whether a waiver of a waiver is possible — whether after $\omega$ drives $C$ to $\bot_{t^*}$, a subsequent act $\omega^{-1}$ can re-establish $C$ in $H^*_{t^*}$ — and whether this depends on whether the waiver was express or implied and whether there was reliance by the obligor.
- Whether the non-waivable right rule (some rights cannot be driven to $\bot$ regardless of the holder's consent) has a formal expression as a nucleus constraint: whether a right $C$ is non-waivable iff $\sigma_{t^*}(C) = C$ and the cultural topology $J$ contains no covering sieve that would certify $\omega(C) = \bot$ — i.e., no $J$-covering makes the retraction locally valid.
- Whether implied waiver (accumulated conduct) is the colimit of the sequence of partial-waiver acts in the category of section retractions, and whether the colimit exists iff the sequence of acts is cofinal in the $\sigma_{t^*}$-retraction order.

---

## Supplementary formulation

```yaml
---

name: "Waiver"
description: "A Waiver is a triple (Q, C, ω) — a right-holder Q, a Hohfeldian claim or immunity C held by Q in H*_{t*}, and a waiver act ω that drives C from H*_{t*} to ⊥_{t*}. The defining structure: waiver is unilateral relinquishment of a right by the right-holder — Q alone can waive Q's own right; the correlative obligor's consent is not required and the obligor cannot prevent it. After ω, C is extinguished: the correlative duty that had burdened the obligor is discharged. Formally: waiver is the retraction of C's section from H*_{t*} to ⊥ via the transferring nucleus Δ_{t*} applied in the dissolving direction — the right that had transferred into the doubly-settled layer is driven back to the bottom element."
date-created: 2026-03-20
---
```

## Formal definition

A **Waiver** is a triple $\mathcal{W} = (Q, C, \omega)$:

$$\mathcal{W} = (Q : \mathrm{RightHolder},\; C \in H^*_{t^*},\; \omega : H^*_{t^*} \to \bot_{t^*})$$

where: - $Q$ is the **right-holder** — the party whose Hohfeldian claim or immunity $C$ is being relinquished; $Q$ must be the current holder of $C$ in $H^*_{t^*}$ - $C \in H^*_{t^*}$ is the **claim or immunity** — the Hohfeldian position being waived; it is doubly settled: $\sigma_{t^*}(C) = C$ and $\Delta_{t^*}(C) = C$; the right exists and has transferred into the settled layer - $\omega$ is the **waiver act** — the formal event (written release, explicit verbal relinquishment, or course of conduct clearly manifesting intent to waive) that drives $C$ from $H^*_{t^*}$ to $\bot_{t^*}$; after $\omega$, $C$ is extinguished and the correlative duty on the obligor lapses

**Three invariants.** $\mathcal{W}$ is a valid waiver iff:

1. **Right-holder exclusivity**: only $Q$ can waive $C$.
  The correlative obligor cannot extinguish the right unilaterally; the obligor can only perform (discharging the duty by satisfaction) or breach (failing to perform, triggering remedial duties).
  Waiver is $Q$'s unilateral act.
  The reason: $C$ is a Hohfeldian claim — a normative position held by $Q$ against the obligor; it belongs to $Q$'s normative domain.

2. **Existence of the right**: $C \in H^*_{t^*}$ — the right must be currently settled before it can be waived.
  Waiving a non-existent right is void ($C \notin H^*_{t^*}$ means there is nothing at $C$'s position to drive to $\bot$).
  A right that has already lapsed (discharged by performance, or previously waived) cannot be waived again.

3. **Intentionality**: $\omega$ must manifest an intent to relinquish $C$.
  Waiver requires knowledge of the right and voluntary choice to give it up.
  Inadvertent waiver (not knowing one had the right) is contested — courts vary on whether an unknowing waiver is effective, but the institutional structure requires that $\omega$ be an act attributable to $Q$'s intentional agency, not an accident.

## Express waiver vs. implied waiver

**Express waiver**: $Q$ explicitly declares relinquishment — a written release, a formal statement "I waive my right to X."
This is the clear case: $\omega$ is a discrete, documented act with identifiable moment of effect.
In the formal framework: $\omega$ applies $\Delta_{t^*}$ in the dissolving direction at the moment of declaration.

**Implied waiver**: $Q$'s conduct unambiguously manifests intent to waive without an explicit declaration.
Classic example: a party who proceeds with a contract despite knowing of a breach impliedly waives the breach.
In the formal framework: the implied waiver is a sequence of acts whose propositional content, viewed as a whole, satisfies $\omega(C) = \bot$ — no single act is the waiver, but the combined section of $Q$'s behavior drives $C$ to $\bot$ by course of conduct.

Implied waiver creates a proof-of-intent problem: whether $Q$'s conduct amounts to waiver is a factual question resolved by the forum ([Standing](standing.md)) that adjudicates the dispute.
Formal implied waiver requires the forum's σ-settlement of the "waived" proposition — the forum's nucleus determines whether the conduct counts as a waiver act.

## Waiver and estoppel

Waiver and equitable estoppel ([Estoppel](../../../../services/sociology-science-services-section/services/work-science-services-section/services/predicated-work-services-section/services/predicated-governance-services-section/content/glossary/terms/estoppel.md), if specified) both result in a party being unable to assert a right.
The distinction:

- **Waiver**: $Q$ voluntarily relinquishes $C$; $C$ is extinguished; the right is gone.
- **Estoppel**: $Q$ is prevented by the forum from asserting $C$ because of prior conduct that led another party to rely to their detriment; $C$ may still exist but $Q$ cannot exercise it in this context.

In the formal framework: waiver drives $C$ to $\bot_{t^*}$ (the right is gone from the fiber).
Estoppel blocks the path from $C \in H_{t^*}$ to $H^*_{t^*}$ — the σ-nucleus refuses to settle $C$ for $Q$ in this forum — but $C$ may remain accessible elsewhere.

## Waiver of procedural vs. substantive rights

**Procedural rights** (right to trial by jury, right to object to evidence, right to receive notice) are generally waivable by conduct.
Failure to timely assert a procedural right typically constitutes waiver: missing the deadline for objection drives the right to $\bot$ for purposes of that proceeding.
In formal terms: the forum's site topology $J$ specifies the temporal window for the procedural right; outside that window, $J$-coverage is no longer available for the right's assertion.

**Substantive rights** (property rights, fundamental constitutional rights, rights under mandatory law) may be subject to non-waiver rules — some rights cannot be waived even by the holder.
These are rights where the legislature has determined that the right-holder's consent to waiver is not sufficient: the right is held not just for $Q$ but for a class of persons, and individual waiver would undermine the collective protection.
In formal terms: non-waivable rights are rights where the waiver-retraction $\omega$ is blocked by a higher-level nucleus — the culture or normative system's topology $J$ will not allow the right to be driven to $\bot$ regardless of $Q$'s intent.

## Math grounding

Waiver is the retraction of $C$'s section from the doubly-settled layer $H^*_{t^*} = \mathrm{Fix}(\sigma_{t^*}) \cap \mathrm{Fix}(\Delta_{t^*})$.
The transferring nucleus $\Delta_{t^*}$ placed $C$ in $H^*_{t^*}$ by transfer from a lower level ([Passage](../../../humanities/theories/math/passage.md), forward pole — the carrier direction placed $C$ in the settled layer).
Waiver reverses this: $\omega$ applies $\Delta_{t^*}$ in the retraction direction, driving $C$ back to $\bot$.

In [Section](../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/section/section.md) terms: $C$ was a global section of the right-fibration over $Q$'s authority domain.
Waiver retracts this section: the right inverse $s_C : \{C\} \to H^*_{t^*}$ is collapsed to the zero section $s_C \mapsto \bot_{t^*}$.

The distinction between waiver (unilateral, right-holder) and revocation (unilateral, grantor) is that waiver retracts from the right side of the Hohfeldian relation — the claim — while revocation retracts from the power side — the grant.
Both use the section retraction structure; they differ in which Hohfeldian position is being retracted.

## Open questions

- Whether a waiver of a waiver is possible — whether after $\omega$ drives $C$ to $\bot_{t^*}$, a subsequent act $\omega^{-1}$ can re-establish $C$ in $H^*_{t^*}$ — and whether this depends on whether the waiver was express or implied and whether there was reliance by the obligor.
- Whether the non-waivable right rule (some rights cannot be driven to $\bot$ regardless of the holder's consent) has a formal expression as a nucleus constraint: whether a right $C$ is non-waivable iff $\sigma_{t^*}(C) = C$ and the cultural topology $J$ contains no covering sieve that would certify $\omega(C) = \bot$ — i.e., no $J$-covering makes the retraction locally valid.
- Whether implied waiver (accumulated conduct) is the colimit of the sequence of partial-waiver acts in the category of section retractions, and whether the colimit exists iff the sequence of acts is cofinal in the $\sigma_{t^*}$-retraction order.
