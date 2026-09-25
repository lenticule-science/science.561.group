---
title: "Agential Semioverse"
date-created: 2026-01-04
tags: []
aliases:
  - "Agential Semioverse"
  - "agential semioverse"
description: "Let's construct an Agential Semioverse: an interactive-semioverse enriched with agents, skills, and tools, where all operations are mediated by a disciplined skill calculus and interpreted as interaction operators on partial states."
---
## Abstract

Let's construct an **Agential Semioverse**: an [interactive-semioverse](../interactive-semioverse/interactive-semioverse.md) enriched with agents, skills, and tools, where all operations are mediated by a disciplined skill calculus and interpreted as interaction operators on partial states.

The Agential Semioverse extends the Interactive Semioverse by adding:

- a set of agent handles with profiles (roles, goals, policies, memory);
- a set of tools as primitive, typed, partial operators on states;
- a skill calculus that composes tools into parametric procedures;
- an execution semantics for agent-skill evaluation;
- policy and authorization as monotone restrictions on admissible operators;
- a fusion principle identifying skills with fragmentwise identical semantics.

All new operators must be fragment-preserving and closure-compatible. The
resulting structure admits a [least fixed point](../../../concepts/fixed-point/index.md) extension and is initial among
agential semioverse structures over the same primitives.

## Scope and intent

This specification defines the Agential Semioverse as an iteration of the
Interactive Semioverse in which internal agents operate over a [semiotic](../../../../linguistics/topics/semiotics/index.md)
library. It does not define user interfaces, model architectures, or
deployment topology. It defines only the mathematical objects, admissibility
constraints, and execution judgments required to make agents, skills, and
executable documents precise, interoperable, and non-arbitrary.

The guiding constraint is that agency is internal: all agent activity must be
representable as admissible interaction operators acting over the same
universe, closure structure, and provenance discipline already defined for the
Interactive Semioverse.
---

# Base Semioverse (Reference)

## Underlying universe (assumed)

Let U denote the universe of partial [semiotic](../../../../linguistics/topics/semiotics/index.md) states. Elements of U are
fragmentary, monotone-extensible structures (for example, libraries of files
with metadata, provenance, and evaluation state). Let Int denote the class of
admissible interaction operators:

  E: U -> U

such that E satisfies the previously defined constraints (monotonicity,
fragment compatibility, closure preservation, provenance extension, and
failure monotonicity). No object introduced below may bypass or weaken these
constraints.

We assume a fixed Interactive Semioverse as in the base mathematics, with:

- a complete [Heyting algebra](../../../concepts/heyting-algebra/index.md) H with modality j and trace G;
- a definable operator algebra Op^def interpreted into H;
- fragments as finitely generated modal-temporal subalgebras;
- [closure operators](../../../concepts/closure-operator/index.md) S_sem, S_syn, S_fus with [least fixed point](../../../concepts/fixed-point/index.md) X*;
- [handles](../../../../../../../content/text/glossary/terms/handle.md), [interaction terms](../../../../../../../content/text/glossary/terms/interaction-term.md), [footprints](../../../../../../../content/text/glossary/terms/footprint.md), provenance, failure, and
  interaction operators.

All agential structures are built on top of this base.

---

# Agents and Profiles

## Agent Handles

Let Agent be a set of **agent handles**. Handles are external indices and are
not elements of H.

## Agent Profiles

An **agent profile** is a tuple

  P(a) = (role_a, goals_a, policy_a, Skills_a, Tools_a, Mem_a)

where:

- role_a is a role label;
- goals_a is a finite set of goals;
- policy_a is a policy predicate on actions (Section 6);
- Skills_a is a set of skills the agent can invoke;
- Tools_a is a set of tools the agent can invoke directly;
- Mem_a is a partial state (or fragment) representing agent memory.

We collect profiles as a function P : Agent -> Profile.

## Memory as a Local Fragment

Each memory Mem_a is a partial state (H_a, Op_a) with H_a subset of H and
Op_a subset of Op^def, intended to be fragment-bounded. Memory is updated only
through skills and is closed under the base [closure operator](../../../concepts/closure-operator/index.md) S.

## Internal agents

An internal agent is a triple

  A = (Sigma, K, Pi)

where:

- Sigma is a bounded internal state space (finite or well-founded);
- K subseteq Int is a finite set of interaction operators (the agent's
  skillset);
