---
type: object
class: classical
status: active
depends-on:
  - memory-store.md
see-also:
  - ../morphisms/retrieval.md
  - embedding-index.md
references: []
title: Retrieval key
description: A retrieval key is the query used to address a memory-store.
---

# Retrieval key

A **retrieval key** is the query used to address a
[memory-store](memory-store.md). The key's structure determines
which traces are retrievable.

## Forms

- **Exact key.** A hash, primary key, or canonical identifier
  that picks out at most one trace.
- **Symbolic pattern.** A SQL where-clause, a SPARQL graph
  pattern, a regular expression. Picks out matching traces.
- **Embedding vector.** A vector in the same space as the
  stored traces, retrieving nearest neighbors.
- **Reconstructive cue.** In distributed memory, a partial
  pattern that cues completion to a stored full pattern.

## Why the key shape matters

Different key shapes support different cognitive operations:

- **Exact-match keys** support efficient lookup but no
  generalization. Useful when the agent knows exactly what
  it stored.
- **Pattern-match keys** support generalization across
  structurally similar items. Useful for semantic recall.
- **Embedding keys** support similarity-based retrieval that
  generalizes across surface form. Useful when query
  vocabulary may differ from stored vocabulary.
- **Reconstructive cues** support recall from fragments,
  approximating human episodic memory's behavior.

## Key-content matching

For a query to succeed, the key shape must match the store's
indexing. A vector-indexed store cannot be queried by SQL; a
hash table cannot be queried by similarity. This is a
load-bearing constraint on memory-system design: the
*expected query distribution* must inform the choice of
indexing.

## In LLM agents

LLM agents typically issue retrieval keys via:

- **Embedding the current context** for vector retrieval —
  the dominant pattern for RAG.
- **Tool-call arguments** — explicit symbolic queries the
  agent constructs (e.g. `search(query='X')`).
- **Implicit attention** — within the context window,
  attention itself is a soft retrieval, with the current
  token's query vector matching against keys of all
  preceding tokens.

The choice between embedding-based and tool-call-based
retrieval is a substantive architectural decision: the former
is automatic but limited to similarity; the latter is precise
but requires the agent to know what to ask.
