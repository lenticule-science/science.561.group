---
id: engine
description: "An engine is the code that drives a machine. It owns I/O, execution, and the external interface. Domain content lives in files; the engine only moves and executes it."
defines: Engine
---

# Engine

## What it is

An **engine** is the code that animates a machine. It owns the machine's I/O (loading
content from files and writing it back), execution (running workflows), and external
interface (exposing the machine to agents or clients). Each machine has exactly one engine.

## MUST

- Own all reads and writes to its machine's data store — no other code touches the store
- Be the only external interface to its machine
- Contain no domain content — math, specs, skills, and runbooks live in files, not in the engine

## CAN

- Expose its machine's capabilities via any interface appropriate to its clients
- Cache content for performance

## CANNOT

- Contain workflow logic — workflows are defined in runbooks, not in engine code
- Span two machines — one engine per machine
