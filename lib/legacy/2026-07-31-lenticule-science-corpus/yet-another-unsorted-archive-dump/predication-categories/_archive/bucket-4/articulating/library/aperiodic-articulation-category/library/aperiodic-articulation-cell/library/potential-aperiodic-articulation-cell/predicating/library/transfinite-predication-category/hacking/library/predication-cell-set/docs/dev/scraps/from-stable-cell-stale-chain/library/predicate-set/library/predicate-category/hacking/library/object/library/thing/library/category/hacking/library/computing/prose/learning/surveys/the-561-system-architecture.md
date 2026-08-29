---
title: "The 561 System Architecture"
description: "A comprehensive description of the 561 Group's multi-agent knowledge management and autonomous orchestration system — its layered architecture, mathematical grounding, computation model, and position in the 2026 agentic systems landscape."
text-type: survey
date-created: 2026-04-05
domain: computing
related-terms:
  - settlement-path
  - progressive-automation
  - settlement
  - predication
  - bilattice
  - formality-level
related-texts:
  - non-llm-computation-for-agent-duties
  - agentic-harness-landscape-2026
  - model-training-as-algebraic-closure
  - the-adjoint-structure-of-predication-on-bilattice-valued-fibers
  - continuous-learning-in-agentic-harnesses
sources:
  - "Belnap, N. D. (1977). A Useful Four-Valued Logic. Modern Uses of Multiple-Valued Logic, Reidel, 5–37."
  - "Busaniche, M. & Cignoli, R. (2014). The Subvariety of Commutative Residuated Lattices Represented by Twist-Products. Algebra Universalis, 71, 5–22."
  - "Dewey, J. (1938). Logic: The Theory of Inquiry. Henry Holt."
  - "Fitting, M. (1991). Bilattices and the Semantics of Logic Programming. J. Logic Programming, 11(2), 91–116."
  - "Lave, J. & Wenger, E. (1991). Situated Learning: Legitimate Peripheral Participation. Cambridge University Press."
  - "Lawvere, F. W. (1969). Adjointness in Foundations. Dialectica, 23(3–4), 281–296."
  - "Maruyama, Y. (2021). Fibred Algebraic Semantics for a Variety of Non-Classical First-Order Logics. J. Symbolic Logic, 86(3), 1189–1213."
  - "Ong et al. (2024). RouteLLM: Learning to Route LLMs with Preference Data. ICLR. arXiv:2406.18665."
  - "Shinn, N. et al. (2023). Reflexion: Language Agents with Verbal Reinforcement Learning. NeurIPS."
---

The 561 system is a multi-agent knowledge management and autonomous orchestration system built as a git repository. It combines a structured library of grounded knowledge, a multi-agent operational harness, a Rust daemon with EAVT graph stores, and a mathematical framework that unifies the system's ontology with its operational dynamics. The system is designed for the 561 Group, a confederacy working toward Black Liberation and Indigenous Sovereignty, and serves as that organization's computer system.

This text describes the system as it exists in April 2026: what it is architecturally, what principles distinguish it from other agent systems, and how its mathematical grounding shapes its design.

## 1. What the system is

The 561 system is three things simultaneously:

**A library.** A domain-organized collection of term definitions and explanatory texts, grounded in real disciplines, cross-referenced by relation, and published as websites. The library contains over 11,000 entities across domains spanning philosophy, mathematics, sociology, botany, computing, and more. Each term defines one concept; each text makes one claim. Content is written for a reader with no background but no tolerance for filler.

**An operations center.** A work management infrastructure that plans, dispatches, executes, tracks, reviews, and learns from work. The system maintains plans with ordered tasks, dispatches typed agents to perform them, tracks completion through sentinel files and event logs, reviews outcomes through automated pipelines, and feeds learnings back into future work.

