---
name: judgment-term
role: structure
derived_from:
- acts/form-term-body
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Term structure for the internal judgment calculus, earned by the term-forming
acts (variables/bodies, abstractions/applications, fixpoint constructors).

## Components

- Variables and bodies (`EquateEventually`, `FormTermBody`).
- Abstractions/applications (`FormFunctionTerm`, `FormApplicationTerm`).
- Least/greatest fixpoint constructors (`PairLeastFix`, `FormLeastFixTerm`,
  `PairGreatestFix`, `FormGreatestFixTerm`).

## Proof

Sketch: each syntactic constructor has a corresponding earned act; their
compositions generate all well-formed judgment-calculus terms. Show closure and
well-formedness under these constructors.
