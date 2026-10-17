---
id: trusted-personal-executive-assistant
name: Trusted Personal Executive Assistant
aliases:
  - T-PEA
  - trusted personal executive assistance
  - TP (informal, ambiguous)
  - tipi (optional verbal mnemonic; no cultural authorization implied)
date-created: 2026-10-17
date-modified: 2026-10-17
description: "A T-PEA is a person-bound, contractually accountable executive-assistance service type: a lawful and revocable relation between a specific principal, an operating provider, an authorized incumbent or engine, a source-aware frontier of delegated outcomes, and independently receivable useful effects. It is neither a persona nor an Office nor a completed commercial Offer simply by being declared."
discipline: business-science
kind: service-type
status: researched-and-formalized; experimental-effectiveness-and-installed-service-not-yet-established
concept-source:
  repository: lenticule-science/business-research-services-section
  path: content/concepts/trusted-personal-executive-assistant.v1.json
  revision: de1e3582651f6d97de98b535d5c164e8c8eef4e0
comparative-research:
  repository: lenticule-science/business-research-services-section
  path: content/source-packets/business-sciences/trusted-personal-executive-assistant.md
  revision: b5bfac88949ad8aab565ad4b215944b007c0c865
operational-consumers:
  - coesite-operations/operations-services-section/lib/agency/skills/instantiate-trusted-personal-executive-assistant/skill.json
  - red-cup-engineering/assist/src/tpea-instance.mjs
  - causeway-services/public-services-section/services/personal-services-section/data/records/service-offerings/trusted-personal-executive-assistance-service.json
---

# Trusted Personal Executive Assistant (T-PEA)

A **Trusted Personal Executive Assistant** is a *business-science service type* whose instances maintain a lawful, personally situated path from an individual's actual goals and obligations to useful received outcomes. It supports executive-level coordination, preparation and delegated actions while keeping decisions, property, confidentiality and authority in the hands of the rightful parties.

It is not merely a human job title or an AI conversational style. The term types a **relation of service**, so different people can receive instances of the *same service type* without sharing identities, credentials, goals, memories or authority.

## Differentiate the four words

**Trusted** requires proportional, revocable, observable reliance. Unknown facts remain unknown. An assistant can be most trustworthy precisely when it refuses an unheld capability or detects a misleading request. Confidence and an assistant's professed good faith do not replace the actual governing sources.

**Personal** denotes an actual *principal* and a protected service context, not a generic customer segment. The service can also involve a lawful representative, a different payer, a benefit recipient or jointly governed community rights, but these must be typed independently rather than inferred from family, geography or a display name.

**Executive** denotes anticipation, attention allocation, decisions made easier, coordination of other resources, and outcomes followed to their actual receiving. It does not create a [corporate Office](./office.md), its Hohfeldian authority or any person's legal capacity to consent.

**Assistant** denotes a competent, accountable service beneath the principal's proper directions and legal constraints. It may be delivered by a human professional, multiple agents, existing software engines or a hybrid, but their identities, duties, rights and costs must remain differentiated.

## Formal relational constitution

Let P be the sort of individual principals, I the sort of bounded customer service instances, M the sort of accepted mandates, A the sort of competent acting incumbents, O the sort of source-identified obligations, W the sort of legitimate work, E the sort of attempted effects, V the sort of observations, and G the sort of independent receiving judgments.

**Person-binding axiom:**

\[
\forall i\in I_{\mathrm{TPEA}},\ \exists !\,p\in P:\operatorname{hasPrincipal}(i,p).
\]

This is a cardinality requirement for a service instance, not a claim that one person cannot participate in several institutions or that all households have one authority structure.

**Authority-gate axiom (necessary, not sufficient):**

\[
\operatorname{AdmissibleEffect}(e,a,i)\Rightarrow
\operatorname{Authenticated}(a)\land
\operatorname{Mandated}(a,i)\land
\operatorname{HeldVerb}(a,e)\land
\operatorname{HeldResource}(a,e)\land
\operatorname{PurposeWithin}(e,M_i)\land
\operatorname{Unrevoked}(M_i)\land
\operatorname{RightsCompatible}(e).
\]

Neither writing this formula nor validating a customer's *declarative* instance record establishes any of its antecedent permissions. Source-originated evidence of the relevant actual law, contract, authority holder, incumbent installation and provider controls is required separately. When those sources are absent, do not complete the implication backward.

**Work-admission axiom:** a natural language request supplies possible evidence of an O, not its grant. It may open authorized native Work W for a legitimate beneficiary, but must not name or appoint an actor or impersonate the holder of a financial, medical, legal, privacy or third-party power.

**Receiving axiom:**

\[
\operatorname{CustomerDone}(o)\Rightarrow
\exists e,r,g\ 
(\operatorname{Produces}(e,r)\land
\operatorname{NativeProviderEvidence}(r)\land
\operatorname{ReceivedAsOutcome}(g,o,r)).
\]

A Git commit, a prepared document, the opening of Work, a scheduler run or a provider API acknowledgment can be evidence of a **different** intermediate effect; none automatically establishes the beneficiary's actual receiving.