**A self-modifying agent harness.** A configuration layer that shapes how AI agents interact with the repository. The harness defines 26 specialized agent offices, 60+ skills encoding domain knowledge, 25+ hooks enforcing invariants at the tool level, and 40+ commands composing views from structured data. The harness is itself generated from engineering source and installed by a script — never edited directly.

These three aspects are not independent modules. The library provides the ontology that the operations center uses to classify work. The operations center produces the events that the harness observes. The harness generates the instincts that become skills that become tools — closing the loop.

## 2. The layered architecture

The system has three architectural layers, each with a distinct purpose and implementation.

### FARS: the file layer

FARS — the Fibered Algebraic Relational System — is the static structure. It is the repository itself: markdown files with YAML frontmatter, organized into domains, each file defining one concept or making one claim. The frontmatter keys are relations — `defines`, `requires`, `part-of`, `instance-of`, `traverses` — forming a typed knowledge graph when extracted.

FARS defines what CAN be: the space of possible states, the valid transitions, the normative positions. It is a library in the classical sense — a structured collection of recorded knowledge — but with one critical addition: every file's frontmatter participates in a computable graph, making the library queryable by machines.

The mathematical foundation is the bilattice-valued hyperdoctrine described in [The Adjoint Structure of Predication on Bilattice-Valued Fibers](../../../../../science/theories/information/texts/the-adjoint-structure-of-predication-on-bilattice-valued-fibers.md). Every subject-predicate-object triple in the knowledge graph carries a value in the four-element Belnap bilattice: unknown ($\bot$), true ($t$), false ($f$), or contradictory ($\top$). The bilattice's two orderings — truth and knowledge — provide independent axes for reasoning about what is established and what is known.

An installer script (`install.js`) scans the library and operations directories, extracts frontmatter into EAVT (entity-attribute-value-time) triples, and produces `knowledge-graph.json` — the computable form of the library. This graph currently holds approximately 11,600 entities with 135,000 facts across 700 attribute types.

### MASH: the daemon layer

MASH — the Multi-Agentic Semiotic Hub — is the dynamic layer. It is a Rust binary (`mash-engine`) that provides persistent state, session management, event ingestion, and a continuous operational loop.

MASH realizes what IS: which specific states the system actually occupies, in what sequence, along what path through the possibility space defined by FARS. The relationship between FARS and MASH is not a metaphor but a mathematical one: FARS defines the modal geometry (possibility space), and MASH provides the temporal dynamics (actual trajectory through that space).

The daemon runs two rhythms:

- **Heartbeat** (every 10 seconds): checks running agent sessions for completion or failure via sentinel files. Records metrics, writes double-entry accounting transactions, fires events.
- **World tick** (every ~5 minutes): ingests JSONL events into the operations graph, detects stale tasks, checks for completed plans, monitors session health. This is the system's ambient intelligence — it notices things without being asked.

MASH maintains two EAVT graphs:

- **Knowledge graph** (`knowledge-graph.json`): the library content, read-only at runtime, rebuilt by the installer. ~11,600 entities.
- **Operations graph** (`operations-graph.json`): sessions, events, transactions, system state. Read-write. Accumulated by the daemon and MCP server.

An MCP (Model Context Protocol) server exposes both graphs to agents through 15 typed tools: `graph_search`, `graph_entity`, `graph_query_attr`, `sessions_list`, `ledger_summary`, `channel`, `record_event`, and others. The MCP server is the primary interface between agents and structured data — agents query the graph rather than parsing files.

### The harness: the agent layer

The harness is the configuration that shapes agent behavior. It is installed from source files in `operations/engineering/fars/agentic/` into `.claude/` (for Claude Code) or `.codex/` (for Codex CLI). The harness consists of:

**Agents** (26 offices): typed specialists with defined action domains, tool allowlists, model tier assignments, and reporting chains. A planner decomposes work. A writer produces content. A build-error-resolver fixes compilation failures. An observer watches for patterns. Each agent has a formal site (what domain it operates in), recognition predicates (what it accepts as input), production predicates (what it outputs), and invariants (what it must not do).

