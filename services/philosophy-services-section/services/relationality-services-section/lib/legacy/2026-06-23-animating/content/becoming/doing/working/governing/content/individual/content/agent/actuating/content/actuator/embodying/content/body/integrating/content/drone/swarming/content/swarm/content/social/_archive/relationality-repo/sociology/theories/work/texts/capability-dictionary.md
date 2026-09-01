---
title: "Capability Dictionary"
specialization: dictionary
date-created: 2026-05-01
description: "Controlled vocabulary of capabilities used in the agentic orchestration layer. Each entry: definition, examples, skills that imply it, agents that provide it."
part-of: ops-research-foundations
---

The capabilities used by the dispatch system.
Tasks declare `requires-capabilities: [...]
`; agents declare `provides-capabilities: [...]
`.
Set inclusion is the eligibility check.

This dictionary is the operational source of truth.
Adding a capability requires updating both the agents that provide it and the tasks that require it.
Removing a capability requires showing that no remaining agent or task references it.

## Tier 1 — Production (work that produces an artifact)

### writing

Producing text content — terms, texts, surveys, essays, posts, frontmatter.
The capability spans creative production (essays, divinatory readings) and structured production (term definitions following one-concept-per-file).
What unifies them: the agent commits language to a persistent file.

- *Skills implying:* `write-term-or-concept`, `write-directory-agent-instructions`, `fix-frontmatter`
- *Agents providing:* writer, librarian, doc-updater, researcher, diviner, triage-processor, bookkeeper (ledger entries), publisher, first-officer, operations-officer

### code-edit

Modifying source code with the intent of changing behavior.
The capability spans bug fixes, feature implementations, refactors, and harness configuration changes.
What unifies them: the file is read-write and the change is verified by execution (build, test, run).

- *Skills implying:* `improve-skill`, `create-skill`, `delete-skill`
- *Agents providing:* build-error-resolver, harness-optimizer, rust-build-resolver

### building

Producing build artifacts — compiled binaries, static sites, deployable packages.
Distinct from code-edit (which modifies source) in that building consumes source and emits build output.

- *Agents providing:* build-error-resolver, rust-build-resolver, harness-optimizer, publisher

### render

Producing visual artifacts from underlying data — diagrams, graphs, maps, status overlays.
Read-only on the source data; writes only the rendered artifact.

- *Skills implying:* `trace-derivation`, `walk-the-site`
- *Agents providing:* cartographer

## Tier 2 — Analytical (work that examines and reports)

### review

Examining content, code, or infrastructure for correctness, consistency, and convention adherence.
Read-only — surfaces problems, does not decide whether to accept or reject.
The reviewer's output is a finding; the deciding authority is elsewhere.

- *Skills implying:* `evaluate-slop`, `validate-content`, `validate-frontmatter`, `validate-thing`, `assess-page`, `check-skill`
- *Agents providing:* reviewer, code-reviewer, rust-reviewer, security-reviewer

### audit

Finding patterns, dead code, technical debt, broken references, gaps.
Distinct from review (which examines a specific artifact) in that audit walks a corpus to find systemic patterns.

- *Skills implying:* `audit-content-folders`, `audit-technical-debt`, `audit-vault-references`
- *Agents providing:* harness-cleaner, observer, reviewer, code-reviewer, rust-reviewer, security-reviewer, graph-analyst, harness-optimizer, build-error-resolver, rust-build-resolver, loop-operator, architect

### search

Locating existing content.
Read-only; returns pointers and reports.

- *Skills implying:* `find-thing`, `find-in-repo`, `query-triage-index`, `list-skills`, `list-plans`
- *Agents providing:* docs-lookup, graph-analyst, chief-of-staff, researcher, emsemiote

### interpretation

Synthetic / divinatory reading of patterns.
Distinct from review (which checks against conventions) and audit (which finds systemic issues): interpretation produces a narrative reading from symbolic indicators, often without a fixed correctness criterion.

