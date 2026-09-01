---
name: skill
description: An entity-form whose characteristic predication-shape makes it invocable by an agent — declaring closure-position, operation-kind, body reference, preconditions, postconditions, and witness shape.
---

A **skill** is a categorical entry reifying a bounded competence an agent can invoke.
Per the dissolution of the recipe-vs-runbook boundary, a skill may be a single bounded operation (script-runtime), an agent-judgment-bearing inference (inference-runtime), or a composition of sub-skills (runbook-shaped) — all three are skills, distinguished by their bodies.

Per agential self-generation, every invocable skill is a categorical entry.
A competence that lives only in external code is an unrecorded gap, not a skill.

## Distinguishing predication-shape

Cells uniquely characteristic of a skill:

- `has-name(skill, slug)` — kebab-case identifier.
- `has-description(skill, two-sentence-string)` — the effect-and-trigger surface bounded by Claude Code's prompt discipline.
- `has-closure-position(skill, {process | procedure | derivation | inquiry})` — the skill's settlement-grade.
  Equivalently the (σ-fixed?, Δ-fixed?) closure-status of the work the skill produces.
- `has-operation-kind(skill, {observation | guard | accounting | query | mutation | analysis | learning})` — the kind of cell-graph operation the skill's body composes.
  Orthogonal to closure-position.
- `has-body(skill, body-reference)` — the body's externally-visible interface.
  Either a reference to a script (`scripts/<name>.mjs`) or an inference-runtime body specification carried in the skill's `Steps` section.
- `composes(skill, sub-skill)` — the skill invokes the named sub-skill as one of its steps.
  Acyclic.
- `produces-witness-shape(skill, witness-shape)` — the witness shape the skill's invocation emits.
- `requires-precondition(skill, shape)` — a shape predicate the input must satisfy for invocation to be admissible.
- `requires-postcondition(skill, shape)` — a shape predicate the output must satisfy after successful invocation.
- `admissible-in-scope(skill, scope)` — a scope within which the skill is invocable.
- `requires-power(skill, power)` — a power-record the invoking agent must hold.

## Invariants

- **One closure-position.** The skill occupies exactly one of the four positions.
  A skill that crosses positions is two skills.
- **One operation-kind.** The skill occupies exactly one of the seven operation-kinds.
  The two classifications are orthogonal; both are required.
- **Acyclic composition.** The `composes` DAG over the skill catalog must be acyclic.
- **Body resolves.** The `has-body` reference resolves to a script that exists on disk (for script-runtime skills) or to a fully-specified inference body (for inference-runtime skills).
  A `SKILL.md` that names a script not on disk is ill-formed.
- **Precondition / postcondition vocabularies are first-classed.** Every shape referenced by `requires-precondition` or `requires-postcondition` is itself a categorical entry.
  References to undefined shapes are forward references requiring resolution.

## Step-induction role

A skill is the reification of *invocable competence*.
Without skill as a distinct form, the dispatcher could match agents to work only by traversing the agents' free-text capability claims, and there would be no place to record the static composition graph that lets auditors check which competences depend on which others.

The skill-form earns its place because:

1. Dispatch needs an invocable surface to match against.
  Capability predications on agents reference skill entities by name; without skill records, the references would be unresolvable.
2. The composition DAG must be categorically-readable.
  Skills compose via `composes`; auditing whether a skill transitively invokes a particular sub-skill is a graph traversal.
3. Witness chains need typed targets.
  A jsonl witness line names the skill that fired; if skills weren't categorical entries, witnesses would carry unresolvable references.

## The skill-invocation operator

Skill invocation is the closure-rule application that fires the skill's body within the invoking agent's authorized scope, recorded as:

$$\mathrm{invoke}(\mathrm{agent}, \mathrm{skill}, \mathrm{scope}, \mathrm{input}) \;\longrightarrow\; (\mathrm{output}, \mathrm{witness})$$

The three phases — precondition check, body execution, postcondition check — align with the Austin-Searle locution / illocution / perlocution factorization: the precondition selects the target predication cells (locution); the body posits the operation's evidence (illocution); the postcondition propagates the closure (perlocution).
The witness records the trace.

## Surface as generator-set projection

An agent's directly-invocable surface is a *generator set* of its capability, not the capability itself.
The `composes` relation, transitively closed, gives a closure operator on the skill catalog (per [`closure-operator`](closure-operator.md)).
A character carries a generator set `G` (its `skills:` cell); the effective capability is `cl(G)` under `composes*`.
The MCP harness exposes `G`, not `cl(G)`.
Helpers reached only through transitive composition stay off the tool surface and are invoked by the parent skill's script.
The projection `cl(G) → G` is the audit story: every helper firing is recorded as part of some surface skill's witness chain.

## Not synonymous with

- **Tool** — a tool extends what an agent can do; a skill shapes how the agent does work.
  The MCP harness presents skills as tools at the Claude Code surface, but the skill is the underlying record, the tool is the session-visible projection.
- **Rule** — a rule fires on every applicable state without invocation; a skill is invoked.
  Both are categorical entries of distinct forms.
- **Transformer** — a transformer is a formal categorical operation (an arrow with domain, codomain, and structure-preservation claim).
  A skill may invoke a transformer in its body; a skill is not itself a transformer unless it carries the full categorical signature.