**Skills** (60+): domain knowledge encoded as structured prompts. Skills load on trigger — a writing skill activates when creating content, a research skill activates when surveying a domain. Skills are progressive: they encode what was learned from past work so future work requires less inference.

**Hooks** (25+): shell scripts that fire on tool-call events. PreToolUse hooks enforce invariants (block secrets from being committed, validate frontmatter, protect configuration files). PostToolUse hooks observe (log tool calls, update the knowledge graph, record events, detect loops). Stop hooks run cleanup (evaluate sessions, analyze failures, track costs). Hooks exit 0 to allow, exit 2 to block. They never exit 1.

**Commands** (40+): named operations that compose views from structured data. `/bridge` shows the operational state. `/plan-status` rolls up plan progress. `/dispatch-work` matches ready tasks to available agents. Commands call deterministic scripts, not inference.

**Rules** (6): invariants that load every session. Content conventions, JavaScript conventions, library-vs-operations separation, harness installation policy, command policies, and the read-before-acting rule.

## 3. The three computation levels

The system uses three levels of computation, allocated by the judgment required:

### LLM inference (Opus, Sonnet, Haiku)

Language model inference handles work that requires understanding: novel task decomposition, reading comprehension, synthesis across sources, judgment under ambiguity. The system allocates model tiers by formality: Opus for the fuzziest work (architecture, planning, research, writing), Sonnet for structured work with judgment components (code review, dispatch, library management), Haiku for routine procedural work (bookkeeping, documentation updates, pattern observation).

This tiering is not arbitrary. An offices-as-fuzzy-cells analysis maps all 26 offices onto a formality scale from F0 (implicit) to F3 (algebraic) and shows that model capability correlates with the fuzziness of the office's recognition and production predicates.

### Deterministic tools (Node.js scripts)

Sixteen deterministic scripts replace agent inference for structured work:

- `task-router.js`: decision-tree routing of tasks to offices
- `library-search.js`: three-step search (graph, filename, content grep)
- `query-library-graph.js`: Datalog-style graph queries
- `harness-audit.js`: unused component detection
- `record-hygiene.js`: stale record identification
- `ledger-tool.js`: double-entry transaction recording and trial balance
- `pattern-detector.js`: tool-call pattern detection and instinct creation
- `auto-dispatch.js`: config-gated autonomous task dispatch
- `propagate-dependencies.js`: automatic dependency status propagation

These scripts produce the same output an agent would, at zero inference cost. They read from the EAVT graph and return structured results. The preference hierarchy is explicit: use MCP tools first, then deterministic scripts, then agent inference only when the work requires reasoning.

### The middle layer (planned)

Between LLM inference and deterministic tools lies a middle layer that the system is actively developing: fine-tuned small models and lightweight classifiers. Tool-call sequences show strong Markov structure (Grep-then-Read occurs 53% of the time; the Read-Edit-Bash edit cycle appears 15 times in 722 tool calls). A bigram model over tool sequences would predict the next tool correctly 40-55% of the time. Task-to-office routing — currently done by LLM — could be handled by a decision tree over frontmatter features (type, domain, work-type). The system's own tool-call logs provide the training data.

This middle layer represents the [settlement path](../../../../../humanities/theories/sociology/theories/work/terms/settlement-path.md) applied to computation itself: what begins as LLM inference (inquiry) gets encoded as a skill (procedure), then distilled into a script (process).

## 4. The continuous learning loop

The system learns from its own operation through a five-stage pipeline:

### Observe

Every tool call fires the observer hook, which writes to `observations.jsonl`. PostToolUse events record what tool was called, what parameters were used, and what the outcome was. The observer runs on Haiku (cheapest tier) in the background (async hook, no blocking).

### Instinct

