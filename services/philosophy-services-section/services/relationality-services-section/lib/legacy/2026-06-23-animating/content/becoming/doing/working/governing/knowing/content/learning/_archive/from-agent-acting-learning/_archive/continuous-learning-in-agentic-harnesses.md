---
title: Continuous Learning in Agentic Harnesses
description: A survey of how AI agent harness systems learn from experience across sessions — observation capture, pattern detection, instinct and skill creation, memory persistence, and quality gates.
text-type: survey
date-created: 2026-04-04
domain: computing
see-also:
  - "../../terms/agent.md"
sources:
  - title: "Everything Claude Code (ECC)"
    url: "https://github.com/anthropics/everything-claude-code"
    type: repository
  - title: "OpenClaw"
    url: "https://github.com/openclaw/openclaw"
    type: repository
  - title: "Cline"
    url: "https://github.com/cline/cline"
    type: repository
  - title: "Voyager: An Open-Ended Embodied Agent with Large Language Models"
    url: "https://arxiv.org/abs/2305.16291"
    authors: ["Guanzhi Wang", "Yuqi Xie", "Yunfan Jiang", "Ajay Mandlekar", "Chaowei Xiao", "Yuke Zhu", "Linxi Fan", "Anima Anandkumar"]
    year: 2023
    type: paper
  - title: "Reflexion: Language Agents with Verbal Reinforcement Learning"
    url: "https://arxiv.org/abs/2303.11366"
    authors: ["Noah Shinn", "Federico Cassano", "Ashwin Gopinath", "Karthik Narasimhan", "Shunyu Yao"]
    year: 2023
    type: paper
  - title: "Language Agent Tree Search Unifies Reasoning Acting and Planning in Language Models"
    url: "https://arxiv.org/abs/2310.04406"
    authors: ["Andy Zhou", "Kai Yan", "Michal Shlapentokh-Rothman", "Haohan Wang", "Yu-Xiong Wang"]
    year: 2023
    type: paper
---

Agentic harness systems face a fundamental problem: LLM agents lose all behavioral context at session boundaries.
Each new session starts from the same base prompt, ignorant of what worked or failed in prior sessions.
Continuous learning is the set of mechanisms by which a harness captures experience during sessions and converts it into durable behavioral changes that persist across sessions — without retraining the underlying model.

This survey compares six systems that address this problem, ranging from production harnesses (Everything Claude Code, OpenClaw, Cline) to research frameworks (Voyager, Reflexion, LATS).
The comparison reveals a shared architecture — observe, detect, persist, validate, promote — instantiated differently in each system.

## The Systems

### Everything Claude Code (ECC)

ECC's continuous learning system, now at v2.1, is the most fully specified among the production harnesses surveyed.
Its architecture has four stages:

**Observation.** Hooks on `PreToolUse` and `PostToolUse` events capture every tool call — input, output, timing, and project context — into a JSONL file.
Hooks fire deterministically (100% capture rate), unlike skill-based observation in v1 which fired probabilistically (~50-80%) based on LLM judgment.
Observations are scoped per-project using a hash of the git remote URL.

**Pattern detection.** A background observer agent (running on Haiku for cost efficiency) analyzes accumulated observations on a configurable interval (default: 5 minutes, minimum 20 observations).
It detects four pattern types: user corrections ("No, use X instead of Y"), error resolutions (error followed by fix), repeated workflows (same tool sequence recurring), and tool preferences (consistent choice of one tool over another).

**Instinct creation.** Detected patterns become instincts — atomic behavioral units with a trigger, an action, a confidence score, a domain tag, and evidence.
Instincts start at confidence 0.3 (one observation) and increase with confirmation (+0.05 per confirming observation), decrease with contradiction (-0.1), and decay without reinforcement (-0.02 per week).
This is a notable design: behavior that is not continuously validated degrades automatically.

