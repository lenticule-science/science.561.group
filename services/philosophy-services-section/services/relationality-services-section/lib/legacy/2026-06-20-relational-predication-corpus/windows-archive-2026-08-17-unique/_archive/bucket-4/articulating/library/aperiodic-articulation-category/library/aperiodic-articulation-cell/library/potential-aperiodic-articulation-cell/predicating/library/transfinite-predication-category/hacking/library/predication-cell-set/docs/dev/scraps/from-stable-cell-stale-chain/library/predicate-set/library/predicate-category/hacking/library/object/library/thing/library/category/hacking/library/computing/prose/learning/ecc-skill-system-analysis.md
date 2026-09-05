---
title: "ECC Skill System Analysis"
description: "Analysis of the Everything Claude Code skill system — activation patterns, composition, the curated/generated distinction, quality patterns, and recommendations for the 561 harness."
date-created: 2026-04-04
sources:
  - operations/engineering/fars/src/everything-claude-code/
concerns:
  - agentic-engineering
  - skill-design
  - harness-construction
---

Everything Claude Code (ECC) is a community-maintained Claude Code plugin containing 156 curated skills, plus infrastructure for generating, importing, and evolving skills at runtime. This text analyzes how ECC's skill system works and extracts patterns relevant to the 561 harness.

## What a Skill Is

A skill is a passive knowledge module that Claude Code loads based on context. ECC distinguishes skills from four sibling component types:

| Component | Activation | Role |
|-----------|-----------|------|
| Skill | Context-based (automatic) | Knowledge repository |
| Agent | Explicit delegation | Task executor |
| Command | User-invoked (`/command`) | User action |
| Hook | Event-triggered | Automation |
| Rule | Always active | Constraint |

The key distinction: skills are *passive*. They do not execute. They inject knowledge into context when Claude determines they are relevant. Rules are always loaded; skills are loaded on demand. This is the fundamental architectural decision — skills trade guaranteed presence for reduced token cost.

## Skill File Structure

Every skill lives in `skills/<skill-name>/SKILL.md` with optional `examples/` and `references/` subdirectories. The SKILL.md has YAML frontmatter:

```yaml
---
name: skill-name          # Required. Lowercase, hyphenated.
description: ...          # Required. One-line. Used for auto-activation.
origin: ECC               # Optional. Attribution.
---
```

The `description` field is the most consequential line in the file. It serves double duty: it appears in the CLAUDE.md skill table *and* it is the primary signal Claude uses to decide whether to load the skill. Everything downstream — whether the skill fires, whether it fires at the right time — depends on this line.

## Activation Patterns

### The "When to Activate" Section

Every well-formed ECC skill contains a `## When to Activate` (or `## When to Use`) section. Examining the corpus reveals three tiers of activation specificity:

**Tier 1: Vague (unreliable activation)**

```markdown
## When to Use
- Writing Python code
- Code review
```

Skills like `python-patterns` trigger on extremely broad conditions. Claude must decide between this and dozens of other potentially relevant skills. Vague triggers lead to inconsistent activation — the ECC docs themselves note that skills "fire ~50-80% of the time based on Claude's judgment."

**Tier 2: Specific scenarios (reliable activation)**

```markdown
## When to Activate
- Setting up eval-driven development (EDD) for AI-assisted workflows
- Defining pass/fail criteria for Claude Code task completion
- Measuring agent reliability with pass@k metrics
```

The `eval-harness` skill triggers on specific *activities*, not just topics. This narrows the activation window and increases precision.

**Tier 3: Explicit trigger/inhibit (most reliable)**

```markdown
TRIGGER when: user says "optimize prompt", "improve my prompt", "how to write a prompt for"
DO NOT TRIGGER when: user says "optimize code", "optimize performance"
```

The `prompt-optimizer` skill (contributed by a community member) adds explicit DO NOT TRIGGER conditions. This is the most reliable pattern because it handles the confusion cases directly. The 561 harness adopted this pattern in CLAUDE.md skill descriptions.

### Description-as-Trigger

The `description` field in frontmatter is what appears in the CLAUDE.md skill table. It must do two jobs simultaneously:

1. Tell a *human* what the skill does (for scanning the table)
2. Tell *Claude* when to activate (for context-based loading)

The best ECC descriptions accomplish both:

> "Multi-agent adversarial verification with convergence loop. Two independent review agents must both pass before output ships."

