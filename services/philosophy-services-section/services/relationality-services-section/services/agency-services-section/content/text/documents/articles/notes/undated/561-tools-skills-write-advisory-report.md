---

description: Write a policy advisory report — a structured research output following advisory report genre conventions
name: write-advisory-report
version: [0, 1]
kind: operational
runtime: inference
triggers:
  - "write advisory report"
  - "write a report on"
  - "survey and report"
inputs:
  topic: string
  findings: string?
outputs:
  report_path: string
region:
  reads: ["content/"]
  writes: ["content/"]
dependencies:
  - find-thing
  - encode-learning
scopes: []
part-of: technology/specifications/agential-semioverse-repository
title: write-advisory-report
---
Write a policy advisory report on `$ARGUMENTS`.

## Instructions

### 1. Genre conventions

A policy advisory report is NOT a research notebook, a survey dump,
or slop. It is a formal document that advises a decision-maker
(emsenn) on a question. Follow these conventions:

**Required sections**:
- **Executive summary** — 1-3 paragraphs. What was studied, what
  was found, what is recommended.
- **Methodology** — How the research was conducted. What sources
  were consulted. What criteria were used for evaluation.
- **Findings** — Organized by theme or relevance tier. Each finding
  includes: what was found, where it came from, and what it means
  for the repository.
- **Recommendations** — Prioritized. Each recommendation includes:
  what to do, why, and what plan or policy it feeds into.
- **Sources** — Full citations or paths to source material.

**Optional sections**:
- **Background** — Context the reader needs before the findings
  make sense.
- **Alternatives considered** — Options that were evaluated and
  rejected, with reasons.
- **Open questions** — What remains unresolved.

### 2. Quality standards

- Write for a reader who is expert in the domain but hasn't done
  this specific research.
- Be specific. "Several projects use X" is weak. "Rust RFCs, Python
  PEPs, and IETF RFC 2026 all use X, with variations in Y" is
  strong.
- Distinguish facts from recommendations. Findings are what IS.
  Recommendations are what SHOULD BE.
- Cite sources. For triage files, use relative paths. For external
  sources, use standard citation format.

### 3. Filing

File the report as a text in the appropriate discipline directory:
- Technology research → `technology/texts/`
- Mathematics research → `mathematics/texts/`
- Governance research → `governance/texts/` (when it exists) or
  `technology/texts/`

### 4. Frontmatter

```yaml
---
title: "Report title"
date-created: YYYY-MM-DDT00:00:00
authors:
  - claude
form: text
tags:
  - RelevantTag
description: "One-sentence description."
cites:
  - source/path/1
  - source/path/2
---
```

### 5. Do not

- Do not write slop. If you can't write a proper advisory report,
  say so and explain what's missing.
- Do not pad. If there are 3 findings, write 3 findings. Do not
  inflate to 10.
- Do not mix findings and recommendations. Keep them separate.
