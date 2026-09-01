---
title: "ECC Agents and Commands: Structural Analysis and Comparison"
description: A comparative analysis of Everything Claude Code's agent definitions, command system, manifest architecture, and model routing against the 561 Group's agentic harness.
content-role: analysis
date-created: 2026-04-04
source: operations/engineering/fars/src/everything-claude-code/
relates-to:
  - continuous-learning-in-agentic-harnesses
---

Everything Claude Code (ECC) is a community plugin providing 38 agents, 72 commands, 156 skills, and automated hooks for Claude Code. This analysis compares its architecture against the 561 Group's agentic harness (27 agents, 80+ commands, 60+ skills) to identify patterns worth adopting, gaps to fill, and design differences that reflect genuinely different needs.

## 1. Agent Prompt Structure

### ECC Pattern

ECC agents use a consistent four-field YAML frontmatter:

```yaml
name: code-reviewer
description: Expert code review specialist...
tools: ["Read", "Grep", "Glob", "Bash"]
model: sonnet
```

The prompt body follows a standard structure: role statement, process/workflow (numbered steps), checklist tables, code examples showing BAD/GOOD patterns, and a success metrics section. ECC agents are self-contained instruction manuals: a senior developer could follow the prompt as a checklist without any agent infrastructure.

Key characteristics:
- **Heavy on examples.** The `code-reviewer` agent includes full TypeScript code samples for every anti-pattern it detects. The `planner` includes a complete worked example (Stripe subscriptions) showing the exact output format expected.
- **Confidence-based filtering.** The code-reviewer explicitly instructs: "report only if >80% confident." This reduces noise but is a prompt-level heuristic, not a structural guarantee.
- **No organizational context.** Agents don't know about each other, about the project's mission, or about any hierarchy. Each operates as an isolated specialist.

### 561 Pattern

Our agents use extended frontmatter that encodes organizational structure:

```yaml
name: planner
description: Planning specialist for complex tasks...
role: operations
tools: ["Read", "Grep", "Glob", "Bash"]
model: opus
department: command
serves: [operations-loop, endeavor-resource-planning]
action-domain: "Work decomposition..."
reports-to: first-officer
autonomous: [list of what agent can do unsupervised]
escalates: [list of what requires human judgment]
duties: [survey-before-planning, present-and-wait]
```

Our prompts carry institutional context: the planner knows it serves the operations loop, reports to the first officer, and must survey the knowledge graph before planning. The architect knows the system "is its own theory" and that library content governs infrastructure design.

### Comparison

ECC agents are **portable skill cards** — drop them into any project and they work. Ours are **officers in an organization** — they understand their position, their duties, and when to escalate. The tradeoff is clear: ECC agents are immediately useful in any context; ours are deeply effective in *this* context but would need significant adaptation elsewhere.

**What to adopt:** ECC's worked examples and BAD/GOOD code patterns. Our agents describe what to do but rarely show a complete output example. The planner's Stripe subscriptions example is worth emulating — it removes ambiguity about what "a good plan" looks like.

**What to preserve:** Our organizational frontmatter (`reports-to`, `escalates`, `autonomous`, `serves`). This is what makes autonomous dispatch possible. An ECC agent doesn't know when to stop; ours do.

## 2. Command Coverage

### ECC Commands We Lack

ECC has 72 commands. After filtering out language-specific shims (go-build, kotlin-review, flutter-test, etc.) and legacy shims that just redirect to skills, the commands with no 561 equivalent include:

