---
type: concept
class: maturation-arc
depends-on: [skill, agential-self-generation]
see-also: [operation-kinds, settlement]
title: Settlement path
description: The platform's pattern for how content matures from a fleeting observation into a settled, reusable artifact.
---

# Settlement path

The platform's pattern for *how content matures* from a fleeting observation into a settled, reusable artifact.
Content enters the substrate unsettled — a raw observation of something that happened — and progresses through stages, each stage adding predications and refining what the content commits to.
The endpoint is a settled artifact (a [skill](skill.md), a [runbook](runbook.md), a deterministic tool) the platform can apply repeatedly without re-deriving its content.

The arc has four stages:

- **Observation.** A predication-graph entity recording what happened — an event that occurred, a state that was reached, a failure that was diagnosed.
  The observation has *what-happened* predications; it carries no claim about why or what to do.
  The content is unsettled in the sense that no closure rules have yet matured it.
- **Instinct.** An entity derived from observations — predications declaring a *pattern* (this kind of event recurs), a *trigger* (when to consult the instinct), and a *why* (the diagnosed cause from the observations).
  An instinct is what reflection-on-observation produces: the pattern is named, the trigger is specified, the cause is recorded.
  The substrate's closure rules can match an instinct's trigger predication against current state to consult its claim.
- **Skill.** An entity declaring *when to apply* and *how to apply* — predications specifying the substrate operations that the skill performs, the preconditions that admit invocation, the postconditions that follow successful invocation.
  A skill is what consolidation-of-instincts produces when an instinct's pattern has been resolved into a structured procedure.
  Skills participate in [dispatch](dispatch.md) like any agent capability.
- **Tool.** A deterministic, in-substrate operation derived from a stable skill — closure-rule applications, graph operators, scripted procedures with no inference component.
  A tool is what *automation* produces: when a skill is invoked the same way often enough that its content can be settled into a deterministic procedure, the platform produces a tool entity that performs the operation with no language-model invocation needed.

Each stage is an entity in the substrate; each transition is a substrate operation that produces the next stage from the previous.
The entire arc is recorded in the [event log](../../../objects/event-log.md): an auditor can trace any tool back to the skills it consolidated, the instincts those skills consolidated, the observations those instincts derived from.
Per [agential self-generation](../../agent/agential-self-generation/agential-self-generation.md), the platform's own skills are subject to the arc — a skill the platform improves through observation-instinct-skill-tool cycles is a skill the platform is settling.

The arc maps to the [formality-layer](../../scope/formality-layer/formality-layer.md) discipline: observations are F0 content (raw, novel, costly to produce); instincts are F1; skills are F2; tools are F3 (deterministic, near-zero cost).
Maturation along the arc is decreasing cost-per-invocation as the content settles.
The platform that pushes content along the arc gains efficiency over time; the platform that does not stays at high formality and high cost.

The maturation is *not* automatic.
Each stage requires a closure rule that has the previous stage's content in its premise and the next stage's structure in its conclusion.
Particular platform realizations may automate the early stages (observation → instinct via reflection) and require human or higher-formality review for the later stages (skill → tool requires that the skill is determinate enough to settle).
The arc is the substrate-level structure; the rules that drive content along it are policy.
