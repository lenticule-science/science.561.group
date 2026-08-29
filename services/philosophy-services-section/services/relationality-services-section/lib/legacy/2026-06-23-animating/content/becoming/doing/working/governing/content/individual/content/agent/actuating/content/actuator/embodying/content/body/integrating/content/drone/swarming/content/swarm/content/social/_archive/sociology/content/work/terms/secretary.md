---

title: "Secretary"
description: "A Secretary is a five-tuple (Q, R, C, F, κ) — a principal body Q whose decisions the secretary records, a record set R (minutes, registers, official correspondence) over which the secretary has custody, a communications function C (official outward transmission), a filing obligation F, and an authentication function κ whose application to a document constitutes official validity. The defining structure: the secretary authenticates decisions made by Q, does not make decisions, and the authenticated record is the institution's official memory."
defines: Secretary
related: Clerk, Principal, Office, Duty, Trustee
date-created: 2026-03-19
---

## Formal definition

A **Secretary** is a five-tuple $\mathcal{E} = (Q, R, C, F, \kappa)$:

$$\mathcal{E} = (Q : \mathrm{Body},\; R \subseteq \mathrm{Records},\; C : \mathrm{Decisions}(Q) \to \mathrm{Official Correspondence},\; F : R \to \mathrm{Repository},\; \kappa : R \to R^*)$$

where: - $Q$ is the **principal body** — the decision-making authority (board, legislature, executive, meeting) whose decisions the secretary records and transmits; $Q$ makes decisions; $\mathcal{E}$ records and authenticates them - $R$ is the **record set** — the official documents over which the secretary has custody: minutes, registers, resolutions, official filings, statutory books; $\mathcal{E}$ is the custodian of $R$ - $C$ is the **communications function** — the map from $Q$'s decisions to official outward transmissions; the secretary is the official channel through which $Q$'s decisions are communicated externally - $F$ is the **filing obligation** — the requirement to deposit $R$ into the appropriate repository (public register, official archive, regulatory body) within required timeframes - $\kappa$ is the **authentication function** — the secretary's signature, seal, or attestation that transforms a document $r \in R$ into an officially valid record $r^* = \kappa(r) \in R^*$; without $\kappa(r)$, the document is a draft

**Five invariants.** $\mathcal{E}$ is a secretary iff it satisfies:

1. **Authentication authority**: $\kappa$ is the secretary's constitutive power.
  The secretary's signature or seal on a document makes it officially valid — not merely recorded, but authenticated as the genuine record of $Q$'s decision.
  This is original authority of a narrow kind: the secretary does not decide what $Q$ decided, but the secretary's attestation is what makes the record of that decision authoritative.

2. **Custody of record**: $\mathcal{E}$ has custody of $R$ — not mere physical possession, but legal and institutional custodianship.
  The secretary is the official repository of $Q$'s documentary history.
  Third parties may rely on the secretary's production of $R$ as authoritative.
  The secretary's certification that a document is "a true copy of the original" is legally sufficient in most jurisdictions.

3. **No independent decision authority**: $\mathcal{E}$ records and transmits $Q$'s decisions; $\mathcal{E}$ does not make decisions on $Q$'s behalf.
  The secretary's role is constitutively posterior to $Q$'s decision-making: first $Q$ decides, then $\mathcal{E}$ records.
  Any purported decision issued in the secretary's own name (not as a transmission of $Q$'s decision) is not within the secretary's authority.

4. **Official communications channel**: $C$ is not advisory — the secretary's transmission of $Q$'s decision is the official act of transmission.
  When the corporate secretary sends a notice of board action, or the Secretary of State certifies an election result, or the Clerk of the Court issues a judgment, the transmission via $C$ is the legally operative act, not merely information about it.

5. **Filing obligation**: $F$ is non-delegable in its legal effect.
  The secretary is personally responsible for ensuring $R$ is filed as required.
  Late filing, incorrect filing, or failure to maintain $R$ are the secretary's responsibility regardless of who performed the administrative tasks.

## Authentication as constitutive power

