---
description: The condition under which the time average of an observable computed along one trajectory equals its expectation over the ensemble of possible trajectories at a fixed time; wealth growth generally lacks it.
identity: ergodicity
name: Ergodicity
date-created: 2026-09-02
references:
  peters2019:
    authors:
      - Ole Peters
    title: The ergodicity problem in economics
    year: 2019
    publication: Nature Physics
    doi: 10.1038/s41567-019-0732-0
  peters2016:
    authors:
      - Ole Peters
      - Murray Gell-Mann
    title: Evaluating gambles using dynamics
    year: 2016
    publication: "Chaos: An Interdisciplinary Journal of Nonlinear Science 26"
---
Ergodicity, in the sense Ole Peters brings to economics, is the condition under which the time average of an observable, computed along one trajectory, equals its expectation over the ensemble of possible trajectories at a fixed time. Peters (2019) argues that economics has conventionally computed the ensemble average of a gamble — its expected value — and treated that quantity as a guide to what happens to an individual who repeats the gamble over time. That equivalence holds for additive processes; it generally fails for the multiplicative processes that describe wealth, because a single ruinous draw can end the trajectory that the ensemble average continues to smooth over.

This economic sense of ergodicity is a property of one designated observable under one specified dynamic — whether its time average and ensemble average coincide — not, as in the dynamical-systems sense already carried at [ergodic](../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/ergodic.md), a property of a system's trajectories sampling the whole of a state space.

The consequence, developed with Gell-Mann (Peters & Gell-Mann, 2016), is that an agent who wants to know what happens to them over time should optimize the time-average growth rate of wealth rather than its expected value — growth-rate optimization that recovers the [Kelly criterion](../../../../../finance-science-services-section/content/text/glossary/terms/kelly-criterion.md) — and that a wealth process with an [absorbing barrier](../../../../../finance-science-services-section/content/text/glossary/terms/absorbing-barrier.md), such as ruin, is non-ergodic by construction: no later draw can average away a trajectory that has already ended.