| ECC Command | What It Does | Our Gap |
|---|---|---|
| `/tdd` | Test-driven development workflow (RED-GREEN-REFACTOR) | We have no TDD workflow. Our code review is post-hoc. |
| `/e2e` | End-to-end Playwright testing | No E2E testing infrastructure. |
| `/test-coverage` | Analyze coverage, find gaps, generate missing tests | No coverage analysis command. |
| `/save-session` / `/resume-session` | Serialize session state to file, reload in new session | We have session logs but no save/resume protocol with structured "what worked / what failed / exact next step" format. |
| `/refactor-clean` | Dead code detection and safe removal with test verification | Our `harness-cleaner` agent detects dead *harness* config but not dead *code*. |
| `/update-codemaps` | Generate token-lean architecture documentation | No equivalent. Our library serves a different purpose but we lack generated architecture maps of the codebase itself. |
| `/pm2` | Auto-detect services and generate PM2 process management config | No process management command. |
| `/prp-plan` / `/prp-implement` / `/prp-prd` / `/prp-commit` / `/prp-pr` | Complete feature lifecycle from PRD to PR | We have `/plan` but not the full pipeline from requirements document through implementation to pull request. |
| `/multi-workflow` | Multi-model collaborative development (Claude + Codex + Gemini) | No multi-model orchestration. |
| `/gan-design` / `/gan-build` | GAN-style adversarial design loop (Generator vs Evaluator) | No adversarial quality loop. |

### ECC Commands We Already Cover Better

| Domain | ECC | 561 |
|---|---|---|
| Session management | `/sessions` (list, alias, info) | `/fleet`, `/crew`, `/duty-status` + mash-engine daemon for external dispatch |
| Planning | `/plan` (single command) | `/plan`, `/plan-status`, `/critical-path`, `/plan-variance`, `/week-plan`, `/dispatch-work` |
| Reviews | `/code-review` | `/code-review`, `/review` (periodic), `/quality-gate`, `/verify` |
| Learning | `/learn`, `/learn-eval` | `/learn`, `/learn-eval`, `/evolve`, `/instinct-status`, `/promote` |
| Operations | (none) | `/standup`, `/bridge`, `/briefing`, `/tracking-status`, `/flow-metrics`, `/monthly-review` |
| Publishing | (none) | `/publish` with Hugo site pipeline |
| Finance | (none) | `/balance` with full ledger system |

### ECC's "Skills-First" Migration

ECC is actively migrating from commands to skills. Many commands are now "legacy shims" that redirect to skills. The stated policy: "skills/ is the canonical workflow surface. commands/ is a legacy slash-entry compatibility surface." This is the opposite of our approach, where commands are user-facing entry points and skills are agent-facing knowledge.

**Assessment:** ECC's migration makes sense for their context (a plugin installed into arbitrary projects where Claude needs to autonomously find the right workflow). Our approach makes sense for ours (an organizational system where users invoke specific capabilities by name). Neither is wrong — they serve different interaction models.

## 3. The Manifest System

ECC's installation system is the most sophisticated component with no 561 equivalent. It operates at three levels:

### Level 1: Modules (`install-modules.json`)

Each module is an atomic unit of installation:

```json
{
  "id": "framework-language",
  "kind": "skills",
  "description": "Core framework and language skills.",
  "paths": ["skills/android-clean-architecture", "skills/api-design", ...],
  "targets": ["claude", "cursor", "antigravity", "codex", "opencode"],
  "dependencies": ["rules-core", "agents-core", "commands-core"],
  "defaultInstall": false,
  "cost": "medium",
  "stability": "stable"
}
```

Key fields:
- **`targets`**: Which AI coding tool this module supports. ECC installs into Claude Code, Cursor, Antigravity, Codex, OpenCode, Gemini, and CodeBuddy.
- **`dependencies`**: Modules that must be installed first.
- **`cost`**: "light", "medium", or "heavy" — a proxy for context window impact.
- **`stability`**: "stable" or "beta".

### Level 2: Components (`install-components.json`)

Components are user-facing selections organized by family:

- **baseline**: rules, agents, commands, hooks, platform configs
- **language**: TypeScript, Python, Go, Java, Rust, Kotlin, Swift, C++, Perl, C#
- **framework**: React, Next.js, Django, Spring Boot, Laravel
- **capability**: database, security, research, content, orchestration, media, social, agentic, devops, supply-chain, documents

