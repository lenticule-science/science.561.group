---
name: Expert System
description: "A live system whose architecture combines a knowledge base (data store) with an inference engine — the knowledge base holds structured content; the engine applies operations to produce output."
aliases: [expert systems]
date-created: 2026-04-05
references:
  feigenbaum1983:
    authors: ["Edward A. Feigenbaum", "Pamela McCorduck"]
    title: "The Fifth Generation"
    publication: "Addison-Wesley"
    year: 1983
  jackson1998:
    authors: ["Peter Jackson"]
    title: "Introduction to Expert Systems"
    publication: "Addison-Wesley"
    year: 1998
    note: "3rd edition"
---

An expert system is a live system that combines a knowledge base with an inference engine. The knowledge base holds structured content — accumulated knowledge, state, constraints. The inference engine applies operations to that content — inference rules, normalization, derivation — and produces output. Together they constitute a system that reasons: it takes accumulated knowledge and derives conclusions from it.

The term comes from classical AI (1970s–1990s), where an expert system consisted of a knowledge base encoding domain expertise and an inference engine that applied rules to answer queries. This pattern strips the domain-specific connotations and makes it available as a structural concept.

## The pattern

Any live cognitive system that accumulates knowledge and derives conclusions from it will have both components:

| Component | Role |
|---|---|
| Knowledge base (data store) | Holds structured content that persists across operations |
| Inference engine | Applies transformation operations to the knowledge base to derive output |

A system with a knowledge base but no engine is an archive — it stores but does not reason. A system with an engine but no knowledge base restarts from nothing on every invocation — it computes but does not learn. Finding one without the other in a designed live system indicates either an incomplete architecture or a system that is not actually running.

## What distinguishes a live expert system

The engine is what makes the system live. A static knowledge base with no running engine is not an expert system — it is a data store. The engine must be able to read from the knowledge base, apply defined operations, and write results back.

The engine does not hold persistent state itself — all durability lives in the knowledge base. Between invocations, the engine carries nothing. This is the characteristic asymmetry: the knowledge base accumulates; the engine transforms.

## Historical context

Classical expert systems (MYCIN, DENDRAL, R1/XCON) embodied this architecture with production rules as the engine and fact databases as the knowledge base. The architecture proved general: modern systems that combine a persistent store with a reasoning process — language model agents with tool memory, database-backed inference services, knowledge graph reasoners — instantiate the same pattern regardless of the inference method used.

## See also

- [The Expert System Pattern: Knowledge Base and Inference Engine](../../../../../texts/expert-system-as-datastore-plus-engine.md) — the algebraic structure of the knowledge base / inference engine decomposition
