---
id: runbook
description: "A runbook is a workflow definition. The engine executes it. Workflow logic lives in runbooks; execution logic lives in the engine."
---

# Runbook

## What it is

A **runbook** is a workflow definition — a named, structured sequence of steps. The
engine loads and executes runbooks without per-runbook engine code. Workflow logic
lives in runbooks; execution logic lives in the engine once.

This is the key property: **adding a new workflow means adding a runbook file, not
writing engine code.**

## MUST

- Have an `id` and `description`
- Declare all inputs and outputs
- Each step must have a unique id within the runbook

## CAN

- Call other runbooks as sub-steps
- Invoke LLM-backed judgment steps

## CANNOT

- Contain execution logic — that belongs in the engine
- Embed environment-specific values — use named inputs instead

## Encodings

### YAML encoding

A runbook is encoded as a `.yaml` file in `runbooks/`. The top-level keys are:

```yaml
id: kebab-case-id
description: "one sentence"
skill-closure-kind: process | procedure | derivation | inquiry

inputs:
  - name: param_name
    type: str | int | list | ...

outputs:
  - name: result_name
    from: "{{step-id.result}}"

steps:
  - id: step-name
    type: query | write | update | for-each | call | script | llm-call | collect
    # ... step-type-specific fields
```

Step ids MUST be unique within the runbook. Template expressions use `{{...}}` syntax.
Input values are accessed as `{{inputs.param_name}}`. Step outputs are accessed as
`{{step-id.result}}`. The context variable `{{today}}` is always available.
