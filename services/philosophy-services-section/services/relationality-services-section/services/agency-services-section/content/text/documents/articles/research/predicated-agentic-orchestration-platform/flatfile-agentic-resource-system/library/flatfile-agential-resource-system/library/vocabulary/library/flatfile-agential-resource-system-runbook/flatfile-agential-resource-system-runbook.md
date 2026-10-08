---
id: flatfile-agential-resource-system-runbook
description: "A FARS Runbook is a named, declarative workflow definition: a YAML file encoding a sequence of steps that an agent reads and executes directly, scoped to the entity it operates on."
implements: Runbook
params:
  steps: relational-universe
  closure-kind: relational-universe
output: relational-universe-morphism
ast:
  foata-normal-form-composition:
    - steps:
        - concurrent-tier
        - causal-order
    - closure-kind:
        - process
        - procedure
        - derivation
        - inquiry
title: FARS Runbook
---

# FARS Runbook

## What this is

A **FARS Runbook** is the YAML encoding of a [Runbook](runbook.md) in the [FlatfileAgentialResourceSystem](../../../../flatfile-agential-resource-system.md).
It is a declarative YAML file defining a sequence of steps.
An agent reads the file and executes each step directly.
The runbook is the definition; the agent is the execution.

A FARS Runbook is itself a [RelationalEntity](relational-entity.md): it has `id` and `description` and is in R.
A runbook can be referenced, shaped, and reasoned about like any other entity in the system.

A FARS Runbook is always scoped to a specific locale or unit.
A `spec/runbooks/` runbook operates on spec units.
A `math/runbooks/` runbook operates on math entitys.
The scope is determined by where the runbook file lives.

Executing a runbook takes entities in the system and produces entities in the system.
The outputs are first-class objects — not ephemeral side effects.
A FARS Runbook MUST have `id` and `description` — it is a RelationalEntity.
It MUST take RelationalEntities as inputs and produce RelationalEntities as outputs.
It MUST be reproducible — the same inputs under the same system state MUST produce the same outputs.
It MUST be declared before it is executed — no ad-hoc operations outside named runbooks.
It CANNOT have side effects not traceable to named output entities.
It CANNOT depend on state not accessible through the system's own entities.
It CANNOT contain execution logic — the agent reads the runbook and supplies the execution at each step.
It CANNOT embed environment-specific values — use named inputs instead.

## Atomicity

A runbook MUST do one thing.
A runbook that does two separable things is two runbooks composed by a third.
The smallest meaningful workflow is the right granularity for a runbook file.
Atomic runbooks MUST NOT call other runbooks — use primitive step types only.

**Atomic runbook:** a runbook whose steps are all primitive operations (query, write, update, script, llm-call) — no `call` steps to other runbooks.

**Composite runbook:** a runbook that composes atomic runbooks via `call` steps.
A composite runbook is a workflow; an atomic runbook is a work unit.

Both are valid runbooks.
The distinction is structural, not hierarchical: a composite runbook does not "own" the runbooks it calls.

## Composition

Runbooks compose by calling other runbooks as steps.
The composition mechanism is the `call` step type:

```yaml
steps:
  - id: do-extraction
    type: call
    runbook: runbooks/extract-anchor.yaml
    inputs:
      file_path: "{{inputs.file_path}}"
      anchor_id: "{{inputs.anchor_id}}"
```

### Runbooks as parameters

A runbook input MAY have type `runbook`.
This allows the caller to pass a runbook reference that the callee will execute:

```yaml
inputs:
  - name: extraction_runbook
    type: runbook
    description: "The runbook to call for each extraction target"

steps:
  - id: extract-each
    type: for-each
    over: "{{find-targets.result}}"
    do:
      - id: run-extractor
        type: call
        runbook: "{{inputs.extraction_runbook}}"
        inputs:
          file_path: "{{item.file}}"
```

The sweep runbook does not know which extraction runbook to use; the caller decides.
This is how generic workflows compose with specific operations.

### Input/output matching

When a composite runbook calls a sub-runbook, the caller MUST supply all required inputs of the callee.
The callee's outputs are available to subsequent steps via `{{step-id.result}}`.
Composite runbooks MUST declare which sub-runbooks they call, either as literal paths or as `runbook`-typed inputs.

