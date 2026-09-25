---
id: mandate
description: "A Mandate is a triple (A, φ, C) — an authorizing source A, a prescribed act or procedure φ that is required without substantive discretion, and a compulsion condition C under which the mandated party must perform φ when triggered. The defining structure: mandated action is not chosen — it is required by the source authority; refusal when triggered is itself a violation. Mandamus will lie against a mandate-holder who refuses a properly triggered mandated act."
date-created: 2026-03-19
date-modified: 2026-03-19
params:
  authorizing-source: relational-universe
  prescribed-act: relational-universe
  trigger-condition: relational-universe-morphism
output: relational-history-fiber-fixed-layer
ast:
  relational-universe-morphism:
    - authorizing-source
    - prescribed-act
    - trigger-condition
aliases:
  - Mandate
---

# Mandate

## Formal definition

A **Mandate** is a triple $\mathcal{M} = (A, \varphi, C)$:

$$\mathcal{M} = (A : \mathrm{AuthorizingSource},\; \varphi : \mathrm{PrescribedAct},\; C : \mathrm{Trigger} \to \{0,1\})$$

where: - $A$ is the **authorizing source** — the statute, regulation, constitutional provision, rule, or institutional authority that creates the mandate; $\varphi$ derives from $A$, not from any individual's choice - $\varphi$ is the **prescribed act** — the specific act or procedure the mandate requires; $\varphi$ must be performed in a prescribed manner without substantive discretion; the mandate-holder cannot vary $\varphi$'s content based on their own judgment - $C$ is the **compulsion condition** — the trigger that activates performance of $\varphi$; when $C(\mathrm{trigger}) = 1$, the mandate-holder must perform $\varphi$; refusal when $C = 1$ is a violation of the mandate

**Four invariants.** $\mathcal{M}$ is a mandate iff it satisfies:

1. **Non-discretionary**: the mandate-holder exercises no substantive judgment about whether or how to perform $\varphi$.
  The prescription is complete in advance.
  If discretion remains — if the holder must decide how to apply $\varphi$ to unusual circumstances — the act is not mandated but directed.
  A mandated act is ministerial: prescribed in its entirety by $A$.

2. **Compelled when triggered**: when $C = 1$, performance of $\varphi$ is not optional.
  The mandate-holder cannot refuse, delay, or substitute.
  The legal mechanism that enforces this is mandamus — a court order compelling a public officer to perform a ministerial duty.
  The writ of mandamus presupposes that the act is mandated: courts will not issue mandamus for discretionary acts.

3. **Source-derived**: $\varphi$ is derived from $A$, not from any individual superior.
  The mandate-holder performs $\varphi$ because $A$ requires it, not because a commanding officer ordered it on this occasion.
  This distinguishes a mandate from a command: a command is issued by a person; a mandate is issued by an authorizing source.
  The clerk files a document because the rules of civil procedure mandate filing; not because the judge asked.

4. **Refusal is violation**: refusing to perform $\varphi$ when $C = 1$ is itself a breach — of the mandate-holder's duty, of the institutional rule, of their office.
  The mandate creates a duty (see [Duty](duty.md)) whose discharge is the performance of $\varphi$.
  Refusal without legal justification (e.g., the document is not in proper form) is actionable.

## Mandate vs. command vs. duty

These three concepts are closely related but formally distinct:

| Concept | Source | Discretion | Non-performance |
|---|---|---|---|
| **Mandate** | Authorizing source $A$ (law, rule) | None | Violation + mandamus available |
| **Command** | A person (superior, officer) | Possibly (unlawful orders) | Disobedience |
| **Duty** | Position $p$ in normative system $N$ | Depends on duty type | Breach of duty |

A mandate is a duty of a specific kind: one where the content of the required act $\varphi$ is prescribed in detail by $A$, and where refusal when triggered is itself actionable.
Commands may involve discretion (a soldier must follow lawful orders but must refuse unlawful ones); mandates do not.

## The ministerial mandate in the Clerk

The [Clerk](../../../../services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/clerk.md)'s ministerial mandate $M$ is the paradigm case.
The Clerk of Court: - Is mandated to file any document presented in proper form ($A$ = rules of civil procedure) - Has no discretion to refuse based on the document's legal merit - Must file, log, and attest in the prescribed manner - Refusal when triggered (document properly presented) is itself unlawful — mandamus will lie

