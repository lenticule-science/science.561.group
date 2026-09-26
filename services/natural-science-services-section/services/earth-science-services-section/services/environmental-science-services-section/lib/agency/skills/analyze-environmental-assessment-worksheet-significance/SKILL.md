---
name: analyze-environmental-assessment-worksheet-significance
description: "Learn how to analyze \u201Cpotential for significant environmental effects\u201D\
  \ under Minnesota Environmental Assessment Worksheet review, using the significance\
  \ criteria in Minnesota Rules chapter 4410 to identify uncertainty, risk, cumulative\
  \ effects, and decision-relevant gaps."
license: CC-BY-4.0
metadata:
  domain: civic-environmental-review
  jurisdiction: Minnesota, USA
  keywords:
  - significance criteria
  - Environmental Assessment Worksheet analysis
  - cumulative effects
  - connected actions
  - uncertainty and risk
  - Minnesota Rules 4410
allowed-tools:
- web.run
- file_search.msearch
- file_search.mclick
requires-capabilities:
  - read
  - path-corpus
  - markdown-search-workbench
  - term-intension
  - read-term-catalog
  - utter
  - articulate
  - predicate
  - posit
  - settle
  - write
---

## Purpose

This skill teaches an agent how to evaluate whether a project “may have the potential for significant environmental effects” at the Environmental Assessment Worksheet stage. The focus is analytical, not advocacy-driven: identifying uncertainty, scale, context, and interactions that matter under Minnesota Rules chapter 4410.

## Core definitions

Use these terms precisely:

- Significance criteria: The factors in Minnesota Rules chapter 4410 used to judge whether environmental effects may be significant.
- Potential effects: Effects that are reasonably foreseeable, including indirect and cumulative effects, not only those asserted as likely.
- Cumulative effects: Environmental effects resulting from incremental impacts of the project in combination with other past, present, or reasonably foreseeable actions.
- Connected actions: Related activities that are functionally or temporally linked to the proposed project.
- Uncertainty: Incomplete information or assumptions that materially affect the assessment of potential effects.

## What “done” looks like

A good completion produces:

1. A structured application of the significance criteria to the project as described.
2. Identification of assumptions and data gaps that affect conclusions.
3. A reasoned discussion of scale, context, and sensitivity of affected resources.
4. Clear articulation of why uncertainty supports further analysis.
5. Outputs that can be directly translated into Environmental Assessment Worksheet comments.

## When to use this skill

Use this skill when a user asks:

- “Does this Environmental Assessment Worksheet show no significant effects?”
- “How do they decide if effects are significant?”
- “What counts as cumulative effects here?”
- “Is uncertainty a reason for an Environmental Impact Statement?”
- “How do I argue that an Environmental Assessment Worksheet is insufficient?”

## Significance analysis model

Always analyze significance using four lenses:

1. Magnitude: How large, intense, or extensive could the effect be?
2. Context: Where and to what resource does the effect occur?
3. Duration and reversibility: How long would effects last, and can they be undone?
4. Probability and uncertainty: How confident are the predictions?

An effect need not be certain to be significant; plausible risk is sufficient.

## Applying the Minnesota significance criteria

Guide the agent to examine, at minimum:

- The type, extent, and reversibility of environmental effects.
- The sensitivity and rarity of affected resources.
- Whether effects are related to other actions or phased development.
- Whether mitigation is proposed, speculative, or enforceable.
- Whether conclusions depend on assumptions not supported by data.

Tie each point explicitly back to the criteria in Minnesota Rules chapter 4410.

## Cumulative and connected effects analysis

Explain that effective analysis:

- Identifies other relevant projects or activities in the same geographic or resource system.
- Evaluates incremental contribution rather than isolating the project.
- Accounts for phased buildout or future expansions that are reasonably foreseeable.
- Avoids treating each permit or phase as independent when functionally linked.

Absence of analysis is itself relevant to significance.

## Role of mitigation in significance

Clarify that mitigation:

- May reduce potential effects but does not erase uncertainty.
- Must be specific and plausible to be credited.
- Cannot be assumed effective without evidence.
- Does not preclude an Environmental Impact Statement if effects may still be significant.

Do not treat proposed mitigation as determinative unless supported.

## Translating analysis into Environmental Assessment Worksheet comments

Guide the agent to convert analysis into comments by:

- Citing the specific significance criterion implicated.
- Identifying the Environmental Assessment Worksheet section at issue.
- Explaining how uncertainty or scale affects the determination.
- Requesting clarification, additional analysis, or recognition of unresolved risk.

Avoid demands for outcomes; focus on the decision threshold.

## Project-specific checklist

When applying this skill to a named project, identify:

- Environmental resources potentially affected.
- Geographic and temporal scope used in the Environmental Assessment Worksheet.
- Other actions relevant to cumulative effects.
- Key assumptions or data gaps.
- How mitigation is described and relied upon.
- Where conclusions about “no significant effects” rest on uncertainty.

## What significance analysis does not do

Be explicit that this analysis:

- Does not require proof of actual harm.
- Does not hinge on public opposition or support.
- Does not replace Environmental Impact Statement-level analysis.
- Does not assume worst-case outcomes without grounding.

## Quality checks and failure modes

Before finalizing an output:

- Confirm each claim is traceable to a significance criterion.
- Distinguish absence of evidence from evidence of absence.
- Avoid conclusory statements without analytical support.
- Ensure the analysis remains relevant to the Environmental Assessment Worksheet decision.

## Reference priorities

Use authoritative sources in this order:

1. Minnesota Rules chapter 4410 significance criteria.
2. Environmental Quality Board guidance on Environmental Assessment Worksheet decisions.
3. Implementing agency environmental review manuals.
4. Project-specific Environmental Assessment Worksheet documents and notices.
