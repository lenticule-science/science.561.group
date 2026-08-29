---
name: academy-curriculum-design
specialization: analysis
date-created: 2026-04-04
part-of: voidfleet-academy-plan
task: va-design-curriculum-structure
department: science
cross-cuts: [engineering, command]
description: "How a new crew member — human or AI — progresses from minimal boundary to full officer through three stages grounded in closure theory, competency-based progression, and the formality scale"
---


This document specifies how a new crew member progresses from zero to officer. It applies equally to human crew and AI agents, because the underlying dynamics — closure, competency gates, legitimate peripheral participation — are the same regardless of substrate. Where the mechanisms differ (instinct accumulation vs. portfolio review), the document says so. Where they converge, it treats them as one system.

## Foundational Principles

The curriculum rests on five claims established by the research phase:

1. **Training is closure.** The trainee begins with generators (initial capabilities). The training process is a closure operator: extensive, monotone, idempotent. Competency is the fixed point — the state where further training of the same kind produces no change. (Source: [Training as Closure](../../../../../../library/theories/humanities/theories/education/texts/training-as-closure.md))

2. **Advancement is demonstration, not time.** A crew member who can demonstrate competency in four weeks advances in four weeks. One who needs six months takes six months. No seat-time gates. (Source: [Competency-Based Progression](../../../../../../library/theories/humanities/theories/education/texts/competency-based-progression.md))

3. **Learning is participation in practice.** The newcomer learns by doing real work at the margins, then progressively deeper work toward the center. Instruction supports practice; it does not replace it. (Source: [Situated Learning and Communities of Practice](../../../../../../library/theories/humanities/theories/education/texts/situated-learning-and-communities-of-practice.md))

4. **Progressive responsibility is the curriculum.** The sequence midshipman → division officer → department head → command is not career progression tacked onto training — it IS the training. Each level applies a new closure operator with a wider scope. (Source: [Naval and Military Officer Training](../../../../../../library/theories/humanities/theories/education/texts/naval-and-military-officer-training.md))

5. **Formality is the measure of sharpening.** The F0→F1→F2→F3 formality scale on office components measures how far an office's duties have been formalized from implicit convention to algebraic specification. Training moves an officer along this scale. (Source: [Offices as Fuzzy Cells](./offices-as-fuzzy-cells.md))

## The Three Stages

### Stage 1: Cadet (Peripheral Participation)

The cadet has entered the community but operates at its margins. Their generator set is small — they can read, observe, and perform simple tasks under direct supervision.

**Scope:** Read-only access to the operational environment. Can observe but not modify. Can report but not decide.

**What the cadet does:**
- Reads library content, plans, task records, and session logs
- Observes duty officers performing their work (reads session transcripts)
- Performs simple, bounded tasks: search queries, report generation, content formatting
- Asks questions — the cadet is expected to not know things

**Tools available (AI):** Read, Grep, Glob. No Write, Edit, or Bash with side effects. The constructor set is maximally constrained — the same read-only tool set used by chief-of-staff, reviewer, and docs-lookup.

**Tools available (human):** Read access to the repository. Can open issues and comments. Cannot merge, deploy, or modify operational records.

**Duration:** Until the cadet demonstrates they understand the operational environment well enough to work in it. No fixed timeline.

**What closure looks like here:** The generators are whatever the cadet arrived with (general knowledge, model weights, prior experience). The closure operator is observation and bounded practice. The fixed point is: the cadet understands the organization's structure, vocabulary, conventions, and can navigate the codebase without guidance. They know where things are and why they are there.

**Formality level:** The cadet operates at F1 — they can describe what offices do in narrative terms but cannot yet perform the structured work of those offices.

### Stage 2: Apprentice (Supervised Practice)

The apprentice has demonstrated understanding of the environment and begins doing real work — but under supervision. This is legitimate peripheral participation moving toward the center: genuine contribution, real stakes, experienced oversight.