- Pi: (Sigma x U) -> P(K) is a policy selecting admissible operators.

The induced agent step operator is:

  E_A: (U x Sigma) -> (U x Sigma)

such that:

  E_A(u, sigma) = (E(u), sigma')

with E in Pi(sigma, u).

Key constraints:

- E_A is monotone in U;
- agent state updates may not invalidate prior provenance;
- agents may only act via operators in K.

Given a profile P(a), take Sigma = Mem_a, derive K from the denotations of
Skills_a, and let Pi be induced by policy_a and scope checks.

---

# Module Semantics

## Module Roots and Containment

A **module** is a colocated collection of artifacts intended to be interpreted
as one thing. Module roots are defined by anchors of the form:

  /{id}/{id}.md

The anchor defines the module id and the module root directory. A module owns
all files in its subtree except those under nested module roots.

## Membership and Inheritance

Each file belongs to the nearest ancestor module root; files with no ancestor
module are unscoped and should be rejected by validation unless explicitly
marked as global.

Tools and skills resolve by inheritance:

  local module -> kind registry -> parent modules -> global defaults

Nearest definitions take precedence.

---

# Tools as Primitive Operators

## Tool Signatures

A **tool** t is a tuple

  t = (name, invocation, precondition, effect)

where:

- invocation identifies a runnable capability (command, script, or service)
  and how to execute it;
- precondition is a predicate on state and inputs;
- effect is a partial function

  t : U x In_t -> U x Out_t

with failure represented by bottom and failure marks.

Tools need not carry typed schemas; skills provide the structured interfaces
and map skill inputs to tool invocations.

## Tool Admissibility

A tool is **admissible** if its interpretation t is:

- monotone in [the state](../../../../../../../../agency-services-section/content/text/documents/articles/notes/undated/the-state.md) component;
- fragment-preserving (maps fragments to fragments);
- closure-compatible: S(t(X)) >= t(S(X)) for all X.

Admissible tools are the primitive operators for skills.

---

# Skill Specification (Normative)

A Skill S is a tuple:

  S := (id, T_in, T_out, Scopes, S)

where:

- id is a globally stable identifier;
- T_in is a strict input schema (total decoding required);
- T_out is a strict output schema, including effect reports;
- Scopes is a finite set of authorization predicates;
- S: T_in -> Int is the denotation of the skill.

A Skill does not execute by itself. Execution is defined only after:

- successful input decoding,
- authorization satisfaction,
- operator construction via S.

Representation (for example, SKILL.md with YAML frontmatter, templates, or
scripts) is non-normative. Multiple representations may denote the same Skill.

---

# Skill Calculus

## Skill Terms

Let SkillTerm be the smallest set generated by:

  s ::= call(t, args)
      | let x = s1 in s2
      | seq(s1, s2)
      | if p then s1 else s2
      | lambda x. s
      | s1(s2)

where t is a tool name and p is a predicate on outputs or state.

## Definable Skills

The set Skill^def is the closure of primitive tool calls under the above
constructors, with definitional equality given by beta-eta rules and any
explicit equations declared by the system.

Skills are parametric: each skill term carries an input and output schema.

---

# Skill Interpretation

## Interpretation into Interaction Operators

An interpretation is a family of maps

  [-](-.md)_skill : Skill^def -> (U x In_s -> U x Out_s)

satisfying:

1. Tool correspondence: [call(t, args)](call(t,-args).md)_skill = t for each tool t.
2. Monotonicity: s_skill is monotone in [the state](../../../../../../../../agency-services-section/content/text/documents/articles/notes/undated/the-state.md) component.
3. Fragment preservation: for any fragment F, s_skill(F, in) has carrier
   contained in the closure of F.
4. Closure compatibility: S(s_skill(X, in)) >= s_skill(S(X), in).
5. Failure preservation: failures are monotone and do not heal.

Thus each skill denotes an interaction operator equipped with I/O behavior.

## Skill Equivalence

For a partial state X, define s ~_X t if for all fragments F subset of H_X and
all inputs in:

  s_skill(F, in) = t_skill(F, in)

as partial states (with failure marks), and this equality is hereditarily
extensional under definable skill composition.

---

# Executable Documents (Skill Instances)

An executable document is a concrete instance of a Skill embedded in the
[semiotic](../../../../linguistics/topics/semiotics/index.md) library.

Normatively, an executable document specifies:

- a reference to a Skill S,
- a concrete input value x in T_in,
- optional expected artifacts or targets,
- optional additional scope requirements.

The document denotes the operator:

  E = S(x)

The Markdown body may provide narrative context, templates rendered during
execution, and constraints or annotations. The body has no semantic force
beyond what is admitted by S. Documents do not introduce new operators;
they instantiate existing ones.

---

# Effect Reports and Artifacts (Required)

Every Skill execution must produce, as part of T_out, an effect report
describing its interaction with U. At minimum, this includes:

- created paths,
- modified paths,
- content hashes or structural summaries,
- optional previews or renderings.

All filesystem-level effects must be reflected here. Silent or implicit side
effects are disallowed. This keeps execution observable, composable, and
compatible with provenance tracking.

---

# Policy and Authorization

A **policy** is a predicate Pol_a on (skill, input, state) such that:

- Pol_a is monotone in [the state](../../../../../../../../agency-services-section/content/text/documents/articles/notes/undated/the-state.md) component;
- if Pol_a(s, in, X) holds and X <= Y, then Pol_a(s, in, Y) holds;
- Pol_a restricts the agent to Skills_a and Tools_a.

We define a policy-restricted interpretation

  s_a(X, in) =
    if Pol_a(s, in, X) then s_skill(X, in) else failure

Policies thus form monotone subsemioverse structures.

## Authorization scopes

Let C be an authorization context. A Skill execution is defined iff:

  C |= Scopes

Authorization must be checked before operator construction, file access, and
agent state updates. Transport-level mechanisms (for example, MCP over HTTP
with bearer tokens) are implementation details, but scope satisfaction is a
semantic requirement.

---

# Role of Language Models (Non-Foundational)

Language models may be used to implement or approximate the policy function
Pi, to assist in selecting Skills or constructing inputs. However:

- LLMs have no semantic standing in this specification.
- Replacing an LLM with a rule engine or script does not change agenthood.

All guarantees are enforced at the operator and schema level, not by model
behavior. This makes the agential semioverse robust to changes in model
capability and vendor practice.

---

# Execution Semantics

## Agent Execution

An **execution step** is a tuple

  Exec(a, s, in, X) = (X', out, trace)

where:

- a is an agent;
- s is a skill in Skills_a;
- X is the current state;
- (X', out) = s_a(X, in);
- trace is a provenance record capturing tool calls, inputs, outputs, and
  referenced handles.

## Memory Update

Memory is updated by a skill-local operator M_a:

  Mem_a' = M_a(Mem_a, trace)

with M_a fragment-preserving and closure-compatible.

---

# Agential Closure and Fusion

## Agential Closure Operator

Define an operator S_agent on agential partial states by closing under:

1. semantic closure S_sem on H;
2. syntactic closure on Skill^def (lambda-definability, composition);
3. fusion of skill equivalence ~_X (identifying skills with equal fragmentwise
   semantics);
4. admissible tool naming: introduce a skill [symbol](../../../../linguistics/topics/semiotics/terms/symbol.md) for any admissible
   behavior already definable by existing skills.

## Least Fixed Point

By monotonicity and inflationary properties, S_agent has a [least fixed point](../../../concepts/fixed-point/index.md)
A* extending the primitive agent, tool, and skill data. We call A* the
**Agential Semioverse**.

---

# Universal Property

An **agential semioverse structure** consists of:

- a base [interactive semioverse](../interactive-semioverse/index.md) (H, j, G, Op^def, ...);
- a set of agents with profiles;
- a set of admissible tools;
- a skill calculus with an interpretation into interaction operators;
- a [fixed point](../../../concepts/fixed-point/index.md) of S_agent extending the primitive data.

A [morphism](../../../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/morphism.md) between two agential semioverse structures preserves:

- the [Heyting](../../../../../../../../../../../../information-science-services-section/services/knowledge-services-section/services/research-services-section/content/text/documents/articles/notes/arend-heyting.md), modal, and trace structure;
- tool interpretations;
- skill interpretations;
- agent profile constraints (role, policy, memory).

**Theorem 9.1 (Initiality).**
The [least fixed point](../../../concepts/fixed-point/index.md) A* is initial among all agential semioverse structures
extending the same primitive data, up to fragmentwise extensional equality.

---

# Exposure and Interoperability

Skills may be exposed as tools over standardized protocols (for example, MCP)
by exporting:

- id,
- input/output schemas,
- required scopes.

This exposure does not change the semantics of the Skill; it only makes S
callable by external clients. The same Skill may be used internally by agents
and externally by users.

---

# Discussion

The Agential Semioverse is the minimal extension of the Interactive Semioverse
that treats agents, skills, and tools as first-class mathematical objects. It
ensures that all operational behavior is:

- parametric (skills are typed and compositional),
- fragment-preserving (locality is respected),
- closure-compatible (no raw or out-of-band mutations),
- auditable (provenance is explicit).

This object provides the formal ground for implementing agent systems over
Markdown/YAML data stores while preserving the [semiotic](../../../../linguistics/topics/semiotics/index.md) closure discipline.

## Extensions

The base specification above defines single-agent execution. The following
documents extend it with multi-agent structures:

- [Multi-agent coordination](./multi-agent-coordination.md) — regions as downward-closed subsets of the fragment [lattice](../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/order-services-section/content/text/glossary/terms/lattice.md), region-restricted agents, non-interference for disjoint regions, parallel and sequential composition with handoffs, fan-out and pipeline patterns, and coordination correctness conditions.
- [Work-unit lifecycle](./work-unit-lifecycle.md) — work units as typed tuples with preconditions, postconditions, and provenance traces; lifecycle state machines; effect reports with completeness and soundness invariants; chain validation via Petri nets; effect composition; idempotency as closure; and audit trails.
- [Skill manifests](./skill-manifests.md) — typed I/O schemas, region declarations for conflict-free parallelism, dependency graphs, manifest versioning, and the manifest registry.
- [Coordination patterns](./coordination-patterns.md) — observed patterns (config-driven batch, directory-partitioned fan-out, pipeline composition, incremental expansion, read-audit-fix cycle) mapped to their formal models.

## Earlier material

- a complete [Heyting algebra](../../../../../../../../agency-services-section/content/text/documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/concepts/heyting-algebra/index.md) H with modality j and trace G;
- a definable operator algebra Op^def interpreted into H;
- fragments as finitely generated modal-temporal subalgebras;
- [closure operators](../../../../../../../../agency-services-section/content/text/documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/concepts/closure-operator/index.md) S_sem, S_syn, S_fus with [least fixed point](../../../../../../../../agency-services-section/content/text/documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/concepts/fixed-point/index.md) X*;
- [handles](../../../../../../../../agency-services-section/content/text/documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/relating/content/interactive-semioverse/terms/handle.md), [interaction terms](../../../../../../../content/text/glossary/terms/interaction-term.md), [footprints](../../../../../../../../agency-services-section/content/text/documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/relating/content/interactive-semioverse/terms/footprint.md), provenance, failure, and interaction operators.

A [morphism](../../../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/morphism.md) between two agential semioverse structures preserves:

- the [Heyting](../../../../../../../../agency-services-section/content/text/documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/general/people/arend-heyting.md), modal, and trace structure;
- tool interpretations;
- skill interpretations;
- agent profile constraints (role, policy, memory).

- [Multi-agent coordination](../../../../../../../../agency-services-section/content/text/documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/technology/specifications/agential-semioverse-repository/theory/multi-agent-coordination.md) — regions as downward-closed subsets of the fragment [lattice](../../../../../../../../agency-services-section/content/text/documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/relating/posets/terms/lattice.md), region-restricted agents, non-interference for disjoint regions, parallel and sequential composition with handoffs, fan-out and pipeline patterns, and coordination correctness conditions.
- [Work-unit lifecycle](work-unit-lifecycle.md) — work units as typed tuples with preconditions, postconditions, and provenance traces; lifecycle state machines; effect reports with completeness and soundness invariants; chain validation via Petri nets; effect composition; idempotency as closure; and audit trails.
- [Skill manifests](../../../../../../../../agency-services-section/content/text/documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/technology/specifications/agential-semioverse-repository/theory/skill-manifests.md) — typed I/O schemas, region declarations for conflict-free parallelism, dependency graphs, manifest versioning, and the manifest registry.
- [Coordination patterns](coordination-patterns.md) — observed patterns (config-driven batch, directory-partitioned fan-out, pipeline composition, incremental expansion, read-audit-fix cycle) mapped to their formal models.
