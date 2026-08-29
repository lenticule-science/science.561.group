---
name: apply-critical-framework
id: apply-critical-framework
description: >-
  Apply a critical theoretical framework — strategic culture analysis,
  necropolitics, reflexive control, or other cross-disciplinary lens — to an
  intelligence assessment to surface structural dynamics that the discipline's
  standard analytical methods do not capture.
type: operational
date-created: 2026-03-06
keywords:
  - Analysis
part-of: militarism/disciplines/intelligence
region:
  reads: ["content/militarism/disciplines/intelligence/", "content/sociology/", "content/philosophy/"]
  writes: ["content/militarism/disciplines/intelligence/"]
triggers:
  - "apply a critical framework"
  - "apply necropolitics"
  - "apply strategic culture analysis"
  - "apply reflexive control"
  - "what structural dynamics are we missing"
  - "reframe this analysis"
inputs:
  framework: string
  target_assessment: string
  context: string?
outputs:
  reframed_analysis: string
---

# Apply Critical Framework

## What you will be able to do

- Select a critical theoretical framework appropriate to the analytical gap in an intelligence assessment
- Apply the framework to surface structural dynamics — power relations, cultural logics, epistemic conditions — that standard intelligence methods do not capture
- Produce findings that extend or challenge the assessment's conclusions without replacing its empirical content
- Avoid the common pitfalls of critical analysis in an intelligence context: moralization, essentialism, unfalsifiability

## Prerequisites

- Familiarity with at least two of the available frameworks (see below)
- Familiarity with [mirror-imaging](../../../glossary/terms/mirror-imaging.md) — the bias most critical frameworks are designed to interrupt
- Familiarity with the [write-intelligence-assessment](../../../../../../../../../../sociology-services-section/content/text/triage/sociological-agential-semioverse-repository/enrich-sociological-content/skill.md) skill — the product format the framework's findings must integrate with

## Available frameworks

| Framework | Core question | Best applied when |
|-----------|--------------|-------------------|
| [Strategic culture analysis](../../../glossary/terms/strategic-culture-analysis.md) | How does the adversary's cultural logic differ from the analyst's? | The assessment assumes the adversary calculates in the same terms as the analyst |
| [Necropolitics](../../../../../../../../../../critical-theory-services-section/services/abolition-services-section/services/state-repression-services-section/content/text/glossary/terms/necropolitics.md) | Who has the power to determine who is exposed to death, and what are the strategic effects of that asymmetry? | The assessment involves targeted killing, sovereignty claims, or differential exposure of populations to harm |
| [Reflexive control](../../../glossary/terms/reflexive-control.md) | Is the adversary shaping the information environment to make the analyst's "correct" assessment produce the adversary's desired outcome? | The assessment relies on information the adversary may have intended the analyst to receive |
| [Intelligence as legibility](../../../glossary/terms/intelligence-as-legibility.md) | What does the analyst's representation of the adversary systematically exclude? | The assessment relies on categories (target sets, orders of battle, network diagrams) that simplify a complex adversary |

## Application procedure

### 1. Identify the analytical gap

Before selecting a framework, identify what the assessment does not explain or what its conclusions depend on without examining:

- **Unexplained adversary behavior.** The adversary acted in a way the assessment's model did not predict.
- **Unstated assumptions about the adversary.** The assessment assumes the adversary is rational, fragile, deterrable, or otherwise describable in terms the analyst's own system generates.
- **Structural features taken as given.** The assessment treats power asymmetries, sovereign authorities, or information flows as background rather than as dynamics that produce strategic effects.

### 2. Select the framework

Match the gap to the framework that addresses it. A framework is appropriate if it provides categories that the assessment lacks and if those categories are consequential for the assessment's key judgments.

Do not apply frameworks that do not address a gap. Critical analysis for its own sake produces noise, not insight.

### 3. Apply the framework

Each framework has a distinct analytical procedure:

**Strategic culture analysis:**
1. Identify the cultural elements (revolutionary identity, martyrdom, strategic patience, historical narrative) that shape the adversary's decision logic
2. Specify how these elements cause the adversary to weigh costs and benefits differently than the analyst's model assumes
3. Identify the specific judgments in the assessment that would change if the adversary's cultural logic replaced the analyst's assumed logic
4. Caveat: guard against essentialism — strategic culture is one input, not a deterministic model

**Necropolitical analysis:**
1. Map the sovereign asymmetry — who can designate whom for death, and what infrastructure enables the designation
2. Identify how the asymmetry shapes the adversary's counter-strategy (contesting the distribution of death)
3. Examine how the intelligence apparatus participates in the production and maintenance of the asymmetry
4. Assess whether the assessment's predictions account for the strategic effects of sovereign asymmetry

**Reflexive control analysis:**
1. Ask whether the adversary could have intended the analyst to reach the assessment's conclusions
2. Identify the information the assessment relies on and whether any of it could have been shaped by the adversary
3. Evaluate whether "correct" analysis might produce the adversary's desired decision
4. Caveat: apply the [Angletonian wilding](../../../glossary/terms/angletonian-wilding.md) check — reflexive control analysis can become paranoia if every piece of information is treated as potentially shaped

**Legibility analysis:**
See the dedicated [apply-legibility-analysis](../../../../../../../../../../sociology-services-section/content/text/triage/sociological-agential-semioverse-repository/enrich-sociological-content/skill.md) skill.

### 4. Produce findings

The output should specify:
- What the framework reveals that the standard assessment does not
- Whether the framework's findings change the assessment's key judgments, or add caveats and alternative readings
- What collection or analytic requirements the framework generates
- The framework's own limitations and the conditions under which its findings would not apply

### 5. Integrate

The framework's findings do not replace the empirical content of the assessment. They extend it by revealing structural dynamics the standard methods do not capture. The integration should:
- Preserve the original assessment's evidence base
- Add the framework's findings as an additional analytic layer
- Identify where the framework contradicts the assessment's conclusions and flag these as contested judgments
- Use [estimative language](../../../glossary/terms/estimative-language.md) for the framework's findings, as for any other analytic judgment

## Quality standards

- The framework must address a specific analytical gap, not merely provide an alternative vocabulary
- Findings must be assessable against evidence, not unfalsifiable claims about structural conditions
- The analysis must avoid moralization — the question is not "is this good?" but "what does this explain that the standard analysis does not?"
- Essentialism warnings must be included when applying cultural frameworks
- Angletonian wilding checks must be included when applying reflexive control

## Scope

This skill covers the application of cross-disciplinary critical frameworks to intelligence assessments. It does not cover:
- The theoretical content of the frameworks themselves (covered by their respective concept files)
- The initial assessment (covered by **write-intelligence-assessment**)
- The research that supports the framework's application (covered by **research-intelligence-topic**)

## Verification

You have this skill if you can: (1) identify a specific analytical gap that a critical framework addresses, (2) apply the framework to produce findings that extend the assessment's empirical content rather than replacing it, (3) avoid moralization, essentialism, and unfalsifiable claims, and (4) integrate the framework's findings with the standard assessment in a way that adds analytic value.
