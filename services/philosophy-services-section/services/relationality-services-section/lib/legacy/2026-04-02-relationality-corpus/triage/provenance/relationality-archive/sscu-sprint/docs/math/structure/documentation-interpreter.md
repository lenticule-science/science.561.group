---
name: documentation-interpreter
role: structure
proof_refs:
- recognition
- evaluation-state
- snapshot
- wiring-plan
- failure-carrier
- call
- evaluate-expression
- map-evaluate
- return
- struct
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---


Documentation interpreter over the documentation DAG: the minimal carriers/operators
that execute nested-array transformations over earned math structures.

## Definition
- Carriers: minimal runtime state and data:
  - [Recognition](recognition.md)
  - [Evaluation State](evaluation-state.md)
  - [Snapshot](snapshot.md)
  - [Wiring Plan](wiring-plan.md)
  - [Failure Carrier](failure-carrier.md)
- Operators (interpreter opcodes):
  - Expression-based control/dispatch has been removed; only earned section/
    recognition evaluation remains.
  - [`identity`](../operator/identity.md) and [`last`](../operator/last.md)
    provide minimal flow where needed.
- API surface: the interpreter is defined entirely by these carriers/operators;
  no external primitives are assumed.

## Invariants
- Fidelity: interpreter executes only transformations encoded in doc frontmatter;
  no hidden semantics beyond the listed operators.
- Closure: interpreter operators consume/produce only the declared carriers.
- Stability: interpreter behaviour is determined by the documented DAG and
  interpreter operators.

## Proof
- Uses: the earned runtime carriers above.
- Shows that: a minimal documentation interpreter suffices to execute the nested-array
  transformations defined in frontmatter without additional primitives; operators listed
  above are sufficient to interpret documented transformations.
