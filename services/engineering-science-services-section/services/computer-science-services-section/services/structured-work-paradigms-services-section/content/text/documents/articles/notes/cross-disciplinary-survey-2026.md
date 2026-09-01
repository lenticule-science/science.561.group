---
title: "Structured-work paradigms: a cross-disciplinary survey"
date-created: 2026-03-07T00:00:00
authors:
  - claude
type: text
keywords:
  - StructuredWork
  - ProgressiveAutomation
  - Methodology
  - Survey
description: "Survey of structured-work methodologies across business, government/military, and scientific research, with analysis of cross-cutting patterns relevant to agent workflow design."
---

This text surveys structured-work methodologies across three
disciplines — business/management, government/military, and
scientific/academic research — to identify patterns that inform
the design of agent workflows in the
[agential semioverse repository](../../../../../../specifications/agential-semioverse-repository/index.md).

The survey was conducted via web research in March 2026. Each
domain was researched independently to avoid cross-contamination
of framing. Citations are provided per finding.

## Cross-cutting patterns

Five patterns recur across all three domains. These are the
findings most relevant to the emsemioverse's workflow design.

### 1. Every methodology encodes expectations before execution

No surveyed methodology begins work without first defining what
"done" looks like. The artifact varies — a PDCA plan, a DMAIC
problem statement, a pre-registered protocol, a military course
of action — but the structure is invariant: state the expected
outcome before acting.

This corresponds to
[policy 008](../../../../../../personal/projects/emsemioverse/policies/008-prompts-become-artifacts.md)
(prompts become artifacts) and the plan infrastructure at
`technology/specifications/agential-semioverse-repository/plans/`.

### 2. Verification means comparing against an explicit expectation

No methodology verifies in the abstract. PDCA compares results
against the Plan. DMAIC compares measurements against Define
requirements. Registered reports compare results against
pre-specified analysis plans. Military planning compares outcomes
against the RATE criteria (Refine, Adapt, Terminate, Execute).

This corresponds to the postcondition checking in the
[work-unit lifecycle](../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/interactive-semioverse-services-section/services/agential-semioverse-services-section/content/text/documents/articles/notes/work-unit-lifecycle.md)
(Definition 3.2, step 2).

### 3. The PDCA pattern is universal

Shewhart's Plan-Do-Check-Act cycle appears in every domain under
different names:

| Domain | PDCA variant |
|---|---|
| Business | PDCA (Deming), DMAIC (Six Sigma), OKR cycles |
| Government | NIST RMF steps, MDMP, OODA loop |
| Science | Hypothesis-experiment-analysis, action research |
| Agent workflows | Anthropic's evaluator-optimizer pattern |

The cycle is the universal structure of improvement. What varies
is the termination condition: some cycles are bounded (DMAIC
projects end), others are unbounded (Kaizen never ends).

### 4. Maturity is progressive, not binary

Government readiness levels (TRL, MRL, CMMI maturity levels) and
business maturity models share a structure: capabilities mature
through defined stages, each requiring demonstrated evidence. No
methodology treats maturity as pass/fail.

This corresponds directly to
[skill maturity](../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/interactive-semioverse-services-section/services/agential-semioverse-services-section/content/text/glossary/terms/skill-maturity.md)
— the five-stage lifecycle from inference-heavy to MCP tool.

### 5. Making the invisible visible

When manufacturing methodologies are adapted to knowledge work,
the core adaptation is always the same: render invisible cognitive
work legible enough to apply improvement methodologies. Kanban
boards, value stream maps, explicit policies, metrics, and audit
trails all serve this function.

In the emsemioverse, the MCP tools, the frontmatter system, the
predicate graph, and the triage index are all instances of this
pattern — making the repository's state visible and queryable
rather than requiring inference to discover.

## Domain summaries

### Business and management

The business domain contributes methodologies organized around
continuous improvement. Key frameworks surveyed:

- **PDCA/PDSA** (Shewhart/Deming, 1920s-1950s) — the foundational
  improvement cycle. Deming's System of Profound Knowledge provides
  the meta-methodology.
- **Six Sigma / DMAIC** (Bill Smith, Motorola, 1986) — statistical
  process control applied to improvement cycles.
- **Lean / Toyota Production System** (Taiichi Ohno, 1940s-1970s) —
  continuous waste elimination via pull systems.
- **Theory of Constraints** (Goldratt, 1984) — system throughput
  optimization via constraint identification. Adapted to knowledge
  work by Tiago Forte (2016).
- **Kanban for knowledge work** (David Anderson, 2004) — pull
  systems with WIP limits, adapted from Toyota.
- **OKRs** (Andy Grove, Intel, 1970s) — objectives with measurable
  key results in quarterly cycles.

Contemporary sources document early applications of these methods
to AI workflows: Anthropic's five agent workflow patterns (2024),
McKinsey's "agentic organization" operating model (2025), and
Kaizen principles applied to LLM interactions (Puzio, 2024).

