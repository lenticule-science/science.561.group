---

name: domain-definition-program
kind: structure
layer: program
derived_from:
- computer/structure/computer-kernel
uses:
- system/structure/recognition-carrier
- system/structure/trace-carrier
produces: []
---

This program makes domain slices (finance, MUD, space program, quantum sim,
etc.) first-class. Each domain declares its recognition schemas, runbook
patterns, and handler bindings, all grounded in the earned acts and the
[Relational Machine Kernel](../../../machine/structure/kernel.md).

## Behaviour

- Define `DomainDefinition`, `DomainSchema`, `DomainRunbookPattern`, and
  `DomainHandlerBinding` recognitions, each with stable IDs, descriptions,
  allowed acts, and measurement channels.
- Link domains to the acts and specifications they use, so each domain is a
  typed slice of the global instruction set.
- Track coverage: which acts/specs are exercised, which schemas and runbooks
  exist, and where conflicts or overlaps appear between domains.

## Intended operators

- Register domains, validating that referenced acts/specs exist and schemas
  embed cleanly into the global recognition schema.
- Introspect runtime bindings to discover or verify handler attachments.
- Validate coverage so every public API/runbook lives inside an owned domain,
  surfacing gaps and collisions for refactor.

## Proof
- Derived from: [Computer Kernel](../../../computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the described behaviour without extending machine semantics.

