---
name: conduct-scenario-analysis
id: conduct-scenario-analysis
description: >-
  Conduct scenario analysis for an intelligence problem — generating a cone of
  plausible futures, identifying the indicators that distinguish between
  scenarios, and deriving the collection requirements each scenario demands.
type: operational
date-created: 2026-03-06
keywords:
  - analysis
part-of: militarism/disciplines/intelligence
region:
  reads: ["content/militarism/disciplines/intelligence/"]
  writes: ["content/militarism/disciplines/intelligence/"]
triggers:
  - "conduct scenario analysis"
  - "what could happen next"
  - "generate scenarios"
  - "cone of plausibility"
  - "wargame this situation"
inputs:
  situation: string
  key_actors: string?
  time_horizon: string?
  context: string?
outputs:
  scenario_set: string
title: conduct-scenario-analysis
---

# Conduct Scenario Analysis

## What you will be able to do

- Generate a structured set of plausible scenarios (baseline, best-case, worst-case, wild-card) for a given intelligence problem
- Identify the key variables that distinguish between scenarios
- Derive the diagnostic indicators that would signal which scenario is materializing
- Produce collection requirements for monitoring each scenario's indicators
- Integrate scenario findings with existing assessments as temporal extensions

## Prerequisites

- Familiarity with [structured analytic techniques](./structured-analytic-techniques.md) — scenario analysis extends SATs into the temporal dimension
- Familiarity with [indications and warning](../../../glossary/terms/indications-and-warning.md) — the I&W framework that scenario indicators feed into
- Familiarity with [key assumptions check](../../../glossary/terms/key-assumptions-check.md) — each scenario's logic rests on assumptions that should be surfaced
- Understanding of [constraint-based reasoning](../../../glossary/terms/constraint-based-reasoning.md) — constraints bound the cone of plausible futures

## When to use this technique

Scenario analysis is most productive when:
- The situation is dynamic and the intelligence question is temporal ("what happens next?" not "what is happening now?")
- Multiple plausible outcomes exist and the intelligence consumer needs to prepare for more than one
- The key variables are identifiable but their values are uncertain
- The intelligence system needs to pre-position collection for contingencies

It is less useful for static assessments, for situations where a single outcome is overwhelmingly likely, or for questions that require precise prediction rather than bounded exploration.

## Application procedure

### 1. Define the scenario space

Identify the key variables that will determine the situation's trajectory. These should be:
- **Independent.** Each variable should vary independently of the others (if two variables always move together, they are one variable).
- **Consequential.** Changes in the variable should produce meaningfully different outcomes.
- **Observable.** The variable's value should be potentially knowable through collection, even if it is not currently known.

For a conflict scenario, typical key variables include: adversary leadership stability, escalation trajectory, allied coalition cohesion, domestic political sustainability, economic sustainability, third-party intervention.

### 2. Generate the scenario set

Produce at minimum four scenarios:

| Scenario | Function | Common pitfall |
|----------|----------|----------------|
| **Baseline** | The most likely trajectory given current trends | Overconfidence — treating the baseline as the prediction |
| **Best-case** | The trajectory where key variables resolve favorably | Wishful thinking — constructing a scenario that is desirable rather than plausible |
| **Worst-case** | The trajectory where key variables resolve unfavorably | Timidity — constructing a "worst case" that is merely unpleasant rather than genuinely adverse |
| **Wild-card** | A low-probability, high-impact trajectory that current analysis does not anticipate | Neglect — treating the wild card as too unlikely to merit analysis |

Each scenario must be:
- **Internally consistent.** The scenario's elements must be compatible with each other.
- **Plausible.** Within the bounds of constraint analysis — the scenario must not require the adversary to do things the adversary cannot do.
- **Specific enough to generate indicators.** "Things get worse" is not a scenario. "The IRGC consolidates under Commander X, accelerates Hormuz mining, and activates the full proxy network within 14 days" is a scenario.
- **Complete.** Dhami et al. find that scenarios tend to be coherent but incomplete — analysts produce neat stories that omit relevant factors. Explicitly check for completeness: does the scenario account for economic effects, domestic political dynamics, third-party responses, and second-order consequences?

### 3. Identify distinguishing indicators

For each pair of scenarios, ask: *what observable event would indicate that Scenario A rather than Scenario B is materializing?* These are diagnostic indicators — events that distinguish between alternatives rather than merely confirming expectations.

Good indicators are:
- **Diagnostic.** They distinguish between scenarios, not merely confirm that the situation is evolving.
- **Observable.** They can be detected through existing or obtainable collection.
- **Timely.** They appear early enough to be actionable — an indicator that is only visible after the scenario has fully materialized is retrospective, not diagnostic.

### 4. Derive collection requirements

Each scenario generates intelligence questions that require collection. For each scenario:
- What information would the intelligence system need to detect this scenario early?
- What collection capabilities are required? Are they currently available?
- What gaps exist between the collection architecture and the scenario's indicator requirements?

### 5. Produce the output

The scenario analysis output should include:
1. The scenario set (4+ scenarios with narrative descriptions)
2. Key variables and their assumed values in each scenario
3. Diagnostic indicator matrix (which indicators distinguish which scenarios)
4. Collection requirements by scenario
5. Timeline — when would each scenario's indicators first become visible?
6. Assumptions — what must be true for each scenario to be plausible? (Link to [key assumptions check](../../../glossary/terms/key-assumptions-check.md))

## Integration with other techniques

| Technique | How it integrates with scenario analysis |
|-----------|----------------------------------------|
| Key assumptions check | Each scenario rests on assumptions — surface and evaluate them |
| ACH | Scenarios generate competing hypotheses that ACH can evaluate against evidence |
| Constraint-based reasoning | Constraints bound the scenario space — scenarios outside the constraint envelope are implausible |
| Legibility analysis | Scenarios should include at least one that operates outside the analyst's legible categories |
| Red teaming | The adversary-perspective scenario can be generated through red team exercise |

## Quality standards

- All scenarios must be plausible within constraint analysis bounds
- The wild-card scenario must be genuinely challenging, not a token inclusion
- Indicators must be diagnostic, not merely confirmatory
- The analysis must resist the bias toward coherence over completeness
- Assumptions must be explicit and linked to evidence evaluation
- The scenario set must include at least one scenario the analyst considers unlikely — scenario analysis is designed to prepare for surprise, not to confirm expectations

## Scope

This skill covers the generation and analysis of plausible future scenarios for intelligence problems. It does not cover:
- Formal wargaming with multiple human participants (a different skill requiring facilitation expertise)
- Quantitative simulation or agent-based modeling
- Writing the assessment that incorporates scenario findings (covered by **write-intelligence-assessment**)

## Verification

You have this skill if you can: (1) generate a scenario set that is internally consistent, complete, and bounded by constraint analysis, (2) identify diagnostic indicators that distinguish between scenarios rather than merely confirming the baseline, (3) derive collection requirements that would enable early detection of each scenario, and (4) resist the common pitfalls of coherence bias, baseline overconfidence, and wild-card neglect.
