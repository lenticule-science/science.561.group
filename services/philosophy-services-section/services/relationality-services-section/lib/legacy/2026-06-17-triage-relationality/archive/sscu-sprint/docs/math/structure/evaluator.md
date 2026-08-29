---
title: Evaluator
role: structure
emerges_from: evaluate-judgement
proof_refs:
- evaluate-judgement
- evaluate-observation
- evaluate-section
- build-evaluation-context
- seed-evaluation-context
- ensure-confluence
fields:
- name: support
  type: hypertensor-section
  description: section/window being evaluated.
- name: scope
  type: coverage-site
  description: locality/coverage in which evaluation proceeds.
- name: context_stack
  type: evaluation-context-stack
  description: stacked frames directing sub-evaluations.
- name: state
  type: evaluation-state
  description: bindings, queues, and wiring for step-wise evaluation.
- name: recognitions
  type: recognition
  description: predicates/failures accumulated during evaluation.
- name: flow_nucleus
  type: flow-nucleus-adjunction
  description: compatibility ensuring evaluation respects flow/nucleus on sections.
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---


Evaluator is the earned transformation executor over sections in the
quasicrystalline hypertensor topos. It combines evaluation contexts, wiring,
bindings, recognitions, and flow/nucleus constraints to step earned
transformations safely.

## Invariants
- **Locality:** evaluation stays within `support`/`scope`; restriction/glue on
  the coverage site preserves results.
- **Context discipline:** `context_stack` obeys the evaluation-context acts
  (seed/build), ensuring plug/compose laws.
- **State coherence:** `state` bindings and wiring match declared signatures;
  steps fire only when ready.
- **Recognition/failure:** predicates/failures are explicit in `recognitions`;
  failures do not bypass invariants.
- **Flow/nucleus stability:** evaluation steps commute with flow/nucleus actions
  on sections, maintaining earned dynamics.

## Proof
- Uses: evaluation acts (`evaluate-judgement`, `evaluate-observation`,
  `evaluate-section`) plus context acts (`seed/build evaluation-context`) to
  justify the context/stack/state discipline; coverage/sheaf acts to justify
  locality; flow/nucleus acts for stability.
- Shows that: packaging support/scope, contexts, state, recognitions, and
  flow/nucleus compatibility yields an earned evaluator structure capable of
  executing transformations without violating sheaf or flow invariants.
