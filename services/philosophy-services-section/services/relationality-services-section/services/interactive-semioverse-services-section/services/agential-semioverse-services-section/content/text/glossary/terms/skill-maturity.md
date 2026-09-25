---
name: "Skill maturity"
date-created: 2026-03-07
authors:
  - emsenn
  - claude
aliases:
  - "runtime promotion"
  - "skill lifecycle"
type: concept
keywords:
  - AgentialSemioverse
  - ProgressiveAutomation
  - SkillLifecycle
description: "The lifecycle by which skills mature from inference-heavy to procedural to automated, with MCP as the substrate for promotion."
date-updated: 2026-03-09
---

Skill maturity describes the lifecycle by which a skill transitions
from requiring high-capability inference to being executable by
deterministic tooling. It is the operational expression of
[policy 001](../../../../personal/projects/emsemioverse/policies/001-progressive-automation.md)
(progressive automation) applied to the
[skill manifest](../../documents/articles/notes/skill-manifests.md) system.

## The maturity axis

The `runtime` field in a skill manifest already distinguishes
execution modes: `inference`, `script`, `mcp`, `manual`,
`documentation`. These represent endpoints, not a lifecycle. Skill
maturity describes the transition pathway between them.

A skill matures through stages:

1. **Inference-heavy** (`runtime: inference`). The agent reads the
   SKILL.md body and applies judgment. Inputs and outputs are
   underspecified. The agent is the engine. This is where every new
   skill starts.

2. **Structured inference** (`runtime: inference` with typed schemas).
   The skill has clear `inputs` and `outputs` in its manifest. The
   agent still exercises judgment, but within a well-defined I/O
   contract. A less capable agent can follow the instructions if the
   schemas constrain the space enough.

3. **Delegable** (`runtime: inference` routed to a local model). The
   skill's instructions are specific enough that a smaller model
   (qwen2.5:7b via `delegate_task`) can execute them. The skill is
   still inference-based, but the inference is mechanical —
   classification, format conversion, frontmatter generation. The
   agent selects the skill; the local model executes it.

4. **Procedural** (`runtime: script`). The skill is a deterministic
   program. No model is needed. The script encodes the exact steps
   that inference previously discovered. This is where the skill
   becomes infrastructure.

5. **Tool** (`runtime: mcp`). The skill is an MCP tool — callable by
   any agent with MCP access, with typed JSON input/output,
   composable with other tools. The skill is no longer a document to
   be read; it is an API to be called.

## Runtime promotion

The transition from one stage to the next is **runtime promotion**.
Each promotion makes the skill:

- **Cheaper** — less capable (and less expensive) agents can execute it
- **Faster** — deterministic execution outperforms inference
- **More reliable** — fewer degrees of freedom mean fewer failure modes
- **More composable** — typed I/O enables pipeline construction

Promotion is not automatic. It requires observing the skill in use,
identifying the invariant structure of its execution, and encoding
that structure in a more deterministic form.

## The MCP boundary

The architectural consequence: as skills mature, the system's
operational boundary shifts from the agent to the MCP layer. External
agents (Claude, local models, future heterogeneous agents) become
callers. The emsemioverse's MCP tools do the work. The agent's role
contracts to: selecting which tool to call, providing context, and
handling novel situations where no mature skill exists.

This is the direction expressed by
[closure pressure](./closure-pressure.md) applied to the skill
system: skills under repeated execution pressure tend toward closure
(deterministic, idempotent operations). Mature skills are closed
under their own operation — re-running them produces the same result,
which is exactly the idempotency property formalized in Section 9 of
the [work-unit lifecycle](../../documents/articles/notes/work-unit-lifecycle.md).

## Relationship to delegation

The `delegate_task` MCP tool occupies a specific position in this
lifecycle: it enables stage 3 (delegable) without requiring
promotion to stage 4 (procedural). A skill that is well-specified
enough for a local model to execute, but not yet fully deterministic,
can be routed through `delegate_task`. This creates a feedback loop:
delegated tasks whose outputs are reliable enough indicate readiness
for promotion to script or MCP tool.

Local models are text-forming tools, not knowledge sources. A
delegated task must provide all knowledge the model needs as context
(file contents, schemas, examples). The model transforms, classifies,
or formats that knowledge — it does not generate new knowledge.
Knowledge acquisition (research, web search, reasoning under
uncertainty) stays with capable agents that have tool access. This
constraint is what makes delegation reliable: the model operates on
supplied facts, not on its training distribution.

## Related concepts

- [Policy 001](../../../../personal/projects/emsemioverse/policies/001-progressive-automation.md) — the policy this concept operationalizes
- [Skill manifests](../../documents/articles/notes/skill-manifests.md) — where `runtime` is declared
- [Work-unit lifecycle](../../documents/articles/notes/work-unit-lifecycle.md) — idempotent work units as mature operations
- [Closure pressure](./closure-pressure.md) — the drive that promotes skills toward determinism

## Earlier material

This is the direction expressed by [closure pressure](../../../../../../../agency-services-section/content/text/documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/relating/content/agential-semioverse/content/vocabulary/content/skill-maturity/closure-pressure.md) applied to the skill system: skills under repeated execution pressure tend toward closure (deterministic, idempotent operations).
Mature skills are closed under their own operation — re-running them produces the same result, which is exactly the idempotency property formalized in Section 9 of the [work-unit lifecycle](../../documents/articles/notes/work-unit-lifecycle.md).

- [Policy 001](../../../../../../../agency-services-section/content/text/documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/relating/content/agential-semioverse/personal/projects/emsemioverse/policies/001-progressive-automation.md) — the policy this concept operationalizes
- [Skill manifests](../../../../../../../agency-services-section/content/text/documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/relating/content/agential-semioverse/content/vocabulary/content/theory/skill-manifests.md) — where `runtime` is declared
- [Work-unit lifecycle](../../documents/articles/notes/work-unit-lifecycle.md) — idempotent work units as mature operations
- [Closure pressure](../../../../../../../agency-services-section/content/text/documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/relating/content/agential-semioverse/content/vocabulary/content/skill-maturity/closure-pressure.md) — the drive that promotes skills toward determinism
