---
id: fiduciary
name: "Fiduciary"
description: "A fiduciary is a person or institution whose authority to act for another carries loyalty and care obligations within the scope of that relationship; the precise duties, beneficiaries, standards, permissible conflicts, and remedies depend on the governing legal regime and the role involved."
component-of: relational-universe
fiber-of: relational-universe
base: t
element-of: entity
date-created: 2026-03-19
date-modified: 2026-08-27
params:
  beneficiary: person
  fiduciary-agent: person
  resource: custody
  discretion-domain: area
output: relational-universe
ast:
  fiduciary-relation:
    - fiduciary-agent
    - beneficiary
    - authority-scope
    - governing-regime
    - loyalty-obligation
    - care-obligation
    - account-obligation
---


## Definition

A **fiduciary** is a person or institution whose authority to act for another carries obligations that constrain how that authority may be used. Loyalty and care are recurring elements, but “fiduciary” is not one uniform, maximum standard detached from a role. A trustee, corporate director, agent, employee-benefit-plan fiduciary, and investment adviser may all be fiduciaries while owing different duties to different beneficiaries over different domains.

The governing law and the scope of the relationship therefore come first. A fiduciary may owe duties to a beneficiary, a principal, a corporation, a plan, a client, or more than one interest-holder. The relevant instrument, statute, regulation, and body of common or equitable law determine the authority, the protected interest, and the available remedies.

The [Trust](../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/interactive-semioverse-services-section/services/agential-semioverse-services-section/services/semiotic-endeavor-services-section/content/text/glossary/terms/trust.md) relation helps explain why fiduciary controls exist: delegated authority creates dependence and exposes another party to decisions they cannot continuously make or observe themselves. Trust alone, however, is not a legal test for fiduciary status. Some trust relationships are not fiduciary, and some fiduciary duties arise from a legally recognized role regardless of the parties’ vocabulary.

## Relational model

For analysis in this corpus, represent a fiduciary relation as:

$$\mathcal{F} = (P, F, D, A, N)$$

where:

- $P$ is the protected principal, beneficiary, client, entity, or plan;
- $F$ is the fiduciary;
- $D$ is the resource, decision, or affairs domain covered by the relation;
- $A$ is the authority actually entrusted to $F$ within $D$; and
- $N$ is the governing normative regime, including applicable law and valid instruments.

This tuple makes scope explicit. An obligation follows from the recognized role and entrusted authority under $N$; it does not automatically extend to every interaction between $P$ and $F$. The SEC’s investment-adviser interpretation states this point for federal investment-adviser law: fiduciary duty follows the contours of the adviser-client relationship, even though it cannot simply be waived away.

D. Gordon Smith’s critical-resource theory offers one analytic explanation for why fiduciary law appears: one party exercises discretion over a resource important to another while ordinary monitoring and contractual protection are inadequate. That theory is useful here as an account of vulnerability and control, not as a universal doctrinal test across jurisdictions.

## Core obligations

The content and intensity of each obligation depend on $N$, but three control families recur.

**Loyalty** constrains use of entrusted authority for an unauthorized conflicting purpose or personal benefit. The operational controls may include avoiding a conflict, disclosing it, obtaining informed consent or authorization, and refusing a transaction when the governing regime does not permit consent to cure it. “No conflict ever” and “disclose every conflict and proceed” are both overbroad summaries.

**Care** governs the quality of decision-making: competence, diligence, information gathering, prudence, and attention appropriate to the role and circumstances. The standard is not identical for every fiduciary. For example, the federal ERISA standard expressly includes care, skill, prudence, diligence, diversification, and adherence to plan documents, while corporate and agency law formulate their own standards and defenses.

**Accounting and information controls** preserve the beneficiary’s ability to inspect the exercise of authority. Depending on the role, these may require segregating property, retaining records, reporting material facts or conflicts, rendering accounts, and supporting transactions with evidence. These controls connect fiduciary theory directly to bookkeeping: a fiduciary account must identify whose resources were controlled, what authority supported each action, what benefit or cost arose, and whether any amount is owed back.

These controls are instances of [Duty](../../../../../../../sociology-science-services-section/services/work-science-services-section/services/governance-services-section/content/text/glossary/terms/duty.md) within a governing [Norm](../../../../../../../sociology-science-services-section/services/work-science-services-section/services/governance-services-section/content/text/glossary/terms/norm.md), rather than free-standing moral labels.

