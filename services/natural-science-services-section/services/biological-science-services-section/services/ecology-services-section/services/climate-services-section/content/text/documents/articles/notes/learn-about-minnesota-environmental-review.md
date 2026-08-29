---
name: learn-about-minnesota-environmental-review
id: learn-about-minnesota-environmental-review
description: "Learn and explain Minnesota\u2019s environmental review system (Minnesota\
  \ Statutes chapter 116D and Minnesota Rules chapter 4410), including Environmental\
  \ Assessment Worksheet, Environmental Impact Statement, Responsible Governmental\
  \ Unit roles, thresholds, timelines, and public participation."
license: CC-BY-4.0
compatibility:
  agentskills: '>=0.1'
metadata:
  domain: civic-environmental-review
  jurisdiction: Minnesota, USA
  keywords:
  - Minnesota Environmental Quality Board
  - Minnesota Rules 4410
  - Minnesota Statutes 116D
  - Environmental Assessment Worksheet
  - Environmental Impact Statement
  - Responsible Governmental Unit
  - public comment
  - petition
allowed-tools:
- web.run
- file_search.msearch
- file_search.mclick
summary: Explain Minnesota's environmental review framework, roles, and documents.
runtime:
  invocation: inference
  tool: llm
inputs:
  - name: question
    type: string
    description: Prompt about Minnesota environmental review
    required: true
  - name: project_context
    type: string
    description: Optional project or agency context to tailor the explanation
    required: false
outputs:
  - name: answer
    type: string
    description: Overview of statutory basis, RGU roles, documents, and timelines
type: topic
tags: []
part-of: ecology/disciplines/climate/topics/regional/minnesota
region:
  reads: ["content/ecology/disciplines/climate/topics/regional/minnesota/"]
  writes: ["content/ecology/disciplines/climate/topics/regional/minnesota/"]
---

## Purpose

This skill teaches an agent how to accurately orient itself in Minnesota’s environmental review framework: what review documents exist, when they are triggered, who is responsible, what decisions are made, and how the public can participate.

This skill is for explanations, learning, and orientation. It is not legal advice, and it does not replace reading Minnesota Rules chapter 4410 or a project’s official record.

## Definitions to use consistently

Use these terms with the following meanings (spell out on first use, then you may use the short name):

- Environmental Assessment Worksheet: A screening document used to decide whether an Environmental Impact Statement is needed.
- Environmental Impact Statement: A detailed analysis used when a project has the potential for significant environmental effects; includes scoping and analysis of alternatives and mitigation.
- Responsible Governmental Unit: The governmental unit designated to prepare the environmental review document and make the “need for Environmental Impact Statement” decision (for the Environmental Assessment Worksheet path).
- Environmental Quality Board: The state body that maintains the rules, forms, and guidance, and administers petition routing/designation processes.

## What “done” looks like

A good completion produces:

1. A short, correct conceptual map: Environmental Assessment Worksheet vs Environmental Impact Statement, and how a decision moves a project from one to the other.
2. Correct rule anchors: Minnesota Rules chapter 4410 sections relevant to the question (for example, Environmental Assessment Worksheet comment period; decision on need for Environmental Impact Statement; scoping).
3. Correct governance anchors: how a Responsible Governmental Unit is designated and what it must do.
4. A participation map: how to comment, and how petitions work (when relevant).
5. A list of “unknowns to look up” for any specific project: project category thresholds, current Responsible Governmental Unit, current stage, and current deadlines.

## When to use this skill

Use this skill when a user asks:

- “What is an Environmental Assessment Worksheet / Environmental Impact Statement?”
- “When is an Environmental Impact Statement required?”
- “Who decides if we need an Environmental Impact Statement?”
- “How do I participate or comment?”
- “What do Minnesota Rules chapter 4410 say about [topic]?”
- “What does it mean that a project is in Environmental Assessment Worksheet review?”

## Core workflow

### Step 1: Identify the user’s intent

Classify the request as one of:

- Orientation: explain concepts and relationships.
- Process: explain steps/timelines/decision points.
- Thresholds: determine whether a category triggers mandatory Environmental Assessment Worksheet / Environmental Impact Statement.
- Participation: how to comment, petition, and what to include.
- Project-specific: identify the Responsible Governmental Unit, current documents, and deadlines.

### Step 2: Use authoritative sources first

Use `web.run` and prioritize, in order:

1. Minnesota Revisor of Statutes: Minnesota Rules chapter 4410 text.
2. Minnesota Environmental Quality Board pages (guidance and participation).
3. Implementing agency pages (for example Minnesota Pollution Control Agency, Minnesota Department of Natural Resources, Minnesota Department of Transportation) for how they apply the rules in practice.
4. Local Responsible Governmental Unit pages only as supplements (helpful for “what our city says,” not to override the rules).

### Step 3: Build the explanation from the rule structure

Explain in this order:

1. The legal “why”: Minnesota’s environmental review exists to evaluate potential environmental effects before approvals and permitting decisions.
2. The two main document types: Environmental Assessment Worksheet (screening) and Environmental Impact Statement (detailed).
3. The decision hinge: Environmental Assessment Worksheet leads to a Responsible Governmental Unit determination on whether an Environmental Impact Statement is needed, using criteria in Minnesota Rules chapter 4410.
4. Public participation: comment periods; petitions (when relevant).
5. What the documents do not do: they inform decision-making; they do not themselves permit or veto the project.

### Step 4: If project-specific, produce a “project lookup checklist”

For any named project, list what must be verified:

- Proposed action and location.
- Applicable mandatory categories and thresholds in Minnesota Rules chapter 4410.
- Whether exemptions apply.
- Responsible Governmental Unit identity.
- Current document stage (Environmental Assessment Worksheet publication, comment period dates, decision date; or Environmental Impact Statement scoping/draft/final).
- Where the official record is hosted.
- Any connected actions/phasing that may affect review scope.

### Step 5: Produce outputs in one of these templates

Use one of the following formats (choose based on user intent):

- One-paragraph explainer + “how the decision works” paragraph + “how to participate” paragraph.
- A short glossary (only if the user is new to the topic).
- A rule-anchored outline (for writers/educators).
- A project engagement brief (Responsible Governmental Unit, stage, deadlines, how to comment, key issues to ask about).

## Quality checks and failure modes

Before finalizing:

- Confirm you cited Minnesota Rules chapter 4410 for any claim about requirements, criteria, timelines, or triggers.
- Do not treat Environmental Quality Board guidance as rule text; if they differ, say the rules control.
- Do not assume the Responsible Governmental Unit; verify it.
- Do not infer “no Environmental Impact Statement needed” from “few comments.” The Responsible Governmental Unit must base decisions on criteria and record.
- Be explicit about what you did not verify when answering without a project name.

## Reference set (authoritative starting points)

Prefer citing these (and the specific parts used):

- Minnesota Rules chapter 4410 (Revisor of Statutes).
- Environmental Quality Board: Environmental Assessment Worksheet guidance; Environmental Impact Statement guidance; Public participation and petitions.
- Implementing agency pages (for example Minnesota Pollution Control Agency environmental review overview).

## Minimal tool recipe

- `web.run` searches:
  - "site:revisor.mn.gov rules 4410 decision on need for EIS"
  - "site:eqb.state.mn.us Environmental Assessment Worksheet guidance"
  - "site:eqb.state.mn.us public participation petition environmental review"
- Optional `file_search`:
  - Use only if the user has a local repository or saved notes you should align with.
