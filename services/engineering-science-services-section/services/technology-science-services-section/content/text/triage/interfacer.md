---
title: "Interfacer"
defines: interfacer
aliases: [interfacers, adapter, bridge, translator]
description: "A component that sits at a system boundary and transforms data between internal representation and external format — extracting inward, applying outward. The general concept underlying adapters, bridges, serializers, and format translators."
date-created: 2026-04-08
instance-of: [component]
has: [extract, apply, format, boundary]
related: [boundary, adapter-pattern, serialization, format]
references:
  - id: gamma1994
    type: document
    title: Design Patterns: Elements of Reusable Object-Oriented Software
    author:
      - literal: Erich Gamma
      - literal: Richard Helm
      - literal: Ralph Johnson
      - literal: John Vlissides
    container-title: Addison-Wesley
    issued:
      - year: 1994
  - id: hexagonal
    type: document
    title: Hexagonal Architecture
    note: Also known as Ports and Adapters
    author:
      - literal: Alistair Cockburn
    container-title: alistair.cockburn.us
    issued:
      - year: 2005
---

An interfacer is a component that sits at a system boundary and transforms data between the system's internal representation and an external format. Every system that communicates with the outside world has interfacers, whether or not it names them.

## The two directions

An interfacer does exactly two things:

1. **Extract** — read data from the external format into internal representation. A markdown parser extracts structured data from text files. A JSON deserializer extracts objects from strings. A database driver extracts rows from wire protocol. The external world comes in through extract.

2. **Apply** — write data from internal representation into the external format. A markdown renderer applies structured data back to text files. A JSON serializer applies objects to strings. A database driver applies commands to wire protocol. The internal state goes out through apply.

These two directions are not symmetric. Extracting is typically lossy (the external format may carry information the internal representation doesn't model). Applying is typically faithful (the internal representation determines the output). The pair extract/apply forms an adjunction in the categorical sense: apply is left adjoint to extract when the round-trip extract(apply(x)) = x holds for all internal representations x.

## The boundary

An interfacer is defined by its boundary — the point where the internal system ends and the external world begins. Cockburn's Hexagonal Architecture (2005) makes this explicit: the system's core has "ports" (abstract interfaces) and "adapters" (concrete implementations that connect ports to external systems). The adapter IS the interfacer. The port IS the boundary.

Gamma et al. (1994) catalog several patterns that are interfacers under different names:
- **Adapter** — converts the interface of one class to another. This is the interfacer pattern directly.
- **Bridge** — separates abstraction from implementation. The bridge's implementor side is an interfacer.
- **Facade** — provides a simplified interface to a subsystem. The facade is an interfacer that hides complexity.

## Interfacers compose

An interfacer for format A can chain with an interfacer for format B to produce an A-to-B transformer: extract from A, apply to B. This composition is the general mechanism behind format conversion, data migration, and multi-format publishing. A system with N interfacers (one per format) supports N² format conversions without N² converters.

## See also

- [Boundary](../../../../../../humanities/domains/philosophy/domains/western/domains/metaphysics/domains/ontology/terms/boundary.md) — the concept of where systems meet
- [Adapter pattern](https://en.wikipedia.org/wiki/Adapter_pattern) — the GoF pattern that IS the interfacer concept
