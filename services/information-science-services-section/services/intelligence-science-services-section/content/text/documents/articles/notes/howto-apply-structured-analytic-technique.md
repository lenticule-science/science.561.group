---
name: apply-structured-analytic-technique
id: apply-structured-analytic-technique
description: >-
  Apply a structured analytic technique (key assumptions check, analysis of
  competing hypotheses, red teaming, or indicators validation) to an existing
  intelligence assessment or to a situation requiring analysis, producing a
  structured output that surfaces what the initial assessment may have missed.
type: operational
date-created: 2026-03-06
keywords:
  - analysis
part-of: militarism/disciplines/intelligence
region:
  reads: ["content/militarism/disciplines/intelligence/"]
  writes: ["content/militarism/disciplines/intelligence/"]
triggers:
  - "apply a structured analytic technique"
  - "run a key assumptions check"
  - "do an ACH analysis"
  - "red team this assessment"
  - "check the assumptions"
inputs:
  technique: string
  target_assessment: string
  context: string?
outputs:
  structured_output: string
title: apply-structured-analytic-technique
---

# Apply Structured Analytic Technique

## What you will be able to do

- Select the appropriate structured analytic technique for a given analytic problem
- Apply key assumptions check (KAC), analysis of competing hypotheses (ACH), red teaming, or indicators validation systematically
- Produce structured outputs that identify what the initial assessment may have missed, overlooked, or assumed without evidence
- Integrate the technique's findings back into the assessment as refinements, caveats, or alternative readings

## Prerequisites

- Completion of the [structured analytic techniques curriculum](./structured-analytic-techniques.md)
- Familiarity with [perception and misperception](../../../glossary/terms/perception-and-misperception.md) — the cognitive biases the techniques are designed to mitigate
- Familiarity with the [write-intelligence-assessment](../../../../../../../../../../../content/text/triage/sociological-agential-semioverse-repository/enrich-sociological-content/skill.md) skill — the assessment format the technique's output feeds back into

## Technique selection

| Problem | Technique | Output |
|---------|-----------|--------|
| "What are we taking for granted?" | Key assumptions check | List of assumptions with evidence evaluation |
| "What else could explain this?" | ACH | Hypothesis matrix with evidence consistency ratings |
| "What would the adversary do?" | Red teaming | Adversary-perspective assessment of vulnerabilities |
| "Are we watching the right things?" | Indicators validation | Revised indicator list with diagnostic value assessment |

## Application procedure

### Key assumptions check

1. State the assessment's conclusion
2. List every assumption the conclusion depends on (including assumptions about adversary rationality, institutional behavior, evidence reliability)
3. For each assumption, evaluate: What evidence supports it? Is the evidence independent of the assumption? What would happen if it were false?
4. Identify the most consequential assumptions — those whose falsification would most change the assessment
5. Recommend monitoring requirements for the most consequential assumptions

### Analysis of competing hypotheses

1. List all reasonable hypotheses (minimum three, including at least one that the analyst considers unlikely)
2. List all significant evidence and arguments
3. For each evidence-hypothesis pair, rate consistency: consistent (C), inconsistent (I), or not applicable (N/A)
4. Focus on inconsistencies — the hypothesis with the fewest inconsistencies is diagnostically preferred
5. Assess sensitivity: would removing any single piece of evidence change the ranking?
6. Identify what evidence would decisively distinguish between the top hypotheses

### Red teaming

1. Adopt the adversary's perspective — their information, their capabilities, their objectives, their constraints
2. Identify vulnerabilities in the assessed side's plan, posture, or assumptions
3. Generate adversary courses of action that exploit identified vulnerabilities
4. Assess which courses of action are most likely given the adversary's actual (not assumed) constraints
5. Recommend mitigations for the most consequential vulnerabilities

### Indicators validation

1. List the indicators currently being monitored
2. For each indicator, assess: Is it diagnostic (does it distinguish between hypotheses) or merely consistent (does it fit the expected pattern without ruling out alternatives)?
3. Identify missing indicators — observable events that would be diagnostic but are not currently monitored
4. Recommend collection requirements for missing diagnostic indicators
5. Assess whether the current indicator set would provide timely warning or only retrospective confirmation

## Quality standards

- The technique's output must add analytic value beyond what the initial assessment already contains
- Assumptions surfaced must be genuinely unstated (not restating the assessment's explicit caveats)
- Alternative hypotheses must be genuinely alternative (not strawmen designed to be easily dismissed)
- Red team perspectives must reflect the adversary's actual strategic culture, not the analyst's projection
- All outputs must use [estimative language](../../../glossary/terms/estimative-language.md) correctly

## Scope

This skill covers the application of structured techniques to existing or developing intelligence assessments. It does not cover:
- Writing the initial assessment (covered by **write-intelligence-assessment**)
- Gathering the evidence base (covered by **research-intelligence-topic**)
- The theoretical foundations of the techniques (covered by the [structured analytic techniques curriculum](./structured-analytic-techniques.md))

## Verification

You have this skill if you can: (1) select the appropriate technique for a given analytic problem, (2) apply it to produce findings that genuinely extend or challenge the initial assessment, (3) avoid common pitfalls (strawman hypotheses, projective red teaming, assumption lists that merely restate the assessment), and (4) integrate the technique's findings back into a refined assessment.