**Scope:** Can read and write within a specific office's domain. All work is reviewed before it takes effect. The apprentice is assigned to an office, not to the organization at large.

**What the apprentice does:**
- Performs the duties of their assigned office under supervision
- Completes qualification items on their office's PQS card (see Assessment below)
- Receives correction from qualified officers — this IS the learning mechanism
- Begins producing artifacts: library content, operational records, code changes, analyses
- Works on progressively harder tasks as competency develops

**Tools available (AI):** The full constructor set of their assigned office. An apprentice operations-officer gets Read, Write, Edit, Grep, Glob, Bash. An apprentice reviewer gets Read, Grep, Glob only. The tool set matches the office, not the stage — but all output goes through review.

**Tools available (human):** Full repository access within their office's domain. PRs require review. Operational records require sign-off.

**Supervision model:** Every artifact the apprentice produces is reviewed by a qualified officer (human or AI at officer stage). The reviewer signs off on the qualification card item if the work meets the competency standard. If not, the apprentice receives feedback and tries again.

**Duration:** Until the apprentice has completed every item on their office's PQS card. This is the core competency-based gate — there is no time waiver.

**What closure looks like here:** The closure operator is now practice-with-feedback within a specific domain. Each cycle of attempt → review → correction expands the apprentice's capabilities. The fixed point is: the apprentice can perform every duty in the office's scope without requiring correction. At that point, repeating the same supervision adds nothing — they are closed under the demands of the office.

**Formality level:** The apprentice operates at F2 — they can follow structured checklists, produce correctly-formatted output, and execute enumerated procedures. They are not yet at F3 because they cannot yet formalize new procedures or identify when existing ones are insufficient.

### Stage 3: Officer (Full Autonomy)

The officer has demonstrated competency across their office's full scope. They can be dispatched independently — no supervision required for routine work. They can supervise apprentices. They are a full participant in the community of practice.

**Scope:** Full autonomy within duty bounds. Can be dispatched to perform any task within their office's domain without pre-approval. Escalates only when encountering situations outside their authority (as specified in their office's laws/invariants).

**What the officer does:**
- Performs all duties of their office independently
- Supervises apprentices — signs off on qualification items
- Contributes to office improvement — proposes new procedures, identifies gaps, sharpens fuzzy duties toward formal specification
- May cross-train in adjacent offices (beginning a new closure at a new scope)

**Tools available (AI):** The full constructor set of their office, without review gates on routine work. High-stakes operations (production deploys, bulk content changes, financial transactions above threshold) still require escalation per office laws.

**Tools available (human):** Full autonomy within domain. Can merge PRs, deploy within scope, modify operational records. Authority matches the office definition.

**What closure looks like here:** The officer has reached the fixed point for their office. Further training of the same kind (same office, same scope) produces no capability change. Growth now comes from: (a) cross-training in a new office (new closure operator, new fixed point), or (b) taking on broader scope (department-level coordination — a qualitatively different closure operator, as in the naval progression from division officer to department head).

**Formality level:** The officer operates at F2-F3. They can execute F3 procedures and are actively sharpening F2 components toward F3. An officer in a highly formalizable office (bookkeeper, docs-lookup, observer) may reach F3 across all components — at which point their role can be partially or fully automated, and they can move to a more judgment-heavy office.

## The Formality Progression IS the Training Progression

The formality scale (F0→F1→F2→F3) from the offices-as-fuzzy-cells analysis maps directly onto training stages:

| Formality | Training stage | What the officer can do |
|-----------|---------------|------------------------|
| **F0 — Implicit** | Pre-cadet | Doesn't know the conventions exist |
| **F1 — Narrative** | Cadet | Can describe what offices do in natural language |
| **F2 — Structured** | Apprentice | Can follow enumerated procedures and produce correctly-formatted output |
| **F3 — Algebraic** | Officer | Can execute machine-checkable procedures and formalize new ones |