Each component maps to one or more modules.

### Level 3: Profiles (`install-profiles.json`)

Profiles are curated bundles for different user types:

| Profile | Modules | Use Case |
|---|---|---|
| `core` | rules, agents, commands, hooks, platform, quality | Minimal baseline |
| `developer` | core + framework-language + database + orchestration | Default for engineers |
| `security` | core + security module | Security-focused work |
| `research` | core + research-apis + business-content + social | Investigation and publishing |
| `full` | everything | All 20 modules |

### The Install CLI

```bash
install.sh --profile developer              # Install a profile
install.sh --modules rules-core,agents-core  # Install specific modules
install.sh --with capability:security        # Add a component
install.sh --without lang:java               # Exclude a component
install.sh --target cursor                   # Install for Cursor instead of Claude
install.sh --config ecc-install.json         # Load from config file
install.sh --dry-run --json                  # Preview as JSON
```

The installer also tracks state (`install-state.json`) to know what was previously installed, enabling incremental updates.

### Comparison with Our Install System

Our installer (`install.js`) copies everything from `operations/engineering/fars/agentic/` to `.claude/` based on a `manifest.json` that lists which components to include using glob patterns (`"agents": "*"`, `"skills": "*"`). There are no profiles, no dependency resolution, no cost tracking, no multi-target support, and no install state.

**What to adopt:**
1. **Cost annotation.** Knowing which skills are "heavy" (context-expensive) would help us make smarter decisions about what to load.
2. **Profiles.** Not the same profiles — we'd want profiles like "research session", "engineering session", "operations review" that load different subsets of our agents, skills, and commands.
3. **Install state.** Tracking what's installed enables incremental updates and drift detection.
4. **Dependency declaration.** Some of our skills reference other skills; making those dependencies explicit would catch broken references.

**What NOT to adopt:**
- Multi-target support. We're not a plugin. We run on Claude Code only.
- Language/framework modules. Our codebase is Node.js and Rust only.

## 4. Model Routing

ECC assigns models to agents explicitly in frontmatter:

| Model | Agents |
|---|---|
| **opus** | planner, architect, healthcare-reviewer, gan-planner, gan-generator, gan-evaluator |
| **sonnet** | code-reviewer, tdd-guide, e2e-runner, refactor-cleaner, security-reviewer, database-reviewer, performance-optimizer, all language-specific reviewers, all build resolvers, opensource-* pipeline, doc-updater, loop-operator, harness-optimizer |

The pattern is clear: **opus for reasoning, sonnet for execution.** Agents that need to think about architecture, plan multi-step work, evaluate quality at a deep level, or make judgment calls about clinical safety get opus. Agents that follow checklists, run commands, apply patterns, or do mechanical review get sonnet.

Our model routing follows the same pattern (planner and architect get opus, most reviewers and processors get sonnet) but we also have haiku-capable agents (observer) and a `/model-route` command that recommends tiers based on task complexity.

**What to adopt:** ECC's GAN harness demonstrates a specific model-routing pattern worth studying: the planner (opus) generates the spec, the generator (opus) builds it, and the evaluator (opus) tears it apart. All three get opus because adversarial quality requires reasoning at every stage. This is different from our pattern where we'd route the reviewer to sonnet. The lesson: when agents are in an adversarial loop, don't downgrade the critic.

## 5. Distinctive ECC Patterns

### The GAN Harness (Generator-Adversarial Network)

ECC's most novel contribution is three agents — `gan-planner`, `gan-generator`, `gan-evaluator` — that form an adversarial loop. The evaluator is explicitly instructed to be "ruthlessly strict" and to "fight your natural tendency to be generous." It scores against a weighted rubric, and the generator must address every issue before the next iteration.

This is structurally similar to our santa-method (two independent reviewers) but more sophisticated: it runs in a loop with iteration tracking, uses Playwright to test the live running application, and adjusts rubric weights for design vs. functionality.