This tells a human: it's a verification method. It tells Claude: activate when output needs dual-agent review before shipping.

The worst descriptions are generic:

> "A comprehensive verification system for Claude Code sessions."

This could mean anything. Claude cannot reliably distinguish this from ten other verification-adjacent skills.

### Activation Reliability

ECC's own continuous-learning-v2 skill documents the fundamental limitation:

> "v1 relied on skills to observe. Skills are probabilistic — they fire ~50-80% of the time based on Claude's judgment."

This is why v2 moved observation to hooks (100% deterministic). The lesson: skills are not a reliable execution mechanism. They are a knowledge-injection mechanism. If something *must* happen, use a hook or rule. If something *should be known*, use a skill.

## Composition Patterns

### Skill-to-Skill References

ECC skills compose through explicit cross-references, not imports. Common patterns:

**Delegation**: The `article-writing` skill says: "If the user wants a specific voice, run `brand-voice` first and reuse its `VOICE PROFILE`." One skill explicitly defers a sub-task to another.

**Sequencing**: The `prompt-optimizer` skill maps tasks to sequences of skills and commands: "For HIGH scope: Opus for blueprint planning, Sonnet for execution." Skills define workflow choreography without executing it.

**Integration tables**: The `santa-method` skill has a dedicated section:

| Skill | Relationship |
|-------|-------------|
| Verification Loop | Run verification-loop first, Santa second |
| Eval Harness | Santa findings feed eval metrics |
| Continuous Learning v2 | Santa findings become instincts |

These tables make composition explicit and discoverable.

### Skill-to-Agent References

Skills frequently prescribe which agents to spawn. The `search-first` skill says: "For non-trivial functionality, launch the researcher agent." The `prompt-optimizer` maps task types to agent types. Skills serve as the knowledge layer; agents serve as the execution layer.

### Skill-to-Command References

Skills reference commands as concrete invocation points: "Run `/verify` before committing." Commands are user-triggered entry points that may internally leverage skill knowledge.

## The Curated vs Generated Distinction

ECC maintains a formal placement policy (documented in `docs/SKILL-PLACEMENT-POLICY.md`) with four tiers:

| Type | Location | Shipped | Provenance |
|------|----------|---------|------------|
| Curated | `skills/` (repo) | Yes | Not required |
| Learned | `~/.claude/skills/learned/` | No | Required |
| Imported | `~/.claude/skills/imported/` | No | Required |
| Evolved | `~/.claude/homunculus/evolved/` | No | Inherited |

Key design decisions:

1. **Only curated skills ship.** Install manifests reference only `skills/`. Generated skills never leave the user's machine.
2. **Generated skills require provenance.** A `.provenance.json` file records source, creation time, confidence, and author. Curated skills don't need this because they are code-reviewed.
3. **The evolution pipeline is instincts → clusters → skills.** Individual observations become atomic instincts (with confidence 0.3–0.9), which get clustered into skills when patterns emerge. This is the continuous-learning-v2 system.
4. **Project scoping prevents cross-contamination.** v2.1 isolates instincts per project. React patterns stay in React projects.

This architecture solves a real problem: generated skills are lower quality than curated skills, but they capture project-specific patterns that curated skills cannot. The provenance system lets the infrastructure treat them differently.

## Quality Observations

### Most Valuable Skills

The skills that deliver the most value per token share these properties:

1. **They encode a workflow, not just knowledge.** The `autonomous-loops` skill doesn't explain what loops are — it provides six concrete patterns with decision matrices for choosing between them. The `santa-method` provides a complete verification architecture.

2. **They include anti-patterns.** The `article-writing` skill lists banned phrases. The `autonomous-loops` skill has a dedicated anti-patterns section. Knowing what *not* to do is often more actionable than knowing what to do.

3. **They have decision trees.** The `autonomous-loops` skill ends with a decision matrix: "Is the task a single focused change? → Sequential Pipeline." The `search-first` skill has an adopt/extend/compose/build matrix. These enable Claude to select the right sub-pattern without human guidance.

4. **They compose explicitly.** The best skills list their relationships to other skills, agents, and commands in tables. This makes the harness self-documenting.

### Recurring Quality Problems

1. **Description-activation mismatch.** Many skills have descriptions that are too broad for reliable activation. The `verification-loop` description says "comprehensive verification system" — indistinguishable from several other skills.

