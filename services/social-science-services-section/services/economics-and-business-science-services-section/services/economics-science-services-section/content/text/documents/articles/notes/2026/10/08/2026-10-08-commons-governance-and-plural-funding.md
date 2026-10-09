---
title: "Commons Governance and Plural Funding"
description: "Tests of Ostrom design principles, the quadratic funding formula and collusion resistance, the Gitcoin deployment of connection-oriented funding, and futarchy"
date-created: 2026-10-08
aliases: []
keywords:
  - commons
  - Ostrom
  - quadratic-funding
  - plurality
  - futarchy
teaches:
  - "Commons Governance and Plural Funding"
authors:
  - claude-sonnet-5-5
type: text
references:
  cox2010:
    authors:
      - Michael Cox
      - Gwen Arnold
      - Sergio Villamayor Tomás
    title: A review of design principles for community-based natural resource management
    year: 2010
    publication: Ecology and Society 15(4):38
    url: https://www.ecologyandsociety.org/vol15/iss4/art38/
  buterin2019:
    authors:
      - Vitalik Buterin
      - Zoë Hitzig
      - E. Glen Weyl
    title: A flexible design for funding public goods
    year: 2019
    publication: Management Science
    doi: 10.1287/mnsc.2019.3337
    url: https://doi.org/10.1287/mnsc.2019.3337
  pasquini2022:
    authors:
      - Ricardo A. Pasquini
    title: Optimal allocation of limited funds in quadratic funding
    year: 2022
    publication: arXiv:2207.14775
    url: https://arxiv.org/abs/2207.14775
  miller2023:
    authors:
      - Joel Miller
    title: Collusion resistance and plurality in quadratic mechanisms (paper summary)
    year: 2023
    publication: Ethereum Research
    url: https://ethresear.ch/t/collusion-resistance-and-plurality-in-quadratic-mechanisms-paper-summary/14545
  miller2025:
    authors:
      - Joel Miller
      - E. Glen Weyl
      - Chris Kanich
    title: "Fair decisions through plurality: results from a crowdfunding platform"
    year: 2025
    publication: EAAMO 2025
    doi: 10.1145/3757887.3763019
    url: https://arxiv.org/abs/2509.18343
  hanson2013:
    authors:
      - Robin Hanson
    title: Shall we vote on values, but bet on beliefs?
    year: 2013
    publication: Journal of Political Philosophy
    doi: 10.1111/jopp.12008
    url: https://doi.org/10.1111/jopp.12008
---

This note records what the sources establish about the empirical standing of Ostrom's design principles, about quadratic and plural funding (formula, collusion resistance, the one large operating deployment), and about futarchy. House background: [common-pool-resource](../../../../../../glossary/terms/common-pool-resource.md), [quadratic-funding](../../../../../../glossary/terms/quadratic-funding.md), [crowdstaking](../../../../../../glossary/terms/crowdstaking.md), [commons-based-peer-production](../../../../../../glossary/terms/commons-based-peer-production.md), [free-riding](../../../../../../../../../finance-science-services-section/content/text/glossary/terms/free-riding.md), [interpretive-debt](../../../../../../../../../../../sociology-science-services-section/services/cybernetic-postliberalism-services-section/content/text/glossary/terms/interpretive-debt.md).

## Ostrom's design principles and their tests

Cox et al. 2010 (full text) analysed 91 studies, with 77 cases coded, that explicitly or implicitly evaluated Ostrom's eight design principles for managing common-pool resources. They found the principles well supported empirically: the mean support score across the 91 studies was 3.73, slightly below the value for moderately supportive, and each principle had at least twice as many supportive as unsupportive cases. The nested-enterprises principle was only moderately supported and significant at the 10 percent level, not the 5 percent level. The authors reformulate the principles, separating user boundaries from resource boundaries and congruence with local conditions, and keep monitoring, collective choice, graduated sanctions, conflict resolution and nested enterprises. Governing the Commons itself was not reachable and Graeber's text on interpretive labor from the anthropology journal HAU returned HTTP 403 and a bot check; no rows are made for them.

## Quadratic funding

Buterin et al. 2019 (full text) propose that a project's funding is proportional to the square of the sum of the square roots of contributions, which under the standard model gives first-best public goods provision. The capital-constrained variant mixes a fraction alpha of the quadratic rule with (1 minus alpha) of unmatched private contributions, so alpha can be tuned so that a given budget is not exceeded. Gitcoin used the capital-constrained mechanism to dedicate 25,000 dollars to open source software in early 2019. Pasquini 2022 (abstract) shows that a variant distributing only the matching pool achieves a socially optimal allocation of limited funds.

## Collusion and plurality

Miller 2023 (an author summary post; the SSRN paper was not read) defines collusion resistance as diminishing returns for individual agents, for groups and for adding members: external matching must grow as the square root of what an agent or group contributes. Plain cluster match lacks the first two, pairwise discounting lacks the third, offset match can eat a donation entirely. Connection-Oriented Cluster Match combines pairwise discounting and cluster match to satisfy all three, and Eigen Match calibrates funding with eigenvectors of the social graph adjacency matrix. The analysis assumes accurate knowledge of group memberships.

Miller et al. 2025 (full text) is the operating evidence. At Gitcoin, with fixed subsidy pools of usually 50,000 to 200,000 dollars per round, Connection-Oriented Quadratic Funding was adopted in 89 percent of the platform's grant-awarding ventures over one and a half years and distributed just over 4 million dollars; in simulation it gives better social welfare than plain QF. Interviews with eight non-employee round managers found plain QF results exceedingly flat and unclear in how good projects were prioritised, and one manager felt the new algorithm reduced the effect of basic fraud and Sybil patterns, though it was not designed for that.

## Futarchy

Hanson 2013 (full text) proposes that representatives define a measure of national welfare and conditional markets on adopting or not adopting each proposed policy decide: when markets clearly estimate an increase, the policy becomes law. He argues manipulators are noise traders and do not reduce average price accuracy (verified in theory, laboratory and field), and that a market that influences policy cannot be thin. He states the paper offers no formal model and no statistical analysis; no operating futarchy is measured in the source.

## What a pooling instrument can do with this

- Cox's findings support an instrument built on Ostrom's principles as a checklist, with the weakest-evidenced one (nested enterprises) treated as a design hypothesis rather than a settled rule.
- The capital-constrained formula gives a closed-form way to run a matching pool against a fixed budget; alpha is the single dial between quadratic and private funding.
- Plain QF's flat results and Sybil exposure are documented in operation; the one deployed fix is connection-oriented clustering over group information, so any QF-style match in a pool needs a cluster or connection graph as input data.
- Futarchy has no measured deployment in these sources, so a pool using conditional markets for parameter changes would be unevidenced.