The `pattern-detector.js` script and observer agent scan observations for recurring patterns. When a pattern appears 3 or more times, it becomes an instinct — a YAML file with a trigger condition, a recommended action, a confidence score, and a domain scope. Instincts are conservative: narrow triggers, no code snippets, and they update existing instincts before creating new ones. Confidence decays over time via `instinct-decay.js`.

### Skill

When instincts cross a confidence threshold (0.8) and prove reliable across multiple contexts, the `/evolve` command promotes them into skills. A skill is a structured prompt with trigger conditions, procedures, and reference material. Skills load on demand — only the metadata (name + description, ~100 tokens) is always present; the full body loads when triggered.

### Tool

Skills that encode fully deterministic procedures become scripts. The `doc-updater` agent's entire workflow — scan filesystem, diff against indexes, update — could be a script. The `harness-cleaner`'s reference counting is already a script (`harness-audit.js`). The transition from skill to tool is the point where the work no longer requires language model inference at all.

### Hook

The most proven patterns become hooks — code that fires automatically on every relevant tool call without any agent deciding to invoke it. Frontmatter validation, secret detection, configuration protection, and loop detection all started as things agents remembered to do and are now invariants enforced by exit codes. A hook that exits 2 blocks the action. No inference required, no judgment involved, no way to forget.

This pipeline is the [settlement path](../../../../../humanities/theories/sociology/theories/work/terms/settlement-path.md) applied to agent behavior: open inquiry (observation) settles into derivation (instinct), then procedure (skill), then process (tool/hook). Each step reduces the inference required. The end state is a system where routine work is deterministic and LLMs are reserved for genuine reasoning.

The failure path has its own pipeline: failed sessions produce `.failure` sentinel files, which trigger `failure-analyzer.js` to dispatch Haiku agents for diagnosis, which feed into `diagnosis-to-instinct.js` to create instincts from recurring failure modes. The success path has a parallel pipeline under development: completed sessions produce `.review` files, triaged by the daemon, processed by `review-session.js`, feeding quality signals back into the learning loop.

## 5. The office and duty system

The system organizes agents into 26 offices across three departments: Command (6 offices), Engineering (14 offices), and Science (7 offices, with publisher shared). Each office is defined by:

- **Site**: the action domain — what space the office operates in
- **Recognition predicates**: what predication cells the office accepts as valid input
- **Production predicates**: what predication cells the office produces as output
- **Constructors**: the tools the office is allowed to use (formal allowlists)
- **Laws/invariants**: what the office must not do, what it must escalate

This structure is not arbitrary naming. The offices-as-fuzzy-cells analysis maps each office onto the mathematical concept of a cell — a position in the predication cell set — with formality assessments on each component. Constructors (tool allowlists) are universally at F3 (algebraic) — the one thing the harness already specifies formally. Sites are universally at F1-F2 (prose) — action domains are described in natural language. Recognition and production predicates sit in between.

The formality assessment reveals a spectrum. Seven offices are near-fully formalizable: bookkeeper (double-entry accounting is algebraic), docs-lookup (search is a query pipeline), graph-analyst (Datalog queries), harness-cleaner (reference counting), doc-updater (filesystem diff), observer (event stream pattern detection), and quartermaster (threshold queries). Five offices are irreducibly fuzzy: architect (design judgment), researcher (reading comprehension), triage-processor (editorial judgment), chief-of-staff (cross-domain synthesis), and planner (novel decomposition).

The dispatch system matches tasks to offices using structured frontmatter features (type, domain, work-type), selects a model tier proportional to the office's fuzziness, and spawns the agent as an external session via `mash-engine start`. The session runs in isolation, writes sentinel files on completion, and the daemon picks up the results on its next heartbeat.

Offices report through a chain of command. Most report to the first officer (the primary agent). Some report to intermediate offices: bookkeeper and quartermaster report to the operations officer; harness-cleaner reports to the harness-optimizer; rust-build-resolver reports to the build-error-resolver. The subsumption relation captures genuine algebraic structure: a subsumed office's recognition and production predicates are subsets of the subsuming office's.

