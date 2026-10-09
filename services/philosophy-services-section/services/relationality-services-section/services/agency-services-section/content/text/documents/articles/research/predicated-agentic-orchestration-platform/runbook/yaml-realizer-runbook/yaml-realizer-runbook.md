---
type: example
status: documented
instantiates: [runbook, runbook-execution, skill]
title: A YAML-realizer runbook with substrate-resident operator specs
description: A working runbook-execution example pairs a YAML "universe" specification with a set of realizers — substrate-resident operator specs declaring how each runbook step is realized.
---

# A YAML-realizer runbook with substrate-resident operator specs

A working runbook-execution example pairs a YAML "universe" specification with a set of *realizers* — substrate-resident operator specs declaring how each runbook step is realized.
Each realizer is a JSON entity citing a Python module and callable; the runbook's execution dispatches each step through the corresponding realizer.
The example demonstrates a [runbook](teaching/explanations/runbook.md) whose steps' specifications are substrate content, not runtime code, and whose execution is a substrate-mediated dispatch sequence.

## Universe specification

A `*.universe.yaml` file declares a runbook scope:

```yaml
sources: content/**/*.md
publish:
  mode: permissive
  filters:
    publish_to:
      - emsenn-net
    status:
      - public
html:
  sanitize: true
  lang: en
  assets:
    inline: false
    minify: true
cache:
  enabled: true
```

The universe is a [scope-record](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/scope-record.md) declaring the predicate vocabulary the runbook admits (sources, publish filters, html configuration, cache policy) and the runbook's projection nucleus (which content qualifies for publication).
Per [scope-as-predication](../../teaching/explanations/scope-as-predication.md), the scope's policy is substrate content the runbook reads at execution time.

## Realizers as substrate-resident skill records

Each runbook step is a *realizer*: a JSON entity declaring how the step is performed.
A realizer's structural fields:

```json
{
  "id": "observe",
  "act": "Observe",
  "module": "realizers.py.core",
  "callable": "realize_observe",
  "input_kind": "ObservationCarrier",
  "output_kind": "ObservationRecognition",
  "description": "Interpret ObservationCarrier using MeasurementFrame recognitions."
}
```

Per [skill-record](../objects/skill-record.md), each realizer entry is a skill: a substrate predication declaring the operation's identity (`id`), its categorical kind (`act` — one of the canonical interaction acts), the module-and-callable that performs it, and the input/output type structure.
The skill's invocation is a [skill-invocation](../../skill/skill-invocation/skill-invocation.md) operation that:

1. Reads the realizer's substrate predications to find `module`, `callable`, `input_kind`, `output_kind`.
2. Invokes the callable with the input.
3. Records the witness predications (input identity, output identity, transition act).

Adding a new step is admitting a new realizer entity to the substrate; no runtime code changes.

## The pipeline

The runbook's full pipeline cascades through several realizers, each producing the input shape the next expects:

- `observe` (input: `ObservationCarrier`, output: `ObservationRecognition`) — interpret raw observations using a measurement frame.
- `nucleate_profile` (input: `ObservationRecognition`, output: `NucleatedProfile`) — close the recognition under a profile-nucleus.
- `flow_profile` (input: `NucleatedProfile`, output: `ProfilePhaseState`) — advance the profile state along a flow direction.
- `flow_measure_step` — incremental flow advance.
- `stabilize_observation` — apply stabilization to settle the observation.
- `fix_flow_nucleus` — repair-style fix when the nucleus's flow state has drifted.
- `advance_trace` — append to the runbook's trace record.
- `normalize_observation` — canonicalize the observation form.

Each step is a [skill](teaching/explanations/skill.md) the substrate dispatches.
The pipeline's overall behavior is substrate content (the realizer entities, their input-output kinds, the runbook's declared sequence); the Python callables are the operator implementations the substrate's runtime invokes.

## What the example demonstrates

The example illustrates several substrate disciplines simultaneously:

- **Skill records as substrate content.** Each realizer is a skill entity (per [skill-record](../objects/skill-record.md)) with its predications declaring how it is invoked.
  Editing the realizer changes the runbook's behavior on the next execution; no code change is needed.

- **Skill invocation through substrate dispatch.** The runtime does not hardcode which Python function to call for "observe" — it reads the realizer's `module` and `callable` predications.
  Per [driver-substrate-split](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/driver-substrate-split.md), the runtime is a thin pump; the program (which callable, on which input kind, producing which output kind) is in substrate content.

- **Type-checked composition through input/output kinds.** The realizer's `input_kind` and `output_kind` are predications about the operation's shape.
  A runbook composing realizers can validate that step $n$'s `output_kind` matches step $n+1$'s `input_kind` — a substrate-level shape check, per [shape](../../scope/shape/shape.md).
  Mismatched kinds surface as substrate-level violations.

- **Pure operator kernels.** Each realizer's Python callable is a pure function `(input_obj, context) → output_payload`.
  No mutation of inputs; the function returns a new payload.
  Per [settlement-determinism](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/settlement-determinism.md), this is what makes the pipeline's output deterministic given the same input.

## Position as an example

The YAML-realizer-runbook demonstrates [runbook](teaching/explanations/runbook.md) machinery at a smaller scale than the full mash-engine: the runbook's steps and execution discipline can be specified entirely in substrate content (universe YAML + realizer JSON entities) with the runtime's role reduced to "read the realizer record, invoke the named callable on the named input kind, record the result."
The example is what an AgOP minimal runbook host looks like: the substrate carries the pipeline's specification, the runtime executes it, the witnessing is in substrate content.
The pattern composes upward to richer runbooks (multi-agent, multi-session, federated) without changing the runtime's structural shape.
