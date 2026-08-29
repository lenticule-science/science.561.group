---
title: "Plan 0053: Model Capability Requirements in Skill Specs"
date-created: 2026-03-08T00:00:00
authors:
  - emsenn
  - claude
type: plan
status: active
priority: high
depends-on: []
goal: "003"
milestone: ""
keywords:
  - SkillSpecification
  - LocalModels
  - AgentCapability
---

# Plan 0053: Model Capability Requirements in Skill Specs

## Problem

Skills declare what they do, what they read and write, and what they
depend on. They do not declare what *agent capability* they require.

This is a gap: `interpret-message` requires a model capable of multi-step
reasoning across ambiguous natural language input. A 3B quantized model
cannot reliably execute it. The skill spec has no way to encode this
requirement, so an agent routing `interpret-message` to qwen2.5:3b would
produce degraded output with no warning.

As local models are used for more operations (plan 0054), routing by
capability becomes critical. Without a capability field in skill specs,
we cannot prevent a 0.5B classification model from attempting a reasoning
task designed for a 20B+ model.

## Goal

Extend the skill spec system to allow skills to declare minimum model
capability requirements. Agents and scripts must check these requirements
before routing work to a model.

## Approach

### 1. Define a capability taxonomy

Capability is not just parameter count. A well-chosen 7B reasoning model
can outperform a poorly-chosen 13B model on specific tasks. The taxonomy
should be task-based, not parameter-based:

| Capability level | Description | Example models |
|-----------------|-------------|----------------|
| `trivial` | Keyword extraction, format detection, simple classification | qwen2.5-0.5b, qwen3:1.7b |
| `classification` | Multi-label classification, tag generation, type inference | qwen2.5:3b, phi4-mini |
| `extraction` | Structured output, entity extraction, frontmatter generation | qwen2.5:7b, mistral-7b |
| `generation` | Coherent prose, summarization, definition writing | qwen2.5:7b, gemma3:12b |
| `reasoning` | Multi-step inference, contradiction detection, planning | deepseek-r1-7b, claude-sonnet-4 |
| `long-context` | Processing documents >8k tokens | phi-3-mini-128k |
| `cloud-required` | Tasks requiring cloud model quality (final review, editorial) | claude-opus-4 |

### 2. Add `min-capability` field to skill frontmatter

Extend the skill specification to include an optional `min-capability`
field:

```yaml
min-capability: reasoning
```

Skills without this field are assumed to require `trivial` capability —
they can run on any model.

### 3. Define the skill specification field

Update `content/technology/specifications/agential-semioverse-repository/
specifications/skill-specification.md` to document the `min-capability`
field, its valid values, and the enforcement semantics.

### 4. Update the skill registry

The skill registry (`.claude/skills/registry.md`) should include a
`min-capability` column so agents can read capability requirements
without opening individual skill files.

### 5. Update routing in interpret-message and MCP tools

The `interpret-message` skill (and the MCP `delegate_task` tool) should
check `min-capability` against the available model before dispatching.

For MCP `delegate_task`: if the caller supplies a `model` argument,
validate it against the skill's `min-capability`. If the model is
insufficient, return an error with the minimum requirement rather than
running with a degraded model.

### 6. Update `local_llm.suggest_model()`

Add a `min_capability` parameter to `suggest_model()` that filters
out models below the required capability level:

```python
suggest_model(task="classification", min_capability="extraction")
```

### 7. Annotate existing skills

After the spec is written, do a pass over all skills in the registry
and add `min-capability` where the default (`trivial`) is wrong:

- `interpret-message` → `reasoning`
- `make-specification` → `reasoning`
- `enrich-triage` (inference path) → `classification`
- `mine-triage-relevance` → `classification`
- `write-advisory-report` → `generation`

## Files to create/modify

| File | Change |
|------|--------|
| `specifications/skill-specification.md` | Add `min-capability` field |
| `.claude/skills/registry.md` | Add `min-capability` column |
| `skills/interpret-message/SKILL.md` | Set `min-capability: reasoning` |
| `scripts/local_llm.py` | Add `min_capability` param to `suggest_model()` |
| `scripts/mcp-server.py` | Add capability check in `delegate_task` |

## Not in scope

- Automatic model selection based on capability (that is `suggest_model`'s
  job — this plan only adds the *declaration* layer)
- Fine-grained benchmarks of specific models against specific tasks
- Hardware-aware capability declaration (NPU vs CPU)

## Log

- 2026-03-08: Plan created. Captures the need identified when emsenn noted
  that `interpret-message` requires 20B+ reasoning but the skill spec
  provides no way to encode this constraint.