## 6. How it differs from comparable systems

### Everything Claude Code (ECC)

ECC is the reference implementation for Claude Code harness structure: 163 skills, 58 commands, 30 agents, with a manifest-driven installation system. The 561 system takes ECC's architecture as a starting point and extends it in three directions. First, grounding: where ECC's skills are procedural prompts, the 561 system's skills are grounded in the repository's own mathematical theory and operational data. Second, continuous learning: ECC has no observation pipeline or instinct system — skills are authored, not evolved. Third, the EAVT datastore: ECC's agents work on files; the 561 system's agents work on a graph that represents those files as typed entities with queryable relations. ECC is a harness. The 561 system is a harness on top of a knowledge management system on top of a mathematical framework.

### OpenClaw

OpenClaw introduces several patterns the 561 system has adopted or plans to adopt: the `SOUL.md` identity document, a dreaming system for autonomous memory consolidation, DM Policy input gating, session-memory hooks with LLM-generated descriptive slugs, and a three-layer skill loading architecture (metadata → body → references). Where OpenClaw and the 561 system diverge is in knowledge representation. OpenClaw's memory is flat — key-value pairs with recall counts and recency scores. The 561 system's memory is a typed graph: entities have attribute types, relations have directionality, and queries use Datalog-style patterns rather than keyword matching. OpenClaw optimizes for an individual agent's memory; the 561 system optimizes for organizational knowledge.

### Cline

Cline (VS Code extension, 15M+ installs) demonstrates production-grade safety patterns: loop detection with soft and hard thresholds, signature-based tool-call deduplication, structured compaction with a 9-section template and auto-file-loading, and a `new_task` tool for structured context handoff between sessions. The 561 system has adopted Cline's loop detection pattern (implemented in `loop-detection.js`) and is implementing structured compaction. Where Cline differs is scope: Cline is a coding assistant that operates within a single IDE session. It has no organizational structure, no dispatch system, no daemon, no knowledge graph, and no multi-agent coordination. The 561 system solves problems Cline does not attempt.

### CrewAI

CrewAI is a multi-agent orchestration framework with role-based agent definitions, task delegation, backstory/persona fields, and structured workflows. The 561 system shares CrewAI's typed-agent-with-defined-roles pattern but differs in how roles are specified. CrewAI defines roles through natural language descriptions: a "researcher" has a backstory and a goal statement. The 561 system defines roles through formal fibers: a researcher has recognition fibers (what it accepts), production fibers (what it outputs), tool allowlists, and invariant constraints. The difference matters for progressive automation: natural language role descriptions cannot be sharpened toward deterministic execution; fiber-based definitions can be, and the formality assessment provides a roadmap for doing so.

CrewAI also lacks a persistent knowledge layer. Its agents have short-term memory within a workflow and optional long-term memory via external stores, but no integrated library of grounded knowledge that agents can query and extend. The 561 system's EAVT datastore is both the agents' working memory and the organization's institutional knowledge.

## 7. The mathematical grounding

Most agent systems are engineering artifacts with no mathematical theory beyond the transformer architecture of their language models. The 561 system is different: it has its own mathematical framework, developed within the repository, that shapes the system's architecture. The framework is **voidmath**, the mathematical layer of the [relationality](../../../../../humanities/theories/philosophy/theories/relationality/_index.md) framework, and its central primitive is **predication** — the directed assignment of value at a triple (subject, predicate, object).

### Predication cells

The system's primary structural unit is the [**predication cell**](../../../../../humanities/theories/math/theories/voidmath/terms/predication-cell.md): an ordered triple $(s, p, o)$ where $s$ is a subject (an entity), $p$ is a predicate, and $o$ is an object (also an entity). Predication cells are elements of the predication cell set $\Phi = E \times \Pi \times E$, where $E$ is the system's entity set and $\Pi$ is its predicate set.