This is the mandate's constitutive role in institutional record-keeping: the neutrality and trustworthiness of the clerk's record depends on the mandate structure.
If the clerk could choose what to file, the record would reflect the clerk's judgment, not the institution's proceedings.
The mandate removes the clerk's judgment and replaces it with prescribed procedure — making the record authoritative precisely because it is not selective.

## Nuclear reading

**Definitions.** A mandate $\mathcal{M} = (\mathrm{Holder}, \varphi, \mathrm{Auth}, C)$ at history $t$: the prescribed procedure $\varphi \in H_t$ is a fiber proposition.
The mandate imposes a nuclear constraint on $\varphi$: $\varphi$ must reach $H^*_t$ for the mandate to be discharged.

**Proposition 1 (Mandated procedure is Δ-first):** The mandate specifies $\varphi$ in advance of performance: the steps are fixed before the holder acts.
This corresponds to $\varphi \in \mathrm{Fix}(\Delta_t)$ — execution-stable; every one-step extension of $t$ already carries $\varphi$ as a required element.
The mandate holder cannot choose a different procedure; the procedure is forward-committed by the authorizing source.

*Nuclear rendering:* $\varphi \in \mathrm{Fix}(\Delta_t) \setminus \mathrm{Fix}(\sigma_t)$ (before performance): the mandate is execution-settled but not yet meaning-settled — the steps are determined, but whether THIS execution instance counts as genuine discharge may remain to be recognized.

**Proposition 2 (Non-trivial transfer gap = refusal space):** If $\varphi \notin \mathrm{Fix}(\Delta_t)$ — the procedure is not yet execution-stable — then $\Delta_t(\varphi) > \varphi$ strictly, and there exists a one-step extension of $t$ that does not carry $\varphi$.
This is the nuclear form of non-compliance: the mandate holder has not yet made $\varphi$ forward-present.

*Proof.* By extensiveness of $\Delta_t$ and the definition of the transfer gap. □

