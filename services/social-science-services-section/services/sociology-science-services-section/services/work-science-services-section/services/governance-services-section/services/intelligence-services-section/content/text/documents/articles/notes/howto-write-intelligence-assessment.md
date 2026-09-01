---
name: write-intelligence-assessment
id: write-intelligence-assessment
description: >-
  Write intelligence assessments for the vault — structured analytic products
  that apply the discipline's frameworks to specific events, conflicts, or
  adversary behaviors under conditions of incomplete information.
type: operational
date-created: 2026-03-06
keywords:
  - Writing
part-of: militarism/disciplines/intelligence
region:
  reads: ["content/militarism/disciplines/intelligence/"]
  writes: ["content/militarism/disciplines/intelligence/"]
triggers:
  - "write an intelligence assessment"
  - "draft intelligence analysis"
  - "assess this from an intelligence perspective"
inputs:
  topic: string
  evidence_base: string?
outputs:
  assessment: string
---

# Write Intelligence Assessment

## What you will be able to do

- Write intelligence assessments that distinguish between what is known, what is assessed, and what is assumed.
- Use estimative language precisely: "likely" (>70%), "probable" (55-70%), "possible" (25-55%), "unlikely" (<25%).
- Structure assessments around competing hypotheses rather than a single narrative, identifying what evidence supports and undermines each hypothesis.
- Evaluate source reliability using the discipline's frameworks — distinguishing source access from source credibility, identifying incentive structures that shape reporting.
- Flag analytic vulnerabilities: [mirror-imaging](../../../glossary/terms/mirror-imaging.md), [consistency-seeking](../../../glossary/terms/perception-and-misperception.md), anchoring, and premature closure.
- Write in Plain Technical General American English, maintaining the vault's scholarly but operationally grounded prose style.

## Prerequisites

- Familiarity with the intelligence discipline's [core concepts](../../concepts/index.md), particularly [intelligence failure](../../../glossary/terms/intelligence-failure.md), the [analyst-policymaker relationship](../../../glossary/terms/analyst-policymaker-relationship.md), and [perception and misperception](../../../glossary/terms/perception-and-misperception.md)
- Familiarity with the discipline's [terms](../../terms/index.md), particularly [estimative language](../../../glossary/terms/estimative-language.md), [source reliability](../../../glossary/terms/source-reliability.md), [analysis of competing hypotheses](../../../glossary/terms/analysis-of-competing-hypotheses.md), and the [collection disciplines](../../../glossary/terms/collection-disciplines.md)
- Understanding of the vault's content types: assessments are filed as `type: text` under the relevant analysis subdirectory

## Reference documents

- [The Structural Expectation of Failure](./the-structural-expectation-of-failure.md) — the epistemic constraints on all intelligence assessment
- [Intelligence failure](../../../glossary/terms/intelligence-failure.md) — the recurring patterns that assessments should be designed to resist
- [Estimative language](../../../glossary/terms/estimative-language.md) — the probabilistic vocabulary assessments must use
- [Source reliability](../../../glossary/terms/source-reliability.md) — the framework for evaluating the evidence base
- Existing analyses: [2026 Iran War](../../analyses/2026-iran-war/index.md)

## Assessment structure

### 1. Analytic statement

Begin with what is being assessed and the bottom-line assessment, with explicit confidence level. Example: "We assess with moderate confidence that Iran's Strait of Hormuz closure is intended as economic leverage rather than permanent denial of the waterway." State the confidence level and explain what drives it (volume of evidence, quality of sources, degree of analytic agreement).

### 2. Evidence base

Present the evidence organized by collection discipline. For each piece of evidence, note:
- The collection discipline that produced it (HUMINT, SIGINT, IMINT, OSINT, etc.)
- The source's reliability and access (using the [admiralty system](../../../glossary/terms/source-reliability.md) framework where applicable)
- Whether the evidence supports, undermines, or is ambiguous with respect to the primary hypothesis

### 3. Alternative hypotheses

Present at least two alternative explanations for the observed indicators. For each alternative:
- State the hypothesis clearly
- Identify which evidence supports it
- Explain why it is considered less likely than the primary assessment (or note if it cannot be confidently distinguished)
- Identify what additional collection would resolve the ambiguity

### 4. Analytic confidence and vulnerabilities

Explicitly address:
- **Mirror-imaging risks** — where the assessment projects the analyst's own strategic logic onto the adversary
- **Gaps** — what information is missing and how its absence affects the assessment
- **Assumptions** — what the assessment takes for granted and what would happen if those assumptions proved wrong
- **Key uncertainties** — what the assessment is least confident about and why

### 5. Implications and collection requirements

Conclude with:
- What the assessment means for decision-makers
- What additional collection would improve the assessment
- What indicators to monitor going forward (feeding back into the [I&W](../../../glossary/terms/indications-and-warning.md) process)

## Conventions specific to intelligence assessments

### Epistemic discipline

Never conflate evidence with assessment. "Satellite imagery shows three IRGC fast attack craft repositioned to Bandar Abbas" is evidence. "Iran is preparing to enforce the Hormuz closure with naval assets" is assessment. Keep them separate and make the inferential step explicit.

### Adversary perspective

For every assessment of adversary intent, attempt to articulate the adversary's perspective in terms the adversary would recognize — not in terms that make the adversary's actions legible to the analyst's own strategic culture. This is the discipline's primary defense against mirror-imaging.

### Temporal markers

Intelligence assessments are perishable. Date them explicitly and note the information cutoff. Flag which elements are most likely to change and on what timeline.

## Scope

This skill covers writing intelligence assessments for this vault's analyses section. It does not cover:
- General vault writing style (covered by the Style Guide)
- The intelligence discipline's theoretical frameworks (covered by concepts and terms)
- Research and evidence gathering (covered by **research-intelligence-topic**)
- Lesson or curriculum design about intelligence (covered by **writing-curricula**)

## Verification

You have this skill if you can: (1) write an assessment that uses estimative language correctly and consistently, (2) present competing hypotheses with evidence for and against each, (3) identify your own mirror-imaging risks in the assessment, and (4) distinguish clearly between evidence, assessment, and assumption throughout.