### Government and military

The government domain contributes frameworks emphasizing
accountability, auditability, and graduated readiness. Key
frameworks surveyed:

- **CMMI** (Carnegie Mellon SEI, 1980s-present) — five maturity
  levels for organizational processes. V3.0 (2023) added data
  management capabilities.
- **ITIL 4** (UK CCTA, 1980s; PeopleCert, 2019) — IT service
  management via the Service Value System.
- **DoD Acquisition Framework** (DoD 5000, reformed 2020) — six
  tailorable acquisition pathways with milestone decision points.
- **NIST RMF** (SP 800-37 Rev. 2, 2018) — six-step risk management
  cycle culminating in Authorization to Operate.
- **Structured Analytic Techniques** (Heuer & Pherson, 2011) —
  66 techniques for externalizing intelligence analysis reasoning.
  Analysis of Competing Hypotheses (ACH), Devil's Advocacy, and
  Red Team Analysis are the most relevant to agent workflows.
- **Technology Readiness Levels** (NASA, 1970s; DoD adoption 2000s)
  — nine-level scale from basic principles to operational system.

Contemporary sources document DoD AI adoption: the Thunderforge
project (Scale AI / Anduril, 2025) integrating AI agents into
military planning, NIST AI 600-1 (2024) addressing autonomous
agent risks, and ICD-505 (2025) establishing IC AI governance.
FedRAMP 20x (2025) demonstrates the shift from narrative
documentation to machine-readable evidence — the same direction
as the emsemioverse's frontmatter-driven approach.

### Scientific and academic research

The scientific domain contributes methodologies organized around
evidence quality and reproducibility. Key frameworks surveyed:

- **Pre-registration / Registered Reports** (Chambers, 2013;
  Center for Open Science) — peer review of methods before
  results are known. Eliminates publication bias.
- **FAIR Data Principles** (Wilkinson et al., 2016) — Findable,
  Accessible, Interoperable, Reusable. Shifts from human-readable
  to machine-actionable data documentation.
- **Systematic review methodology** (Cochrane / PRISMA 2020) —
  protocol-driven evidence synthesis with documented search
  strategies and bias assessment.
- **Design Science Research Methodology** (Hevner, 2004;
  Peffers, 2007) — build-evaluate cycle for research artifacts.
- **Action research** (Lewin, 1946) — iterative intervention
  where the researcher's practice is itself the subject. The most
  self-referential methodology surveyed.
- **Grounded theory** (Glaser & Strauss, 1967) — theory emerges
  from data through constant comparison until theoretical
  saturation. Inverts the hypothetico-deductive method.
- **Literate programming** (Knuth, 1984) and its descendants
  (Org-Babel, Jupyter, R Markdown, marimo) — specification,
  execution, and documentation as a single artifact.

Contemporary sources document AI-assisted systematic reviews
(Nature Medicine, 2026), agentic AI for scientific discovery
(Li et al., ICLR 2025), and computational reproducibility
frameworks (ENCORE, Nature Communications, 2024).

## The bounded/unbounded distinction

The scientific research agent identified a structural parallel to
Hofstadter's BlooP/FlooP distinction (Godel, Escher, Bach, 1979):

- **Bounded loops** (BlooP-like): pre-registration, systematic
  review, DSRM, DMAIC projects. The number of iterations is
  known or bounded before the loop begins. Always terminates.
  Verifiable. Cannot discover what exceeds pre-specified bounds.

- **Unbounded loops** (FlooP-like): grounded theory, ethnographic
  fieldwork, action research, Kaizen. Termination depends on data
  (theoretical saturation, thick description). May not terminate.
  Can discover what bounded loops cannot.

This maps onto the skill maturity lifecycle: mature skills
(stages 4-5, procedural/tool) are bounded loops — they always
terminate with known outputs. Immature skills (stages 1-2,
inference-heavy) are unbounded — the agent may need arbitrary
reasoning to complete them. The maturity trajectory is from
FlooP toward BlooP.

## Implications for the emsemioverse

The survey identifies several patterns the emsemioverse already
implements and several it could adopt:

**Already implemented:**
- Expectations before execution (plans, skill manifests)
- Postcondition verification (work-unit lifecycle)
- Progressive maturity (skill maturity concept)
- Audit trails (effect reports, provenance traces)
- Making the invisible visible (MCP tools, frontmatter, triage index)

**Candidates for adoption:**
- Structured analytic techniques (ACH, Devil's Advocacy) applied
  to content classification and triage decisions
- Readiness levels for content maturity (analogous to TRL) — from
  triage through slop through draft through published
- FAIR-aligned metadata practices for the frontmatter system
- Pre-registration for research plans (commit to methodology
  before executing, reducing scope drift)
- WIP limits on active plans and in-progress work (Kanban)