**Source and privacy axiom:** reusable definitions and engineering code can be common to I, while any two separately instantiated persons have disjoint personal source territories by default. Joint tenancy is a distinct institution with explicit rights and no automatic transfer of credentials or protected histories.

## Relation to the 561 Group's theory of an Office and an Offer

The Group's [Office](./office.md) is a normative quadruple with a fiber nuclear doctrine, a governed action domain, a Hohfeldian deontic profile and an installation morphism. A T-PEA **does not constitute that office** and cannot confer its normative powers. When an actual incumbent performs T-PEA work through an office, that incumbent's *real installation and deontic scope* govern the work. An office's globally persisting structure must not be mistaken for the transient, person-bound service instance.

The Group's [Offer](./offer.md) has an actual bounded operation, contract, access boundary, price terms, market projection and ledger account. The T-PEA **service type** is not itself a market-ready Offer. A catalog entry without these elements is a proposed offering, not a completed sale or economic settlement; customer-specific contracts and chargeable calls remain distinct.

The type, operation, contract, actor, office, instance, offer, Work and independently received effect are therefore separate objects, even if a single human has colloquially called each of them "my assistant."

## Situated professional and empirical warrant

Lenticule Business Research holds the source packet comparing US O*NET (noting old occupational survey dates), international IAAP competencies, UK Skills England and adult-care role boundaries, France Travail, Japanese Hisho Kentei, India's historically dated qualification register, German IHK programming, Brazilian secretarial-profession debates, South African SAQA historical qualifications and Singapore's skills framework.

These have different evidentiary statuses: occupational task studies, credential exam scopes, curriculum descriptions, professional debate, and public workforce frameworks. The source's institutional jurisdiction is not a stereotyped behavioral property of the principal. A culturally and professionally competent T-PEA learns the actual person's preferred interaction and requirements, the institution it is operating within and applicable law. It does not pretend a selected sample represents *every contemporary business culture*.

Behavioral theories of distributed cognition (Hollan–Hutchins–Kirsh), cognitive offloading (Risko–Gilbert), appropriate reliance in automation (Lee–See), and principal-agent incentive conflicts (Jensen–Meckling) motivate specific *testable designs*. Brynjolfsson–Li–Raymond's 2025 field evidence on AI-assisted customer-support workers is informative about heterogeneous human-AI work, but **not a T-PEA efficacy estimate**. NIST AI RMF informs risk practice without authorizing any effect.

## Mark, predication and settlement — explicit conjectural bridge

A T-PEA's legitimate cycle may be represented as **a source Mark → articulation of a need → predication of beneficiary/authority/conditions → position of a permitted bounded Work → settlement by effect and real receiving**. In the Group's broader Obsmetrologia program, this may eventually be derived as a specific case of attending, turns and caring. This entry records a *correspondence under investigation*, not a proof of those foundational conjectures or an excuse to invent provider-side facts.

The Work frontier respects the three live states active, waiting on a particular external event, and requiring an actual nondelegable client decision. Terminal done/canceled/superseded/abandoned work leaves the live frontier. Unknown observations must not be promoted into empty or closed work. This is the operational special case of refusing to counterfeit settlement.

## Scientific discriminations and service tests

A successful T-PEA must first be **portable across two distinct principals**, correctly refuse a third party's data or an unheld verb, and reduce avoidable attention *without* suppressing a genuinely important human decision. Distinguish (1) source type-conformance, (2) native work eligibility, (3) executable provisioned capability, (4) completed provider effect, (5) independent receiving, and (6) comparative economic benefit.

The predeclared experimental targets are **authorized received outcomes per principal-attention cost**, missed obligations, unauthorized attempts, privacy near misses, false task resurrection, domain neglect, agency preservation, client-specific adaptation and net benefit after real costs. Controls include reactive assistant services, qualified human professional assistance and the person's unaided performance. No current T-PEA effectiveness claim is warranted by source commits, test cases or a registered ASSIST host.

## Canonical custodians and consumers

The machine-readable [Business Research concept](https://github.com/lenticule-science/business-research-services-section/blob/main/content/concepts/trusted-personal-executive-assistant.v1.json) is the typed scientific source. The [comparative study](https://github.com/lenticule-science/business-research-services-section/blob/main/content/source-packets/business-sciences/trusted-personal-executive-assistant.md) contains source warrants and the experimental plan. Red Cup Engineering's [ASSIST](https://github.com/red-cup-engineering/assist/blob/main/src/tpea-instance.mjs) admits separately bound customer parameters and reuses its native bounded Person Work broker. Coesite Operations holds the [instantiation procedure](https://github.com/coesite-operations/operations-services-section/blob/main/lib/agency/skills/instantiate-trusted-personal-executive-assistant/SKILL.md). Causeway's [Personal Services section](https://github.com/causeway-services/public-services-section/blob/main/services/personal-services-section/README.md) can publish proposed services and must keep each person's contract, private frontier and receiving distinct.

**Do not collapse these layers.** One can improve an invariant at Science, one engine at Engineering, one operation at Coesite, and every legitimate new principal instance, without promoting an unobserved claim to a legal right or a deployed service.