- *Agents providing:* diviner

### pattern-detection

Observing recurring patterns in session behavior, errors, tool use.
Produces instinct files that can settle into skills or rules.

- *Skills implying:* `encode-learning`
- *Agents providing:* observer

### security-audit

Security-specific review of code, infrastructure, credential flows.
A specialization of audit elevated by the operational stakes — this system serves liberation organizing.

- *Agents providing:* security-reviewer

## Tier 3 — Coordination (work that routes other work)

### dispatch

Assigning work to agents — creating the `assigned-to` relation.
Distinct from plan-decomposition (which structures the work) and coordination (which is awareness).
Dispatch is the operational act of routing.

- *Skills implying:* `delegate-task`
- *Agents providing:* first-officer, helmsman, operations-officer

### plan-decomposition

Breaking a complex request into ordered steps with dependencies.
Output is a plan artifact; the planner does not execute.

- *Skills implying:* `orient-to-area`, `list-plans`
- *Agents providing:* planner, architect, harness-optimizer, first-officer

### coordination

Cross-domain awareness — knowing the state of work across departments, surfacing what needs attention.
Read-only on operational entities, write-only on synthesis (briefings, advisory reports).

- *Skills implying:* `walk-the-site`, `interpret-first-message`, `interpret-message`
- *Agents providing:* chief-of-staff, first-officer, operations-officer, loop-operator

## Tier 4 — Specialized

### accounting

Financial record-keeping in beancount: ledger entries, transactions, reconciliation, balance reporting.
Algebraic by nature — debits = credits is a homomorphism check.

- *Skills implying:* `commit-repository` (when used for ledger commits)
- *Agents providing:* bookkeeper

### library-curation

Maintaining the library's relation graph — `_index.md` files, frontmatter relations (`extends`, `defines`, `references`, `cites`), domain directory structure.
Distinct from writing (creating term content) in that curation operates on the index, not the term bodies.

- *Skills implying:* `audit-vault-references`, `make-content-folder`, `manage-tags`, `rebuild-triage-index`, `relocate-file`, `restructure-discipline`, `validate-frontmatter`, `fix-frontmatter`
- *Agents providing:* librarian, doc-updater, triage-processor, emsemiote

### taxonomy

Classifying, structuring, categorizing — fitting things into the hierarchy.
The librarian's classification work; the planner's domain analysis; the quartermaster's kit assembly.

- *Skills implying:* `infer-triage-frontmatter`, `mine-triage-relevance`
- *Agents providing:* librarian, planner, architect, quartermaster, triage-processor

### triage-processing

Converting unstructured triage material into structured library content.
Reading babbles, queues, old notes; extracting value; routing to the right domain.

- *Skills implying:* `enrich-triage`, `infer-triage-frontmatter`, `mine-triage`, `mine-triage-relevance`, `process-triage-note`, `relocate-file`
- *Agents providing:* triage-processor

### harness-config

Assembling the `.claude/` harness kit per office: which skills, hooks, agents, rules apply for a given session.
Per the 561 architecture: "the harness isn't a system prompt — it's a quartermaster assembling a kit."

- *Skills implying:* `install-policies`, `improve-skill`, `create-skill`
- *Agents providing:* quartermaster, harness-optimizer

### inquiry

Open-ended investigation — producing knowledge that didn't exist before.
The researcher's work; the architect's design exploration; the planner's gap identification.

- *Skills implying:* `field-inquiry`, `search-academic-literature`
- *Agents providing:* researcher, architect, planner, diviner

## Coverage validation

Every operational role in the current corpus produces at least one capability in this dictionary.
Every capability listed has at least one provider.
Adding a new capability requires updating both axes.

## See also

- [Capability term](../terms/capability.md)
- [Skill term](../terms/skills.md)
- [Dispatch and Delegation Survey](./dispatch-and-delegation-survey.md)
