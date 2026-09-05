---
name: modal-logic-program
role: structure
derived_from:
- computer/type/documentation-interpreter
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



This program realises earned modal structures as a working modal logic for
recognitions.

## Behaviour

- Represent modal frames, accessibility relations, and modal judgments as
  recognitions with provenance.
- Ensure operations respect the earned modal structure from the math layer.
- Measure proof properties (depth, branching) in modal derivations.

## Intended operators

- Form and check modal judgments; navigate accessibility relations.
- Translate between modal and non-modal views where justified.
- Export modal proof traces for other reasoning programs.

## Proof
- Derived from: [Documentation Interpreter](../../../computer/type/documentation-interpreter.md).
- Shows that: this program evaluates modal logic over the documentation interpreter without extending machine semantics.
