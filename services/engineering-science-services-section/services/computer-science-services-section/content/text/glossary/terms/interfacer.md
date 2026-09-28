---
name: "Interfacer"
aliases: [interfacers, adapter, bridge, translator]
description: "A component at a system boundary that translates between the system's internal content and an external representation: extracting inward, applying changes outward and composing derived documents, under round-trip laws that keep the translation lossless."
date-created: 2026-04-08
date-modified: 2026-09-27
instance-of: [component]
has: [extract, apply, compose, format, boundary]
depends-on: [boundary, canonical-form]
references:
  gamma1994:
    authors: ["Erich Gamma", "Richard Helm", "Ralph Johnson", "John Vlissides"]
    title: "Design Patterns: Elements of Reusable Object-Oriented Software"
    publication: "Addison-Wesley"
    year: 1994
  hexagonal:
    authors: ["Alistair Cockburn"]
    title: "Hexagonal Architecture"
    publication: "alistair.cockburn.us"
    year: 2005
    note: "Also known as Ports and Adapters"
  foster2007:
    authors: ["J. Nathan Foster", "Michael B. Greenwald", "Jonathan T. Moore", "Benjamin C. Pierce", "Alan Schmitt"]
    title: "Combinators for Bidirectional Tree Transformations: A Linguistic Approach to the View-Update Problem"
    publication: "ACM Transactions on Programming Languages and Systems 29(3)"
    year: 2007
title: "Interfacer"
defines: interfacer
related: [boundary, adapter-pattern, serialization, format]
---

An **interfacer** is a component that sits at a system boundary and translates between the system's internal content and an external representation: markdown text, a JSON document, a JSON-RPC message, an agent's context window, an HTTP body, a file format. Every system that communicates with the outside world has interfacers, whether or not it names them. In a predication substrate the interfacer is the I/O discipline: the rules by which predications enter from outside and leave to outside, with the guarantee that round trips do not silently corrupt content.

## Three operations

- **Extract**: external representation to internal content. A markdown parser extracts structured data from text files; a JSON deserializer extracts objects from strings; a database driver extracts rows from its wire protocol. In a substrate, extracted predications enter by insertion.
- **Apply**: a change to internal content becomes an edit to the external representation already holding it. A renderer writes structured data back to text; a serializer writes objects to strings; a driver sends commands. In a substrate, apply takes insertions and retractions and produces the matching edit.
- **Compose**: several pieces of internal content become a new, derived external document that is not the serialization of any one of them. Compose is the observation direction, and it is not invertible: different internal states can compose to the same output.

Extract and apply are not symmetric. Extracting is often lossy, since the external format may carry information the internal representation does not model; applying is determined by the internal content.

## Round-trip laws

An extract/apply pair is a bidirectional transformation, a lens in the sense of Foster et al. (2007), with extract as *get* and apply as *put*. Its laws make it a lossless translator rather than a lossy adapter:

- **Write then read (PutGet).** Applying a change-set $\Delta$ to external content $c$ and extracting yields $c$'s content joined with the change: $\textsf{extract}(\textsf{apply}(\Delta, c)) = \textsf{extract}(c) \oplus \Delta$. The house calls this the counit law. In the whole-state form, $\textsf{extract} \circ \textsf{apply} = \mathrm{id}$ makes apply a section of extract. An interfacer that fails it loses information that later extracts cannot recover.
- **Batched and incremental edits agree.** Applying $\Delta_1$ then $\Delta_2$ equals applying their composite once, so batched edits and incremental edits are interchangeable.
- **Compatible edits glue.** Two compatible applies against the same content combine; incompatible ones produce a contested predication, never one silently overwriting the other.

## The boundary

An interfacer is defined by its boundary, the point where the internal system ends and the external world begins. Cockburn's Hexagonal Architecture (2005) makes this explicit: the core has *ports* (abstract interfaces) and *adapters* (concrete connections to external systems). The adapter is the interfacer and the port is the boundary. Gamma et al. (1994) catalog interfacers under other names: the **Adapter** converts one interface to another; the **Bridge**'s implementor side is an interfacer; a **Facade** is an interfacer that hides a subsystem's complexity.

## Layers

A realization separates four layers:

- **Content**: what the predications are.
- **Precompiled cache**: a fast-lookup representation computed deterministically from the content.
- **Stepping mechanism**: small, stable code that walks predications and applies the per-format rules.
- **Protocol adapter**: where and when, meaning which path, port or request channel.

Adding a format or a content rule should then be a content change (a new entity defining the format's pattern), not a change to the stepping code or the adapter.

## Validation is composition

Extraction can compose the extracted predications against their type's shape. A value that disagrees with the shape surfaces as a contested predication, not a silent reject; each interfacer's policy then either admits it and records the contradiction for repair, or refuses the extract and reports it. The same algebra that produces content decides whether content is admissible.

## Interfacers compose

An interfacer for format A chained with one for format B gives an A-to-B transformer: extract from A, apply to B. This is the mechanism behind format conversion, data migration and multi-format publishing: $N$ interfacers, one per format, support $N^2$ conversions without $N^2$ converters.

## See also

- [Adapter pattern](https://en.wikipedia.org/wiki/Adapter_pattern): the Gang of Four pattern that is the interfacer directly.
