---
title: "Bounded Rationality"
description: "Herbert Simon's concept that real decision-makers operate under cognitive, informational, and time constraints that preclude classical optimization, instead engaging in satisficing — searching the alternative space until a 'good enough' option is found rather than identifying the global optimum."
defines: bounded-rationality
related: [satisficing, organizational-search, dispatch, planning, capability]
contrasts-with: [perfect-rationality, expected-utility-maximization]
date-created: 2026-05-03
references:
  - id: simon1947
    type: document
    title: Administrative Behavior: A Study of Decision-Making Processes in Administrative Organization
    author:
      - literal: Herbert A. Simon
    container-title: Macmillan
    issued:
      - year: 1947
  - id: simon1955
    type: document
    title: A Behavioral Model of Rational Choice
    author:
      - literal: Herbert A. Simon
    container-title: Quarterly Journal of Economics, 69(1)
    issued:
      - year: 1955
  - id: simon1956
    type: document
    title: Rational Choice and the Structure of the Environment
    author:
      - literal: Herbert A. Simon
    container-title: Psychological Review, 63(2)
    issued:
      - year: 1956
  - id: march-simon-1958
    type: document
    title: Organizations
    author:
      - literal: James G. March
      - literal: Herbert A. Simon
    container-title: Wiley
    issued:
      - year: 1958
  - id: cyert-march-1963
    type: document
    title: A Behavioral Theory of the Firm
    author:
      - literal: Richard M. Cyert
      - literal: James G. March
    container-title: Prentice-Hall
    issued:
      - year: 1963
  - id: gigerenzer-2008
    type: document
    title: Bounded Rationality: The Adaptive Toolbox
    author:
      - literal: Gerd Gigerenzer
      - literal: Reinhard Selten (Eds.)
    container-title: MIT Press
    issued:
      - year: 2008
---

**Bounded rationality** is Herbert Simon's concept, formulated in [Administrative Behavior](simon1947) and developed in a series of subsequent papers [simon1955, simon1956], that real decision-makers — individuals and organizations alike — operate under cognitive, informational, and temporal constraints that preclude the optimization assumed in classical economic and decision theory.
Rationality is real but *bounded*; the decision-maker pursues good outcomes within constraints, rather than identifying the globally-optimal outcome a god's-eye view would deliver.

## The three bounds

Simon's analysis identifies three distinguishable constraints on real-world decision-making:

1. **Cognitive bounds** — the decision-maker's brain has finite computational capacity.
  Comparing all alternatives, evaluating all consequences, and computing all expected utilities is not possible for any non-trivial problem.
2. **Informational bounds** — the decision-maker has incomplete information about the alternatives and their consequences.
  The information that is available is often inaccurate, ambiguous, or contested.
3. **Temporal bounds** — decisions must be made in finite time, often under deadlines that preclude extended analysis.
  Even when more analysis would in principle improve the decision, the cost of delay frequently exceeds the value of the additional analysis.

The three bounds are *empirical* facts about real decision-makers, not normative deficiencies.
The classical optimization model is not a description of how decision-making *should* be done corrected by the bounds; it is a model that has no descriptive grip on how decision-making *is* done.
The bounded-rationality program proposes to study decision-making as it actually happens, with the bounds as part of the model from the start.

## Satisficing

The decision-maker's response to bounded rationality is *satisficing* — a portmanteau of *satisfy* and *suffice* that Simon coined.
Rather than seeking the optimal alternative, the satisficing decision-maker:

1. Establishes an *aspiration level* (an outcome that would be "good enough").
2. Searches the alternative space sequentially.
3. Selects the first alternative that meets or exceeds the aspiration level.
4. Adjusts the aspiration level over time based on past outcomes — raising it when satisficing has been easy, lowering it when satisficing has been hard.

Satisficing is not a failure mode of rationality; it is the *form* rationality takes under bounded conditions.
A satisficing decision-maker who finds an acceptable alternative quickly and acts on it may achieve substantially better outcomes than an optimizing decision-maker who exhausts time and energy in a fruitless search for the global maximum.

## At the organizational level

The behavioral theory of organizations developed by March and Simon [march-simon-1958] and Cyert and March [cyert-march-1963] generalized bounded rationality from the individual to the organization.
Organizations engage in *problemistic search* (search triggered by perceived problems, terminated when a workable solution is found), maintain *organizational slack* (resources held in reserve against uncertainty), exhibit *sequential attention to goals* (attending to one goal at a time rather than optimizing a multi-goal utility function), and operate through *standard operating procedures* that economize cognitive effort by routinizing decisions that recur.
Each is a satisficing-style adaptation to the bounds the organization faces.

The framework explains why real organizations do not behave as profit-maximizing rational actors in the neoclassical-economic sense even when their executives have every interest in doing so: the cognitive and informational bounds preclude the optimization, and the organizational machinery is built around satisficing routines that economize on the bounds.

## Reception

Simon's work won the Nobel Prize in Economics in 1978.
The bounded-rationality program has been developed in three major subsequent directions:

- **Behavioral economics** (Kahneman, Tversky, Thaler, Sunstein) — extending the bounded-rationality observation into systematic studies of cognitive bias, heuristics, and the predictable departures from optimization that real decision-makers exhibit.
  Kahneman won the Nobel Prize in 2002.
- **Ecological / fast-and-frugal heuristics** (Gigerenzer, Selten [gigerenzer-2008]) — arguing that the heuristics decision-makers actually use are well-adapted to the environments in which they operate, and that the apparent "biases" the behavioral-economics tradition documents are often genuine adaptations rather than failures.
- **Computational decision theory** — extending bounded rationality through formal models of resource-bounded reasoning, which have become foundational in artificial intelligence and computational cognitive science.

## Distinguished from

- **Perfect rationality** — the classical model bounded rationality replaces.
  Perfect rationality assumes complete information, unlimited computation, and timelessness; bounded rationality assumes none of these.
- **Irrationality** — bounded rationality is not the absence of rationality but its constrained form.
  Bounded-rational decision-makers have reasons for their choices, pursue their goals, and respond to evidence; they simply do so within the bounds.
- **Heuristics-and-biases** — the heuristics-and-biases tradition (Kahneman-Tversky) is *one* development of bounded rationality, focused on systematic departures from optimization.
  The original Simon program was broader: it asked how rationality actually operates under bounds, not only how it fails relative to the optimization standard.
- **Satisficing** (the term, distinct from the concept) — satisficing is the *behavioral strategy* through which bounded rationality is enacted; bounded rationality is the *condition* that motivates satisficing.
  The two are inseparable in Simon's exposition but logically distinguishable.

## Within this library

Bounded rationality is the foundational decision-theoretic concept the [classical-organization-theory-survey](../texts/classical-organization-theory-survey.md) introduces and is the empirical-cognitive substrate against which the predicated-work substrate's [planning](planning.md), [dispatch](dispatch.md), and [delegation](delegation.md) procedures are designed.
The corpus's preference for satisficing-style algorithms over optimization, for sequential decomposition over global search, and for decision-routinization through templates and runbooks reflects bounded-rationality commitments.