## Contract, direction, and discretion

A fiduciary relationship can be created or shaped by a [Contract](../../../../../../../law-science-services-section/content/text/glossary/terms/contract.md), trust instrument, corporate charter, plan document, statute, or conduct. Those sources may define the field of authority and allocate decision rights. They do not imply that every fiduciary has discretion the protected party “cannot override.” An agent may be subject to lawful instructions; an adviser and client may agree on the scope of advisory or proxy-voting authority; a trustee may be constrained by the trust instrument and governing law.

The important distinction is not contract versus fiduciary. It is between:

1. defining the relationship’s scope and authority; and
2. attempting to authorize conduct or eliminate obligations that the governing regime does not permit the parties to waive.

Whether a term effectively limits, modifies, or exculpates an obligation is a legal question specific to the role and jurisdiction.

## Benefit, breach, and remedy

Compensation and other benefits are not inherently incompatible with fiduciary status. The question is whether the benefit was authorized and whether the fiduciary complied with applicable loyalty, disclosure, and consent rules.

When a fiduciary obtains an unauthorized benefit through a breach, possible consequences include damages, restitution, disgorgement, rescission, an accounting, removal, injunction, or a constructive trust. These are remedies a court may apply under the governing law; an alleged profit does not universally and automatically become the beneficiary’s property at the moment it arises. Delaware authority, for example, uses disgorgement to strip profit resulting from conscious wrongdoing and breach of loyalty, while federal trust-law cases distinguish the fiduciary’s wrongful gain from loss to the beneficiary.

## Process-system reading

The corpus’s coalgebra language can model the evolution of a controlled resource through time, but it does not itself establish fiduciary law. Let $X(t)$ be the evidenced state of resources and authority at history $t$, and let a transition map record an authorized action and its successor state. A useful fiduciary transition must preserve enough evidence to answer:

- which protected party and domain the action concerned;
- which authority permitted it;
- which assets, liabilities, quantities, costs, and benefits changed;
- whether a conflict or related-party interest existed;
- what disclosure, consent, or approval the governing regime required; and
- what amount, if any, must be restored or disgorged.

The ordinary coalgebra counit law does not mean that a fiduciary may never consume, sell, distribute, or transform a resource. Those acts may be the very purpose of the authority. Nor does the law mathematically force every gain into the principal’s carrier. The formal model is sound only when legal scope, authorization, evidence, and remedy are represented as data and constraints rather than inferred from the coalgebra laws alone.

## Accounting consequence for the 561 Group

Where a 561 Group entity controls assets or decisions for another party, its books should distinguish:

- entity-owned assets from assets held for others;
- authorized compensation from other benefits;
- principal transactions from agent or custodian transactions;
- ordinary counterparties from related parties and conflicts;
- booked facts from valuations and estimates; and
- transaction evidence from the later legal or accounting conclusion drawn from it.

Balanced debits and credits establish arithmetic closure of recorded entries. They do not establish that a fiduciary act was authorized, complete, properly valued, or loyal. Those assertions require source documents, authority records, ownership and quantity evidence, conflict controls, and reconciliation.

## References

- [SEC, Commission Interpretation Regarding Standard of Conduct for Investment Advisers](https://www.sec.gov/rules-regulations/2019/06/ia-5248) — federal investment-adviser duty of care and loyalty; application determined by relationship scope.
- [29 U.S.C. § 1104](https://www.law.cornell.edu/uscode/text/29/1104) — role-specific duties imposed on ERISA fiduciaries.
- [Northeast General Corp. v. Wellington Advertising, Inc.](https://www.law.cornell.edu/nyctap/082_0158.htm) — fiduciary duties concern matters within the scope of the relation.
- [Delaware Court of Chancery opinion on disgorgement for loyalty breach](https://courts.delaware.gov/Opinions/Download.aspx?id=332510) — disgorgement tied to profit resulting from wrongful conduct.
- [Thole v. U.S. Bank N.A.](https://www.law.cornell.edu/supremecourt/text/17-1712) — trust-law discussion of restitution and disgorgement for fiduciary breach.