The system's EAVT (entity-attribute-value-time) datastore is a direct realization of the predication cell structure: each EAVT row is a predication cell with a value attached. The library knowledge graph and the operations graph are both predication-cell collections at scale — approximately 11,600 entities with 135,000 facts at the time of writing.

### The bilattice fiber algebra

At each predication cell, the system records a value in Belnap's four-valued [bilattice](../../../../../humanities/theories/math/theories/voidmath/terms/bilattice.md): unknown ($\bot$), true ($\mathbf{t}$), false ($\mathbf{f}$), or contradictory ($\top$). This is not Boolean logic. It handles incomplete information ($\bot$: we have no data) and contradictory information ($\top$: two sources disagree) as first-class values rather than errors. The bilattice carries two parallel orderings — the [knowledge order](../../../../../humanities/theories/math/theories/voidmath/terms/knowledge-order.md) $\leq_k$ (measuring how much evidence has accumulated) and the [truth order](../../../../../humanities/theories/math/theories/voidmath/terms/truth-order.md) $\leq_t$ (measuring direction of evidence).

The values at all cells with predicate $p$ fixed form the [**predication fiber algebra**](../../../../../humanities/theories/math/theories/voidmath/terms/predication-fiber-algebra.md) $A_p$ — the pointwise [twist product](../../../../../humanities/theories/math/theories/voidmath/terms/twist-product.md) $\mathbf{L}^\bowtie$ of a residuated lattice $\mathbf{L}$ over the entity-pair index $E \times E$. The fiber algebra is bilattice-residuated, supporting two adjoint operations on bilattice values: extending ($\odot$, combining evidence) and restricting ($\Rightarrow$, testing implication). These operations are adjoint: $a \odot p \leq_t q$ if and only if $p \leq_t (a \Rightarrow q)$. This adjunction — the same one Lambek identified in grammar and Lawvere identified in categorical logic — is the system's primitive operation on knowledge.

### Settlement: the four-corner structure

The four extremal elements of the bilattice are the four corners of [**settlement**](../../../../../humanities/theories/math/theories/voidmath/terms/settlement.md): the joint structure within which every claim has its position. Settlement is composed of two independent axes — the truth axis and the knowledge axis — and the four corners are the joint extremes:

| Corner | Knowledge axis | Truth axis | Reading |
|---|---|---|---|
| $\bot$ (absurd) | bottom | mid | un-witnessed; held bare or not held at all |
| $\mathbf{f}$ (false-only) | mid | bottom | witnessed in denying direction; settled toward false |
| $\mathbf{t}$ (true-only) | mid | top | witnessed in affirming direction; settled toward true |
| $\top$ (both) | top | mid | witnessed in both directions; paraconsistently settled |

The classification is exhaustive: every claim's settlement is a position in the joint space spanned by these two axes, and the four corners are the extremal joint positions. Most actual settlements sit in the interior, partway along one or both axes.

This is the math-side counterpart to what the framework's philosophical layer calls the **inquiry trajectory** (absurd → possible → necessary → determined): the trajectory describes how a claim moves through settlement space; the four corners describe where it can sit at any moment.

### The hyperdoctrinal layer

The structure of how predicates relate is captured by the [**predicate category**](../../../../../humanities/theories/math/theories/voidmath/terms/predicate-category.md) $\mathcal{C}$, whose morphisms are generated by exactly four canonical classes (specialization, converse, subject-projection, object-projection) under entity-set equivariance. The [**predication fibration**](../../../../../humanities/theories/math/theories/voidmath/terms/predication-fibration.md) ties predicates to their fiber algebras with reindexing along the four generator classes. The [**predication hyperdoctrine**](../../../../../humanities/theories/math/theories/voidmath/terms/predication-hyperdoctrine.md) adds parallel adjoint quantifier systems — one in the knowledge order, one in the truth order — yielding two derived equality predicates and the full Lawvere–Seely categorical-logic structure.