**Proposition 3 (Discharge is doubly stable):** The mandate is discharged at $t'$ iff $\varphi \in H^*_{t'} = \mathrm{Fix}(\sigma_{t'}) \cap \mathrm{Fix}(\Delta_{t'})$: both the execution stability AND the meaning-recognition of the performance are complete. $\sigma_{t'}(\varphi) = \varphi$ certifies that the history up to $t'$ fully constitutes $\varphi$ as the canonical discharge act; $\Delta_{t'}(\varphi) = \varphi$ certifies that the performance is forward-active.

*Proof.* $H^*_{t'} = \mathrm{Fix}(\sigma_{t'}) \cap \mathrm{Fix}(\Delta_{t'})$ by definition. □

**Proposition 4 (Refusal when triggered is a non-trivial saturation gap):** If the trigger condition $C = 1$ and the holder refuses to perform $\varphi$, then at the resulting history $t''$ (with refusal recorded), $\varphi \notin \mathrm{Fix}(\sigma_{t''})$: the restriction profile of $\varphi$ to predecessor histories includes the trigger event but not the performance — $\sigma_{t''}(\varphi) > \varphi$.
The saturation gap $[\varphi, \sigma_{t''}(\varphi)]$ is the nuclear signature of refusal: the past demands performance, but performance has not been delivered.

*Consequence.* A mandate creates a fiber-level obligation: when triggered, $\varphi \in \mathrm{Fix}(\Delta_t)$ (the procedure exists and is execution-settled) but $\varphi \notin \mathrm{Fix}(\sigma_{t''})$ after refusal (the meaning-layer recognizes the non-discharge).
The normative gap remains open until performance.

## Open questions

- Whether a mandate can exist without a specific trigger — whether standing mandates (duties that are always potential, not conditionally triggered) fit the same tuple or require a separate treatment.
- Whether the compulsion condition $C$ admits gradations — whether a "strongly recommended" institutional procedure that faces no legal sanction for refusal is a mandate in a weaker sense, or simply not a mandate at all.
- The formal relationship between mandate and the [Standing Orders](../../../../services/political-science-services-section/services/military-science-services-section/content/text/glossary/terms/duty-officer.md) $\mathrm{SO}$ of the duty officer — whether standing orders are mandates issued by the principal to the duty officer, or something structurally different (more like commands than mandates because issued by a person).

---

## Supplementary formulation

```yaml
---

name: "Mandate"
description: "A Mandate is a triple (A, φ, C) — an authorizing source A, a prescribed act or procedure φ that is required without substantive discretion, and a compulsion condition C under which the mandated party must perform φ when triggered. The defining structure: mandated action is not chosen — it is required by the source authority; refusal when triggered is itself a violation. Mandamus will lie against a mandate-holder who refuses a properly triggered mandated act."
date-created: 2026-03-19
---
```

## Formal definition

A **Mandate** is a triple $\mathcal{M} = (A, \varphi, C)$:

$$\mathcal{M} = (A : \mathrm{AuthorizingSource},\; \varphi : \mathrm{PrescribedAct},\; C : \mathrm{Trigger} \to \{0,1\})$$

where: - $A$ is the **authorizing source** — the statute, regulation, constitutional provision, rule, or institutional authority that creates the mandate; $\varphi$ derives from $A$, not from any individual's choice - $\varphi$ is the **prescribed act** — the specific act or procedure the mandate requires; $\varphi$ must be performed in a prescribed manner without substantive discretion; the mandate-holder cannot vary $\varphi$'s content based on their own judgment - $C$ is the **compulsion condition** — the trigger that activates performance of $\varphi$; when $C(\mathrm{trigger}) = 1$, the mandate-holder must perform $\varphi$; refusal when $C = 1$ is a violation of the mandate

**Four invariants.** $\mathcal{M}$ is a mandate iff it satisfies:

1. **Non-discretionary**: the mandate-holder exercises no substantive judgment about whether or how to perform $\varphi$.
  The prescription is complete in advance.
  If discretion remains — if the holder must decide how to apply $\varphi$ to unusual circumstances — the act is not mandated but directed.
  A mandated act is ministerial: prescribed in its entirety by $A$.

2. **Compelled when triggered**: when $C = 1$, performance of $\varphi$ is not optional.
  The mandate-holder cannot refuse, delay, or substitute.
  The legal mechanism that enforces this is mandamus — a court order compelling a public officer to perform a ministerial duty.
  The writ of mandamus presupposes that the act is mandated: courts will not issue mandamus for discretionary acts.

3. **Source-derived**: $\varphi$ is derived from $A$, not from any individual superior.
  The mandate-holder performs $\varphi$ because $A$ requires it, not because a commanding officer ordered it on this occasion.
  This distinguishes a mandate from a command: a command is issued by a person; a mandate is issued by an authorizing source.
  The clerk files a document because the rules of civil procedure mandate filing; not because the judge asked.

4. **Refusal is violation**: refusing to perform $\varphi$ when $C = 1$ is itself a breach — of the mandate-holder's duty, of the institutional rule, of their office.
  The mandate creates a duty (see [Duty](duty.md)) whose discharge is the performance of $\varphi$.
  Refusal without legal justification (e.g., the document is not in proper form) is actionable.

## Mandate vs. command vs. duty

These three concepts are closely related but formally distinct:

| Concept | Source | Discretion | Non-performance |
|---|---|---|---|
| **Mandate** | Authorizing source $A$ (law, rule) | None | Violation + mandamus available |
| **Command** | A person (superior, officer) | Possibly (unlawful orders) | Disobedience |
| **Duty** | Position $p$ in normative system $N$ | Depends on duty type | Breach of duty |

A mandate is a duty of a specific kind: one where the content of the required act $\varphi$ is prescribed in detail by $A$, and where refusal when triggered is itself actionable.
Commands may involve discretion (a soldier must follow lawful orders but must refuse unlawful ones); mandates do not.

## The ministerial mandate in the Clerk

The [Clerk](../../../../services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/clerk.md)'s ministerial mandate $M$ is the paradigm case.
The Clerk of Court: - Is mandated to file any document presented in proper form ($A$ = rules of civil procedure) - Has no discretion to refuse based on the document's legal merit - Must file, log, and attest in the prescribed manner - Refusal when triggered (document properly presented) is itself unlawful — mandamus will lie

This is the mandate's constitutive role in institutional record-keeping: the neutrality and trustworthiness of the clerk's record depends on the mandate structure.
If the clerk could choose what to file, the record would reflect the clerk's judgment, not the institution's proceedings.
The mandate removes the clerk's judgment and replaces it with prescribed procedure — making the record authoritative precisely because it is not selective.

## Nuclear reading

**Definitions.** A mandate $\mathcal{M} = (\mathrm{Holder}, \varphi, \mathrm{Auth}, C)$ at history $t$: the prescribed procedure $\varphi \in H_t$ is a fiber proposition.
The mandate imposes a nuclear constraint on $\varphi$: $\varphi$ must reach $H^*_t$ for the mandate to be discharged.

**Proposition 1 (Mandated procedure is Δ-first):** The mandate specifies $\varphi$ in advance of performance: the steps are fixed before the holder acts.
This corresponds to $\varphi \in \mathrm{Fix}(\Delta_t)$ — execution-stable; every one-step extension of $t$ already carries $\varphi$ as a required element.
The mandate holder cannot choose a different procedure; the procedure is forward-committed by the authorizing source.

*Nuclear rendering:* $\varphi \in \mathrm{Fix}(\Delta_t) \setminus \mathrm{Fix}(\sigma_t)$ (before performance): the mandate is execution-settled but not yet meaning-settled — the steps are determined, but whether THIS execution instance counts as genuine discharge may remain to be recognized.

**Proposition 2 (Non-trivial transfer gap = refusal space):** If $\varphi \notin \mathrm{Fix}(\Delta_t)$ — the procedure is not yet execution-stable — then $\Delta_t(\varphi) > \varphi$ strictly, and there exists a one-step extension of $t$ that does not carry $\varphi$.
This is the nuclear form of non-compliance: the mandate holder has not yet made $\varphi$ forward-present.

*Proof.* By extensiveness of $\Delta_t$ and the definition of the transfer gap. □

**Proposition 3 (Discharge is doubly stable):** The mandate is discharged at $t'$ iff $\varphi \in H^*_{t'} = \mathrm{Fix}(\sigma_{t'}) \cap \mathrm{Fix}(\Delta_{t'})$: both the execution stability AND the meaning-recognition of the performance are complete. $\sigma_{t'}(\varphi) = \varphi$ certifies that the history up to $t'$ fully constitutes $\varphi$ as the canonical discharge act; $\Delta_{t'}(\varphi) = \varphi$ certifies that the performance is forward-active.

*Proof.* $H^*_{t'} = \mathrm{Fix}(\sigma_{t'}) \cap \mathrm{Fix}(\Delta_{t'})$ by definition. □

**Proposition 4 (Refusal when triggered is a non-trivial saturation gap):** If the trigger condition $C = 1$ and the holder refuses to perform $\varphi$, then at the resulting history $t''$ (with refusal recorded), $\varphi \notin \mathrm{Fix}(\sigma_{t''})$: the restriction profile of $\varphi$ to predecessor histories includes the trigger event but not the performance — $\sigma_{t''}(\varphi) > \varphi$.
The saturation gap $[\varphi, \sigma_{t''}(\varphi)]$ is the nuclear signature of refusal: the past demands performance, but performance has not been delivered.

*Consequence.* A mandate creates a fiber-level obligation: when triggered, $\varphi \in \mathrm{Fix}(\Delta_t)$ (the procedure exists and is execution-settled) but $\varphi \notin \mathrm{Fix}(\sigma_{t''})$ after refusal (the meaning-layer recognizes the non-discharge).
The normative gap remains open until performance.

## Open questions

- Whether a mandate can exist without a specific trigger — whether standing mandates (duties that are always potential, not conditionally triggered) fit the same tuple or require a separate treatment.
- Whether the compulsion condition $C$ admits gradations — whether a "strongly recommended" institutional procedure that faces no legal sanction for refusal is a mandate in a weaker sense, or simply not a mandate at all.
- The formal relationship between mandate and the [Standing Orders](../../../../services/political-science-services-section/services/military-science-services-section/content/text/glossary/terms/duty-officer.md) $\mathrm{SO}$ of the duty officer — whether standing orders are mandates issued by the principal to the duty officer, or something structurally different (more like commands than mandates because issued by a person).