**Evolution and promotion.** The `/evolve` command clusters related instincts into higher-order artifacts — skills (auto-triggered behaviors), commands (user-triggered actions), agents (multi-step processes requiring isolation), or hooks (deterministic checks at confidence >= 0.9).
Project-scoped instincts are promoted to global scope when the same pattern appears in 2+ projects with average confidence >= 0.8.

**Quality gates.** The `/learn-eval` command extends basic pattern extraction with a checklist-based quality gate: grep existing skills for overlap, check memory for redundancy, confirm reusability, then render a holistic verdict (Save, Improve then Save, Absorb into existing, or Drop).
The system explicitly avoids numeric scoring rubrics, noting that frontier models produce better verdicts through unconstrained judgment than through forced quantization.

ECC also maintains curated "inherited" instincts — pre-packaged behavioral patterns for specific repositories that can be imported via `/instinct-import`.
These function as a knowledge transfer mechanism between projects and teams.

### OpenClaw

OpenClaw achieves behavioral evolution through six integrated mechanisms rather than a single continuous learning pipeline:

**Memory persistence.** Two-layer file system: `MEMORY.md` holds curated long-term facts, while dated `memory/YYYY-MM-DD.md` files create a session-by-session audit trail.
Memory is file-first and auditable — not hidden in a database.
Memory plugins (exclusive plugin slots where only one implementation loads) provide search capabilities without replacing the underlying files.

**Skill autonomy.** Agents can write new skills during execution.
Each skill is a directory containing `SKILL.md` (metadata), tools, examples, and tests.
When an agent encounters a problem it cannot solve with existing capabilities, it can write a skill, save it to the workspace, and gain that capability immediately.
The skill persists; future sessions inherit it.
A public registry (CrawHub) enables community sharing.

**Proactive monitoring.** The `HEARTBEAT.md` file defines what the agent checks when idle — tasks written in natural language ("Every Monday at 9 AM, check action items").
Running in isolated sessions cuts token costs by 60-80% while maintaining persistent memory as context.
This enables continuous monitoring without conversation history overhead.

**Hook-driven learning.** Directory-discovered event handlers that fire on lifecycle events.
Hooks contain metadata (`HOOK.md`) and implementation.
They intercept commands, capture observations, and trigger downstream learning — all without rebuilding the agent.

**Behavioral boundaries.** `SOUL.md` defines identity, style, values, and guardrails.
Unlike skills (persistent code artifacts) or memory (accumulated facts), SOUL.md is prescriptive.
Changes take effect in the next cycle.

**Input gating.** The DM Policy controls inbound messages through four modes (pairing, allowlist, open, disabled), shaping the distribution of inputs the agent learns from.

OpenClaw does not have a formal instinct-to-skill evolution pipeline like ECC.
Instead, it relies on the combination of persistent memory files and autonomous skill creation to achieve behavioral improvement over time.
The learning is less structured but more autonomous — agents can directly create capabilities rather than waiting for pattern accumulation.

### Cline

Cline, the VS Code autonomous coding agent, takes a deliberately manual approach to cross-session learning through its Memory Bank methodology:

**Memory Bank.** Five structured markdown files stored in the repository: `projectbrief.md` (foundation), `productContext.md` (why the project exists), `activeContext.md` (current work focus and recent changes), `systemPatterns.md` (architecture and design patterns), and `techContext.md` (technologies and constraints).
These files are designed specifically for AI consumption — more comprehensive than a README.

**Persistent configuration.** The `.clinerules` file serves as a project-scoped learning journal, capturing patterns, preferences, and project intelligence as version-controlled markdown.
Over time, `.clinerules` becomes a project-specific instruction set.

**Context window management.** The `new_task` tool allows Cline to recognize when its context window is approaching saturation and cleanly end the current session, starting a new one with the Memory Bank threading state across boundaries.
Plan Mode reads the Memory Bank on resume to assess current state before implementing changes.

**What Cline lacks.** No automatic behavioral adaptation, no pattern detection, no instinct creation, no cross-project learning transfer.
Learning is entirely manual: users must identify patterns, document them in `.clinerules`, and validate them.
The trade-off is full auditability — users can inspect everything Cline "knows" by reading markdown files.