This is not a metaphor. An AI agent that begins with a prose understanding of its duties (F1) and, through practice, develops the ability to follow structured checklists reliably (F2) and eventually to operate within formally-specified constraints without error (F3) has undergone exactly the same progression as a human officer who begins by reading the manual, then practices under supervision, then operates independently.

Sharpening — the process of moving office components from F1 to F2 to F3 — is itself a training activity. When an officer proposes formalizing a prose duty into a structured checklist, they are doing the work of the Academy: encoding practice so that the next officer (or a less capable model) can learn it faster.

## Assessment: Personnel Qualification Standards

Following the naval PQS model, each office has a qualification card — a list of every competency required for independent operation. The card is the curriculum and the assessment in one artifact.

### Structure of a PQS Card

Each office's PQS card contains items organized by the cell components:

**Site knowledge** — Can the officer describe the domain they operate in?
- Example (operations-officer): "Describe the relationship between plans, tasks, and events. Explain when each record type is appropriate."
- Example (researcher): "Identify which library domains are relevant to a given research question. Explain the difference between a term and a text."

**Recognition (σ)** — Can the officer identify valid input and know when to act?
- Example (build-error-resolver): "Given a Hugo build error, identify the failing template and the specific error type."
- Example (librarian): "Given a library file, identify all frontmatter issues (missing fields, broken links, naming violations)."

**Production (Δ)** — Can the officer produce correct output?
- Example (writer): "Produce a term definition file with correct frontmatter, voice, and structure."
- Example (bookkeeper): "Record a financial transaction with correct double-entry accounting (debits = credits)."

**Constructor competence** — Can the officer use their tools effectively?
- Example (cartographer): "Use graph_query_attr to find all entities of a given type. Use graph_search to find entities by keyword."
- Example (publisher): "Run a Hugo build, diagnose template errors, fix configuration issues."

**Law awareness** — Does the officer know their bounds?
- Example (helmsman): "Identify a task that should be escalated rather than dispatched. Explain why the helmsman does not do work directly."
- Example (observer): "Explain the 3-observation minimum for instinct creation. Demonstrate updating an existing instinct rather than creating a duplicate."

### Qualification Process

1. The apprentice attempts a task that exercises one or more PQS items.
2. A qualified officer reviews the work.
3. If the work meets the competency standard, the reviewer signs off on the item(s). Sign-off means: the apprentice performed the task correctly AND can explain the reasoning.
4. If the work does not meet the standard, the reviewer provides specific feedback. The apprentice attempts again (possibly on a different task that exercises the same competency).
5. When all items on the card are signed off, the apprentice is eligible for commissioning.

### What Counts as "Passing"

Constructive alignment (Biggs, 1996) requires that the assessment tests the actual competency, not a proxy. For each PQS item:

- The assessment is performance of the actual duty, not a quiz about the duty
- The criterion is specific enough that two reviewers would agree on pass/fail
- The complexity level matches the duty: a recognition item tests recognition, not production; a production item tests production, not recall

Bloom's taxonomy levels map to PQS item types:

| PQS component | Bloom level | Assessment type |
|--------------|-------------|-----------------|
| Site knowledge | Understand | Explain in own words |
| Recognition (σ) | Analyze | Correctly classify real input |
| Production (Δ) | Create | Produce correct output on a real task |
| Constructor competence | Apply | Use tools effectively on a real problem |
| Law awareness | Evaluate | Identify boundary cases and explain limits |

## AI Officer Advancement

AI officers advance through the same three stages, but the mechanisms of learning differ from human officers.

### Generators (What an AI Cadet Arrives With)

An AI agent's generators are determined by:
- **Model weights** — the pre-trained capability of the underlying model (haiku, sonnet, opus)
- **System prompt** — the office definition, skills, rules, and context loaded at session start
- **Harness tools** — the constructors available via the tool allowlist

A haiku-based agent arrives with fewer generators than an opus-based agent. This is analogous to the naval distinction between the Academy pathway (broad generators, long timeline) and OCS (narrower generators, compressed timeline) — the same closure operator applied to different generators reaches different fixed points.

