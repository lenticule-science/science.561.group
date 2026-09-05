---
aliases:
  - QF
  - liberal radicalism
description: Quadratic funding allocates a shared matching pool among projects so that each project's total funding equals the square of the sum of the square roots of its individual contributions.
identity: quadratic-funding
name: Quadratic funding
provenance:
  date-created: 2026-09-05
references:
  buterin2019:
    authors:
      - Vitalik Buterin
      - Zoë Hitzig
      - E. Glen Weyl
    title: A Flexible Design for Funding Public Goods
    year: 2019
    publication: Management Science 65(11)
    doi: 10.1287/mnsc.2019.3337
---
Quadratic funding allocates a shared matching pool among projects so that each project's total funding equals the square of the sum of the square roots of its individual contributions. Buterin, Hitzig, and Weyl derive it as the mechanism that funds each public good at the level where the marginal benefit summed across its contributors equals its marginal cost, under quasilinear utility and independent private values; the difference between the funded amount and the sum of contributions is paid from the matching pool ([Buterin 2019](../../documents/articles/bibliographies/buterin2019.md)).

It differs from one-person-one-vote in that contributions carry weight, and from capital-weighted allocation in that many small contributors outweigh one large contributor of the same total. Both extremes are lawful rules for a cycle distribution, and Breadchain's fixed-equal share plus vote-weighted share is a third; quadratic funding is the one with an efficiency argument behind it ([Buterin 2019](../../documents/articles/bibliographies/buterin2019.md)).

The mechanism is only as sound as its identities, since one person contributing under many names or several colluding can capture the pool, so a membership boundary is a precondition of using it and not an afterthought. The paper says so itself, and every deployed instance has added identity or reputation constraints the paper does not supply ([Buterin 2019](../../documents/articles/bibliographies/buterin2019.md)). For a pool whose pot is its members' directed yield, the admission record that already bounds the [common-pool resource](../../../../../economics-science-services-section/content/text/glossary/terms/common-pool-resource.md) is that identity constraint, and the contribution that carries weight is a member's directed yield in the cycle.
