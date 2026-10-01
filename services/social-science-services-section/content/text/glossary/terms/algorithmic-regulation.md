---
name: "Algorithmic Regulation"
description: "Karen Yeung's term for regulatory regimes that operate through algorithmic systems — predictive, population-categorical, design-embedded — rather than through general rules applied case-by-case after the fact under conditions permitting reasoned contestation. A structurally distinct regulatory form whose interaction with constitutional and human-rights protections is deeply unsettled."
contrasts-with: [classical-regulation, rule-based-regulation]
date-created: 2026-05-03
references:
  yeung-2017:
    authors:
      - Karen Yeung
    title: "'Hypernudge': Big Data as a Mode of Regulation by Design"
    year: 2017
    publication: Information, Communication & Society, 20(1)
  yeung-2018:
    authors:
      - Karen Yeung
    title: "Algorithmic Regulation: A Critical Interrogation"
    year: 2018
    publication: Regulation & Governance, 12(4)
  hildebrandt2015:
    authors:
      - Mireille Hildebrandt
    title: "Smart Technologies and the End(s) of Law: Novel Entanglements of Law and Technology"
    year: 2015
    publication: Edward Elgar
  pasquale2015:
    authors:
      - Frank Pasquale
    title: "The Black Box Society: The Secret Algorithms That Control Money and Information"
    year: 2015
    publication: Harvard University Press
  eubanks2018:
    authors:
      - Virginia Eubanks
    title: "Automating Inequality: How High-Tech Tools Profile, Police, and Punish the Poor"
    year: 2018
    publication: St. Martin's Press
aliases:
  - algorithmic-regulation
see-also:
  - hypernudge
  - governance-indicator
  - surveillance-capitalism
  - ordinal-society
  - normative-system
  - charter
  - policy
---

**Algorithmic regulation** is Karen Yeung's term, formulated in [Algorithmic Regulation: A Critical Interrogation](yeung-2018), for regulatory regimes that operate through algorithmic systems rather than through the general-rule, case-by-case, contestable apparatus that classical legal and administrative regulation inherits from the modern legal tradition.
The concept is broader than *governance through code* (which had been used since Lessig 1999): algorithmic regulation includes credit-scoring, predictive policing, child-protective-services risk assessment, welfare-eligibility automation, content-moderation systems, employment-screening tools, and the dynamic pricing and personalization regimes of consumer-facing platforms.

## The structural difference from classical regulation

Mireille Hildebrandt's [Smart Technologies and the End(s) of Law](hildebrandt2015) supplies the parallel jurisprudential analysis.
Classical legal regulation operates through:

- **General rules** applied to **individual cases** (each case judged as a particular instance of the rule).
- **Reasoned application** through institutional procedures (judicial reasoning, administrative determination) that articulate the basis of the decision.
- **Reactive timing** — the rule is applied *after* the regulated event, with the event having occurred and the question being how to respond.
- **Contestability** — the application is open to challenge through argument, appeal, and (eventually) democratic revision of the rule itself.

Algorithmic regulation operates through:

- **Individual predictions** applied to **categorized populations** (the regulated subject is treated as a member of a statistical class with characteristic risk or value).
- **Pattern-matching application** through opaque computational procedures whose internal reasoning is typically not articulated and often not articulable.
- **Preemptive timing** — the regulatory effect is achieved *before* the regulated event, by structuring the choice architecture, denying access, raising prices, or routing attention.
- **Limited contestability** — challenges face the prediction's opacity, the speed at which it is applied, the scale at which it operates, and the absence of institutional venues with jurisdiction over the algorithm itself.

The differences are not incidental implementation choices that better engineering could remedy; they are structural features of the algorithmic regulatory form.
Yeung and Hildebrandt's joint contribution is to insist that algorithmic regulation be analyzed as a regulatory form *in its own right*, neither a continuation of classical regulation by other means nor a technology-neutral information-processing layer underneath classical regulation.

## Yeung's three-axis taxonomy

