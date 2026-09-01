---
name: sheaf-assembly-program
role: structure
derived_from:
- computer/type/documentation-interpreter
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Builds and maintains sheaf assemblies from earned windows, towers, and sections
for runtime and analytics consumption.

## Behaviour
- Ingest sheaf component recognitions (windows, towers, sections) as
  [Computer Recognition](../../type/computer-recognition.md).
- Validate gluing/restriction constraints; assemble sections.
- Emit assembled sheaf bundles or [Computer Failure](../../type/computer-failure.md)
  on constraint violations.

## Invariants
- Gluing/restriction satisfy earned sheaf axioms.
- Assemblies are traceable to component recognitions.
- Failures use [`FailureCarrier`](docs/machine/structure/failure-carrier.md).

## Proof
Refines the documentation interpreter by specialising to sheaf assembly wiring while
preserving kernel failure semantics.
