---
title: "Cybernetic Planning"
description: "Cybersyn, the Soviet OGAS proposals and the computational feasibility argument for planning, with the numbers"
date-created: 2026-10-08
aliases: []
keywords:
  - cybernetics
  - planning
  - Cybersyn
  - OGAS
  - computation
teaches:
  - "Cybernetic Planning"
authors:
  - claude-sonnet-5-5
type: text
references:
  medina2011:
    authors:
      - Eden Medina
    title: "Cybernetic Revolutionaries: Technology and Politics in Allende’s Chile"
    year: 2011
    publisher: MIT Press
    doi: 10.7551/mitpress/8417.001.0001
    url: https://doi.org/10.7551/mitpress/8417.001.0001
  gerovitch2008:
    authors:
      - Slava Gerovitch
    title: "InterNyet: why the Soviet Union did not build a nationwide computer network"
    year: 2008
    publication: History and Technology
    doi: 10.1080/07341510802044736
    url: https://doi.org/10.1080/07341510802044736
  peters2016:
    authors:
      - Benjamin Peters
    title: "How Not to Network a Nation: The Uneasy History of the Soviet Internet"
    year: 2016
    publisher: MIT Press
    doi: 10.7551/mitpress/9800.001.0001
    url: https://doi.org/10.7551/mitpress/9800.001.0001
  cockshott1993:
    authors:
      - Allin Cottrell
      - W. Paul Cockshott
    title: "Calculation, complexity and planning: the socialist calculation debate once again"
    year: 1993
    url: https://users.wfu.edu/cottrell/socialism_book/calculation_debate.pdf
---

This note records what the cybernetic-planning literature establishes: the Chilean Cybersyn project, the Soviet national network proposals, and the computational feasibility argument for planning. House background in the cybernetic-postliberalism section: [viable-system-subject](../../../../../../../../../../../sociology-science-services-section/services/cybernetic-postliberalism-services-section/content/text/glossary/terms/viable-system-subject.md), [recursive-governance](../../../../../../../../../../../sociology-science-services-section/services/cybernetic-postliberalism-services-section/content/text/glossary/terms/recursive-governance.md), [modulative-governance](../../../../../../../../../../../sociology-science-services-section/services/cybernetic-postliberalism-services-section/content/text/glossary/terms/modulative-governance.md), [telemetric-method](../../../../../../../../../../../sociology-science-services-section/services/cybernetic-postliberalism-services-section/content/text/glossary/terms/telemetric-method.md).

## Cybersyn

Medina 2011 (publisher description only; the book body was not read) tells the history of Chile's experiment with peaceful socialist change under Allende and the simultaneous attempt to build a computer system to manage the economy. The cybernetic system was to feature holistic system design, decentralized management, human-computer interaction, a national telex network, near real-time control of the growing industrial sector and modelling of dynamic systems. Project Cybersyn was never completely implemented and the government ended in a military coup. Quantities (machines, factories connected) are in the body, not read.

## OGAS and why the Soviet network was not built

Gerovitch 2008 (full text) traces the proposals from the late 1950s. At the end of 1962 Kosygin called in Glushkov, who presented a proposal for an automated system for economic planning and management on a nationwide computer network; the name was the Statewide Automated Management System for Collection and Processing of Information for the Accounting, Planning, and Management of the National Economy (OGAS). Glushkov argued the larger the controlled object, the greater the effect of automation, and warned that without automation nearly the entire adult population would be engaged in planning, accounting and management by the mid-1980s. He asserted OGAS would control only information flows, not the economy, and left the ministries' computer centres in place. A separate proposal to eliminate money never gained Party support. The Central Statistical Administration, which already had a national collection network, turned the network into an extension of its own; Gosplan insisted on organising it by its own departmental structure; while the dispute continued, no action was taken, and in 1966 to 1970 414 management information systems were built at enterprises and agencies without coordination or any connecting network. Gerovitch concludes the network became a patchwork because information was power.

Peters 2016 (publisher description) states that between 1959 and 1989 Soviet attempts to network the nation failed through unregulated competition among self-interested institutions and bureaucrats, whereas ARPANET (online 1969) succeeded through well-managed state subsidies and collaborative research environments: "The capitalists behaved like socialists while the socialists behaved like capitalists." The book body was not read.

## Computational feasibility

Cottrell & Cockshott 1993 (full text of the author-hosted paper) answer the claim that planning an economy with about 10 million separately identifiable products is impossible. Brute-force Gaussian elimination needs about 10^21 operations, roughly 10^22 instructions, about 1.5 million years on a mid-1980s supercomputer of 200 million instructions per second. Iterative methods with 20 iterations give about 3 years. Exploiting the sparsity of the technical-coefficient matrix with a linked-list structure, with 100 direct inputs per product, gives about 10^3 seconds, 17 minutes. They state this says nothing about gathering the data and endorse labour-time calculation supplemented by algorithms that let consumer choice guide allocation.

## Looked for and not found

Stafford Beer's Viable System Model texts (Crossref lists a Beer article of the mid-1980s in the Journal of the Operational Research Society) carried no abstract and no first-party read was possible, so no Beer row is made. No source read reports measured performance of a cybernetic planning system in operation; the Chilean and Soviet projects were not completed.

## What a pooling instrument can do with this

- The Soviet failure is a coordination-of-authority failure, not a compute failure: the record shows 414 uncoordinated systems. An instrument whose accounting is a single shared ledger removes the "who owns the network" dispute by making the ledger a common substrate.
- The feasibility result means clearing and allocation over millions of line items is cheap if the obligation graph is sparse; on-chain cost is then dominated by data entry and verification, not by the solve.
- Glushkov's framing, to control information flows and leave decision rights with members, matches a pool that publishes balances and flows without commanding allocation.
- Cybersyn's design (decentralised management, near real-time monitoring) is a design reference only; it was not completed.
