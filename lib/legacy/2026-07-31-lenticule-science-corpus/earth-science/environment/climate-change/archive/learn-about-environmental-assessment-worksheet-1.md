---
name: learn-about-environmental-assessment-worksheet
id: learn-about-environmental-assessment-worksheet
description: Learn and explain the Environmental Assessment Worksheet process under
  Minnesota environmental review, including when it is required, how it is prepared,
  how public comment works, and how the Responsible Governmental Unit decides whether
  an Environmental Impact Statement is needed.
license: CC-BY-4.0
compatibility:
  agentskills: '>=0.1'
metadata:
  domain: civic-environmental-review
  jurisdiction: Minnesota, USA
  keywords:
  - Environmental Assessment Worksheet
  - Minnesota Rules 4410
  - Responsible Governmental Unit
  - mandatory categories
  - discretionary EAW
  - public comment
allowed-tools:
- web.run
- file_search.msearch
- file_search.mclick
summary: Explain Minnesota's Environmental Assessment Worksheet process, triggers, and outcomes.
runtime:
  invocation: inference
  tool: llm
inputs:
  - name: question
    type: string
    description: Prompt about Environmental Assessment Worksheets
    required: true
  - name: project_context
    type: string
    description: Optional project name or facts to ground the explanation
    required: false
outputs:
  - name: answer
    type: string
    description: Plain-language explanation covering triggers, process, and decisions
type: topic
tags: []
part-of: ecology/disciplines/climate/topics/regional/minnesota
region:
  reads: ["content/ecology/disciplines/climate/topics/regional/minnesota/"]
  writes: ["content/ecology/disciplines/climate/topics/regional/minnesota/"]
---

## Purpose

This skill teaches an agent how to accurately explain and work with the Environmental Assessment Worksheet as Minnesota’s primary environmental review screening document. The emphasis is on clarity about what the Environmental Assessment Worksheet does, what it does not do, and how it fits into real project timelines.

## Core definitions

Use these terms with precision:

- Environmental Assessment Worksheet: A standardized worksheet used to determine whether a project has the potential for significant environmental effects such that an Environmental Impact Statement is required.
- Responsible Governmental Unit: The governmental unit designated to prepare the Environmental Assessment Worksheet, manage the public process, and make the determination on the need for an Environmental Impact Statement.
- Mandatory Environmental Assessment Worksheet: An Environmental Assessment Worksheet required because a project meets a category and threshold listed in Minnesota Rules chapter 4410.
- Discretionary Environmental Assessment Worksheet: An Environmental Assessment Worksheet ordered by a governmental unit based on the potential for significant environmental effects, even if no mandatory category is met.

## What “done” looks like

A good completion produces:

1. A clear explanation of why the Environmental Assessment Worksheet exists and how it functions as a screening step.
2. Correct identification of mandatory versus discretionary triggers under Minnesota Rules chapter 4410.
3. An accurate description of the Environmental Assessment Worksheet content areas and structure.
4. A correct explanation of the public comment period and record.
5. A precise description of the Responsible Governmental Unit’s decision on the need for an Environmental Impact Statement and what that decision means.

## When to use this skill

Use this skill when a user asks:

- “What is an Environmental Assessment Worksheet?”
- “Is an Environmental Assessment Worksheet approval?”
- “When is an Environmental Assessment Worksheet required in Minnesota?”
- “Who prepares the Environmental Assessment Worksheet?”
- “What happens after the Environmental Assessment Worksheet comment period closes?”
- “How does an Environmental Assessment Worksheet lead to or avoid an Environmental Impact Statement?”

## Conceptual model

Explain the Environmental Assessment Worksheet in this sequence:

1. Screening role: The Environmental Assessment Worksheet is designed to identify potential environmental effects, not to fully analyze alternatives or mitigation.
2. Triggering: It is prepared because a project meets a mandatory threshold or because a governmental unit determines discretionary review is warranted.
3. Information gathering: The worksheet compiles project description, environmental setting, potential effects, and proposed mitigation.
4. Public input: A formal public comment period allows agencies and the public to identify concerns, missing information, or potential impacts.
5. Decision point: The Responsible Governmental Unit evaluates the worksheet and comments to decide whether an Environmental Impact Statement is needed.

## Process workflow

### Step 1: Determine why the Environmental Assessment Worksheet exists

Identify whether the Environmental Assessment Worksheet is mandatory or discretionary. Cite the relevant Minnesota Rules chapter 4410 category if mandatory.

### Step 2: Identify the Responsible Governmental Unit

Confirm which unit is designated as the Responsible Governmental Unit and why. Do not assume; verify designation or default assignment rules.

### Step 3: Explain worksheet preparation

Describe who prepares the Environmental Assessment Worksheet, what sources are used, and how the form is structured. Emphasize that it is standardized but project-specific.

### Step 4: Explain public participation

Explain the length and purpose of the public comment period, what kinds of comments are most relevant, and how comments become part of the official record.

### Step 5: Explain the determination

Describe the Responsible Governmental Unit’s decision on the need for an Environmental Impact Statement, including the criteria used and the meaning of “no Environmental Impact Statement needed.”

## What the Environmental Assessment Worksheet does not do

Be explicit that the Environmental Assessment Worksheet:

- Does not approve or deny a project.
- Does not replace permitting or zoning decisions.
- Does not guarantee that no environmental impacts will occur.
- Does not foreclose later regulatory requirements.

## Project-specific checklist

When applying this skill to a named project, identify:

- Project description and location.
- Applicable mandatory categories and thresholds.
- Basis for discretionary review, if applicable.
- Responsible Governmental Unit.
- Environmental Assessment Worksheet publication date.
- Public comment deadline.
- Date of the decision on the need for an Environmental Impact Statement.
- Where the official Environmental Assessment Worksheet record is hosted.

## Quality checks and failure modes

Before finalizing an output:

- Verify all claims about requirements or thresholds against Minnesota Rules chapter 4410.
- Do not conflate Environmental Assessment Worksheet findings with permit approvals.
- Do not treat the absence of comments as evidence of no environmental effects.
- Clearly distinguish facts from unresolved questions.

## Reference priorities

Use authoritative sources in this order:

1. Minnesota Rules chapter 4410.
2. Environmental Quality Board Environmental Assessment Worksheet guidance and forms.
3. Implementing agency environmental review pages.
4. Local Responsible Governmental Unit materials for project context only.