Two runbooks compose cleanly when the first runbook's output type matches the second runbook's input type.
This is not enforced mechanically yet — it is a convention that skill-object-types will formalize (see Open questions).

## Foata normal form

A YAML file is a morphism $u \in \mathbb{M}(\Sigma, I)$ expressed in Foata normal form: $$u = B_1 \cdot B_2 \cdots B_k$$ where each $B_i$ is a **concurrent tier** — an unordered set of steps that are pairwise commuting under the independence relation $I$.

- Steps within the same tier commute: any ordering yields the same history.
- Tiers are causally ordered: every step in $B_{i+1}$ depends on at least one step in $B_i$.
- Wiring between tiers is explicit: each step in $B_{i+1}$ declares which output from a prior step feeds which of its inputs.

Steps within a tier that share no wiring dependency are concurrent — they may execute in any order or in parallel.
The YAML does not declare concurrency explicitly; it is derived from the absence of wiring dependencies between steps in the same tier.

`closure-kind` lives on the YAML, not on individual Python files, because the nuclear quartet classifies **compositions**, not generators.
A single step $s \in \Sigma$ is a generator — it has no closure kind.
The quartet position emerges from how generators compose:

| `closure-kind` | Wiring structure |
|---|---|
| `process` | every step wired deterministically; no branching |
| `procedure` | wiring includes conditional routing |
| `derivation` | wiring includes a step whose output type is declared but produced at runtime |
| `inquiry` | wiring is open — the composition discovers its structure during execution |

## YAML format

A runbook is encoded as a `.yaml` file in `runbooks/`.
The top-level keys are:

```yaml
id: kebab-case-id
description: "one sentence"
closure-kind: process | procedure | derivation | inquiry

inputs:
  - name: param_name
    type: str | int | list | runbook | ...
    description: "what this input is"

outputs:
  - name: result_name
    from: "{{step-id.result}}"

steps:
  # Tier 1 — steps that commute with each other
  - id: step-a
    run: step_a.py
    inputs:
      x: "{{inputs.x}}"
  - id: step-b
    run: step_b.py
    inputs:
      y: "{{inputs.y}}"

  # Tier 2 — depends on tier 1 via wiring
  - id: step-c
    run: step_c.py
    inputs:
      from_a: "{{step-a.output}}"
      from_b: "{{step-b.output}}"
```

Each `run:` value names a Python file.
The Python file's function signature is the single source of truth for that step's input and output types — the YAML does not duplicate them.

### Step types

| Type | What it does | Atomic? |
|------|-------------|---------|
| `query` | Read data from the repository | yes |
| `write` | Create a file | yes |
| `update` | Modify an existing file | yes |
| `script` | Run a shell command | yes |
| `llm-call` | Ask the LLM a question | yes |
| `collect` | Gather results from prior steps | yes |
| `call` | Execute another runbook | no (composition) |
| `for-each` | Iterate over a collection | container (wraps other steps) |
| `condition` | Branch on a predicate | container (wraps other steps) |

Step ids MUST be unique within the runbook.
Template expressions use `{{...}}
` syntax.
Input values are accessed as `{{inputs.param_name}}`.
Step outputs are accessed as `{{step-id.result}}`.
The context variable `{{today}}` is always available.

A runbook MAY have a colocated `.py` script implementing one or more of its steps.
See [flatfile-agential-resource-system-script](../flatfile-agential-resource-system-script/flatfile-agential-resource-system-script.md) for the colocated script spec.

## Open questions

- Which specific structural operations in $\mathcal{F}$ correspond to which runbook patterns.
  The primitive operations in $\mathcal{F}$ are fiberwise propositional operations, the nuclei σ and Δ, and history concatenation ★.
  The correspondence between these and concrete runbook step types is not yet derived.
- Formal type system for runbook inputs/outputs so that composition can be mechanically verified.
  Blocked by skill-object-types spec.
- Whether `for-each` and `condition` should be separate runbooks rather than step types — the current design treats them as control flow within a runbook, but they could be generic composition operators.