### Voyager

Voyager (Wang et al., 2023), a Minecraft agent, demonstrates persistent compositional learning through an explicit skill library:

**Observation.** Environment observations (task state changes, crafting requirements), execution errors (invalid JavaScript), and self-verification by a second LLM instance that critiques whether the task succeeded.

**Skill creation.** New skills are executable JavaScript code snippets indexed by semantic embeddings of their descriptions.
Skills reference and build on earlier skills, creating a compositional hierarchy.
Persistence is non-parametric — skills exist as executable code, not weight updates.

**Retrieval and reuse.** When encountering a new task, Voyager retrieves relevant skills via embedding similarity, allowing complex behaviors to be composed from prior learnings.
This approach obtains 3.3x more unique items and reaches tech milestones up to 15.3x faster than prior systems.

**Quality gate.** Multi-signal feedback: environment state verification, execution error detection, and LLM-based self-critique.
Skills that fail verification are iteratively refined through successive prompting rounds.

### Reflexion

Reflexion (Shinn et al., 2023) uses linguistic feedback loops rather than skill libraries:

**Observation.** An evaluator produces scalar reward from task outcomes.

**Pattern detection.** A self-reflection module converts reward signals into natural language summaries: "You failed because X; remember to Y next time."

**Persistence.** Textual reflections are prepended to the actor's context in the next episode, forming an episodic memory buffer.

**Quality gate.** Reflection only occurs when performance feedback is available.
Achieved 91% pass@1 on HumanEval, outperforming GPT-4's 80%.

**Limitation.** As episodic memory grows, it consumes the context window.
Unlike Voyager's indexed skill library, Reflexion's memory becomes less efficient at scale.

### LATS

Language Agent Tree Search (Zhou et al., 2023) embeds Monte Carlo Tree Search within the agent loop:

**Observation.** Action generation samples plausible next steps; an LLM-based critic estimates expected future reward.

**Pattern detection.** Self-critique at multiple decision points within a trajectory, not just at episode boundaries like Reflexion.

**Persistence.** Successful trajectories through the decision tree serve as learned artifacts for future search.

**Quality gates.** Value function confidence (only deep-dive on high-value branches), environment feedback (external signals terminate or redirect search), and reflection consistency (self-critiques contradicting prior reasoning are flagged).
Achieves 92.7% pass@1 on HumanEval.

## Cross-System Comparison

| Dimension | ECC | OpenClaw | Cline | Voyager | Reflexion | LATS |
|-----------|-----|----------|-------|---------|-----------|------|
| **Observation** | Deterministic hooks (100%) | Hooks + heartbeat | Manual documentation | Environment + self-verification | Evaluator reward | Action sampling + critic |
| **Pattern detection** | Background agent (Haiku) | Agent autonomy | None (manual) | Execution feedback | Self-reflection module | Multi-point self-critique |
| **Persistence format** | YAML instincts + JSONL | Markdown files + skill dirs | Markdown Memory Bank | Embedded code library | Episodic text buffer | Trajectory cache |
| **Quality gate** | Checklist + holistic verdict | Skill test suites | Human review | Multi-signal verification | Reward availability | Value confidence + env feedback |
| **Scope management** | Project vs global hash | Per-workspace | Per-project | Per-world | Per-task | Per-search tree |
| **Evolution path** | Instinct -> skill -> hook | Memory -> skill (autonomous) | None | Simple skills -> composite | Buffer growth | Tree depth growth |
| **Confidence tracking** | Numeric 0.3-0.9 with decay | None explicit | None | Implicit via reuse | None | Value estimates |
| **Cross-project transfer** | Promotion at 2+ projects | CrawHub registry | None | World transfer | None | None |

## Patterns Across Systems

Three elements appear necessary for cross-session learning without retraining:

