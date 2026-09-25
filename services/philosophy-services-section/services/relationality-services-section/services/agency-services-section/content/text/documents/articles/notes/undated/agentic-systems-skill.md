---
name: skill
description: An entity-form whose characteristic predication-shape makes it invocable by an agent — declaring closure-position, operation-kind, body reference, preconditions, postconditions, and witness shape. A $\mathcal{P}$-morphism with domain = precondition shape and codomain = postcondition shape.
specializing: agentic-systems
is-morphism-of: predication-category
realizes-standard: claude-code-skills
title: skill
---

A **skill** is a categorical entry reifying a bounded competence an agent can invoke.
Per the dissolution of the recipe-vs-runbook boundary, a skill may be a single bounded operation (script-runtime), an agent-judgment-bearing inference (inference-runtime), or a composition of sub-skills (runbook-shaped) — all three are skills, distinguished by their bodies.

## Why a skill is a $\mathcal{P}$-morphism

Per [transformer.md](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/transformer/transformer.md), a transformer is a morphism of the predication category $\mathcal{P}$ — an arrow $T : A \to B$ with a single domain entity and a single codomain entity.
A skill's declared `requires-precondition` shape is its domain $A$; its declared `requires-postcondition` shape is its codomain $B$; its `has-body` is the morphism's data; its `composes` chain is categorical composition with structural acyclicity; its `produces-witness-shape` is the EAVT row emitted when the arrow fires.
These five cells, together, satisfy the full categorical signature of a $\mathcal{P}$-morphism.
The Claude Code Skills SKILL.md surface (name + description + input/output schema pair + scripts directory) is the byte-level realization of that signature.

This entity record supersedes the conservative position in [the historic glossary record](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/code/structures/skill.md) (which hedged that a skill is "not itself a transformer unless it carries the full categorical signature").
The layout work has clarified that every well-formed skill carries that signature; the lawful filesystem position of a skill is therefore the transformer slot at its codomain structure's `doing/working/` subdir per [the layout map](../../../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/semiotic-computer-system-services-section/lib/legacy/2026-07-05-doing/working/hacking/doing/working/planning/library/project/library/realigning-the-repository-layout/study-notes/layout-map.md).

## Distinguishing predication-shape

- `has-name(skill, slug)` — kebab-case identifier.
- `has-description(skill, two-sentence-string)` — the effect-and-trigger surface bounded by Claude Code's prompt discipline.
- `has-closure-position(skill, closure-position)` — one of the four settlement-grades per the [closure-position structure](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/operating-system/library/computer-operating-system/library/closure-position/closure-position.md) (process, procedure, derivation, inquiry).
- `has-operation-kind(skill, {observation | guard | accounting | query | mutation | analysis | learning})` — the kind of cell-graph operation the skill's body composes.
  Orthogonal to closure-position.
- `has-body(skill, body-reference)` — either a reference to a script (`scripts/<name>.mjs`) or an inference-runtime body specification carried in the skill's `Steps` section.
- `composes(skill, sub-skill)` — the skill invokes the named sub-skill as one of its steps.
  Acyclic.
- `produces-witness-shape(skill, witness-shape)` — the witness shape the skill's invocation emits.
- `requires-precondition(skill, shape)` — the shape predicate the input must satisfy.
  This is the morphism's domain.
- `requires-postcondition(skill, shape)` — the shape predicate the output must satisfy.
  This is the morphism's codomain.
- `admissible-in-scope(skill, scope)` and `requires-power(skill, power)` — dispatch-time admissibility checks.

## Invariants

- **One closure-position.** A skill that crosses positions is two skills.
- **One operation-kind.** Orthogonal to closure-position; both classifications required.
- **Acyclic composition.** The `composes` DAG over the skill catalog must be acyclic.
- **Body resolves.** A SKILL.md naming a script not on disk is ill-formed.
- **Precondition / postcondition vocabularies are first-classed.** Every shape referenced is itself a categorical entry; forward references require resolution.

## The skill-invocation operator

Skill invocation is the closure-rule application that fires the skill's body within the invoking agent's authorized scope:

$$\mathrm{invoke}(\mathrm{agent}, \mathrm{skill}, \mathrm{scope}, \mathrm{input}) \;\longrightarrow\; (\mathrm{output}, \mathrm{witness})$$

The three phases — precondition check, body execution, postcondition check — align with the Austin–Searle locution / illocution / perlocution factorization: precondition selects the target cells (locution); body posits the operation's evidence (illocution); postcondition propagates closure (perlocution).
The witness records the trace.

## Surface as generator-set projection

A character's directly-invocable surface is a *generator set* of its capability, not the capability itself.
The `composes` relation, transitively closed, gives a closure operator on the skill catalog.
A character carries a generator set $G$ (its `skills:` cell); the effective capability is $\mathrm{cl}(G)$ under `composes*`.
The MCP harness exposes $G$, not $\mathrm{cl}(G)$.
Helpers reached only through transitive composition stay off the tool surface and are invoked by the parent skill's script.
Every helper firing is recorded as part of some surface skill's witness chain.

## Not synonymous with

- **Tool** — a tool extends what an agent can do; a skill shapes how the agent does work.
  The MCP harness presents skills as tools at the Claude Code surface, but the skill is the underlying record, the tool is the session-visible projection.
- **Rule** — a rule fires on every applicable state without invocation; a skill is invoked.
