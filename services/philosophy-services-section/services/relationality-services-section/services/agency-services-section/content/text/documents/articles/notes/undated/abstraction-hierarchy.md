---
type: object
class: structural
status: stable
depends-on:
  - planning-problem.md
  - teaching/explanations/hierarchical-planning.md
see-also:
  - ../morphisms/plan-decomposition.md
  - ../theorems/hierarchical-decomposition-soundness.md
references:
  - references/erol-hendler-nau1994.md
title: Abstraction hierarchy
description: An abstraction hierarchy is the set of compound tasks, decomposition methods, and primitive actions that defines what an HTN planner can express and decompose.
---

# Abstraction hierarchy

An **abstraction hierarchy** is the set of compound tasks, decomposition methods, and primitive actions that defines what an HTN planner can express and decompose.
It is the planner's *representation of how-to-do-things knowledge*.

## Components

For an HTN planning instance, the hierarchy consists of:

- **Primitive actions** $A_{\text{prim}}$: the directly executable operators of an underlying classical-planning instance.
- **Compound tasks** $\mathcal{T}_c$: named placeholders for abstract activities (e.g., "deliver-package", "prepare-meal", "negotiate-contract") that are not directly executable.
- **Methods** $\mathcal{M}$: rules of the form $$m: \tau \mapsto \langle w, \mathrm{pre}(m) \rangle$$ meaning "compound task $\tau$ can be decomposed into task network $w$ (a partially-ordered set of compound and primitive tasks), provided precondition $\mathrm{pre}(m)$ holds."

A given compound task may have many methods; the planner chooses among them during decomposition.

## Levels

Tasks form a (typically directed acyclic) decomposition graph: high-level tasks decompose into combinations of lower-level tasks, which decompose into combinations of still-lower-level tasks, until the leaves are primitive actions.
The depth of this graph is the *depth of the hierarchy*; the average decomposition factor is the *branching*.

A typical hierarchy might have:

| Level | Task | Decomposes into |
|---|---|---|
| 4 | trip-to-conference | book-flight, book-hotel, attend-sessions, return-home |
| 3 | book-flight | search-flights, select-flight, pay-for-flight |
| 2 | search-flights | open-search-tool, enter-criteria, retrieve-results |
| 1 | open-search-tool | navigate(URL), wait-for-load |
| 0 | navigate(URL) | (primitive) |

## Expressiveness vs tractability

The hierarchy determines what plans the planner can express and what it can find:

- **Library completeness**: a hierarchy is *complete* for a problem if every classical solution to the underlying problem is expressible as some sequence of method applications terminating in a primitive action sequence.
  Few hand-written hierarchies are complete in this strict sense; most express a *good* subset of plans rather than all of them.
- **Library compactness**: a smaller hierarchy is faster to search but expresses fewer plans.
  The [hierarchical-decomposition-soundness](hierarchical-decomposition-soundness.md) theorem makes the tradeoff precise.

## Authoring vs learning

Traditionally, abstraction hierarchies are *hand-authored* by domain experts.
This is the classical "knowledge engineering" bottleneck.

Recent research learns hierarchies from demonstrations or from trial-and-error exploration: the *option discovery* literature in RL learns useful options (the RL analogue of methods) from agent interaction.
This shifts the authoring cost to data-collection cost.

In LLM-based planning, the hierarchy is *implicit* in the LLM's training distribution: the LLM has seen many examples of "to do X, you should do A, then B, then C" and produces decompositions following these patterns.
The hierarchy is not a separate object; it is encoded in the model weights and elicited by prompting.

## Comparative structure

| Hierarchy form | Authoring | Soundness | Coverage |
|---|---|---|---|
| Hand-written HTN | Expert labor | Explicit (verified by planner) | Limited to authored methods |
| Learned options (RL) | Interaction data | Empirical | Limited to encountered situations |
| LLM-implicit | Training data | None (best-effort) | Broad but unprincipled |

The trend in deployed LLM-agent systems is to combine the LLM's implicit hierarchy with explicit constraints (tool-use schemas, guardrails) — a partial recovery of HTN's soundness machinery without its authoring cost.