Yeung's [2018 paper](yeung-2018) supplies the field's standard analytical taxonomy.
Algorithmic regulatory systems differ along three axes:

1. **Type of decision** the system automates: *allocational* (who gets the resource), *evaluative* (what is the entity worth), *behavioral* (what should the subject do).
2. **Mode of operation**: *reactive* (responding to events as they occur) vs. *preemptive* (acting in advance to prevent or shape events).
3. **Transparency**: *open* (the algorithm's logic is documented and subject to review) vs. *opaque* (proprietary, technically inscrutable, or both).

Each combination raises distinguishable normative questions.
An *open* + *reactive* + *evaluative* system (e.g., a documented credit score applied after a loan application) raises some accountability questions; an *opaque* + *preemptive* + *behavioral* system (e.g., a personalized newsfeed ranking algorithm shaping attention without the user's knowledge) raises substantially more searching ones, particularly where the system operates at scale.

## The accountability deficits

The algorithmic-regulation literature catalogs the systematic accountability deficits the form generates.
Frank Pasquale's [Black Box Society](pasquale2015) supplied the early canonical articulation: algorithmic systems in finance, search, and reputation operate as black boxes whose internal decisions are unintelligible to those they affect, with proprietary trade-secret protection layered atop technical opacity to defeat external scrutiny.
Virginia Eubanks's [Automating Inequality](eubanks2018) documented the consequences in U.S. social services: algorithmic eligibility, fraud-detection, and risk-prediction systems disproportionately deny, surveil, and punish poor people while obscuring the punishment as technical-neutral.

The deficits identified in the literature:

- **Opacity** — the affected subject typically cannot determine why the system reached the decision it did.
- **Speed and scale** — the system operates at velocities and volumes that preclude case-by-case human review.
- **Jurisdictional ambiguity** — the algorithm's developer, deployer, operator, and beneficiary may sit in different organizations and jurisdictions, with no single institutional venue having competence to review the system.
- **Disempowered contestation** — appeal mechanisms (where they exist) typically engage human agents who are themselves bound by the algorithm's outputs.
- **Population-categorical treatment** — the subject is judged as a member of a statistical class, with the resulting decisions reflecting the class's modal characteristics rather than the individual's.

## Distinguished from

- **[Hypernudge](hypernudge.md)** (Yeung's own narrower term) — hypernudge names the *behavioral-shaping* mode of algorithmic regulation that operates through dynamic personalization of choice architectures.
  Hypernudge is one form algorithmic regulation takes; algorithmic regulation includes also allocational and evaluative forms hypernudge does not centrally address.
- **Algorithmic management** — the work-side parallel; [algorithmic management](algorithmic-management.md) is the exercise of *managerial* functions by software, while algorithmic regulation is the exercise of *regulatory* functions by software.
  The two share an apparatus but operate over different relational fields (employment vs. governance).
- **Code-as-law** (Lessig) — Lessig's earlier concept covered the *constraining-by-design* aspect (the code architecture limits what users can do); algorithmic regulation is broader and more decision-theoretic, encompassing predictive and evaluative systems whose regulatory effects do not reduce to architectural constraint.
- **Administrative discretion** — administrative discretion is the human official's case-by-case judgment within a rule framework; algorithmic regulation typically *replaces* discretion with algorithmic determination, transferring judgment from the human official to the system designer (and to the training data the system was built on).

## Within this library

Algorithmic regulation is the central concept of the [algorithmic-governance-and-governance-by-indicators-survey](../texts/algorithmic-governance-and-governance-by-indicators-survey.md).
It is the contemporary extension of the [policy](policy.md) and [normative-system](../../../../services/sociology-science-services-section/services/work-science-services-section/services/governance-services-section/content/text/glossary/terms/normative-system.md) apparatus into algorithmically-enacted regimes, parallels the work-side [algorithmic-management](algorithmic-management.md), and supplies the broader frame within which [hypernudge](hypernudge.md), [governance-indicator](governance-indicator.md), [surveillance-capitalism](../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/surveillance-capitalism.md), and the ordinal-classification regimes operate.
