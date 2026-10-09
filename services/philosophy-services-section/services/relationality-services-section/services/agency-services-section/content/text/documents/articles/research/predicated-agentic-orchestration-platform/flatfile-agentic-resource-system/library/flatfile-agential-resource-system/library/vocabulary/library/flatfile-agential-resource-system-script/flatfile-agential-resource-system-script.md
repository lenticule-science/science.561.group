---
id: flatfile-agential-resource-system-script
description: "A FARS Script is a Python file colocated with a runbook YAML, implementing one or more of its steps: invoked directly by the agent executing the runbook."
implements: Script
component-of: FlatfileAgentialResourceSystemBlueprint
params:
  function-signature: relational-universe
  step: relational-universe
output: relational-universe-morphism
ast:
  atomic-stepping-map:
    - function-signature:
        - typed-annotated-signature
    - step:
        - counit-law-satisfaction
title: FARS Script
---

# FARS Script

## What it is

A **FARS Script** is one stepping map $\gamma_t : X(t) \to X(s \star t)$ for one step $s \in \Sigma$ — a Python file that implements exactly one atomic step of a [FARS Runbook](../flatfile-agential-resource-system-runbook/flatfile-agential-resource-system-runbook.md).

The mathematical constraint: the function must satisfy the **counit law** — inputs must be recoverable from the output.
The stepping map adds content from step $s$ without destroying content from history $t$.
If the function fails, no state is changed.
The stepping map either completes or does not fire.

A FARS Script carries no composition metadata.
No `id`, no `description`, no `closure-kind` in the file body.
Those fields describe morphisms in $T$ (the YAML's job), not atomic steps.
The Python file's function name is its identity; its typed signature is its interface.

A FARS Script MUST contain exactly one function.
Its typed signature MUST use `typing.
Annotated[T, Field(description="...")]
` — the single source of truth for this step's input and output types.
It MUST accept only inputs recoverable from those types.
It MUST produce outputs that preserve the inputs (counit law: no information destruction).
All side effects MUST be traceable to named output entities.
A FARS Script CANNOT read or write state not accessible through the system's own entities.

## Encoding

A FARS Script is a Python file colocated with its runbook YAML in `runbooks/`.
Inputs arrive as named command-line flags corresponding to the runbook's `inputs:` fields.
Outputs are written as markdown files with valid frontmatter satisfying applicable [flatfile-agential-resource-system-shape](../flatfile-agential-resource-system-shape/flatfile-agential-resource-system-shape.md) constraints.

## Open questions

- Whether scripts can be shared across runbooks or whether each script belongs to exactly one runbook.
