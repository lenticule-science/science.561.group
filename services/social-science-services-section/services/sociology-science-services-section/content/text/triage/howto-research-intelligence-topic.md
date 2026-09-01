---
name: research-intelligence-topic
id: research-intelligence-topic
description: >-
  Research a topic for intelligence analysis — gather open-source evidence,
  evaluate source reliability, identify collection gaps, map competing
  narratives, and produce a structured research brief for use in writing
  intelligence assessments.
type: operational
date-created: 2026-03-06
keywords:
  - Research
part-of: militarism/disciplines/intelligence
region:
  reads: ["content/militarism/disciplines/intelligence/", "content/"]
  writes: ["content/militarism/disciplines/intelligence/"]
triggers:
  - "research this intelligence topic"
  - "gather intelligence on"
  - "build an evidence base for"
  - "intelligence research brief"
inputs:
  topic: string
  scope: string?
  existing_analysis: string?
outputs:
  research_brief: string
---

# Research Intelligence Topic

## What you will be able to do

- Conduct structured open-source research on a topic relevant to intelligence analysis, distinguishing primary reporting from aggregated secondary sources.
- Evaluate the source landscape: identify which outlets have demonstrated access (prior accurate reporting on the topic or similar topics), which are aggregating, and which have identifiable biases or incentive structures.
- Identify collection gaps — what questions cannot be answered from available open sources and what collection disciplines (HUMINT, SIGINT, IMINT, MASINT) would be required.
- Map competing narratives: what interpretive frameworks different actors are applying and what their incentive structures are.
- Produce a structured research brief that feeds directly into the **write-intelligence-assessment** skill.
- Identify vault integration points: what existing terms, concepts, or texts are relevant, and what new entries may need to be created.

## Prerequisites

- Familiarity with [OSINT](../../terms/osint.md) — the capabilities and limitations of open-source intelligence
- Familiarity with [source reliability](../../terms/source-reliability.md) — the admiralty system and its application to open sources
- Understanding of the intelligence discipline's [collection disciplines](../../concepts/collection-disciplines.md) — to identify what open sources cannot provide
- Familiarity with the vault's content structure — to identify integration points

## Reference documents

- [OSINT](../../terms/osint.md) — the open-source collection discipline
- [Source reliability](../../terms/source-reliability.md) — the framework for evaluating sources
- [Collection disciplines](../../concepts/collection-disciplines.md) — the full collection architecture, to contextualize what OSINT can and cannot do
- [Signal-to-noise](../../terms/signal-to-noise.md) — the foundational problem research must navigate

## Research brief structure

### 1. Key facts

Separate confirmed facts from attributed claims. For each fact or claim, note:
- **Source**: who reported it (e.g., "U.S. officials speaking to CNN," "IRGC spokesman via Fars News," "satellite imagery published by Planet Labs")
- **Access**: does this source have demonstrated access to the information, or is it aggregating others' reporting?
- **Corroboration**: is the claim independently confirmed by multiple sources with independent access, or does it trace to a single originating report?

### 2. Source landscape

Map the available sources:
- **Primary sources**: government statements, official military communications, court documents, declassified materials
- **First-hand reporting**: journalists or organizations with demonstrated access (on-the-ground reporting, named sources with confirmed positions)
- **Analytical sources**: think tanks, academic analysts, former officials (note institutional affiliations and potential biases)
- **Aggregators**: outlets that compile others' reporting without independent access
- **Adversary sources**: what the adversary is saying about itself (noting that adversary self-reporting is simultaneously evidence and potential deception)

### 3. Collection gaps

For each significant unanswered question, identify:
- What the question is and why it matters for the analysis
- What collection discipline could address it
- Whether the gap is likely temporary (more reporting expected) or structural (requires classified access)

### 4. Competing narratives

For each major interpretive framework:
- Who is advancing it and what their incentive structure is
- What evidence supports it
- What evidence it fails to explain
- What its relationship is to the other competing narratives

### 5. Analytic leads

Hypotheses that merit investigation in the assessment phase:
- What the hypothesis is
- What initial evidence supports it
- What indicators would confirm or disconfirm it
- What additional research could be done

### 6. Vault integration

- Existing terms, concepts, or texts that the analysis should reference
- New terms or concepts that may need to be created
- Cross-discipline connections (e.g., to sociology, political theory, economics)

## Conventions specific to intelligence research

### Source skepticism

Treat all sources as having incentive structures. Government officials leak to shape narratives. Think tanks reflect their funders' priorities. Adversary media serves information-operations purposes. Academic analysts have theoretical commitments. None of this makes sources unusable — it makes the incentive structure part of the evidence.

### The signal-to-noise problem at scale

In a rapidly developing conflict, the volume of reporting vastly exceeds the volume of genuine new information. Most "new" reports aggregate the same underlying sources. Research must trace claims to their originating reports rather than treating aggregation as corroboration. Five outlets citing the same anonymous official are one source, not five.

### Temporal discipline

Note when information was reported and what information cutoff applies. In fast-moving situations, assessments from 48 hours ago may already be superseded.

## Scope

This skill covers the research phase of intelligence analysis. It does not cover:
- Writing the assessment itself (covered by **write-intelligence-assessment**)
- The theoretical frameworks for analysis (covered by concepts and terms)
- Classified or restricted collection methods (this skill operates in the OSINT domain)

## Verification

You have this skill if you can: (1) distinguish primary from aggregated reporting and trace claims to originating sources, (2) evaluate source incentive structures without dismissing sources entirely, (3) identify collection gaps and articulate what disciplines could fill them, and (4) produce a structured brief that an assessment-writer can act on directly.