The authentication function $\kappa$ is the structural core of the secretary role.
It is a Hohfeldian power: the secretary's application of $\kappa$ to $r$ creates a new normative relation — $r^* = \kappa(r)$ is officially valid, and third parties may rely on it as such.

Formally: $\kappa(r) \in R^* \iff \mathcal{E}$ has applied their attestation and $r$ accurately records $Q$'s decision.
The authentication is not substantive review — the secretary does not verify that $Q$'s decision was wise or lawful.
The authentication is formal: it attests that this document accurately records what $Q$ decided.

This is why the corporate secretary's certificate is legally operative: "I, [name], Secretary of [Corporation], hereby certify that the following is a true and correct copy of a resolution duly adopted by the Board of Directors..."
The certification creates a legally reliant document.

## Relation to the Clerk

The secretary and the [Clerk](./clerk.md) (pending) are closely related but structurally distinct:

| Property | Secretary | Clerk |
|---|---|---|
| Principal body | $Q$ (a decision-making body) | An institution or court |
| Primary function | Record and authenticate $Q$'s decisions | Maintain the authoritative register |
| Authentication effect | Makes document an official record of $Q$ | Makes entry in register constitute legal fact |
| Communications function | $C$ — outward transmission | Typically absent or secondary |
| Relationship to decisions | Records decisions made by $Q$ | Often the decision itself requires the clerk's act |

The clerk's authentication tends to be constitutive of the underlying fact (the register entry *is* the marriage, *is* the filed case); the secretary's authentication tends to be evidential of an underlying decision (the minutes record a decision that has independent existence).
This distinction is not sharp and varies by domain — it awaits the clerk spec for refinement.

## Corporate secretary as legal officer

In corporate law, the corporate secretary (or "clerk" in some Canadian jurisdictions) is a named officer whose duties are often specified in corporate legislation:

- Maintenance of the minute book (minutes of board and shareholder meetings)
- Maintenance of the share register
- Filing annual returns and other mandatory filings with the companies registry
- Custody of the corporate seal (where used)
- Notice of meetings (directors and shareholders)
- Certification of board resolutions for bank and third-party reliance

The corporate secretary's certified copy of a board resolution is accepted by banks, counterparties, and courts as conclusive evidence of the resolution's contents.
This is the $\kappa$ function in its most legally developed form.

## Authentication and filing as nuclear operations on the documentary fiber

**Source:** [Commuting Nucleus Pair Submonoid](../../humanities/theories/math/commuting-nucleus-pair-submonoid.md), [Shadow Class Type](../../humanities/theories/math/relational-history-fiber-shadow-class-type.md).

The secretary's operations on the documentary fiber — authentication and filing — correspond exactly to the two nuclear operations on the fiber Heyting algebra, and the complete secretary function corresponds to the joint retraction.

**Authentication = saturation nucleus applied to the draft.** An unauthenticated document (a draft in RelationalHistoryFreeShadowType or RelationalHistoryTrShadowType) is a fiber element that has not yet been meaning-recognized by the institutional normative system.
The secretary's application of the authentication function RelationalHistorySecretaryAuthenticationFunction transforms the draft r into the officially valid record RelationalHistoryOfficialRecord = RelationalHistoryFiberSaturatingNucleus applied to r.
This is the saturation nucleus: it closes the meaning-recognition gap, advancing the document from its current shadow class into RelationalHistorySatShadowType or RelationalHistoryFixedFiber.
Without authentication, the document is a shadow element — it accurately records what happened, but the institutional system has not yet recognized it as an official record.
Authentication is the meaning-recognition event.

**Filing = transfer nucleus applied to the authenticated record.** Once authenticated, the record must be carried forward in every institutional extension — deposited into the official repository, preserved in the archive, made available to third parties in all future states of the institution.
The filing obligation RelationalHistorySecretaryFilingObligation is the application of RelationalHistoryFiberTransferringNucleus to the authenticated record: it execution-commits the record, making it transfer-stable (carried forward as a fixed-fiber element in every one-step extension).
A filed record is in RelationalHistoryFixedFiber: both nuclei fix it; it is doubly-quiescent.