This stack is described in [The Adjoint Structure of Predication on Bilattice-Valued Fibers](../../../../../science/theories/information/texts/the-adjoint-structure-of-predication-on-bilattice-valued-fibers.md), the system's mathematical foundation paper.

### How the math shapes the system

The mathematical framework is not decorative. It determines concrete design decisions:

- **The EAVT datastore** is the predication cell set: every row is a $(s, p, o)$ triple with a bilattice value attached at the time it was recorded.
- **The daemon's world tick** advances the system's settlement: ingesting events (raising knowledge-axis position by adding affirming or denying evidence), detecting stale tasks (where settlement has not advanced), checking plan completion (where settlement has reached a local fixed point in the determined corner). The condition that knowledge values rise monotonically — *settling monotonicity* — is what makes the daemon's evolution a coherent temporal-evidence structure.
- **The settlement path** is the trajectory through the inquiry modes: a piece of work moves from inquiry (absurd, no evidence) through derivation and procedure to process (determined, settled in one of the truth-axis-tilted corners).
- **The formality scale** (F0–F3) measures how close an office's specification is to being algebraically checkable — how far along its own settlement path.
- **Progressive automation** is the policy of moving work along the settlement path: every task completion should encode itself so a less capable agent (or a script) can do it next time. This is the operational meaning of fixed-point convergence: applying the training operator until the work reaches a position from which further training produces no change.

## 8. What makes the system distinct

Three properties distinguish the 561 system from other agent systems in 2026:

### The settlement path as design principle

Other systems optimize for agent capability: make the agent smarter, give it more tools, expand its context window. The 561 system optimizes for agent *unnecessity*: make each task completable by a less capable agent, then by a script, then by a hook. The ideal endpoint for routine work is not a better agent but no agent at all — a deterministic process that runs without inference.

This is not anti-AI. It is the recognition that inference is expensive, slow, and non-deterministic, and that using it for work a `switch` statement could handle is waste. The settlement path — inquiry to derivation to procedure to process — provides a formal framework for deciding which work needs inference and which does not. The continuous learning pipeline (observe → instinct → skill → tool → hook) is the mechanism for moving work along that path.

### Algebraic learning calculus

The system does not just learn from experience — it has a mathematical theory of what learning is. [Training is closure](../../../../../humanities/theories/education/texts/training-as-closure.md): the agent begins with generators (initial capabilities), a closure operator (the training process) acts on them, and competency is the fixed point where further training produces no change. This applies identically to human apprenticeship (Lave and Wenger 1991), neural network training (loss convergence), and the system's own instinct evolution (observation → confidence threshold → promotion).

The four-corner settlement structure provides the fine structure: a piece of learning's position in the joint truth/knowledge space tells you whether it has been witnessed (knowledge-axis) and in which direction (truth-axis). The formality assessment of offices — rating each component on the F0-F3 scale — is a concrete measurement of where in the joint settlement space each office's specification sits, and how much further along the settlement path it can be moved.

This is not the kind of "learning" most agent systems claim, where a memory bank accumulates key-value pairs. It is learning with a convergence criterion: you know when you are done because the closure operator has become identity.

### The organizational frame

The 561 system is not an agent or a collection of agents. It is an organization with departments, offices, chains of command, policies, and accounting. Agents are officers who hold offices. Work flows through a six-stage loop: planning, dispatch, execution, tracking, review, feedback. Sessions produce double-entry transactions. Failures accrue as attention debt on a liability account. The system has a trial balance.

This organizational frame is not a metaphor layered on top of an agent framework. It is the primary design: the system is an organization that happens to use AI agents as officers, not an AI system that happens to use organizational terminology. The distinction matters because organizational infrastructure — governance, accounting, dispatch, review — has centuries of refined practice behind it. The 561 system draws on that practice rather than reinventing it from first principles of agent design.