2. **Unbounded scope.** Framework-pattern skills (`django-patterns`, `springboot-patterns`) try to cover an entire framework in one file. These frequently exceed 500 lines and provide shallow coverage of too many topics.

3. **Missing negative triggers.** Most skills say *when* to activate but not *when not to*. The `prompt-optimizer` is an exception. Without negative triggers, skills fire in adjacent contexts where they are unhelpful.

4. **Code-heavy, principle-light.** Language-pattern skills tend to be collections of code snippets without explaining *why* these patterns matter. The snippets become stale as frameworks evolve; the principles would remain useful.

## Comparison to the 561 Harness

The 561 harness (18 skill directories, plus skills referenced only in CLAUDE.md) differs from ECC in several structural ways:

### What 561 Does Better

1. **Explicit TRIGGER/DO NOT TRIGGER in CLAUDE.md descriptions.** Our skill table entries like `writing-philosophy-surveys` include both positive and negative activation conditions directly in the description string. This is the most reliable activation pattern, and we apply it more consistently than ECC.

2. **Domain-specific skill specialization.** Skills like `writing-botanical-terms`, `writing-gardening-texts`, and `writing-philosophy-surveys` are narrow and deep. They encode the exact conventions for a specific content type. ECC's equivalent would be one broad `content-writing` skill.

3. **The interpret-directives skill.** This has no ECC equivalent. It handles a specific interaction pattern (visionary captain → structured artifacts) that is deeply specific to our workflow. This is exactly what a skill should be — a workflow pattern that would be impossible to rediscover from scratch each session.

4. **Skills as process, not just knowledge.** Our `writing-terms` skill doesn't just list term conventions — it defines a complete procedure: file location, voice standard, structure by type, frontmatter patterns. ECC's template skills tend to be more declarative.

### What ECC Does Better

1. **Composition documentation.** ECC skills explicitly list their relationships to other skills, agents, and commands. Our skills rarely reference each other. The `santa-method` integration table is a pattern worth adopting.

2. **The curated/generated distinction.** ECC formally separates curated skills (shipped, code-reviewed) from generated skills (local, confidence-scored, provenance-tracked). Our harness installs everything from `tools/agentic/skills/` without a quality tier.

3. **Anti-pattern sections.** ECC's best skills include explicit anti-patterns with concrete examples. Our skills tend to state conventions without showing what violations look like.

4. **Validation infrastructure.** ECC has `validate-skills.js` in CI that checks every skill directory for a non-empty SKILL.md. We have no automated skill validation.

## Recommendations for the 561 Harness

### 1. Add negative triggers to all skill descriptions

Every skill description in CLAUDE.md should include a DO NOT TRIGGER condition. Priority targets: `search-first` (fires too broadly), `concept-lookup` (conflicts with mid-task term usage), `writing-surveys` (conflicts with `research-survey`).

### 2. Add composition tables to skills

Each skill should include a `## Related Skills` or `## Integration` section that explicitly maps its relationships to other skills, agents, and commands. This makes the harness self-documenting and helps Claude choose between overlapping skills.

### 3. Add anti-pattern sections to writing skills

The `writing-terms`, `writing-texts`, and `writing-surveys` skills should include concrete examples of what *not* to do — AI prose, hedging, padding, generic transitions. The rules file `content-conventions.md` covers some of this, but embedding anti-patterns in the skill itself is more reliable because the skill is loaded precisely when the agent is writing.

### 4. Consider a validation script

A simple script that checks each `skills/*/SKILL.md` exists, has valid frontmatter, and has a `When to Activate` section would catch skill rot early. This could run as part of the harness install process.

### 5. Track skill activation reliability

The continuous-learning system already observes tool usage. Extending it to track *which skills were loaded when work succeeded vs failed* would provide data for tuning trigger descriptions. This is the eval-driven approach applied to skill design.

## See Also

- [Continuous Learning in Agentic Harnesses](./continuous-learning-in-agentic-harnesses.md)
- ECC source: `operations/engineering/fars/src/everything-claude-code/`
- ECC skill development guide: `operations/engineering/fars/src/everything-claude-code/docs/SKILL-DEVELOPMENT-GUIDE.md`
- ECC skill placement policy: `operations/engineering/fars/src/everything-claude-code/docs/SKILL-PLACEMENT-POLICY.md`