### The Open-Source Pipeline

Three agents form a chain: `opensource-forker` (strip secrets, parameterize config) → `opensource-sanitizer` (verify independently, trust nothing) → `opensource-packager` (generate README, CLAUDE.md, setup.sh, templates). The sanitizer explicitly "never trusts the forker's work" — it re-scans everything independently using 20+ regex patterns for secrets.

This pipeline pattern — sequential agents where each stage audits the previous — is worth studying even if we never open-source fork anything. The principle of independent verification stages applies to any multi-agent pipeline.

### Session Save/Resume Protocol

ECC's `/save-session` command produces a structured document with specific sections: "What WORKED (with evidence)", "What Did NOT Work (and why)", "What Has NOT Been Tried Yet", "Exact Next Step." The resume command loads this and presents a briefing with "WHAT NOT TO RETRY" prominently displayed.

This is more structured than our session logs and addresses a real problem: sessions retrying approaches that already failed. Our session-state system tracks tool calls and events but doesn't capture the editorial judgment of what worked and what didn't.

### PRP (Plan-Research-Plan) Workflow

The `/prp-plan` command is the most detailed planning prompt in ECC. It runs through 6 phases (Detect → Parse → Explore → Research → Design → Architect → Generate) and produces a plan that includes a "Mandatory Reading" table, a "Patterns to Mirror" section with actual code snippets from the codebase, and a "No Prior Knowledge Test" — can a fresh agent implement from this plan alone?

The "Patterns to Mirror" approach is particularly clever: instead of telling the agent "follow project conventions," it finds and captures actual code patterns with file:line references, then instructs the implementation agent to replicate them exactly. This eliminates style drift.

## 6. Recommendations

### Commands to Add

1. **`/save-session`** — Structured session capture with what-worked/what-failed/next-step format. Distinct from our session logs, which capture events rather than editorial judgment.

2. **`/refactor-clean`** — Dead code detection and safe removal with test verification at each step. Extends our `harness-cleaner` pattern to application code.

3. **`/test-coverage`** — Coverage analysis with gap identification. Relevant for our Rust codebase (cargo-llvm-cov) and our hook scripts.

### Agent Patterns to Adopt

1. **Worked examples in agent prompts.** Every agent that produces structured output should include one complete worked example showing the expected format, level of detail, and quality bar.

2. **BAD/GOOD pattern pairs in reviewer agents.** Our code-reviewer lists what to check but doesn't show what violations look like.

3. **Adversarial evaluation loops.** Our santa-method skill describes the pattern; we should have a dedicated evaluator agent that can be dropped into any verification loop.

### Manifest Features to Build

1. **Cost annotation** on skills and agents (`light` / `medium` / `heavy`) to track context window impact.

2. **Session profiles** — load different subsets of the harness for different work types (research vs. engineering vs. operations review).

3. **Install state tracking** — record what's installed so we can detect drift, do incremental updates, and know when the harness needs reinstallation.

4. **Dependency declaration** between skills, so the installer can warn when a skill references another skill that isn't installed.

### Patterns NOT to Adopt

- **Language-specific agent proliferation.** ECC has 8 language-specific reviewers and 7 build resolvers. We have two languages (JS, Rust) and two corresponding specialists. Adding more would be premature.

- **Skills-first migration.** ECC is moving commands into skills because they're a plugin. Our commands are organizational entry points for a specific system — they should stay as commands.

- **Multi-model orchestration.** ECC's `/multi-workflow` routes frontend to Gemini and backend to Codex. We're a single-model system and the coordination overhead isn't justified.

- **TDD enforcement.** ECC mandates tests-before-code with 80%+ coverage. Our codebase includes a knowledge library, organizational records, and infrastructure scripts — TDD doesn't apply to most of our work. Where it does (Rust binary, Node.js hooks), we should test but not adopt the ritual.