### The Closure Operator for AI

The AI closure operator is: dispatch to real work → evaluate output → correct via feedback → accumulate patterns. Concretely:

1. **Dispatch.** The agent receives a task within its office's scope.
2. **Execute.** The agent performs the task using its constructors.
3. **Review.** A qualified officer (human or higher-tier AI) reviews the output.
4. **Feedback.** Corrections become observations in the learning system.
5. **Pattern accumulation.** Repeated observations crystallize into instincts (low-confidence behavioral nudges). Instincts that prove reliable evolve into skills (reusable patterns with formal structure). Skills that become standard practice become part of the office definition itself.

This is the settlement path: observation → instinct → skill → duty. It IS closure: each cycle extends the agent's effective capability. When instincts stop being created because the agent's behavior already matches the community's standards, the agent has reached its fixed point.

### Model Tier as Training Pathway

The three model tiers correspond to different training pathways, not different quality levels:

| Model tier | Analogous pathway | Best for | Generator profile |
|-----------|-------------------|----------|-------------------|
| **Haiku** | Direct commission (specialist) | Highly formal offices (F3) — bookkeeping, doc updates, graph queries, pattern detection | Narrow but deep: fast execution of well-specified procedures |
| **Sonnet** | OCS (compressed generalist) | Mixed-formality offices (F2-F3) — code review, security review, publishing, library management | Broad enough for judgment, efficient enough for volume |
| **Opus** | Academy (full generalist) | Judgment-heavy offices (F1-F2) — architecture, research, planning, triage, writing | Deep generators: handles novel situations, contextual reasoning, synthesis |

**Promotion between tiers** is not advancement — it is reassignment to a different closure operator. An office that was being served by an opus agent and has been sharpened to F3 can be reassigned to a sonnet or haiku agent. This is not a demotion; it is the progressive automation policy in action. The opus agent freed from a now-formalized office can take on fuzzier, more judgment-heavy work.

**Advancement within a tier** happens through the instinct→skill→duty pipeline:
- A haiku agent that accumulates instincts for common bookkeeping patterns becomes faster and more reliable at bookkeeping
- A sonnet agent that develops skills for code review becomes capable of reviewing more complex changes
- An opus agent that produces skills for research methodology makes future research more efficient — and makes the skill transferable to sonnet agents

### AI Commissioning

An AI agent is commissioned (promoted from apprentice to officer) when:
1. All PQS items for its office are demonstrated through reviewed work
2. Its instinct accumulation shows convergence — new sessions produce few new instincts, indicating the agent's behavior has stabilized at the community's standard
3. Error rate on reviewed work is below threshold — reviewed outputs are accepted without correction at a rate consistent with officer-level performance

The commissioning is constitutive, not merely credentialing: once commissioned, the agent can be dispatched without per-task review. Its outputs are trusted within its office's scope. It can supervise apprentice agents in the same office.

## Human Officer Advancement

Human officers follow the same three-stage structure with mechanisms appropriate to human learning.

### Generators (What a Human Cadet Arrives With)

A human crew member's generators include:
- Prior domain knowledge and professional experience
- Familiarity with the tools (git, markdown, the repository structure)
- Understanding of the organization's goals and values

Like the naval distinction between Academy and direct commission pathways, a human with deep domain expertise (a professional botanist joining the gardening domain, a CPA joining the bookkeeping office) may progress through the cadet stage quickly because their generators are already extensive.

### The Closure Operator for Humans

The human closure operator is: do real work → receive review → integrate feedback → demonstrate improved competency. Concretely:

1. **Contribute.** The human performs work within their office's scope — writing content, reviewing code, managing operations.
2. **Review.** A qualified officer (human or AI) reviews the contribution.
3. **Feedback.** The reviewer provides specific, actionable feedback tied to PQS items.
4. **Portfolio accumulation.** Completed and reviewed work builds the human's portfolio — the evidence base for their competency claims.