1. **Structured observation capture.** Every system that learns automatically (ECC, OpenClaw, Voyager, Reflexion, LATS) captures experience in a structured format — JSONL events, environment state, reward signals.
  Cline's manual approach demonstrates the cost of omitting this: no automation, full burden on the user.

2. **Persistent indexing.** Captured experience must be stored in a way that enables retrieval.
  The mechanisms vary — semantic embeddings (Voyager), file system organization (ECC, OpenClaw, Cline), episodic buffers (Reflexion), tree caches (LATS) — but all systems that learn must solve the storage-retrieval problem.

3. **Quality validation before reuse.** Every system includes some gate between observation and behavioral change.
  ECC uses checklist-based holistic verdicts.
  Voyager uses multi-signal verification.
  Reflexion gates on reward availability.
  Without validation, learned behaviors degrade the system — ECC's curated instinct guidelines explicitly warn against bulk-generated, duplicated, or contradictory instincts.

Two additional patterns distinguish the more sophisticated systems:

4. **Confidence decay.** ECC's instincts decay at -0.02 per week without reinforcement.
  This prevents stale patterns from persisting indefinitely — an important property when project conventions change.
  Most other systems lack this mechanism.

5. **Scope isolation with promotion.** ECC and OpenClaw both isolate learned behaviors by project, with mechanisms for promoting universal patterns to broader scope.
  This prevents cross-project contamination while still allowing genuine generalizations to propagate.

## What the 561 Harness Does Differently

The 561 Group's continuous learning system (described in `continuous-learning-v2.md` and the `cl-pipeline` plan) shares ECC's basic architecture — observations, instincts, confidence scores, evolution into skills — but extends it in several ways:

**Settlement path framing.** The 561 system maps the learning pipeline onto a theoretical framework: observations are inquiry, instincts are derivation, skills are procedure, hooks are process.
This is not mere labeling — it connects to the library's work taxonomy, providing a principled answer to "what kind of work does this pattern represent?" that guides evolution decisions.

**Failure-driven learning.** The `cl-pipeline` plan specifies a closed loop: failures produce diagnoses, diagnoses produce instincts, instincts produce duty updates.
The balance check (if waste/failed-sessions grows but instincts don't, the pipeline is broken) treats learning as an operational metric, not an optional enhancement.

**Structured offices.** Where ECC and OpenClaw have generic agents, the 561 system has typed officers with defined duties.
Instincts don't just become "skills" — they become updates to specific officer duties, making the learning loop tighter because the target of improvement is well-defined.

**What to consider adopting.** Several patterns from other systems are worth evaluating:

- **Autonomous skill creation** (OpenClaw): agents writing their own capabilities during execution, rather than waiting for post-session analysis.
- **Semantic embedding retrieval** (Voyager): instinct retrieval by embedding similarity rather than trigger matching could improve recall.
- **Confidence decay** is already specified but the decay rate and reinforcement mechanisms could be tuned against Voyager's compositional reuse patterns.
- **Heartbeat monitoring** (OpenClaw): periodic proactive checks that run in isolated sessions, useful for the 561 system's duty officer model.
- **Memory Bank documentation** (Cline): the structured project context files are a simpler version of what the 561 system achieves through its library and frontmatter system, but the explicit "designed for AI consumption" framing is worth noting.

## Open Questions

Several problems remain unsolved across all systems surveyed:

1. **Catastrophic forgetting in instinct stores.** When should an instinct be deleted rather than decayed?
  No system has a principled answer beyond "user curation."

2. **Cross-project generalization.** ECC promotes instincts seen in 2+ projects, but the threshold is arbitrary.
  What makes a pattern genuinely universal versus coincidentally repeated?

3. **Evaluation of learning quality.** How do you measure whether a continuous learning system is actually making the agent better?
  ECC's quality gates evaluate individual instincts, but no system evaluates the learning pipeline itself.

4. **Compositional skill hierarchies.** Voyager's skills reference earlier skills, creating depth.
  Production harnesses (ECC, OpenClaw, 561) keep skills flat.
  The relationship between learned skills remains implicit rather than structured.