**The complete secretary operation = joint retraction.** The secretary's full operation on a draft document is the sequential application of both nuclei — authentication followed by filing = RelationalHistoryFiberSaturatingNucleus composed with RelationalHistoryFiberTransferringNucleus = RelationalHistoryFiberJointNuclearRetraction.
The draft r is in H_t; the authenticated and filed record is in RelationalHistoryFixedFiber.
The joint retraction maps the draft to its canonical doubly-stable image in a single pass.

The commuting nucleus pair submonoid theorem guarantees that this operation is well-defined and that the composition order does not matter (by the nucleus commutation axiom): authentication then filing = filing then authentication = RelationalHistoryFiberJointNuclearRetraction.
The secretary's two operations commute.
This is the formal content of why the order of authentication and filing does not affect the outcome — both orders produce the same element in RelationalHistoryFixedFiber.

| Secretary operation | Nuclear operation | Effect on shadow class |
|---|---|---|
| Authentication: κ(r) | RelationalHistoryFiberSaturatingNucleus applied to r | FreeShadow/TrShadow → SatShadow/FixedFiber |
| Filing: F(κ(r)) | RelationalHistoryFiberTransferringNucleus applied to κ(r) | SatShadow → FixedFiber |
| Complete operation: F(κ(r)) = κ(F(r)) | RelationalHistoryFiberJointNuclearRetraction applied to r | Any shadow class → FixedFiber |

**No-independent-decision authority = saturation-only authority.** The no-independent-decision invariant (Invariant 3: the secretary records Q's decisions, not the secretary's own) is the formal restriction that the secretary has saturation nucleus authority over the record set but not transfer nucleus authority over non-decisions.
The secretary can meaning-recognize (σ-fix) Q's decisions as official records; the secretary cannot execution-commit (Δ-fix) propositions that Q has not decided.
The secretary's position in RelationalHistoryFiberCommutingNucleusPairSubmonoid is the saturation atom, not the transfer atom and not the join.

The authentication function is the saturation atom's operation: it advances records into Fix(RelationalHistoryFiberSaturatingNucleus) without reaching Fix(RelationalHistoryFiberTransferringNucleus) on its own.
The filing obligation then applies the transfer atom to complete the operation to the join.
The secretary is the institutional locus of the saturation nucleus applied to the documentary fiber, with the transfer nucleus as the subsequent filing step.

**Proposition (Secretary as fiber nuclear factorization).** The secretary's complete documentary operation factors through RelationalHistoryFiberCommutingNucleusPairSubmonoid: authentication applies the saturation atom, filing applies the transfer atom, and the joint operation is the join (RelationalHistoryFiberJointNuclearRetraction).
The secretary cannot apply the join unilaterally to non-decisions (the no-independent-decision invariant); the secretary must first have Q's decision as input before the saturation nucleus can be applied.
The documentary fiber over Q's decision-making period is the presheaf of records; the secretary's complete operation is the fiber retraction to the doubly-stable sub-algebra.

*Source.* Four-element submonoid theorem from [Commuting Nucleus Pair Submonoid §Exactly Four Elements](../../humanities/theories/math/commuting-nucleus-pair-submonoid.md#commuting-nucleus-pair-submonoid-size).
Shadow class advancement from [Shadow Class Type](../../humanities/theories/math/relational-history-fiber-shadow-class-type.md).
Distributive lattice structure of the submonoid from [§The Submonoid as an Indexing Set](../../humanities/theories/math/commuting-nucleus-pair-submonoid.md#commuting-nucleus-pair-submonoid-index). $\square$

## Open questions

- Whether the secretary's authentication function $\kappa$ is the same structure as the clerk's authentication, or whether there is a formal difference between authenticating a decision and authenticating a register entry — awaiting the clerk spec.
- Whether the Secretary of State (government official) and the corporate secretary share the same formal structure or whether their differences (scope of authority, constitutional vs. corporate grounding) require distinct tuples.
- Whether $C$ (communications function) is a necessary component of the secretary tuple or whether a pure record-keeper without a communications role counts as a secretary.