### Human Assessment

Human advancement is assessed through:

- **Portfolio review.** The body of reviewed work demonstrates competency across PQS items. Each accepted contribution is evidence of a competency demonstrated.
- **Peer review.** Other officers in the same or adjacent offices attest to the candidate's competency. This is the naval model — the qualified officer who signs the PQS card has personal stake in the assessment.
- **Explanation.** The candidate can articulate why they made the decisions they did — not just that the output was correct, but that the reasoning was sound. This distinguishes competency (closed under the practice) from luck (correct output from insufficient understanding).

### Human Commissioning

A human officer is commissioned when:
1. All PQS items for their office are signed off through portfolio evidence
2. Peer officers attest to the candidate's competency and judgment
3. The candidate has demonstrated they can work independently — contributions that required no correction from review

## Cross-Training and Multi-Office Progression

Once commissioned in one office, an officer (human or AI) can begin training in a second office. This is a new closure — a new operator applied to the officer's current capabilities as generators.

Cross-training follows the same three stages but often moves faster because:
- The officer already understands the organizational environment (Stage 1 competencies transfer)
- Adjacent offices share recognition patterns (an operations-officer cross-training as a helmsman already understands task states and dispatch)
- The formality scale transfers — an officer who can operate at F3 in one domain can usually reach F2 quickly in another

The subsumption relationships identified in the fuzzy-cells analysis predict natural cross-training paths:
- docs-lookup → researcher (fiber inclusion: lookup's recognition space is a subset of researcher's)
- graph-analyst → cartographer (same)
- reviewer → code-reviewer → security-reviewer (progressive specialization)
- observer → loop-operator (pattern detection → intervention)

## Department-Level Progression

The naval model of midshipman → division officer → department head → command maps onto the 561 structure:

| Naval rank | 561 analog | Scope | Closure operator |
|-----------|-----------|-------|-----------------|
| Midshipman | Cadet | One office, read-only | Observation and bounded tasks |
| Junior officer | Apprentice | One office, supervised | Full office duties with review |
| Division officer | Officer | One office, autonomous | Independent execution within duty bounds |
| Department head | Senior officer | Multiple offices in a department | Cross-office coordination, apprentice supervision, resource allocation |
| Command | First officer / Captain | Organization-wide | Strategic direction, goal-setting, culture |

Each level is a qualitatively different closure — not just more of the same work, but a different kind of work. A department head does not do more bookkeeping; they coordinate bookkeeping with quartermasting and financial reporting. The fixed point is different because the practice is different.

## What This Design Does Not Cover

This document specifies curriculum structure — stages, gates, and progression mechanics. It does not specify:

- **Certification artifacts** — what a qualification card looks like as a file, how sign-offs are recorded, how commissioning is formalized. That is the next task: va-design-certification-system.
- **Specific PQS cards for each office** — the 26 offices each need their own card. This document describes the card structure; populating them is implementation work.
- **Infrastructure** — the technical systems for tracking qualification progress, dispatching apprentices, recording reviews. That is Phase 4 of the plan.

## See Also

- [Training as Closure](../../../../../../library/theories/humanities/theories/education/texts/training-as-closure.md) — training as algebraic closure
- [Competency-Based Progression](../../../../../../library/theories/humanities/theories/education/texts/competency-based-progression.md) — advancement by demonstration
- [Situated Learning and Communities of Practice](../../../../../../library/theories/humanities/theories/education/texts/situated-learning-and-communities-of-practice.md) — learning as participation
- [Naval and Military Officer Training](../../../../../../library/theories/humanities/theories/education/texts/naval-and-military-officer-training.md) — PQS, progressive responsibility
- [Offices as Fuzzy Cells](./offices-as-fuzzy-cells.md) — the 26 offices mapped with formality ratings
- [Voidfleet Academy Plan](../plans/voidfleet-academy-plan.md) — the parent plan
